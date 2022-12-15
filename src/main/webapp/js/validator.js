
const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

class Validator {

    constructor(options) {
        this.options = options;
        this.selectorRules = {};
    }

    main() {
        // Lấy form element cần validate
        const formElement = $(this.options.form);

        if (!formElement) {
            console.log('have not form element');
            return;
        }

        // Disable submit
        formElement.onsubmit = (e) => {
            e.preventDefault();
            let isSuccess = true;

            // Lặp qua từng rule và validate
            this.options.rules.forEach((rule) => {
                const inputElement = formElement.querySelector(rule.selector);
                let flagError = this.validate(inputElement, rule);

                if (flagError)
                    isSuccess = false;
            })

            if (isSuccess) {
                if (typeof this.options.onSubmit !== 'function') {
                    formElement.submit();
                    return;
                }

                let enableInputs = formElement.querySelectorAll('[name]');

                let formValue = Array.from(enableInputs).reduce((formValue, input) => {
                    switch (input.type) {
                        case 'radio':
                            if (input.checked)
                                formValue[input.name] = input.value;
                            break;
                        case 'checkbox':
                            if (!formValue[input.name])
                                formValue[input.name] = [];
                            if (input.checked)
                                formValue[input.name].push(input.value);
                            break;
                        case 'select-one':
                            formValue[input.name] = input.options[input.selectedIndex].value;
                            break;
                        case 'file':
                            formValue[input.name] = input.files;
                        default:
                            formValue[input.name] = input.value;
                    }
                    return formValue;
                }, {})

                this.options.onSubmit(formValue);
            }

        }

        // Lặp lần lượt qua các rule
        this.options.rules.forEach(rule => {
            const inputElements = formElement.querySelectorAll(rule.selector);

            if (!inputElements) {
                console.log('have not input element');
                return;
            }

            // Lưu lại các rule cho các input
            if (Array.isArray(this.selectorRules[rule.selector]))
                this.selectorRules[rule.selector].push(rule.test)
            else
                this.selectorRules[rule.selector] = [rule.test]

            // Lặp các inputElement trong trường hợp 1 selector có nhiều element
            inputElements.forEach(inputElement => {

                // Xử lý sự kiện blur
                inputElement.onblur = () => {
                    this.validate(inputElement, rule);
                }

                // Xử lý khi user nhập
                inputElement.oninput = () => {
                    this.deleteErrorMessage(inputElement);
                }

            })
        })
    }

    validate(inputElement, rule) {
        let errorMessage;
        let rulesOfInputE = this.selectorRules[rule.selector]
        const formElement = $(this.options.form);

        // Lặp qua từng rule có lỗi thì break
        for (let ruleOfInput of rulesOfInputE) {
            switch (inputElement.type) {
                case 'radio':
                case 'checkbox':
                    errorMessage = ruleOfInput(formElement.querySelector(rule.selector + ':checked'))
                    break;
                case 'select-one':
                    let select = $(`${this.options.form} ${rule.selector}`);
                    errorMessage = ruleOfInput(select.selectedIndex != 0 ? true : undefined);
                    break;
                default:
                    errorMessage = ruleOfInput(inputElement.value);
            }
            if (errorMessage) break;
        }

        if (!errorMessage)
            this.deleteErrorMessage(inputElement);
        else
            this.createErrorMessage(inputElement, errorMessage);

        return errorMessage;
    }

    getParentElement(inputElement) {
        return inputElement.closest(this.options.formGroupSelector);
    }
    getErrorElement(inputElement) {
        return this.getParentElement(inputElement).querySelector(this.options.errorSelector);
    }

    deleteErrorMessage(inputElement) {

        this.getErrorElement(inputElement).innerText = '',
            this.getParentElement(inputElement).classList.remove('invalid');

    }
    createErrorMessage(inputElement, errorMessage) {

        this.getErrorElement(inputElement).innerText = errorMessage,
            this.getParentElement(inputElement).classList.add('invalid');

    }

    static isRequired(selector, message) {

        return {
            selector,
            test(value) {
                return value ? undefined : message || 'Vui lòng nhập trường này';
            }
        }

    }

    static isEmail(selector, message) {

        return {
            selector,
            test(value) {
                const regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                return regex.test(value) ? undefined : message || 'Trường này là Email';
            }
        }

    }

    static minLength(selector, min, message) {

        return {
            selector,
            test(value) {
                return value.length >= min ? undefined : message || `Vui lòng nhập trường này tối thiểu ${min} kí tự`
            }
        }

    }

    static isConfirmed(selector, getConfirmValue, message) {

        return {
            selector,
            test(value) {
                return value === getConfirmValue() ? undefined : message || "Mật khẩu không trùng khớp";
            }
        }
    }
    static isValidPw = (selector) => {
        return {
            selector: selector,
            test(value) {
                var regexPw = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,}$/;
                return regexPw.test(value) ? undefined : 'Nhập tối thiểu 8 kí tự, bao gồm số, chữ in hoa và chữ thường'
            }
        }
    }

}

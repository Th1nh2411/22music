package ptithcm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import web.entity.Account;



public class AdminInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		//System.out.println("LoggerInterceptor.preHandle()");

		HttpSession ss = request.getSession();
		System.out.println(ss.getAttribute("DangNhap"));
		
		if (ss.getAttribute("DangNhap") == null) {
			response.sendRedirect(request.getContextPath() + "/index.htm");
			return false;
		}else {
			Account account = (Account) ss.getAttribute("DangNhap");
			if (account.getRole()!=1) {
				System.out.println("Đăng nhập không thành công!");
				response.sendRedirect(request.getContextPath() + "/index.htm");
				return false;
			}
		}
		
		return true;
	}
}

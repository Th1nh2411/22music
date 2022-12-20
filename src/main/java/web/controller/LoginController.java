package web.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javassist.expr.NewArray;

import web.entity.Account;
import web.entity.Song;
import web.entity.User;

@Transactional
@Controller
public class LoginController {
	
	@Autowired
	SessionFactory factory;
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String showLogin(ModelMap model, @ModelAttribute("account") Account taiKhoan, HttpSession ss) {	
		ss.setAttribute("DangNhap", taiKhoan=null);
		model.addAttribute("isLogin", false);
		
		return "login";
	}
	@RequestMapping(value = "logout")
	public String logout(ModelMap model,HttpSession ss) {
		// Chưa truyền attribute index
		ss.setAttribute("DangNhap",null);
		model.addAttribute("isLogin", false);
		List<Song> newSongs = getRandom6NewSongs();
		model.addAttribute("newsongs", newSongs);
		return "index";
	}
	@RequestMapping(value = "action", method = RequestMethod.POST)
	public String showIndex(ModelMap model, @ModelAttribute("account") Account taiKhoan, HttpSession ss) {
		try {
			taiKhoan = this.getDangNhap(taiKhoan.getName(), taiKhoan.getPass());

			ss.setAttribute("DangNhap", taiKhoan);
			System.out.print("dang nhap 1thanh cong");
			
			List<Song> newSongs = getRandom6NewSongs();
			model.addAttribute("isLogin", true);
			model.addAttribute("newsongs", newSongs);
			model.addAttribute("accountName", taiKhoan.getUser().getName());
			if (taiKhoan.getRole()==1) {
				
				return "redirect:/admin/trangchu.htm";
			}
			return "index";
		} 
		catch (Exception e) {
			model.addAttribute("message", "Sai tên tài khoản hoặc mật khẩu!");
			System.out.print("dang nhap khong thanh cong");
//			model.addAttribute("check", 0);
			return "login";
		}
	}
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String showRegister(ModelMap model, HttpServletRequest request,@ModelAttribute("user") User user, HttpSession ss) {	
		user = new User();
		
		model.addAttribute("user", user);
		
		model.addAttribute("isLogin", false);
		ss.setAttribute("DangNhap",null);
		return "register";
	}
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String dangki(ModelMap model, HttpServletRequest request,@ModelAttribute("user") User user, HttpSession ss) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		Account taiKhoan = new Account();
		taiKhoan.setName(request.getParameter("username"));
		taiKhoan.setPass(request.getParameter("pass"));
		
		System.out.print(taiKhoan.getName());
		System.out.print(taiKhoan.getPass());
		taiKhoan.setRole(0);
		
		try {
			System.out.print("Them thanh cong2");
			session.save(user);
			t.commit();
			model.addAttribute("message", "Thêm thành công!");
			model.addAttribute("isLogin", true);
			
			List<Song> newSongs = getRandom6NewSongs();
			model.addAttribute("newsongs", newSongs);
			System.out.print("Them thanh cong1");
		} catch (Exception e) {
			System.out.println(e);
			t.rollback();
			
			System.out.print("Them thanh cong3");
			model.addAttribute("message", "Thêm thất bại!");
			model.addAttribute("user", new User());
			
			model.addAttribute("isLogin", false);
			return "register";
		} finally {
			session.close();
		}
		int test = addAccount(taiKhoan);
		taiKhoan = this.getDangNhap(taiKhoan.getName(), taiKhoan.getPass());

		ss.setAttribute("DangNhap", taiKhoan);
		model.addAttribute("accountName", taiKhoan.getUser().getName());
		if (test ==0) {
			System.out.print("that bai tao account");
			test = deleteUser(user);
		}
		return "index";
//		Session session1 = factory.openSession();
//		Transaction t1 = session1.beginTransaction();
//		try {
//			taiKhoan.setId(getLastUser().getId());
//			session1.save(taiKhoan);
//			t1.commit();
//		} catch (Exception e) {
//			t.rollback();
//			t1.rollback();
//			System.out.print("Them thanh cong4");
//			model.addAttribute("message", "Thêm thất bại!");
//			// TODO: handle exception
//		}
//		finally {
//			session.close();
//			session1.close();
//		}
//		Session sessions = factory.getCurrentSession();
//		String hqlaccount = "FROM Account ";
//		Query queryaccount = sessions.createQuery(hqlaccount);
//		List<Account> listaccount = queryaccount.list();
//		PagedListHolder pagedListHolder = new PagedListHolder(listaccount);
//		int page = ServletRequestUtils.getIntParameter(request, "u", 0);
//		pagedListHolder.setPage(page);
//		pagedListHolder.setMaxLinkedPages(5);
//		pagedListHolder.setPageSize(4);
//		model.addAttribute("pagedListHolder", pagedListHolder);
//			return "user-info";
		}	
	public Account getDangNhap(String taiKhoan, String matKhau) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Account d WHERE d.name= :taiKhoan AND d.pass= :matKhau";
		Query query = session.createQuery(hql);
		query.setParameter("taiKhoan", taiKhoan);
		query.setParameter("matKhau", matKhau);
		Account dangNhap = (Account) query.list().get(0);
		return dangNhap;
	}
	public List<Song> getRandom6NewSongs() {
		
		Random rand =  new Random();
		List<Song> list = getNewSongs();
		List<Song> listRandom = new ArrayList<>();
		int numberOfElements = 6;
		try {
			for (int i = 0; i < numberOfElements; i++) {
		        int randomIndex = rand.nextInt(list.size());
		        listRandom.add( list.get(randomIndex));
		        list.remove(randomIndex);
		    }
			return listRandom;
		} catch (Exception e) {
			// TODO: handle exception
		}
	  return list;
	}
	public List<Song> getNewSongs() {
		
		Session session = factory.getCurrentSession();
		String hqlString = "FROM Song";
		Query query = session.createQuery(hqlString);
		List<Song> list = query.list();
	
		for( int i = 0; i < list.size(); i++) {
			Song song = list.get(i);
			if (song.dayDiffNow()>30) {
				list.remove(i);
			}
		}
		return list;
	}
	public User getLastUser() {
		Session session = factory.getCurrentSession();
		String hqlString = "FROM User";
		Query query = session.createQuery(hqlString);
		List<User> list = query.list();
		User user = list.get(list.size()-1);
		return user;
	}
	public int addAccount(Account account) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {System.out.println("fa");
		
			account.setUser(getLastUser());
			System.out.println("fa1");
			System.out.println(account.getId()+","+account.getName()+","+account.getPass()+","+account.getRole());
			session.save(account);
			System.out.println("fa2");
			t.commit();
		}
		catch (Exception e) {
			t.rollback();
			return 0;
		}
		finally {
			session.close();
		}
		return 1;
	}
	public Integer deleteUser(User sinhVien) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(sinhVien);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			e.printStackTrace();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
}

package web.controller;

import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import web.entity.Account;
import web.entity.History;
import web.entity.Song;
import web.entity.User;

@Controller
@Transactional
public class MainController {

	@Autowired
	SessionFactory factory;
	
	@RequestMapping( value = "/index.htm")
	public String home(ModelMap model, HttpSession ss) {
		try {
			Account account = (Account) ss.getAttribute("DangNhap");
			System.out.print(account.getId());
			model.addAttribute("isLogin", true);
			model.addAttribute("accountName", account.getUser().getName());
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("That bai");
			model.addAttribute("isLogin", false);
		}
		List<Song> newSongs = getRandom6NewSongs();
		model.addAttribute("newsongs", newSongs);
		return "index";
	}
	@RequestMapping( value = "/index/{id}/{num}/{isPre}.htm")
	public String home1(ModelMap model, HttpSession ss, @PathVariable("id") int idS, @PathVariable("num") int num, @PathVariable("isPre") int isPre) {

		try {
			Account account = (Account) ss.getAttribute("DangNhap");
			System.out.print(account.getId());
			int rate =0;
			if(num>30) {
				rate = 1;
			}
			
			History history = new History();
			history.setIsPre(isPre);
			history.setSong(getSongByIdSong(idS));
			history.setRating(rate);
			history.setUser(account.getUser());
			int check = addHistory(history);
			model.addAttribute("isLogin", true);
			model.addAttribute("accountName", account.getUser().getName());
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("That bai");
			model.addAttribute("isLogin", false);
		}
		
		List<Song> newSongs = getRandom6NewSongs();
		model.addAttribute("newsongs", newSongs);
		return "index";
	}
//	Thinh fix
	@RequestMapping(value = "/tag/{tag}.htm")
	public String songsByTag(ModelMap model, @PathVariable("tag") String tag, HttpSession ss) {
		
		try {
			Account account = (Account) ss.getAttribute("DangNhap");
			System.out.print(account.getId());
			model.addAttribute("isLogin", true);
			model.addAttribute("accountName", account.getUser().getName());
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("That bai");
			model.addAttribute("isLogin", false);
		}
		List<Song> songsByTag = getSongsByTagSong(tag);
		model.addAttribute("songsByTag", songsByTag);
		model.addAttribute("tag", tag);
		return "tag";
	}
	@RequestMapping(value = "/tag/{tag}/{id}/{num}/{isPre}.htm")
	public String songsByTag1(ModelMap model, @PathVariable("tag") String tag, HttpSession ss, @PathVariable("id") int idS, @PathVariable("num") int num, @PathVariable("isPre") int isPre) {
		
		try {
			Account account = (Account) ss.getAttribute("DangNhap");
			System.out.print(account.getId());
			int rate =0;
			if(num>30) {
				rate = 1;
			}
			
			History history = new History();
			history.setIsPre(isPre);
			history.setSong(getSongByIdSong(idS));
			history.setRating(rate);
			history.setUser(account.getUser());
			int check = addHistory(history);
			model.addAttribute("isLogin", true);
			model.addAttribute("accountName", account.getUser().getName());
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("That bai");
			model.addAttribute("isLogin", false);
		}
		List<Song> songsByTag = getSongsByTagSong(tag);
		model.addAttribute("songsByTag", songsByTag);
		model.addAttribute("tag", tag);
		return "tag";
	}

	@RequestMapping(value = "/Nhac/{id}/{isPre}.htm")
	public String songById(ModelMap model, HttpSession ss, @PathVariable("id") int id, @PathVariable("isPre") int isPre) {
		
		try {
			Account account = (Account) ss.getAttribute("DangNhap");
			System.out.print(account.getId());
			model.addAttribute("isLogin", true);
			model.addAttribute("accountName", account.getUser().getName());
			try {
				History historyNew = getHistoryBySongAndUserId(id, account.getId()).get(getHistoryBySongAndUserId(id, account.getId()).size()-1);
				model.addAttribute("isFavor", historyNew.getRating());
			}
			catch(Exception e) {
				model.addAttribute("isFavor", 0);
			}
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("isFavor", 0);
			model.addAttribute("isLogin", false);
		}
		
		Song songById = getSongByIdSong(id);
		
//		ss.setAttribute("songId", id);
//		ss.setAttribute("isPre", isPre);
		
		
		model.addAttribute("songById", songById);
		model.addAttribute("isPre", isPre);
//		Test
		List<Song> suggestSongs = getSongPreForSongWithoutUser(songById.getPred(), songById.getId());
		model.addAttribute("suggestSongs", suggestSongs);
		return "song";
	}
	@RequestMapping(value = "/Nhac/{idNew}/{isPreNew}/{idOld}/{num}/{isPre}.htm")
	public String songById1(ModelMap model, HttpSession ss, @PathVariable("idNew") int idNew, @PathVariable("idOld") int idOld, @PathVariable("isPre") int isPre,@PathVariable("isPreNew") int isPreNew, @PathVariable("num") int num) {
		
		try {
			Account account = (Account) ss.getAttribute("DangNhap");
			
			int rate =0;
			if(num>30) {
				rate = 1;
			}
			
			History history = new History();
			
			history.setIsPre(isPre); history.setSong(getSongByIdSong(idOld));
			history.setRating(rate); history.setUser(account.getUser()); 
			int check = addHistory(history);
			try {
				History historyNew = getHistoryBySongAndUserId(idNew, account.getId()).get(getHistoryBySongAndUserId(idNew, account.getId()).size()-1);
				model.addAttribute("isFavor", historyNew.getRating());
				System.out.print(historyNew.getRating());
			}
			catch(Exception e) {
				model.addAttribute("isFavor", 0);
			}
			model.addAttribute("isLogin", true);
			model.addAttribute("accountName", account.getUser().getName());
		} catch (Exception e) {
			model.addAttribute("isFavor", 0);
			model.addAttribute("isLogin", false);
		}
		
		Song songById = getSongByIdSong(idNew);
		
		model.addAttribute("songById", songById);
		model.addAttribute("isPre", isPreNew);
		
//		Test
		List<Song> suggestSongs = getSongPreForSongWithoutUser(songById.getPred(), songById.getId());
		
		model.addAttribute("suggestSongs", suggestSongs);
		return "song";
	}
	@RequestMapping(value = "/tag/recommend.htm")
	public String recommmendSongs(ModelMap model, HttpSession ss) {
		try {
			Account account = (Account) ss.getAttribute("DangNhap");
			//System.out.print(account.getId());
			
			model.addAttribute("isLogin", true);
			model.addAttribute("accountName", account.getUser().getName());
			List<Song> recommendSongs = getSongPreForUser(account.getUser().getPred(), account.getUser());
			model.addAttribute("recommendSongs", recommendSongs);
			
			return "recommend";
		} catch (Exception e) {
			// TODO: handle exception
			//System.out.print("That bai");
			model.addAttribute("isLogin", false);
			List<Song> recommendSongs = getRandom6NewSongs();
			model.addAttribute("recommendSongs", recommendSongs);
			
			return "recommend";
		}
		
	}
	@RequestMapping(value = "/tag/recommend/{id}/{num}/{isPre}.htm")
	public String recommmendSongs1(ModelMap model, HttpSession ss, @PathVariable("id") int idS, @PathVariable("num") int num, @PathVariable("isPre") int isPre) {
		try {
			Account account = (Account) ss.getAttribute("DangNhap");
			//System.out.print(account.getId());
			
			System.out.print(account.getId());
			int rate =0;
			if(num>30) {
				rate = 1;
			}
			
			History history = new History();
			history.setIsPre(isPre);
			history.setSong(getSongByIdSong(idS));
			history.setRating(rate);
			history.setUser(account.getUser());
			int check = addHistory(history);
			model.addAttribute("isLogin", true);
			model.addAttribute("accountName", account.getUser().getName());
			List<Song> recommendSongs = getSongPreForUser(account.getUser().getPred(), account.getUser());
			model.addAttribute("recommendSongs", recommendSongs);
			
			return "recommend";
		} catch (Exception e) {
			// TODO: handle exception
			//System.out.print("That bai");
			model.addAttribute("isLogin", false);
			List<Song> recommendSongs = getRandom6NewSongs();
			model.addAttribute("recommendSongs", recommendSongs);
			
			return "recommend";
		}
		
	}
	@RequestMapping(value = "search.htm")
	public String timkiem(ModelMap model, @RequestParam("timkiem") String kiemtra, HttpSession ss) {
		try {
			Account account = (Account) ss.getAttribute("DangNhap");
			System.out.print(account.getId());
			
			model.addAttribute("isLogin", true);
			model.addAttribute("accountName", account.getUser().getName());
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("That bai");
			model.addAttribute("isLogin", false);
		}
		
		List<Song> searchSongs = searchSong(kiemtra);
		model.addAttribute("searchSongs", searchSongs);
		model.addAttribute("kiemtra", kiemtra);
		return "search";
	}
	@RequestMapping( value = "search/{id}/{num}/{isPre}.htm")
	public String timkiem1(ModelMap model, HttpSession ss, @RequestParam("timkiem") String kiemtra, @PathVariable("id") int idS, @PathVariable("num") int num, @PathVariable("isPre") int isPre) {

		try {
			Account account = (Account) ss.getAttribute("DangNhap");
			int rate =0;
			if(num>30) {
				rate = 1;
			}
			
			History history = new History();
			history.setIsPre(isPre);
			history.setSong(getSongByIdSong(idS));
			history.setRating(rate);
			history.setUser(account.getUser());
			int check = addHistory(history);
			model.addAttribute("isLogin", true);
			model.addAttribute("accountName", account.getUser().getName());
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("That bai");
			model.addAttribute("isLogin", false);
		}
		
		List<Song> searchSongs = searchSong(kiemtra);
		model.addAttribute("searchSongs", searchSongs);
		model.addAttribute("kiemtra", kiemtra);
		return "search";
	}
	@RequestMapping( value = "/favor.htm")
	public String getFavor(ModelMap model, HttpSession ss) {
		Account account = new Account();
		try {
			account = (Account) ss.getAttribute("DangNhap");
			System.out.print(account.getId());
			model.addAttribute("accountName", account.getUser().getName());
			model.addAttribute("isLogin", true);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("That bai");
			model.addAttribute("isLogin", false);
		}
		try {
			account = (Account) ss.getAttribute("DangNhap");
			System.out.print("That bai2");
			List<Song> userFavor = getListSongHistoryByUserIdWithRate1(account.getUser().getId());
			System.out.print(userFavor);
			model.addAttribute("blank", false);
			model.addAttribute("userFavor", userFavor);
			if (userFavor.isEmpty()) {
				model.addAttribute("blank", true);
			}
		} catch (Exception e) {
			
		}
		
		return "favor";
	}
	@RequestMapping( value = "/favor/{id}/{num}/{isPre}.htm")
	public String getFavor1(ModelMap model, HttpSession ss, @PathVariable("id") int idS, @PathVariable("num") int num, @PathVariable("isPre") int isPre) {
		Account account = new Account();
		try {
			account = (Account) ss.getAttribute("DangNhap");
			int rate =0;
			if(num>30) {
				rate = 1;
			}
			
			History history = new History();
			history.setIsPre(isPre);
			history.setSong(getSongByIdSong(idS));
			history.setRating(rate);
			history.setUser(account.getUser());
			int check = addHistory(history);
			System.out.print(account.getId());
			model.addAttribute("accountName", account.getUser().getName());
			model.addAttribute("isLogin", true);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("That bai");
			model.addAttribute("isLogin", false);
		}
		try {
			account = (Account) ss.getAttribute("DangNhap");
			System.out.print("That bai2");
			List<Song> userFavor = getListSongHistoryByUserIdWithRate1(account.getUser().getId());
			System.out.print("That bai1");
			model.addAttribute("blank", false);
			model.addAttribute("userFavor", userFavor);
		} catch (Exception e) {
			model.addAttribute("blank", true);
		}
		
		return "favor";
	}
	
	public List<Song> getSongs() {
		
		Session session = factory.getCurrentSession();
		String hqlString = "FROM Song";
		Query query = session.createQuery(hqlString);
		List<Song> list = query.list();
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
	
	public Song getSongByIdSong(int idString) {
		Session session = factory.getCurrentSession();
		String hqlString = "FROM Song WHERE id='"+idString+"'";
		Query query = session.createQuery(hqlString);
		Song song = (Song) query.list().get(0);
		return song;
	}
	public List<Song> getSongsByTagSong(String tag) {
		Session session = factory.getCurrentSession();
		String hqlString = "FROM Song WHERE tag='"+tag+"'";
		Query query = session.createQuery(hqlString);
		List<Song> list = query.list();
		return list;
	}
	public List<User> getUsers() {
		Session session = factory.getCurrentSession();
		String hqlString = "FROM User";
		Query query = session.createQuery(hqlString);
		List<User> list = query.list();
		return list;
	}
	public User getUserByIdUser(int idString) {
		Session session = factory.getCurrentSession();
		String hqlString = "FROM User WHERE id='"+idString+"'";
		Query query = session.createQuery(hqlString);
		User user = (User) query.list().get(0);
		return user;
	}
	public History getHistoryByIdHistory(String idString) {
		Session session = factory.getCurrentSession();
		String hqlString = "FROM History WHERE id='"+idString+"'";
		Query query = session.createQuery(hqlString);
		History history = (History) query.list().get(0);
		return history;
	}
	public List<History> getHistory() {
		Session session = factory.getCurrentSession();
		String hqlString = "FROM History";
		Query query = session.createQuery(hqlString);
		List<History> list = query.list();
		
		
		return list;
	}
	public List<History> getHistoryByUserId(int id) {
		Session session = factory.getCurrentSession();
		String hqlString = "FROM History WHERE user.id='"+id+"'";
		Query query = session.createQuery(hqlString);
		List<History> list = query.list();
		
		
		return list;
	}
	
	public List<Song> getListSongHistoryByUserIdWithRate1(int id) {
		Session session = factory.getCurrentSession();
		String hqlString = "FROM History WHERE user.id='"+id+"'";
		Query query = session.createQuery(hqlString);
		List<History> list = query.list();
		List<Song> song = new ArrayList<>();
		System.out.println("That bai nay");
		for( int i = 0; i < list.size(); i++) {
			History history =  list.get(i);
			if(history.getRating()==0) {
				try {
					song.remove(getSongByIdSong(history.getSong().getId()));
				} catch (Exception e) {
					// TODO: handle exception
				}
				
			}
			if(history.getRating()==1) {
				try {
					song.remove(getSongByIdSong(history.getSong().getId()));
				} catch (Exception e) {
					// TODO: handle exception
				}
				song.add(getSongByIdSong(history.getSong().getId()));
			}
//			List<History> listbyS= getHistoryBySongAndUserId(history.getSong().getId(), id);
//			
//			if(listbyS.get(listbyS.size()-1).getRating()==1) {
//				
//				song.add(getSongByIdSong(listbyS.get(listbyS.size()-1).getId()));
//				
//				
//			}
		}
		System.out.println("That ba1213i");
		return song;
	}
	
	public List<History> getHistoryBySongId(String id) {
		Session session = factory.getCurrentSession();
		String hqlString = "FROM History WHERE song.id='"+id+"'";
		Query query = session.createQuery(hqlString);
		List<History> list = query.list();
		
		
		return list;
	}
	
	public int addHistory(History history) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(history);
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
	public List<Song> searchSong(String name) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Song WHERE songName LIKE :name and isDel= '" + false + "'";
		Query query = session.createQuery(hql);
		query.setParameter("name", "%" + name + "%");
		List<Song> list = query.list();
		return list;
	}

	public List<History> getHistoryBySongAndUserId(int songId, int userId) {
		Session session = factory.getCurrentSession();
		String hqlString = "FROM History h WHERE h.song.id='"+songId+"'and h.user.id='"+userId+"'";
		Query query = session.createQuery(hqlString);
		List<History> list = query.list();
		
		
		return list;
	}
	public int checkSong(int songId, int userId) {
		try {
			List<History> history = getHistoryBySongAndUserId(songId, userId);
			
			System.out.print(history.get(0).getId());
			
			return 1;
		} catch (Exception e) {
			// TODO: handle exception
			
			return 0;
		}
		
	}
	public List<Song> getSongPreForUser(String string, User user) {
		List<Song> list = new ArrayList<Song>();
		Song song;
		try {
			String[] splitData = string.split(",");
	        for (int i = 0; i < splitData.length; i++) {
	             if(splitData[i]!=null&&splitData[i]!="") {
	            	 if(checkSong(Integer.parseInt(splitData[i]), user.getId())==0) {
	            		 song = getSongByIdSong(Integer.parseInt(splitData[i]));
	                	 
	                	 list.add(song);
	            	 }
	            	 if(list.size()==6) {
	            		 break;
	            	 }
	            	 
	             }
	        
	        }
		}
		catch(Exception e){
			list = getRandom6NewSongs();
		}
        
		
	
        return list;
}

	public List<Song> getSongPreForSongWithoutUser(String string, int idSong) {
		List<Song> list = new ArrayList<Song>();
		Song song;
		try {
			String[] splitData = string.split(",");
	        for (int i = 0; i < splitData.length; i++) {
	             if(splitData[i]!=null&&splitData[i]!="") {
	            	 if(Integer.parseInt(splitData[i])!=idSong) {
	            		 song = getSongByIdSong(Integer.parseInt(splitData[i]));
	                	 
	                	 list.add(song);
	            	 }
	            	 if(list.size()==6) {
	            		 break;
	            	 }
	            	 
	             }
	        
	        }	
		} catch (Exception e) {
			list = getRandom6NewSongs();
		}
		
       
		
	
        return list;
}
	
}

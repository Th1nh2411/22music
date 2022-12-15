package web.controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Iterator;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import web.entity.Account;
import web.entity.History;
import web.entity.Song;
import web.entity.User;

@Controller
@Transactional
public class AdminController {

	private static final String COMMA_DELIMITER = ",";
	private static final String NEW_LINE_SEPARATOR = "\n";
	private static final String GETRATING_STRING = "D:/Eclipse/eclipse-workspace/22music/src/main/webapp/getRatingUser.py";

	private static final String GETSONGSIM_STRING = "D:/Eclipse/eclipse-workspace/22music/src/main/webapp/getSongSim.py";

	private static final String PREMAXTRIXPY_STRING = "D:/Eclipse/eclipse-workspace/22music/src/main/webapp/userPredMatrix.py";
	private static final String fileData = "D:/Eclipse/eclipse-workspace/22music/src/main/webapp/data.txt";
	private static final String fileUserPred = "D:/Eclipse/eclipse-workspace/22music/src/main/webapp/PredUser.txt";
	private static final String fileSongSim = "D:/Eclipse/eclipse-workspace/22music/src/main/webapp/PredSong.txt";
	
	@Autowired
	SessionFactory factory;
	//day la phuong thuc ghi history ra file txt de python train
	@RequestMapping( value = "/admin/index.htm")
	public String home1(ModelMap model, HttpSession ss) {
		try {
			Account account = (Account) ss.getAttribute("DangNhap");
			System.out.print(account.getId());
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("That bai");
		}
		List<Song> newSongs = getRandom6NewSongs();
		model.addAttribute("newsongs", newSongs);
		return "index";
	}
	@RequestMapping( value = "/admin/admin.htm")
	public String admin(ModelMap model) {
		try {
			int a = historyToCsv("D:\\Eclipse\\eclipse-workspace\\22music\\src\\main\\webapp\\data.txt");
			if (a==0) {
				System.out.println("Khong ghi duoc file csv !!!");
			}
			User user = getUserByIdUser(1);
			//List<History> history = getHistoryBySongAndUserId(1, 2);
//			
			//System.out.println(history.get(0).getId());
			List<Song> list = getSongPre(user.getPred(), user);
			
			System.out.println("Day la check");
			System.out.println(list.get(0).getId());
			System.out.println(checkSong(1, 1));
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Co gi do da sai !!!");
			return "admin";
		}
		return "admin";	
	
	}
	
	@RequestMapping(value = "/admin/train.htm")
	public String adminTrain(ModelMap model) {
		try {int a;
			a = trainData();
			if (a==0) {
				System.out.println("Khong train duoc !!!");
			}
			
			return "admin";
		} catch (Exception e) {
			// TODO: handle exception
			return "admin";
		}
	}
	@RequestMapping(value = "/admin/getPred.htm")
	public String getPre(ModelMap model) {
		try {int a;
			a = getSongSim();
			if (a==0) {
				System.out.println("Khong get du lieu song sim vao song duoc !!!");
			}
			a= getRatingUser();
			if (a==0) {
				System.out.println("Khong get du lieu user pred vao dc !!!");
			}
			return "admin";
		} catch (Exception e) {
			// TODO: handle exception
			return "admin";
		}
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
	/*
	 * public List<History> getNewHistories() {
	 * 
	 * Session session = factory.getCurrentSession(); String hqlString =
	 * "FROM History"; Query query = session.createQuery(hqlString); List<History>
	 * list = query.list();
	 * 
	 * for( int i = 0; i < list.size(); i++) { History song = list.get(i);
	 * 
	 * } return list; }
	 */
	
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
	public History getHistoryByIdHistory(int idString) {
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
	public List<History> getHistoryByUserId(String id) {
		Session session = factory.getCurrentSession();
		String hqlString = "FROM History WHERE user.id='"+id+"'";
		Query query = session.createQuery(hqlString);
		List<History> list = query.list();
		
		
		return list;
	}
	public List<History> getHistoryBySongId(int id) {
		Session session = factory.getCurrentSession();
		String hqlString = "FROM History WHERE song.id='"+id+"'";
		Query query = session.createQuery(hqlString);
		List<History> list = query.list();
		
		
		return list;
	}
	
	public List<History> getHistoryBySongAndUserId(int songId, int userId) {
		Session session = factory.getCurrentSession();
		String hqlString = "FROM History h WHERE h.song.id='"+songId+"'and h.user.id='"+userId+"'";
		Query query = session.createQuery(hqlString);
		List<History> list = query.list();
		
		
		return list;
	}
	
	public int historyToCsv(String fileName) {
		
		List<History> list = getHistory();
		//System.out.println(list.get(0).getSong().getId());
		FileWriter fileWriter = null;
		try {
			
			fileWriter = new FileWriter(fileName);
			fileWriter.write("song_id,user_id,rating");
			
			for (History history : list) {
				//System.out.println(history.getId());
				fileWriter.append(NEW_LINE_SEPARATOR);
				fileWriter.append(String.valueOf(history.getSong().getId()));
	            fileWriter.append(COMMA_DELIMITER);
	            fileWriter.append(String.valueOf(history.getUser().getId()));
	            fileWriter.append(COMMA_DELIMITER);
	            fileWriter.append(String.valueOf(history.getRating()));
	                
	                
			}
			
			
			fileWriter.flush();
			fileWriter.close();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Co loi trong qua trinh ghi file history to CSV !!!");
			return 0;
		} finally {
			
			return 1;
		}
		
	}
	public static List<String> parseCsvLine(String csvLine) {
        List<String> result = new ArrayList<String>();
        if (csvLine != null) {
            String[] splitData = csvLine.split(COMMA_DELIMITER);
            for (int i = 0; i < splitData.length; i++) {
                result.add(splitData[i]);
            }
        }
        return result;
    }
	
	//Train data matrix
	public int trainData() {
		
		try {
			Runtime rt = Runtime.getRuntime();
			Process p = rt.exec("D:/HocTap/Python/Python310/python.exe "+PREMAXTRIXPY_STRING+" "+fileData
								+" "+fileUserPred+" "+fileSongSim);
			
			return 1;
		} catch (Exception e) {
			
			return 0;
		}
		
		
	}
	public int getRatingUser() {
		
		
		try {
			Runtime rt = Runtime.getRuntime();
			Process p = rt.exec("D:/HocTap/Python/Python310/python.exe "+GETRATING_STRING+" "+fileData
								+" "+fileUserPred);
			BufferedReader r = new BufferedReader(new InputStreamReader(p.getInputStream()));
			String line;
			
			while(true) {
				
				String userpred="";
				List<String> result = new ArrayList<String>();
	              line = r.readLine();
	              if (line == null) {
	                break;
	              }
	              String[] splitData = line.split(",");
	              for (int i = 0; i < splitData.length; i++) {
	                  result.add(splitData[i]);
	              }
	                
	                for( int i = 0; i < result.size(); i++) {
	        			if(i!=0) {
	        				userpred = userpred + result.get(i)+",";
	        			}
	                }
	              User user2 = getUserByIdUser(Integer.parseInt(result.get(0)));
	              user2.setPred(userpred);
	              int a = updateUser(user2);
	              if(a==0) {
	            	  System.out.print("Line 332 admin co van de");
	              }
			}
			return 1;
		} catch (Exception e) {
			
			return 0;
		}
	}
	public Integer updateSong(Song sinhVien) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(sinhVien);
			t.commit();

		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			// TODO: handle finally clause
			session.close();
		}
		return 1;
	}
	public Integer updateUser(User sinhVien) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(sinhVien);
			t.commit();

		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			// TODO: handle finally clause
			session.close();
		}
		return 1;
	}
	public int getSongSim() {
		try {
			Runtime rt = Runtime.getRuntime();
			Process p = rt.exec("D:/HocTap/Python/Python310/python.exe "+GETSONGSIM_STRING+" "+fileData
								+" "+fileSongSim);
			BufferedReader r = new BufferedReader(new InputStreamReader(p.getInputStream()));
			String line;
			
			while(true) {
				
				String userpred="";
				List<String> result = new ArrayList<String>();
	              line = r.readLine();
	              if (line == null) {
	                break;
	              }
	              String[] splitData = line.split(",");
	              for (int i = 0; i < splitData.length; i++) {
	                  result.add(splitData[i]);
	              }
	                
	                for( int i = 0; i < result.size(); i++) {
	        			if(i!=0) {
	        				userpred = userpred + result.get(i)+",";
	        			}
	                }
	              Song user2 = getSongByIdSong(Integer.parseInt(result.get(0)));
	              user2.setPred(userpred);
	              int a = updateSong(user2);
	              if(a==0) {
	            	  System.out.print("Line 332 admin co van de");
	              }
			}
			return 1;
		} catch (Exception e) {
			
			return 0;
		}
		
		
	}
	

	public List<Song> getSongPre(String string, User user) {
			List<Song> list = new ArrayList<Song>();
			Song song;
			String[] splitData = string.split(",");
            for (int i = 0; i < splitData.length; i++) {
                 if(splitData[i]!=null&&splitData[i]!="") {
                	 if(checkSong(Integer.parseInt(splitData[i]), user.getId())==0) {
                		 song = getSongByIdSong(Integer.parseInt(splitData[i]));
                    	 
                    	 list.add(song);
                	 }
                	 
                 }
            
            }
           
			
		
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
    private static void printContry(List<String> country) {
        System.out.println(
                "Song [id= "
                + country.get(0) 
                + ", user_id= " + country.get(1) 
                + " , rating=" + country.get(2) 
                + "]");
    }

@RequestMapping( value = "/admin/trangchu.htm")
public String admin(ModelMap model,  HttpServletRequest request) {
	Session session = factory.getCurrentSession();
	String hqlsong = "FROM Song where isDel= '" + false + "'";
	Query querysong = session.createQuery(hqlsong);
	List<Song> listsong = querysong.list();
	PagedListHolder pagedListHolder = new PagedListHolder(listsong);
	int page = ServletRequestUtils.getIntParameter(request, "u", 0);
	pagedListHolder.setPage(page);
	pagedListHolder.setMaxLinkedPages(5);
	pagedListHolder.setPageSize(10);
	model.addAttribute("pagedListHolder", pagedListHolder);
	return "admin-views/songs";
}	
@RequestMapping(value = "admin/xoasong/{id}.htm")
public String xoasong(ModelMap model, @PathVariable("id") Integer id,HttpServletRequest request) {
	Session session = factory.openSession();
	Transaction t = session.beginTransaction();
	String hql = "FROM Song WHERE id = '" + id + "'";
	Query query = session.createQuery(hql);
	Song neww= (Song) query.list().get(0);
	neww.setIsDel(1);
	session.update(neww);
	t.commit();
	Session sessions = factory.getCurrentSession();
	String hqlsong = "FROM Song where isDel= '" + false + "'";
	Query querysong = sessions.createQuery(hqlsong);
	List<Song> listsong = querysong.list();
	PagedListHolder pagedListHolder = new PagedListHolder(listsong);
	int page = ServletRequestUtils.getIntParameter(request, "u", 0);
	pagedListHolder.setPage(page);
	pagedListHolder.setMaxLinkedPages(5);
	pagedListHolder.setPageSize(4);
	model.addAttribute("pagedListHolder", pagedListHolder);		
	return "admin-views/songs";
}

public List<Song> searchSong(String name) {
	Session session = factory.getCurrentSession();
	String hql = "FROM Song WHERE songName LIKE :name and isDel= '" + false + "'";
	Query query = session.createQuery(hql);
	query.setParameter("name", "%" + name + "%");
	List<Song> list = query.list();
	return list;
}

@RequestMapping(value = "timkiem.htm")
public String timkiem(ModelMap model, @RequestParam("timkiem") String kiemtra,  HttpServletRequest request) {
	Session session = factory.getCurrentSession();
	List<Song> timSong = searchSong(kiemtra);
	PagedListHolder pagedListHolder = new PagedListHolder(timSong);
	int page = ServletRequestUtils.getIntParameter(request, "u", 0);
	pagedListHolder.setPage(page);
	pagedListHolder.setMaxLinkedPages(5);
	pagedListHolder.setPageSize(4);
	model.addAttribute("pagedListHolder", pagedListHolder);
	return "admin-views/songs";
}
@RequestMapping(value = "thembaihat", method = RequestMethod.GET)
public String thembaihat(ModelMap model) {
	model.addAttribute("thembaihat", new Song());
	return "admin-views/thembaihat";
}
@RequestMapping(value = "thembaihat", method = RequestMethod.POST)
public String thembaihat(ModelMap model, HttpServletRequest request , @ModelAttribute("thembaihat") Song song,
		BindingResult errors) {
	Session session = factory.openSession();
	Transaction t = session.beginTransaction();
	if (song.getSongName().trim().length() == 0) {
		errors.rejectValue("songName", "Song", "Vui lòng nhập tên bài hát!");
	} 
	if (song.getDate().trim().length() == 0) {
		errors.rejectValue("date", "Song", "Vui lòng nhập ngày!");
	}
	
	if (song.getTag().trim().length() == 0) {
		errors.rejectValue("tag", "Song", "Vui lòng điền nhạp thể loại!");
	}
	if (song.getAudio().trim().length() == 0) {
		errors.rejectValue("audio", "Song", "Vui lòng thêm bài hát!");
	}
	if (song.getLyric().trim().length() == 0) {
		errors.rejectValue("lyric", "Song", "Vui lòng thêm lyric!");
	}
	if (song.getImage().trim().length() == 0) {
		errors.rejectValue("image", "Song", "Vui lòng thêm image!");
	}
	if (song.getAuthor().trim().length() == 0) {
		errors.rejectValue("author", "Song", "Vui lòng thêm người sáng tác!");
	}
	if (song.getPerformer().trim().length() == 0) {
		errors.rejectValue("performer", "Song", "Vui lòng thêm người thể hiện!");
	}
	if (errors.hasErrors()) {
		model.addAttribute("message", "Vui lòng sửa các lỗi sau!");
		return "admin-views/thembaihat";
	} 
	song.setPoint(0);
	song.setIsDel(0);
	try {
		session.save(song);
		t.commit();
		model.addAttribute("message", "Thêm thành công!");
	} catch (Exception e) {
		System.out.println(e);
		t.rollback();
		model.addAttribute("message", "Thêm thất bại!");
	} finally {
		session.close();
	}
	Session sessions = factory.getCurrentSession();
	String hqlsong = "FROM Song where isDel= '" + false + "'";
	Query querysong = sessions.createQuery(hqlsong);
	List<Song> listsong = querysong.list();
	PagedListHolder pagedListHolder = new PagedListHolder(listsong);
	int page = ServletRequestUtils.getIntParameter(request, "u", 0);
	pagedListHolder.setPage(page);
	pagedListHolder.setMaxLinkedPages(5);
	pagedListHolder.setPageSize(4);
	model.addAttribute("pagedListHolder", pagedListHolder);
		return "admin-views/songs";
	}	
@RequestMapping(value = "admin/suasong/{id}", method = RequestMethod.GET)
public String suabaihat(ModelMap model, @PathVariable("id") Integer id,HttpServletRequest request) {
	Session session = factory.openSession();
	Transaction t = session.beginTransaction();
	String hql = "FROM Song WHERE id = '" + id + "'";
	Query query = session.createQuery(hql);
	Song neww= (Song) query.list().get(0);
	model.addAttribute("suabaihat", neww);
	return "admin-views/suabaihat";
}
@RequestMapping(value = "admin/suasong/{id}", method = RequestMethod.POST)
public String suabaihat(ModelMap model, HttpServletRequest request , @ModelAttribute("suabaihat") Song song,
		BindingResult errors) {
	Session session = factory.openSession();
	Transaction t = session.beginTransaction();
	if (song.getSongName().trim().length() == 0) {
		errors.rejectValue("songName", "Song", "Vui lòng nhập tên bài hát!");
	} 
	if (song.getDate().trim().length() == 0) {
		errors.rejectValue("date", "Song", "Vui lòng nhập ngày!");
	}
	
	if (song.getTag().trim().length() == 0) {
		errors.rejectValue("tag", "Song", "Vui lòng điền nhạp thể loại!");
	}
	if (song.getAudio().trim().length() == 0) {
		errors.rejectValue("audio", "Song", "Vui lòng thêm bài hát!");
	}
	if (song.getLyric().trim().length() == 0) {
		errors.rejectValue("lyric", "Song", "Vui lòng thêm lyric!");
	}
	if (song.getImage().trim().length() == 0) {
		errors.rejectValue("image", "Song", "Vui lòng thêm image!");
	}
	if (song.getAuthor().trim().length() == 0) {
		errors.rejectValue("author", "Song", "Vui lòng thêm người sáng tác!");
	}
	if (song.getPerformer().trim().length() == 0) {
		errors.rejectValue("performer", "Song", "Vui lòng thêm người thể hiện!");
	}
	if (errors.hasErrors()) {
		model.addAttribute("message", "Vui lòng sửa các lỗi sau!");
		return "admin-views/thembaihat";
	} 
	song.getPoint();
	song.getIsDel();
	try {
		session.update(song);
		t.commit();
		model.addAttribute("message", "Sửa thành công!");
	} catch (Exception e) {
		System.out.println(e);
		t.rollback();
		model.addAttribute("message", "Sửa thất bại!");
	} finally {
		session.close();
	}
	Session sessions = factory.getCurrentSession();
	String hqlsong = "FROM Song where isDel= '" + false + "'";
	Query querysong = sessions.createQuery(hqlsong);
	List<Song> listsong = querysong.list();
	PagedListHolder pagedListHolder = new PagedListHolder(listsong);
	int page = ServletRequestUtils.getIntParameter(request, "u", 0);
	pagedListHolder.setPage(page);
	pagedListHolder.setMaxLinkedPages(5);
	pagedListHolder.setPageSize(4);
	model.addAttribute("pagedListHolder", pagedListHolder);
		return "admin-views/songs";
	}

@RequestMapping( value = "/admin/thongtinUser.htm")
public String thongtinUser(ModelMap model,  HttpServletRequest request) {
	Session session = factory.getCurrentSession();
	String hqlinf = "FROM User";
	Query queryinf = session.createQuery(hqlinf);
	List<User> listinf = queryinf.list();
	PagedListHolder pagedListHolder = new PagedListHolder(listinf);
	int page = ServletRequestUtils.getIntParameter(request, "u", 0);
	pagedListHolder.setPage(page);
	pagedListHolder.setMaxLinkedPages(5);
	pagedListHolder.setPageSize(8);
	model.addAttribute("pagedListHolder", pagedListHolder);
	return "admin-views/thongtinUser";
}	


}
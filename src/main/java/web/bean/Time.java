package web.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Date;

public class Time {

	public Integer isValidDay(String dateString) {
		try {
			Date dateS = new SimpleDateFormat("yyyy-MM-dd").parse(dateString);
			
			
			
		} catch (ParseException e) {
			return 0;
			
		}
		return 1;
	}
	public Long dayDiffNow(String date1) {
		//now - date2
		try {
			ZonedDateTime zonedDateTime = LocalDate.now().atStartOfDay(ZoneId.systemDefault());
			Date currentDate = Date.from(zonedDateTime.toInstant());
			Date d1 = new SimpleDateFormat("yyyy-MM-dd").parse(date1);
			
			if(currentDate.after(d1)||d1 ==currentDate) {
				Long diff = currentDate.getTime()-d1.getTime();
				Long diffDays = diff / (24 * 60 * 60 * 1000);
				return diffDays;
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return (long) 0;
	}
}

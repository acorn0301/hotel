package spring.data;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class jhClass {
	
	
	   public static Calendar CalendarFromString(String date)
	    {
	        Calendar cal = Calendar.getInstance();
	         
	        try
	        {
	            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	            cal.setTime(formatter.parse(date));
	        }
	        catch(ParseException e)
	        {
	            e.printStackTrace();
	        }
	        return cal;
	    }


	

	public static List<ReviewReplyDto> getSimpletime(List<ReviewReplyDto> list){
		
		Date now = new Date();
		
		for(ReviewReplyDto r: list) {
			
			long timediff = now.getTime()-r.getReview_reply_writeday().getTime();
						
			timediff /= 1000*60;
			
			
			if(timediff < 1) {
				r.setSimpletime("방금전");
			}else if(timediff < 60) {
				r.setSimpletime(String.valueOf(timediff) + "분전");
			}else if(timediff < 60*24) {
				r.setSimpletime(String.valueOf(timediff/60) + "시간전");
			}else if(timediff < 60*24*30 ) {
				r.setSimpletime(String.valueOf(timediff/(60*24)) + "일전");
			}else if(timediff < 60*24*30*12) {
				r.setSimpletime(String.valueOf(timediff/(60*24*30)) + "달전");
			}else {
				r.setSimpletime(String.valueOf(timediff/(60*24*30*12)) + "년전");
			}
			
		}
		
		return list;
		
	}
}


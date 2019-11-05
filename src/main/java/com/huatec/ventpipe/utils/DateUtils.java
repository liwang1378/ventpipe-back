package com.huatec.ventpipe.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {
	
	// >0 大于当前日期
	public static int compare(String dateStr) throws ParseException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = sdf.parse(dateStr);
		Date now = new Date();
		return date.compareTo(now);
	}

}

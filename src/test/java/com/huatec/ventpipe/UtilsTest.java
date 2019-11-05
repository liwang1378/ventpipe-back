package com.huatec.ventpipe;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;

public class UtilsTest {

	@Test
	public void test() throws ParseException {
		String dateStr = "2019-01-29";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = sdf.parse(dateStr);
		Date now = new Date();
		System.out.println(date.compareTo(now));
		System.out.println(now.compareTo(date));
	}

}

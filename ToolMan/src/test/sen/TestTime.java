package test.sen;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.sql.Timestamp;

public class TestTime {

	public static void main(String[] args) {

		// 取得現在時間
		Timestamp now = new Timestamp(System.currentTimeMillis());
		System.out.println(now);
		
		// 自訂時間
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar calobj = Calendar.getInstance();
		try {
			calobj.setTime(sdf.parse("2017-05-01 02:03:05"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Timestamp o_bdatetest = new Timestamp(calobj.getTimeInMillis());
		System.out.println(o_bdatetest);

	}

}

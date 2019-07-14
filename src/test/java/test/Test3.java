package test;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;

public class Test3 {

	@Test
	public void generateId() {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		System.out.println(format.format(new Date()));
	}
}

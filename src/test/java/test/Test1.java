package test;

import java.time.format.DateTimeFormatter;
import java.util.Date;

import org.apache.commons.lang3.time.DateUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import edu.hncj.entity.Book;
import edu.hncj.mapper.BookMapper;


public class Test1 {

	private ApplicationContext ioc=new ClassPathXmlApplicationContext("applicationContext.xml");
	private BookMapper bookMapper=ioc.getBean("bookMapper",BookMapper.class);
	@Test
	public void t1() {
		Book book = new Book();
		book.setBookId("11");
		book.setSales(1000);
		Integer updateById = bookMapper.updateById(book);
		System.out.println(updateById);
	}
	@Test
	public void t2() {
		String hashAlgorithmName = "MD5";
		Object credentials = "123456";
		Object salt = ByteSource.Util.bytes("admin1");
		int hashIterations = 1024;
		String password1 = new SimpleHash(hashAlgorithmName, credentials, salt, hashIterations).toHex();
		System.out.println(password1);
	}
	
	
}

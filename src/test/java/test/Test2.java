package test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.redis.core.RedisTemplate;

import edu.hncj.common.AESUtil;
import edu.hncj.entity.Book;

public class Test2 {
	

//	@Test
//	public void s () {
//		ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext-redis.xml");
//		System.out.println(context);
//		RedisTemplate bean = context.getBean(RedisTemplate.class);
//		System.out.println(bean);
//		Book book = new Book();
//		Book selectById = book.selectById(11);
//		Logger logger = Logger.getLogger(Test2.class);
//		logger.info(selectById.toString()); ext@73035e27
//		bean.opsForValue().set("dd", selectById);@75412c2f
//	}
	@Test
	public void s2() {
		/**
         * 第一种
         */
        String content = "123456";
        String password = "18749669210";
        //加密
        System.out.println("加密前：" + content);
        byte[] encryptResult = AESUtil.encrypt(content, password);
        String encryptResultStr = AESUtil.parseByte2HexStr(encryptResult);
        System.out.println("加密后：" + encryptResultStr);
        //解密
        byte[] decryptFrom = AESUtil.parseHexStr2Byte(encryptResultStr);
        byte[] decryptResult = AESUtil.decrypt(decryptFrom, password);
        System.out.println("解密后：" + new String(decryptResult));

	}
	@Test
	public void s21() {
		Date date = new Date();
		System.out.println(date);
//		long time = date.getTime();
//		System.out.println(time);
//		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-MM-dd");
//		System.out.println(simpleDateFormat.format(date));
//		UUID randomUUID = UUID.randomUUID();
//		System.out.println(randomUUID);
	}
}

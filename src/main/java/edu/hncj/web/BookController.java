package edu.hncj.web;


import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.baomidou.mybatisplus.mapper.BaseMapper;

import edu.hncj.entity.Book;
import edu.hncj.service.BookService;

import java.util.HashMap;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author dayan
 * @since 2019-03-19
 */
@Controller
@RequestMapping("/book")
public class BookController {
	@Autowired
	private BookService bookService;
	@Autowired
	private RedisTemplate<String, Integer> redis;
	@RequestMapping(value="/bookinfo/{bookId}",method=RequestMethod.GET)
	public String  bookinfo(@PathVariable("bookId") String bookId,Model m) {
		Book book = bookService.selectById(bookId);
		Integer i= redis.opsForValue().get(bookId);
		if(i!=null) {
			i++;
			redis.opsForValue().set(bookId, i);
			redis.expire(bookId, 1, TimeUnit.HOURS);
		}else {
		i = book.getBrowseCount()==null?0:book.getBrowseCount();
		redis.opsForValue().set(bookId, i);
		}
		if(i%10==0&&i!=0) {
			book.setBrowseCount(i);
			bookService.updateById(book);
		}
		//List<Book> list = bookService.selectList(8);
		m.addAttribute("book", book);
		//m.addAttribute("list", list);
		return "bookinfo";
	}
	@RequestMapping(value="search",method=RequestMethod.GET)
	public String bookSearch(String title,Model m) {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("book_name", title);
		List<Book> selectByMap = bookService.selectByMap(hashMap);
		if(selectByMap.size()<0) {
			return "views/404";
		}
		m.addAttribute("book",selectByMap.get(0));
		return "bookinfo";
	}
}


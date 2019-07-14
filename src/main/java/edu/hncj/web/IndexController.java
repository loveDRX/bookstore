package edu.hncj.web;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baomidou.mybatisplus.mapper.EntityWrapper;

import edu.hncj.entity.Book;
import edu.hncj.entity.BookType;
import edu.hncj.service.BookService;
import edu.hncj.service.BookTypeService;

@Controller
@RequestMapping("/")
public class IndexController {
	@Autowired
	private BookService bookService;
	@Autowired
	private BookTypeService bService;
	@RequestMapping({"","/","index"})
	public String index(Model model) {
		EntityWrapper<Book> entityWrapper = new EntityWrapper<Book>();
		entityWrapper.orderBy("recommend_value",false).last("limit 4");
		List<Book> list1 = bookService.selectList(entityWrapper);
		Integer limit=null;
		limit=limit==null?20:limit;
		List<Book> list2 = bookService.selectList(limit);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("parent_id","0");
		List<BookType> selectByMap = bService.selectByMap(map);
		for (BookType bookType : selectByMap) {
			map.put("parent_id",bookType.getId());
			List<BookType> selectByMap2 = bService.selectByMap(map);
			bookType.setTwoList(selectByMap2);
		}
//		HashMap<String, Object> hashMap1 = new HashMap<String, Object>();
//		hashMap1.put("parentId", "0");
//		List<BookType> list5= bookTypeService.selectByMap(hashMap1);
//		for (BookType bookType : list5) {
//			//遍历一级分类，把二级分类存进去
//			hashMap1.put("parentId", bookType.getId());
//			List<BookType> map = bookTypeService.selectByMap(hashMap1);
//			bookType.setTwoList(map);
//		}
//		model.addAttribute("list", list5);
		model.addAttribute("list", selectByMap);
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		return "index";
	}
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	@RequestMapping("/register")
	public String register() {
		return "register";
	}
}

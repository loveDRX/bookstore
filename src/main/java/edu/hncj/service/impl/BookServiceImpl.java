package edu.hncj.service.impl;

import edu.hncj.entity.Book;
import edu.hncj.mapper.BookMapper;
import edu.hncj.service.BookService;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import java.util.List;
import java.util.concurrent.TimeUnit;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author dayan
 * @since 2019-03-19
 */
@Service
public class BookServiceImpl extends ServiceImpl<BookMapper, Book> implements BookService {
	@Autowired
	private RedisTemplate<String, List<Book>> redis;
	private static final Logger logger=LoggerFactory.getLogger(BookServiceImpl.class); 
	public List<Book> selectList(Integer limit) {
		// TODO Auto-generated method stub
	//	List<Book> list = redis.opsForValue().get("tushu");
		List<Book> list = redis.opsForSet().pop("tushuSet");
		if(list!=null&&list.size()>0) {
			logger.info("使用了redis的缓存数据");
			if(limit<20) {
				return list.subList(0, limit);
			}
			return list;
		}
		EntityWrapper<Book> wrapper = new EntityWrapper<Book>();
		wrapper.orderBy(false,"sales").last("limit "+limit);
		List<Book> list2 = baseMapper.selectList(wrapper);
	//	redis.opsForValue().set("tushu", list2);
		redis.expire("tushuSet",1, TimeUnit.HOURS);
		redis.opsForSet().add("tushuSet", list2);
		return list2;
	}

}

package edu.hncj.service;

import edu.hncj.entity.Book;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author dayan
 * @since 2019-03-19
 */
public interface BookService extends IService<Book> {

	List<Book> selectList(Integer limit);

}

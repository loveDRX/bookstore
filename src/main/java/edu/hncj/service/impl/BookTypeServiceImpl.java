package edu.hncj.service.impl;

import edu.hncj.entity.BookType;
import edu.hncj.mapper.BookTypeMapper;
import edu.hncj.service.BookTypeService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

/**
 * <p>
 * 商品类别表 服务实现类
 * </p>
 *
 * @author dayan
 * @since 2019-03-31
 */
@Service
public class BookTypeServiceImpl extends ServiceImpl<BookTypeMapper, BookType> implements BookTypeService {
@Resource
private BookTypeMapper bookTypeMapper;
	public List<BookType> selectByparentId(Integer id) {
		// TODO Auto-generated method stub
		List<BookType> list=bookTypeMapper.selectByparentId(id);
		return list;
	}

}

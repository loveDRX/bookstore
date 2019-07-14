package edu.hncj.service;

import edu.hncj.entity.BookType;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 * 商品类别表 服务类
 * </p>
 *
 * @author dayan
 * @since 2019-03-31
 */
public interface BookTypeService extends IService<BookType> {

	List<BookType> selectByparentId(Integer id);

}

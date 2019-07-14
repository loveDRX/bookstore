package edu.hncj.mapper;

import edu.hncj.entity.BookType;

import java.util.List;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * <p>
 * 商品类别表 Mapper 接口
 * </p>
 *
 * @author dayan
 * @since 2019-03-31
 */
public interface BookTypeMapper extends BaseMapper<BookType> {

	List<BookType> selectByparentId(Integer id);

}

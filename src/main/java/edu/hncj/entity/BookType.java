package edu.hncj.entity;

import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;
import java.util.List;

/**
 * <p>
 * 商品类别表
 * </p>
 *
 * @author dayan
 * @since 2019-03-31
 */
@TableName("book_type")
public class BookType extends Model<BookType> {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 名称
     */
    private String name;
    /**
     * 级别 0 是一级分类 1 是二级分类
     */
    private Integer grade;
    /**
     * 父ID
     */
    @TableField(exist = false)
    private List twoList;
    

	public List getTwoList() {
		return twoList;
	}

	public void setTwoList(List twoList) {
		this.twoList = twoList;
	}
	@TableField("parent_id")
	private Integer parentId;
    /**
     * 序号(显示的先后序号）
     */
    private Integer number;
    /**
     * 列表logo
     */
    private String logo;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "BookType{" +
        ", id=" + id +
        ", name=" + name +
        ", grade=" + grade +
        ", parentId=" + parentId +
        ", number=" + number +
        ", logo=" + logo +
        "}";
    }
}

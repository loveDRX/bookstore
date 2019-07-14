package edu.hncj.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.activerecord.Model;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author dayan
 * @since 2019-03-20
 */
public class Cart extends Model<Cart> {

    private static final long serialVersionUID = 1L;

    @TableField("customer_id")
    private String customerId;
    @TableField("book_id")
    private String bookId;
    private Integer count;


    public Cart(String bookId, Integer count) {
		super();
		this.bookId = bookId;
		this.count = count;
	}

	public Cart(String customerId, String bookId, Integer count) {
		super();
		this.customerId = customerId;
		this.bookId = bookId;
		this.count = count;
	}

	public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    @Override
    protected Serializable pkVal() {
        return null;
    }

    @Override
    public String toString() {
        return "Cart{" +
        ", customerId=" + customerId +
        ", bookId=" + bookId +
        ", count=" + count +
        "}";
    }
}

package edu.hncj.entity;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author dayan
 * @since 2019-03-25
 */
@TableName("order_item")
public class OrderItem extends Model<OrderItem> {

    private static final long serialVersionUID = 1L;

    @TableField("product_id")
    private String productId;
    @TableField("product_name")
    private String productName;
    @TableField("product_image")
    private String productImage;
    @TableField("product_count")
    private Integer productCount;
    @TableField("product_money")
    private BigDecimal productMoney;
    @TableField("order_id")
    private String orderId;

    
    public OrderItem() {
		super();
	}

	public OrderItem(String productId, String productName,  BigDecimal productMoney,String productImage) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productImage = productImage;
		this.productMoney = productMoney;
	}


	public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public Integer getProductCount() {
        return productCount;
    }

    public void setProductCount(Integer productCount) {
        this.productCount = productCount;
    }

    public BigDecimal getProductMoney() {
        return productMoney;
    }

    public void setProductMoney(BigDecimal productMoney) {
        this.productMoney = productMoney;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    @Override
    protected Serializable pkVal() {
        return null;
    }

    @Override
    public String toString() {
        return "OrderItem{" +
        ", productId=" + productId +
        ", productName=" + productName +
        ", productImage=" + productImage +
        ", productCount=" + productCount +
        ", productMoney=" + productMoney +
        ", orderId=" + orderId +
        "}";
    }
}

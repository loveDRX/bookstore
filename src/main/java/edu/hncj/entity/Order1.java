package edu.hncj.entity;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

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
 * @since 2019-03-25
 */
public class Order1 extends Model<Order1> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.INPUT)
    private String id;
    @TableField("total_money")
    private BigDecimal totalMoney;
    @TableField("user_id")
    private String userId;
    @TableField("reciver_name")
    private String reciverName;
    @TableField("reciver_address")
    private String reciverAddress;
    @TableField("reciver_phone")
    private String reciverPhone;
    @TableField("create_time")
    private Date createTime;
    /**
     * 0未支付，1支付完成
     */
    private String state;

    private List<OrderItem> orderItem;
    public List<OrderItem> getOrderItem() {
		return orderItem;
	}

	public void setOrderItem(List<OrderItem> orderItem) {
		this.orderItem = orderItem;
	}

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public BigDecimal getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(BigDecimal totalMoney) {
        this.totalMoney = totalMoney;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getReciverName() {
        return reciverName;
    }

    public void setReciverName(String reciverName) {
        this.reciverName = reciverName;
    }

    public String getReciverAddress() {
        return reciverAddress;
    }

    public void setReciverAddress(String reciverAddress) {
        this.reciverAddress = reciverAddress;
    }

    public String getReciverPhone() {
        return reciverPhone;
    }

    public void setReciverPhone(String reciverPhone) {
        this.reciverPhone = reciverPhone;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "Order1{" +
        ", id=" + id +
        ", totalMoney=" + totalMoney +
        ", userId=" + userId +
        ", reciverName=" + reciverName +
        ", reciverAddress=" + reciverAddress +
        ", reciverPhone=" + reciverPhone +
        ", createTime=" + createTime +
        ", state=" + state +
        "}";
    }
}

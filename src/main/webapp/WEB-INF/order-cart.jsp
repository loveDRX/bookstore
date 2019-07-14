<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" /> 
<meta name="format-detection" content="telephone=no" />  
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" /> 
<meta name="format-detection" content="telephone=no" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>订单结算页</title>
<!--结算页面样式-->	
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/res/static/css/main.css" />
  <link rel="stylesheet" type="text/css" href="res/layui/css/layui.css" />
  <script type="text/javascript" src="res/layui/layui.js"></script>
<link rel="stylesheet" type="text/css" href="../css/jquery.alerts.css?v=20160713" />
<link rel="stylesheet" type="text/css" href="../css/head.css?v=20160713" />
<link rel="stylesheet" type="text/css" href="../css/order.css?v=20160713" />
<script type="text/javascript" src="../js/jquery-3.3.1.min.js?v=20160713"></script>
</head>	
<body id="mainframe">
<%@include file="/WEB-INF/header.jsp" %>
<div class="orderMain">
<form action="genernateOrder" method="post">
<input type="hidden" name="id" value="${guid }" />
  <h3 class="orderHd">填写并核对订单信息</h3>
  <div id="userAddrId" class="orderTbody ">
    <h3 class="orderTitle">收货人信息：<span class="addrAlter" style="display:inline;">[确认信息]</span></h3>
    <div class="orderItem">
        <div class="orderCurr" id="userAddress" style="display:block;">
          <ul>
            <li><input type="hidden" name="userId" value="${sessionScope.customer.id }" /><input type="text" name="reciverName" value="${sessionScope.customer.username }" />&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="reciverPhone" value="${sessionScope.customer.tel }" />&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="reciverAddress" value="${sessionScope.customer.address }" /></li>
          </ul>
        </div>
    </div>
  </div>
  <div class="orderTbody" style="width:958px;border-bottom:0 none;">
  <div class="backToCart"><a style=" text-decoration:underline;" target="" href="/bookstore/cart/getCart">返回修改购物车</a></div>
  <h3 class="orderTitle">商品信息：</h3>
  <span class="clear"></span>
  <div class="orderPItem">
  <div id="producthtml">

	<div id="chaidanorder2" class="">
		<div class="orderItem">
			<div class="dateShow">
				<strong>商品下单后尽快为您发货</strong>
			</div>
			<div class="orderTbl">
				<div class="orderThead">
					<div class="tCol">商品图片</div>
					<div class="tCol pGoods">商品名称</div>
					<div class="tCol pPrice">单价</div>
					<div class="tCol pQuantity">数量</div>
					<div class="tCol pSubtotal">小计</div>
				</div>
				<c:forEach items="${list3}" var="d" varStatus="status">
				<input type="hidden" name="orderItem[${status.index}].productId"  value="${d.productId}"/>
				<div class="orderPInfo">
					<div class="pItem">
						<a href="#">
						<input type="hidden" name="orderItem[${status.index}].productImage"  value="${d.productImage}"/>
						<img src="${pageContext.request.contextPath }/img/product/${d.productImage}" style="width: 60px;height: 60px;"/>
						</a>
					</div>
					<div class="pItem pGoods">
					<input type="hidden" name="orderItem[${status.index}].productName"  value="${d.productName}"/>
						<a href="#">${d.productName}</a>
					</div>
					<input type="hidden" name="orderItem[${status.index}].productMoney"  value="${d.productMoney}"/>
					<div class="pItem pPrice" style="position: relative; z-index: 99">
						${d.productMoney}
					</div>
					<input type="hidden" name="orderItem[${status.index}].productCount"  value="${d.productCount}"/>
					<div class="pItem pQuantity">${d.productCount}</div>
					<div class="pItem pSubtotal">¥${d.productMoney*d.productCount }</div> 
					<span class="clear"></span>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
</div>
  <div class="orderItem" style="position:relative;padding-top:10px;">

    <div id="ordercoupon1" class="ordercoupon"><span id="ordercoupon"></span></div>
    <div class="order-info" style="z-index: -1;">
     </div>
  </div>
  </div>
  <div class="orderTFoot">
  	<div id="orderSaveTip" class="ct"></div>            
    <div class="submitOrder">
      <div class="orderSubmit">
      	<input  class="submitBtn" value="提交订单 " type="submit"/>
      </div>
      <div class="orderAccount">
        <span class="t">应付总额：</span>
        <span class="p">¥</span>
        <input type="hidden" name="totalMoney"  value="${totalMoney}"/>
        	<span id="countPrice" class="p">${totalMoney}
        </span>
      </div>
      <span class="clear"></span>
    </div>
  </div>
  </form>
</div>

<!-- /main -->
<jsp:include page="footer.jsp" />
</body>
</html>
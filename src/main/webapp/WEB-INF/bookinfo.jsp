<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>图书详清</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/res/static/css/main.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/res/layui/css/layui.css">
  <script type="text/javascript" src="${pageContext.request.contextPath }/res/layui/layui.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
  <style type="text/css">
   	#cart1{
   	  width: 260px;
   	  height: 320px;
   	}
  </style>
</head>
<body>
<%@include file="/WEB-INF/header.jsp" %> 

  <div class="content content-nav-base datails-content">
    <div class="main-nav">
      <div class="inner-cont0">
        <div class="inner-cont1 w1200">
          <div class="inner-cont2">
            <a href="commodity.html" class="active">所有商品</a>
          </div>
        </div>
      </div>
    </div>
    <div class="data-cont-wrap w1200">
      <div class="crumb">
        <a href="javascript:;">首页</a>
        <span>></span>
        <a href="javascript:;">所有商品</a>
        <span>></span>
        <a href="javascript:;">产品详情</a>
      </div>
      <div class="product-intro layui-clear">
        <div class="preview-wrap">
          <a href="javascript:;"><img id="cart1" src="${pageContext.request.contextPath }/img/product/${book.bookImage }"></a>
        </div>
        <div class="itemInfo-wrap">
          <div class="itemInfo">
            <div class="title">
              <h4>${book.bookName } </h4>
              <span><i class="layui-icon layui-icon-rate-solid"></i>收藏</span>
            </div>
            <div class="summary">
              <p class="reference"><span>参考价</span> <del>￥${book.originalPrice }</del></p>
              <p class="activity"><span>活动价</span><strong class="price"><i>￥${book.money }</i></strong></p>
              <c:if test="${sessionScope.customer !=null }">
              <p class="address-box"><span>送&nbsp;&nbsp;&nbsp;&nbsp;至</span><strong class="address">${sessionScope.customer.address}</strong></p>
              </c:if>
            </div>
            <div class="choose-attrs">
              <div class="color layui-clear"><span class="title">作&nbsp;&nbsp;&nbsp;&nbsp;者:</span> <div class="color-cont"><span class="btn">${book.bookAuthor }</span></div></div>
              <div class="number layui-clear"><span class="title">数&nbsp;&nbsp;&nbsp;&nbsp;量:</span><div class="number-cont"><span class="cut btn">-</span><input onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" 
              onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" maxlength="4" type="" id="count" name="" value="1"><span class="add btn">+</span></div></div>
              	<div><span class="title">库&nbsp;&nbsp;&nbsp;&nbsp;存:</span>${book.bookInventory }</div>
            </div>
            <div class="choose-btns">
              <button class="layui-btn layui-btn-primary purchase-btn">立刻购买</button>
              <button id="addcart" class="layui-btn  layui-btn-danger car-btn"><i class="layui-icon layui-icon-cart-simple"></i>加入购物车</button>  
            </div>
          </div>
         <div class="detail">
          <h4>详情</h4>
          <div class="item">
            ${book.bookDescription }
          </div>
        </div>
        </div>
      </div>
      <div class="layui-clear">
        
       
      </div>
    </div>
  </div>
<script type="text/javascript">
  layui.config({
    base: '${pageContext.request.contextPath }/res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
  }).use(['mm','jquery'],function(){
      var mm = layui.mm,$ = layui.$;
      var cur = $('.number-cont input').val();
      $('.number-cont .btn').on('click',function(){
        if($(this).hasClass('add')){
          cur++;
         
        }else{
          if(cur > 1){
            cur--;
          }  
        }
        $('.number-cont input').val(cur)
      })
      
  });
  var a=${book.bookId};
  
  $("#addcart").click(function(){
	  var b=$("#count").val();
		$.ajax({
			url:"${pageContext.request.contextPath }/cart/addcart",
			type:"post",
			data:{
				bookId:a,
				count:b
			},
			async:true,
			success:function(data){
				if(data=='1'){
					alert("添加成功")
				}else alert("添加失败")
			}
		});
		
	})
</script>
</body>
</html>
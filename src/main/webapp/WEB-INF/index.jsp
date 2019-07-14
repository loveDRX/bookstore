<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>网上书城</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/res/static/css/main.css">
  <link rel="stylesheet" type="text/css" href="res/layui/css/layui.css">
  <script type="text/javascript" src="res/layui/layui.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>
<body id="list-cont">
<%@include file="/WEB-INF/header.jsp" %>
<c:forEach items="${put }" var="l">
	<p>${l.list.btName}</p>
</c:forEach>
  <div class="content">
    <div class="main-nav">
      <div class="inner-cont0">
        <div class="inner-cont1 w1200">
          <div class="inner-cont2">
            <a href="commodity.html" class="active">你想要的全都有!</a>
          </div>
        </div>
      </div>
    </div>
    <div class="category-con">
      <div class="category-inner-con w1200">
        <div class="category-type">
          <h3>全部分类</h3>
        </div>
        <div class="category-tab-content">
          <div class="nav-con">
            <ul class="normal-nav layui-clear">
            <c:forEach items="${list}" var="l3">
              <li class="nav-item nobor">
                <div class="title">${l3.name}</div>
                <p>
                <c:forEach items="${l3.twoList }" var="tl">
                <a href="#">${tl.name}</a>
                </c:forEach>
                </p>
                <i class="layui-icon layui-icon-right"></i>
              </li>
              </c:forEach> 
            </ul>
          </div>
        </div>
      </div>
      <div class="category-banner">
        <div class="w1200">
          <img style="width: 950px;margin-left: 300px" src="res/static/img/banner.jpg">
        </div>
      </div>
    </div>
    <div class="floors">
      <div class="sk">
        <div class="sk_inner w1200">
          <div class="sk_hd">
            <a href="javascript:;">
              <img src="res/static/img/s_img1.jpg">
            </a>
          </div>
          <div class="sk_bd">
            <div class="layui-carousel" id="test1">
            <div carousel-item>
            
                   <div class="item-box">
              	
              <c:forEach items="${list1 }" var="l1" >
               <div class="item">
                    <a href="book/bookinfo/${l1.bookId }"><img src="img/product/${l1.bookImage }"></a>
                    <div class="title">${l1.bookName }</div>
                    <div class="price">
                      <span>￥${l1.money }</span>
                      <del>￥${l1.originalPrice }</del>
                    </div>
                  </div>
              </c:forEach>
              
                </div></div>
            </div>
          </div>
        </div>    
      </div>
    </div>


    <div class="product-list-box" id="product-list-box">
      <div class="product-list-cont w1200">
        <h4>更多推荐</h4>
        <div class="product-item-box layui-clear">
        <c:forEach items="${list2 }" var="l2">
          <div class="list-item">
            <a href="book/bookinfo/${l2.bookId }"><img style="width: 190px;height: 170px" src="img/product/${l2.bookImage }"></a>
           <p>${l2.bookName }</p>
            <span>￥${l2.money }</span>
          </div>
          </c:forEach>
        </div>
      </div>
    </div>
  </div>

  <div class="footer">
    <div class="ng-promise-box">
      <div class="ng-promise w1200">
        <p class="text">
          <a class="icon1" href="javascript:;">7天无理由退换货</a>
          <a class="icon2" href="javascript:;">满99元全场免邮</a>
          <a class="icon3" style="margin-right: 0" href="javascript:;">100%品质保证</a>
        </p>
      </div>
    </div>
    <div class="mod_help w1200">                                     
      <p>
        <a href="javascript:;">关于我们</a>
        <span>|</span>
        <a href="javascript:;">帮助中心</a>
        <span>|</span>
        <a href="javascript:;">售后服务</a>
        <span>|</span>
        <a href="javascript:;">管理资讯</a>
        <span>|</span>
        <a href="javascript:;">关于货源</a>
      </p>
      <p class="coty">商城版权所有 &copy; 2012-2020</p>
    </div>
  </div>
  <script type="text/javascript">

layui.config({
    base: 'res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
  }).use(['mm','carousel'],function(){
      var carousel = layui.carousel,
     mm = layui.mm;
     var option = {
        elem: '#test1'
        ,width: '100%' //设置容器宽度
        ,arrow: 'always'
        ,height:'298' 
        ,indicator:'none'
      }
      carousel.render(option);
});
  </script>
</body>
</html>
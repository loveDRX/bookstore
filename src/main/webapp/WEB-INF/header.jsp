<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="site-nav-bg">
    <div class="site-nav w1200">
      <p class="sn-back-home">
        <i class="layui-icon layui-icon-home"></i>
        <a href="${pageContext.request.contextPath }/index">首页</a>
      </p>
      <div class="sn-quick-menu">
       		<c:if test="${sessionScope.customer !=null }">欢迎您，亲爱的${sessionScope.customer.username }<a href="${pageContext.request.contextPath }/customer/logout">退出登陆</a></c:if>
        <c:if test="${sessionScope.customer eq null }"><div class="login"><a href="${pageContext.request.contextPath }/login">登录</a></div></c:if>
        <div class="sp-cart"><a href="${pageContext.request.contextPath }/cart/getCart">购物车</a>&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath }/register">注册</a></div>
      </div>
    </div>
  </div>


  <div class="header">
    <div class="headerLayout w1200">
      <div class="headerCon">
        <h1 class="mallLogo">
          <a href="${pageContext.request.contextPath }/index" title="777图书商城">
            <img style="width: 30%;height: 30%" src="${pageContext.request.contextPath }/res/static/img/logo1.png">
          </a>
        </h1>
        <div class="mallSearch">
          <form action="${pageContext.request.contextPath }/book/search" method="get" class="layui-form" novalidate>
            <input type="text" name="title" required  lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入需要的商品">
            <button class="layui-btn" lay-submit lay-filter="formDemo" type="submit">
                <i class="layui-icon layui-icon-search"></i>
            </button>
          </form>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
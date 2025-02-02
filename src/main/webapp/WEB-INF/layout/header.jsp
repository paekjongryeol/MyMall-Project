<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.mall.table.vo.UserInfoVO" %>
<%
		UserInfoVO uservo = (UserInfoVO)session.getAttribute("MallUser");
		System.out.println("=====================");
		if(uservo!=null){
		System.out.println(uservo.getUserId());
		}
 %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

   <!-- ======= Header ======= -->
  <header id="header" class="d-flex align-items-center">
    <div class="container d-flex justify-content-between">

      <div class="logo">
        <h1 class="text-light"><a href="index.html">MY SHOP</a></h1>
      </div>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="active" href="/main/mall">홈</a></li>
          <li><a href="/cart/list">장바구니</a></li>
          <li><a href="/inquiry/board">문의하기</a></li>
          <%
          if(uservo== null || uservo.getUserId()==null){
          %>
          <li><a href="/login">로그인</a></li>
          <li><a href="/join">회원가입</a></li>
          <%}else{ %>
          <li><a href="#" onclick="logout();">로그아웃</a></li>
          <%} %>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->
  
  <form id='logoutform'>
  </form>
  
  <script>
  	function logout(){
  		call_server(logoutform, "/logout", chkLogOut);
  	}
  	
  	function chkLogOut(){
  		location.href='/main/mall';
  	}
  </script>
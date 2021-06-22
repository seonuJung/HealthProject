<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>달력</title>
<style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:hover { color: blue; text-decoration: none;}
</style>
</head>
<body>
	<header>
	<h1 align="center"><a href="?yy=${Calendar.getInstance().get(Calendar.YEAR) }&mm=${Calendar.getInstance().get(Calendar.MONTH)}">헬스관리 프로그램</a></h1>
	<c:if test="${empty user }">
	<div align="right">
	<button onclick="location.href='login'">로그인</button>
	</div>
	</c:if>
	<c:if test="${not empty user}">
	
		<h4 align="right">[<a href="${pageContext.request.contextPath }/joinupdate">정보 수정</a>]</h4>
	<c:if test="${user.grade == 3 }">
		<h4 align="right">[<a href="${pageContext.request.contextPath }/sysupdate">관리자모드</a>]</h4>
	</c:if>
	
	<div align="right">
	<strong>${user.member_name }님</strong>
	<button onclick="location.href='logout'" style="margin-right: 300; ">로그 아웃</button>
	</div>
	
	</c:if>
	</header>
</body>
</html>
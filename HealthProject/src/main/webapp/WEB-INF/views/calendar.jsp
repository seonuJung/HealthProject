<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="header.jsp" %>
<%@ include file="menu.jsp" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>달력</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/comm.js"></script>
<style type="text/css">
table {
	border: none;
	width: 1200px;
	margin: auto;
	border-spacing: 5px;
	padding: 10px;
}

th {
	padding: 10px;
	background-color: #6daaed;
	boder: 1px solid gray;
	width: 100px;
	border-radius: 5px;
}

.title {
	font-size: 30pt;
	height: 40px;
	border: none;
	text-align: center;
}


td {
	border: 1px solid gray;
	padding: 15px;
	height: 20px;
	text-align: right;
	vertical-align: top;
	border-radius: 5px;
}
 a:link { color: black; text-decoration: none;}
 a:hover { color: blue; text-decoration: none;}
</style>
</head>
<body>
	<table>
		<tr align="center" >
			<td colspan="2" class="title">
				<a href="?yy=${yy-1 }&mm=${mm}"> <img src="./resources/images/first.png" alt="이전년도"> </a>
				<a href="?yy=${yy }&mm=${mm-1}"> <img src="./resources/images/prev.png" alt="이전월"> </a>
			</td>
			<td colspan="3" class="title">
				${yy }년 ${mm }월
			</td>
			<td colspan="2" class="title">
				<a href="?yy=${yy }&mm=${mm+1}"> <img src="./resources/images/next.png" alt="다음월"> </a>
				<a href="?yy=${yy+1 }&mm=${mm}"> <img src="./resources/images/last.png" alt="다음년도"> </a>
			</td>
		</tr>
		<tr>
			<th style="color: red;">일</th>
			<th>월</th><th>화</th><th>수</th><th>목</th><th>금</th>
			<th style="color: blue;">토</th>
		</tr>
		<tr>
			<%-- 빈칸을 이용해 1일의 위치를 맞춘다 --%>
			<c:forEach begin="1" end="${list[0].solarDay }">
				<td>&nbsp;</td>
			</c:forEach>
			<%-- 마지막 날짜 --%>
			<c:forEach var="i" begin="0" end="${list[fn:length(list)-1].solarDate-1 }">
				<%-- 일요일 이면 빨강 --%>
				<c:if test="${list[i].solarDay==0}"><td style="color:red;"></c:if>
				<%-- 토요일 이면 파랑 --%>
				<c:if test="${list[i].solarDay==6}"><td style="color:blue;"></c:if>
				
				<c:if test="${list[i].solarDay!=0 && list[i].solarDay!=6 }"><td></c:if>
					<c:if test="${user.grade==2 }">
						<div style="font-size: 20pt">
							<a href="javascript:sendPost('${pageContext.request.contextPath }/plan',{ 'dd': ${list[i].solarDate }, 'yy':${yy }, 'mm':${mm }} );">
								${list[i].solarDate }
							</a>
						</div>
					</c:if>
					<c:if test="${user.grade==1}">
						<div style="font-size: 20pt">${list[i].solarDate }</div>
						<c:forEach var="ptlist" items="${ptList }">
						<c:if test="${user.member_phone == ptlist.member_phone }">
						<c:if test="${fn:substring(ptlist.pt_date,0,4)==yy }">
						<c:if test="${fn:substring(ptlist.pt_date,4,6)==month }">
						<c:if test="${fn:substring(ptlist.pt_date,6,8)==list[i].solarDate }">
							pt시간 : ${ptlist.pt_time } <br />
							운동부위 : ${ptlist.pt_exercise } <br />
							pt잔여횟수 : ${ptlist.pt_remain }회
						</c:if>
						</c:if>
						</c:if>
						</c:if>
						</c:forEach>
					</c:if>
					<c:if test="${empty user}">
						<div style="font-size: 20pt">${list[i].solarDate }</div>
					</c:if>
					<c:if test="${user.grade==3}">
						<div style="font-size: 20pt">${list[i].solarDate }</div>
					</c:if>
				</td>
				<%-- 토요일에서 줄바꿔주기 --%>
				<c:if test="${list[i].solarDay==6 }">
					</tr>
					<c:if test="${list[i].solarDate<list[fn:length(list)-1].solarDate }">
						<tr>
					</c:if>
				</c:if>
			</c:forEach>
			<%-- 남은 부분 빈칸으로 채우기 --%>
			<c:if test="${list[fn:length(list)-1].solarDay!=6}">
				<c:forEach begin="${list[fn:length(list)-1].solarDay+1}" end="6">
					<td>&nbsp;</td>
				</c:forEach>
			</c:if>
		</tr>
		</table>
</body>
<%@ include file="footer.jsp" %>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 - 글쓰기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/comm.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
		function formCheck(){
			var value = $("#member_name").val();
			if(!value || value.trim().length==0){
				alert('로그인후 글쓰기가 가능합니다.');
				document.location.href = 'login';
				return false;
			}
			var value = $("#member_title").val();
			if(!value || value.trim().length==0){
				alert('제목은 반드시 입력해야 합니다.');
				 $("#member_title").val("");
				 $("#member_title").focus();
				return false;
			}
			var value = $("#member_content").val();
			if(!value || value.trim().length==0){
				alert('내용은 반드시 입력해야 합니다.');
				 $("#member_content").val("");
				 $("#member_content").focus();
				return false;
			}
			return true; 
		}
</script>
</head>
<body>
	<form action="${pageContext.request.contextPath }/guestinsertOk" method="post" onsubmit="return formCheck()">
	<table style="width: 700px;">
		<tr>
			<td colspan="4" class="title">
			자유게시판 - 글쓰기
			</td>
		</tr>
		<tr>
			<th width="15%">이름</th>
			<td>
				<input type="text" name="member_name" id="member_name" size="10" value="${user.member_name }" readonly="readonly"/>
				<input type="hidden" name="suggestion_mode" id="suggestion_mode" size="20" value="insert"/>
			</td>
			<th width="15%">아이디</th>
			<td>
				<input type="text" name="member_id" id="member_id" size="10" value="${user.member_id }" readonly="readonly"/>
			</td>
		</tr>
		<tr>
			<th width="15%">제목</th>
			<td colspan="4">
				<input type="text" name="member_title" id="member_title" size="94" placeholder="제목 입력" required="required" />
			</td>
		</tr>
		<tr>
			<th width="15%" valign="top"><br /><br /><br /><br />내용</th>
			<td colspan="4">
				<textarea name="member_content" id="member_content" cols="95" rows="10" placeholder="내용을 입력하세요" required="required"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="4" class="info">
				<input type="submit" value="저장하기"/>
				<input type="reset" value="다시쓰기" />
				<input type="button" value="리스트로" onclick="location.href='guest'"/>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 - 글쓰기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/comm.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
		function formCheck(){
			var value = $("#sys_title").val();
			if(!value || value.trim().length==0){
				alert('제목은 반드시 입력해야 합니다.');
				 $("#sys_title").val("");
				 $("#sys_title").focus();
				return false;
			}
			var value = $("#sys_content").val();
			if(!value || value.trim().length==0){
				alert('내용은 반드시 입력해야 합니다.');
				 $("#sys_content").val("");
				 $("#sys_content").focus();
				return false;
			}
			return true; 
		}
</script>
</head>
<body>
	<form action="${pageContext.request.contextPath }/newsinsertOk" method="post" onsubmit="return formCheck()">
	<table style="width: 700px;">
		<tr>
			<td colspan="2" class="title">
			공지사항 - 글쓰기
			</td>
		</tr>
		<tr>
			<th width="15%">이름</th>
			<td>
				<input type="text" name="sys_name" id="sys_name" size="10" value="${user.member_name }" readonly="readonly"/>
				<input type="hidden" name="notice_mode" id="notice_mode" size="20" value="insert"/>
			</td>
		</tr>
		<tr>
			<th width="15%">제목</th>
			<td colspan="2">
				<input type="text" name="sys_title" id="sys_title" size="83" placeholder="제목 입력" required="required" />
			</td>
		</tr>
		<tr>
			<th width="15%" valign="top"><br /><br /><br /><br />내용</th>
			<td colspan="2">
				<textarea name="sys_content" id="sys_content" cols="84" rows="10" placeholder="내용을 입력하세요" required="required"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="3" class="info">
				<input type="submit" value="저장하기" />
				<input type="reset" value="다시쓰기" />
				<input type="button" value="리스트로" onclick="location.href='news'"/>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link href="resources/css/comm.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
		function formCheck(){
			var value = $("#sys_name").val();
			if(!value || value.trim().length==0){
				alert('공지사항은 로그인후(관리자만) 글쓰기가 가능합니다.');
				document.location.href = 'login';
				return false;
			}
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
		
		function editForm(notice_idx, sys_name, sys_title, sys_content, sys_date){
			$("#notice_idx").val(notice_idx);				
			$("#sys_name").val(sys_name);				
			$("#sys_title").val("");				
			$("#sys_content").val("");				
			$("#sys_date").val(sys_date);				
			$("#notice_mode").val("update");
			
			document.getElementById('sys_title').readOnly = false;
			document.getElementById('sys_content').readOnly = false;
			$("#sys_title").focus(); 
		}

		function deleteForm(notice_idx, sys_name, sys_title, sys_content, sys_date){
			$("#submitBtn").val('삭제');
			$("#notice_idx").val(notice_idx);				
			$("#sys_name").val(sys_name);				
			$("#sys_title").val(sys_title);				
			$("#sys_content").val(sys_content);				
			$("#sys_date").val(sys_date);
			$("#notice_mode").val("delete")
		}
</script>
</head>
<body>
	<form action="${pageContext.request.contextPath }/newsinsertOk" method="post" onsubmit="return formCheck()">
	<table style="width: 700px;">
		<tr>
			<td colspan="3" class="title">
			공지사항
			</td>
		</tr>
		<tr>
			<th width="15%">이름</th>
			<td>
				<input type="hidden" name="notice_mode" id="notice_mode" size="20" value="update"/>
				<input type="hidden" id="notice_idx" name="notice_idx" value="0"/>
				<input type="text" name="sys_name" id="sys_name" size="10" value="${news.sys_name }" readonly="readonly"/>
			</td>
			<td align="center">
				<fmt:formatDate value="${news.sys_date }" pattern="yy-MM-dd"/>
			</td>
		</tr>
		<tr>
			<th width="15%">제목</th>
			<td colspan="3">
				<input type="text" name="sys_title" id="sys_title" size="83" placeholder="제목 입력" value="${news.sys_title}" required="required" readonly="readonly"/>
			</td>
		</tr>
		<tr>
			<th width="15%" valign="top"><br /><br /><br /><br />내용</th>
			<td colspan="3">
				<textarea name="sys_content" id="sys_content" cols="84" rows="10" placeholder="내용을 입력하세요" readonly="readonly">${news.sys_content }</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="3" class="info">
				<c:if test="${user.grade==3 }">
				<button onclick="editForm('${news.notice_idx }','${news.sys_name }','${news.sys_title }','${news.sys_content }','${news.sys_date }');">수정</button>
				<button onclick="deleteForm('${news.notice_idx }','${news.sys_name }','${news.sys_title }','${news.sys_content }','${news.sys_date }');">삭제</button>
				<input type="submit" id="submitBtn" value="변경사항 저장하기">
				</c:if>
				<input type="button" value="리스트로" onclick="location.href='news'"/>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>
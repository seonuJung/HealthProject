<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스케줄</title>
<link href="resources/css/comm.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		
	});
	
	function formCheck(){
		var value = $("#member_id").val();
		if(!value || value.trim().length==0){
			alert('아이디는 반드시 입력해야 합니다.');
			 $("#member_id").val("");
			 $("#member_id").focus();
			 return false;
		}
		var value = $("#member_password").val();
		if(!value || value.trim().length==0){
			alert('비밀번호는 반드시 입력해야 합니다.');
			 $("#member_password").val("");
			 $("#member_password").focus();
			 return false;
		}
		var value = $("#member_name").val();
		if(!value || value.trim().length==0){
			alert('이름은 반드시 입력해야 합니다.');
			 $("#member_name").val("");
			 $("#member_name").focus();
			 return false;
		}
		var value = $("#member_birth").val();
		if(!value || value.trim().length==0){
			alert('생년월일은 반드시 입력해야 합니다.');
			 $("#member_birth").val("");
			 $("#member_birth").focus();
			 return false;
		}
		var value = $("#member_phone").val();
		if(!value || value.trim().length==0){
			alert('휴대폰번호는 반드시 입력해야 합니다.');
			 $("#member_phone").val("");
			 $("#member_phone").focus();
			 return false;
		}
		var value = $("#weight").val();
		if(!value || value.trim().length==0){
			alert('몸무게는 반드시 입력해야 합니다.');
			 $("#weight").val("");
			 $("#weight").focus();
			 return false;
		}
		var value = $("#height").val();
		if(!value || value.trim().length==0){
			alert('신장은 반드시 입력해야 합니다.');
			 $("#height").val("");
			 $("#height").focus();
			 return false;
		}
		
		var value = $("#grade").val();
		if(!value || value.trim().length==0){
			alert('등급은 반드시 입력해야 합니다.');
			 $("#grade").val("");
			 $("#grade").focus();
			 return false;
		}
		
		return true;
	}

	function editForm(member_idx, member_id, member_password, member_name, member_birth, member_phone, weight, height, grade){
		$("#submitBtn").val('수정'); 
		$("#member_idx").val(member_idx);				
		$("#member_id").val(member_id);				
		$("#member_password").val(member_password);				
		$("#member_name").val(member_name);				
		$("#member_birth").val(member_birth);				
		$("#member_phone").val(member_phone);
		$("#weight").val(weight);
		$("#height").val(height);
		$("#grade").val(grade);
		$("#member_mode").val("update");
		
		
		$("#cancelBtn").css('display','inline'); 
		$("#member_idx").focus(); 
	}

	function deleteForm(member_idx, member_id, member_password, member_name, member_birth, member_phone, weight, height, grade){
		$("#submitBtn").val('삭제');
		$("#member_idx").val(member_idx);				
		$("#member_id").val(member_id);				
		$("#member_password").val(member_password);				
		$("#member_name").val(member_name);				
		$("#member_birth").val(member_birth);				
		$("#member_phone").val(member_phone);
		$("#weight").val(weight);
		$("#height").val(height);
		$("#grade").val(grade);
		$("#member_mode").val("delete")
		
		$("#cancelBtn").css('display','inline'); 
		
	}
	
</script>
</head>
<body>
	<table border="1">
		<tr>
			<td colspan="9" align="center" class="title">회원 목록</td>
		</tr>
		<tr>
			<th>회원 번호</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>전화번호</th>
			<th>몸무게</th>
			<th>신장</th>
			<th>등급</th>
		</tr>
		<c:if test="${empty list }">
			<tr>
				<td colspan="9" style="text-align: center;">등록된 회원이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="list" items="${list }">
					<tr>
						<td align="center"><c:out value="${list.member_idx }"/></td>
						<td align="center"><c:out value="${list.member_id }"/></td>
						<td align="center"><c:out value="${list.member_password }"/></td>
						<td align="center"><c:out value="${list.member_name }"/></td>
						<td align="center"><c:out value="${list.member_birth }"/></td>
						<td align="center"><c:out value="${list.member_phone }"/></td>
						<td align="center"><c:out value="${list.weight }"/></td>
						<td align="center"><c:out value="${list.height }"/></td>
						<td align="center">
							<c:out value="${list.grade }"/>
							<button onclick="editForm('${list.member_idx }','${list.member_id }','${list.member_password }','${list.member_name }','${list.member_birth }','${list.member_phone }','${list.weight }','${list.height }','${list.grade }');">수정</button>
							<button onclick="deleteForm(${list.member_idx },'${list.member_id }','${list.member_password }','${list.member_name }','${list.member_birth }','${list.member_phone }','${list.weight }','${list.height }','${list.grade }');">삭제</button>
						</td>
					</tr>
			</c:forEach>
		</c:if>
		<%-- 입력폼 --%>
		<tr>
			<td colspan="9" style="text-align: center;">
				<form action="sysupdateOk" method="post" onsubmit="return formCheck();">
					<input type="hidden" id="member_mode" name="member_mode"/>
					<input type="text" id="member_idx" name="member_idx" readonly="readonly"/>
					<input type="text" name="member_id" id="member_id" required="required" readonly="readonly"/>
					<input type="text" name="member_password" id="member_password" required="required"/>
					<input type="text" name="member_name" id="member_name" required="required"/>
					<input type="text" name="member_birth" id="member_birth" required="required"/>
					<input type="text" name="member_phone" id="member_phone" required="required"/>
					<input type="text" name="weight" id="weight" required="required"/>
					<input type="text" name="height" id="height" required="required"/>
					<input type="text" name="grade" id="grade" required="required"/>
					<input type="submit" id="submitBtn" value="수정,삭제">
					<h4 align="right" ><a href="${pageContext.request.contextPath }/">돌아가기</a></h4>
					<%-- 수정/삭제를 취소하는 버튼 처음에는 보일 필요가 없다. --%>
					<input type="button" id="cancelBtn" value="취소" style="display: none;" onclick="resetForm()">
				</form>			
			</td>
		</tr>
	</table>
</body>
</html>
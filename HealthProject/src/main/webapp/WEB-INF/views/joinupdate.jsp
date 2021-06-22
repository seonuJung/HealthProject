<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

function formCheck(){
	var data = $("#member_password").val();
	if(!data || data.trim().length==0){
		alert('비밀번호는 반드시 입력해야합니다');
		$("#member_password").val("");
		$("#member_password").focus();
		return false;
	}
	var data = $("#member_password2").val();
	if(!data || data.trim().length==0){
		alert('비밀번호 확인는 반드시 입력해야합니다.');
		$("#member_password2").val("");
		$("#member_password2").focus();
		return false;
	}
		
	if($("#member_password").val() != $("#member_password2").val()){
		alert('비밀번호가 일치하지 않습니다.');
		$("#member_password").val("");
		$("#member_password2").val("");
		$("#member_password").focus();
		return false;
		}
	
	var data = $("#member_birth").val();
	if(!data || data.trim().length==0){
		alert('생년월일은 반드시 입력해야합니다.');
		$("#member_birth").val("");
		$("#member_birth").focus();
		return false;
	}
	
	var data = $("#member_phone").val();
	if(!data || data.trim().length==0){
		alert('핸드폰번호는 반드시 입력해야합니다.');
		$("#member_phone").val("");
		$("#member_phone").focus();
		return false;
	}
	
	var data = $("#weight").val();
	if(!data || data.trim().length==0){
		alert('몸무게는 반드시 입력해야합니다.');
		$("#weight").val("");
		$("#weight").focus();
		return false;
	}
	
	var data = $("#height").val();
	if(!data || data.trim().length==0){
		alert('키는 반드시 입력해야합니다.');
		$("#height").val("");
		$("#height").focus();
		return false;
	}else{
	alert('수정이 정상적으로 되었습니다.');
	return true;
	}	
}

</script>
</head>
<body>
	<h1 align="center">회원 수정</h1>
	<form method="POST" action="${pageContext.request.contextPath }/joinupdateOk" onsubmit="return formCheck();">
		<table style="border: 1px solid gray" align="center">
			<tr>
				<td >
					<input type="hidden" name="member_idx" id="member_idx" value="${user.member_idx }">
				</td>
			</tr>	
			<tr>
				<td align="center">사용자아이디</td>
				<td >
					<input type="text" name="member_id" id="member_id" value="${user.member_id }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td align="center">비밀번호</td>
				<td>
					<input type="password" name="member_password" id="member_password">
				</td>
			</tr>
			<tr>
				<td align="center">비밀번호확인</td>
				<td>
					<input type="password" name="member_password2" id="member_password2">
				</td>
			</tr>
			<tr>
				<td align="center">이름</td>
				<td>
					<input type="text" name="member_name" id="member_name" value="${user.member_name }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td align="center">생년월일</td>
				<td>
					<input type="text" placeholder="숫자만 입력하시오." name="member_birth" id="member_birth" value="${user.member_birth }">
				</td>
			</tr>
			<tr>
				<td align="center">전화번호</td>
				<td>
					<input type="text" placeholder="-없이 입력하시오." name="member_phone" id="member_phone" value="${user.member_phone }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td align="center">몸무게</td>
				<td>
					<input type="text" placeholder="숫자만 입력하시오." name="weight" id="weight" value="${user.weight }">
					kg
				</td>
			</tr>
			<tr>
				<td align="center">키</td>
				<td>
					<input type="text" placeholder="숫자만 입력하시오" name="height" id="height" value="${user.height }">
					cm
				</td>
			</tr>
			<tr>
				<td align="center">등급</td>
				<td align="center">
					<input type="radio" name="grade" value="1" checked="checked">회원
					<input type="radio" name="grade" value="2">트레이너
				</td>
			</tr>
		</table>
		<div align="right" style="margin: 50px">
           <button type="submit">회원 수정</button>
           <h4 align="right" ><a href="${pageContext.request.contextPath }/">돌아가기</a></h4>
        </div>
	</form>
</body>
</html>
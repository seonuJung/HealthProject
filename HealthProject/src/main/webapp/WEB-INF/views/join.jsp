<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

function formCheck(){
	if($("#idCheck").css('color')=='rgb(255, 0, 0)'){
		alert('가입 불가능한 아이디입니다.');
		$("#member_id").val("");
		$("#member_id").focus();
		return false;
	}
	
	var data = $("#member_id").val();
	if(!data || data.trim().length==0){
		alert('아이디는 반드시 입력해야합니다.');
		$("#member_id").val("");
		$("#member_id").focus();
		return false;
	}
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
	var data = $("#member_name").val();
	if(!data || data.trim().length==0){
		alert('사용자 이름은 반드시 입력해야합니다.');
		$("#member_name").val("");
		$("#member_name").focus();
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
		alert('신장은 반드시 입력해야합니다.');
		$("#height").val("");
		$("#height").focus();
		return false;
	}else{
	alert('회원가입이 정상적으로 되었습니다.');
	return true;
	}	
}
// 아이디 중복 확인
function idCheck(){
	var value = $("#member_id").val();
	if(value.length>3){
		$.ajax('idCheck',{
			type:'GET',
			data:{'member_id': value},
			dataType:'json',
			error : function(){
				alert('아이디를 다시입력하시오.');
			},
			success:function(data){
				if(data==1)
					$("#idCheck").css('color','red').html("사용 불가능한 아이디입니다.");
				else 
					$("#idCheck").css('color','green').html("사용 가능한 아이디입니다.");
			}
		});
	}else{
		$("#idCheck").html("");
	}
}
</script>
</head>
<body>
	<h1 align="center">회원 가입</h1>
	<form method="POST" action="${pageContext.request.contextPath }/joinOk" onsubmit="return formCheck();">
		<table style="border: 1px solid gray" align="center">
			<tr>
				<td align="center">사용자아이디</td>
				<td >
					<input type="text" name="member_id" id="member_id" onkeyup="idCheck();">
				</td>
				<td>
					<span id="idCheck" style="text-align: right;"></span>
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
					<input type="text" name="member_name" id="member_name">
				</td>
			</tr>
			<tr>
				<td align="center">생년월일</td>
				<td>
					<input type="text" placeholder="숫자만 입력하시오." name="member_birth" id="member_birth">
				</td>
			</tr>
			<tr>
				<td align="center">전화번호</td>
				<td>
					<input type="text" placeholder="-없이 입력하시오." name="member_phone" id="member_phone">
				</td>
			</tr>
			<tr>
				<td align="center">몸무게</td>
				<td>
					<input type="text" placeholder="숫자만 입력하시오." name="weight" id="weight">
					kg
				</td>
			</tr>
			<tr>
				<td align="center">신장</td>
				<td>
					<input type="text" placeholder="숫자만 입력하시오" name="height" id="height">
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
           <button type="submit">회원가입</button>
           <button type="button" onclick="location.href='login'">돌아가기</button>
        </div>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>회원관리-로그인</title>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function formCheck(){
		var data = $("#member_id").val();
		if(data==null || data.trim().length==0){
			alert('아이디는 반드시 입력해야 합니다.');
			$("#member_id").val("");
			$("#member_id").focus();
			return false;
		}
		var data = $("#member_password").val();
		if(data==null || data.trim().length==0){
			alert('비밀번호는 반드시 입력해야 합니다.');
			$("#member_password").val("");
			$("#member_password").focus();
			return false;
		}
		return true; 
	}
</script>
</head>
<body>
	
	<div>
		<div>
			<div>
				<form action="${pageContext.request.contextPath }/loginOk" method="post" onsubmit="return formCheck()">
					<h1 align="center">로그인</h1>

					
					<div data-validate = "member_id is required" align="center">
						<input type="text" name="member_id" id="member_id" value="${member_id }">
						<span></span>
					</div>
					
					
					<div data-validate = "member_password is required" align="center">
						<input type="password" name="member_password" id="member_password">
						<span></span>
					</div>
<br />					
					<div>
						<div align="center">
							<input type="checkbox" name="remember" value="save" ${not empty member_id ? "checked='checked'":"" } >
							<label style="font-size: 10pt;">
								아이디저장
							</label>
						</div>
<br />
						<div align="center">
							<a href="${pageContext.request.contextPath }/join">
								회원가입
							</a>
						</div>
					</div>
<br />		
					<div align="center">
						<button style="width: 100px; height: 30px ">
							Login
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
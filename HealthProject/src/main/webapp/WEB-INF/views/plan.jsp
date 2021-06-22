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
	function formCheck(){
		var value = $("#pt_time").val();
		if(!value || value.trim().length==0){
			alert('예약시간은 반드시 입력해야 합니다.');
			 $("#pt_time").val("");
			 $("#pt_time").focus();
			 return false;
		}
		var value = $("#member_name").val();
		if(!value || value.trim().length==0){
			alert('이름은 반드시 입력해야 합니다.');
			 $("#member_name").val("");
			 $("#member_name").focus();
			 return false;
		}
		var value = $("#pt_age").val();
		if(!value || value.trim().length==0){
			alert('나이는 반드시 입력해야 합니다.');
			 $("#pt_age").val("");
			 $("#pt_age").focus();
			 return false;
		}
		var value = $("#pt_exercise").val();
		if(!value || value.trim().length==0){
			alert('운동부위는 반드시 입력해야 합니다.');
			 $("#pt_exercise").val("");
			 $("#pt_exercise").focus();
			 return false;
		}
		var value = $("#pt_remain").val();
		if(!value || value.trim().length==0){
			alert('남은횟수는 반드시 입력해야 합니다.');
			 $("#pt_remain").val("");
			 $("#pt_remain").focus();
			 return false;
		}
		var value = $("#member_phone").val();
		if(!value || value.trim().length==0){
			alert('핸드폰번호는 반드시 입력해야 합니다.');
			 $("#member_phone").val("");
			 $("#member_phone").focus();
			 return false;
		}
		var value = $("#pt_date").val();
		if(!value || value.trim().length==0){
			alert('예약날짜는 반드시 입력해야 합니다.');
			 $("#pt_date").val("");
			 $("#pt_date").focus();
			 return false;
		}
		if(value.trim().length!=8){
			alert('예약날짜는 20210101형식이여야합니다.');
			 $("#pt_date").val("");
			 $("#pt_date").focus();
			 return false;
		}
		return true;
	}

	function editForm(pt_idx, trainer_id, pt_time, member_name, pt_age, pt_exercise, pt_remain, member_phone, pt_date){
		$("#submitBtn").val('수정'); 
		$("#pt_idx").val(pt_idx);				
		$("#trainer_id").val(trainer_id);				
		$("#pt_time").val(pt_time);				
		$("#member_name").val(member_name);				
		$("#pt_age").val(pt_age);				
		$("#pt_exercise").val(pt_exercise);
		$("#pt_remain").val(pt_remain);
		$("#member_phone").val(member_phone);
		$("#pt_date").val(pt_date);
		$("#pt_mode").val("update");
		
		
		$("#cancelBtn").css('display','inline'); 
		$("#pt_time").focus(); 
	}

	function deleteForm(pt_idx, trainer_id, pt_time, member_name, pt_age, pt_exercise, pt_remain, member_phone, pt_date){
		$("#submitBtn").val('삭제');
		$("#pt_idx").val(pt_idx);				
		$("#trainer_id").val(trainer_id);				
		$("#pt_time").val(pt_time);				
		$("#member_name").val(member_name);				
		$("#pt_age").val(pt_age);				
		$("#pt_exercise").val(pt_exercise);
		$("#pt_remain").val(pt_remain);
		$("#member_phone").val(member_phone);
		$("#pt_date").val(pt_date);
		$("#pt_mode").val("delete")
		
		$("#cancelBtn").css('display','inline'); 
		
	}
	
	function resetForm(){
		$("#submitBtn").val('저장'); 
		$("#pt_time").val("");				
		$("#member_name").val("");				
		$("#pt_age").val("");				
		$("#pt_exercise").val("");
		$("#pt_remain").val("0");
		$("#member_phone").val("");
		$("#pt_date").val("");
		$("#pt_mode").val("insert")
		
		
		$("#cancelBtn").css('display','none');
		$("#pt_time").focus();
	}	
	
	function user(obj) {
		var value=obj.value;
		//alert(value);
		document.getElementById("member_phone").value=value;
	}
</script>
</head>
<body>
	<table border="1">
		<tr>
			<td colspan="8" align="center" class="title">${date } 예약회원 목록</td>
		</tr>
		<tr>
			<th>트레이너아이디</th>
			<th>예약시간</th>
			<th>성함</th>
			<th>나이</th>
			<th>운동할부위</th>
			<th>pt남은횟수</th>
			<th>전화번호</th>
			<th>예약 날짜</th>
		</tr>
		<c:if test="${empty ptList }">
			<tr>
				<td colspan="8" style="text-align: center;">등록된 예약회원이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty ptList }">
			<c:forEach var="ptlist" items="${ptList }">
				<c:if test="${date == ptlist.pt_date }">
				<c:if test="${user.member_id == ptlist.trainer_id }">
					<tr>
						<td align="center"><c:out value="${ptlist.trainer_id }"/></td>
						<td align="center"><c:out value="${ptlist.pt_time }"/></td>
						<td align="center"><c:out value="${ptlist.member_name }"/></td>
						<td align="center"><c:out value="${ptlist.pt_age }"/></td>
						<td align="center"><c:out value="${ptlist.pt_exercise }"/></td>
						<td align="center"><c:out value="${ptlist.pt_remain }"/></td>
						<td align="center"><c:out value="${ptlist.member_phone }"/></td>
						<td align="center">
							<c:out value="${ptlist.pt_date }"/>
							<button onclick="editForm('${ptlist.pt_idx }','${ptlist.trainer_id }','${ptlist.pt_time }','${ptlist.member_name }','${ptlist.pt_age }','${ptlist.pt_exercise }','${ptlist.pt_remain }','${ptlist.member_phone }','${ptlist.pt_date }');">수정</button>
							<button onclick="deleteForm('${ptlist.pt_idx }','${ptlist.trainer_id }','${ptlist.pt_time }','${ptlist.member_name }','${ptlist.pt_age }','${ptlist.pt_exercise }','${ptlist.pt_remain }','${ptlist.member_phone }','${ptlist.pt_date }');">삭제</button>
						</td>
					</tr>
				</c:if>
				</c:if>
			</c:forEach>
		</c:if>
		<%-- 입력폼 --%>
		<tr>
			<td colspan="8" style="text-align: center;">
				<form action="${pageContext.request.contextPath }/planupdate" method="post" onsubmit="return formCheck();">
					<select onchange="javascript:user(this);">
						<option value="none">===선택===</option>
						<c:forEach var="userlist" items="${userList }">
						<c:if test="${userlist.grade == 1 }">
							<option value="${userlist.member_phone }">${userlist.member_name}</option>
						</c:if>
						</c:forEach>
					</select>
					<input type="hidden" id="pt_mode" name="pt_mode" value="insert"/>
					<input type="hidden" id="pt_idx" name="pt_idx" value="0"/>
					<input type="hidden" id="trainer_id" name="trainer_id" value="${user.member_id }"/>
					<input type="text" name="pt_time" id="pt_time" placeholder="예약 시간" required="required"/>
					<input type="text" name="member_name" id="member_name" placeholder="성함" required="required"/>
					<input type="text" name="pt_age" id="pt_age" placeholder="나이" required="required"/>
					<input type="text" name="pt_exercise" id="pt_exercise" placeholder="운동할 부위" required="required"/>
					<input type="text" name="pt_remain" id="pt_remain" placeholder="pt남은 횟수" required="required"/>
					<input type="text" name="member_phone" id="member_phone" placeholder="전화번호" required="required"/>
					<input type="text" name="pt_date" id="pt_date" value="${date }" required="required"/>
					<input type="submit" id="submitBtn" value="저장">
					<input type="button" id="cancelBtn" value="취소" style="display: none;" onclick="resetForm()">
					<h4 class="info"><a href="${pageContext.request.contextPath }/">돌아가기</a></h4>
				</form>			
			</td>
		</tr>
	</table>
</body>
</html>
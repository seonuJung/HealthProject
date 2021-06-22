<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
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
			var value = $("#member_id").val();
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
		function cmformCheck(){
			var value = $("#sys_id").val();
			if(!value || value.trim().length==0){
				alert('로그인후 글쓰기가 가능합니다.');
				document.location.href = 'login';
				return false;
			}
			var value = $("#sys_name").val();
			if(!value || value.trim().length==0){
				alert('로그인후 글쓰기가 가능합니다.');
				document.location.href = 'login';
				return false;
			}
			var value = $("#sys_content").val();
			if(!value || value.trim().length==0){
				alert('제목은 반드시 입력해야 합니다.');
				 $("#sys_content").val("");
				 $("#sys_content").focus();
				return false;
			}
			return true; 
		}
		
		function editForm(sg_idx, member_name, member_id, member_title, member_content, member_date){
			$("#sg_idx").val(sg_idx);				
			$("#member_name").val(member_name);				
			$("#member_id").val(member_id);				
			$("#member_title").val("");				
			$("#member_content").val("");				
			$("#member_date").val(member_date);				
			$("#suggestion_mode").val("update");
			
			document.getElementById('member_title').readOnly = false;
			document.getElementById('member_content').readOnly = false;
			$("#sys_title").focus(); 
		}

		function deleteForm(sg_idx, member_name, member_id, member_title, member_content, member_date){
			$("#submitBtn").val('삭제');
			$("#sg_idx").val(sg_idx);				
			$("#member_name").val(member_name);				
			$("#member_id").val(member_id);				
			$("#member_title").val(member_title);				
			$("#member_content").val(member_content);				
			$("#member_date").val(member_date);	
			$("#suggestion_mode").val("delete")
		}
		function resetForm(){
			$("#resetBtn").css('display','none');
			$("#cm_mode").val('insert');
			$("#cm_idx").val(0);
			$("#sys_content").val("");
			$("#sys_content").removeAttr("readonly");
			$("#cmsubmitBtn").val('댓글저장');
			$("#sys_name").focus();
		}
		function cmeditForm(cm_idx, ref, sys_name, sys_id, sys_content){
			$("#resetBtn").css('display','inline');
			$("#cm_mode").val('update');
			$("#cm_idx").val(cm_idx);
			$("#ref").val(ref);
			$("#sys_name").val(sys_name);
			$("#sys_id").val(sys_id);
			$("#sys_content").val(sys_content);
			$("#cmsubmitBtn").val('댓글수정');
			$("#sys_content").focus();
		}
		function cmdeleteForm(cm_idx, ref, sys_name, sys_id, sys_content){
			$("#resetBtn").css('display','inline');
			$("#cm_mode").val('delete');
			$("#cm_idx").val(cm_idx);
			$("#ref").val(ref);
			$("#sys_name").val(sys_name);
			$("#sys_id").val(sys_id);
			$("#sys_content").val(sys_content);
			$("#sys_content").attr("readonly","readonly");
			$("#cmsubmitBtn").val('댓글삭제');
		}
		$(function(){
			// 취소 버튼을 숨긴다.
			$("#resetBtn").css('display','none');
			
			$("#commentForm").submit(function() {
				var value = $("#sys_content").val();
				if(!value || value.trim().length==0){
					alert('내용은 반드시 입력해야 합니다.');
					 $("#sys_content").val("");
					 $("#sys_content").focus();
					return false;
				}
				return true; 
			});
		});
</script>
</head>
<body>
	<form action="${pageContext.request.contextPath }/guestinsertOk" method="post" onsubmit="return formCheck()">
	<table style="width: 700px;">
		<tr>
			<td colspan="5" style="font-size: 22pt; border: none; text-align: center; margin: auto; width: 90%;">
			자유게시판
			</td>
			<td class="info">
			(${count })개의 댓글이 있습니다.
			</td>
		</tr>
		<tr>
			<th width="15%" align="center">이름</th>
			<td align="center">
				<input type="hidden" name="suggestion_mode" id="suggestion_mode" size="20" value="update"/>
				<input type="hidden" id="sg_idx" name="sg_idx" value="0"/>
				<input type="text" name="member_name" id="member_name" size="10" style="text-align: center;" value="${guest.member_name }" readonly="readonly"/>
			</td>
			<th width="15%" align="center">아이디</th>
			<td align="center"">
				<input type="text" name="member_id" id="member_id" size="10" style="text-align: center;" value="${guest.member_id }" readonly="readonly"/>
			</td>
			<td align="center" colspan="2">
				<fmt:formatDate value="${guest.member_date }" pattern="yy-MM-dd"/>
			</td>
		</tr>
		<tr>
			<th width="15%">제목</th>
			<td colspan="6">
				<input type="text" name="member_title" id="member_title" size="82" placeholder="제목 입력" value="${guest.member_title}" required="required" readonly="readonly"/>
			</td>
		</tr>
		<tr>
			<th width="15%" valign="top"><br /><br /><br /><br />내용</th>
			<td colspan="6">
				<textarea name="member_content" id="member_content" cols="84" rows="10" placeholder="내용을 입력하세요" readonly="readonly">${guest.member_content }</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="6" class="info">
				<c:if test="${user.member_id == guest.member_id }">
				<button onclick="editForm('${guest.sg_idx }','${guest.member_name }','${guest.member_id }','${guest.member_title }','${guest.member_content }','${guest.member_date }');">수정</button>
				<button onclick="deleteForm('${guest.sg_idx }','${guest.member_name }','${guest.member_id }','${guest.member_title }','${guest.member_content }','${guest.member_date }');">삭제</button>
				<input type="submit" id="submitBtn" value="변경사항 저장하기">
				</c:if>
				<input type="button" value="리스트로" onclick="location.href='guest'"/>
			</td>
		</tr>
	</table>
	</form>
	
	<form action="commentOk" method="post" onsubmit="return cmformCheck()">
	<table style="width: 700px">
		<tr>
			<td>
						<input type="hidden" name="sg_idx"  id="sg_idx"   value="${guest.sg_idx }"/>
						<input type="hidden" name="cm_idx"  id="cm_idx"   value="0" />
						<input type="hidden" name="ref"     id="ref"      value="${guest.sg_idx }"/>
						<input type="hidden" name="p" value="${pv.currentPage }" />
						<input type="hidden" name="s" value="${pv.pageSize }" />
						<input type="hidden" name="b" value="${pv.blockSize }" />
						<input type="hidden" name="cm_mode" id="cm_mode"  value="insert"/>
						<input type="text"   name="sys_id"  id="sys_id"   value="${user.member_id }" placeholder="로그인을 해주세요." readonly="readonly"/>
						<input type="text"   name="sys_name"id="sys_name" value="${user.member_name }" placeholder="로그인을 해주세요." readonly="readonly"/>
			</td>
		</tr>
		<tr>
			<td>
						<textarea name="sys_content" id="sys_content" cols="100" rows="5" required="required"></textarea>
						<br /><br />
						<input type="submit" style="margin-left: 605px" id="cmsubmitBtn" value="댓글저장">
						<input type="button" onclick='resetForm()' id="resetBtn" value="취소">
			</td>
		</tr>
	</table>
	</form>
	<table>
		<%-- 댓글 리스트 --%>
		<c:if test="${empty guest.list }">
			<tr>
				<td colspan="4" align="center"> 등록된 댓글이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty guest.list }">
			<c:forEach var="cm" items="${guest.list }">
			<tr>
				<td colspan="4" style="border: none;"> 
					<div style="background-color: #a9d6ae;padding:5px;">
						<strong>${cm.sys_id }</strong>님이 
						<strong>
							<fmt:formatDate value="${cm.sys_date }" pattern="yyyy년 MM월 dd일 hh:mm"/>
						</strong>에 남긴글
						<c:if test="${user.member_id == cm.sys_id }">
						<button onclick="cmeditForm('${cm.cm_idx}','${guest.sg_idx }','${cm.sys_name}','${cm.sys_id}','${cm.sys_content}');">수정</button>
						</c:if>
						<c:if test="${user.grade == 3 || user.member_id == cm.sys_id }">
						<button onclick="cmdeleteForm('${cm.cm_idx}','${guest.sg_idx }','${cm.sys_name}','${cm.sys_id}','${cm.sys_content}');">삭제</button>
						</c:if>
					</div>
					<div style="border: 1px solid gray;padding:8px; padding-left: 20px; border-radius: 5px">
						<c:set var="content" value="${cm.sys_content }"/>
						<c:set var="content" value='${fn:replace(cm.sys_content, "<","&lt;") }'/>
						<c:set var="content" value='${fn:replace(cm.sys_content, newLine, br) }'/>
						<span><strong>${cm.sys_name } &nbsp; :</strong> ${content }</span>
					</div>
				</td>
			</tr>
			</c:forEach>
		</c:if>
	</table>
</body>
</html>
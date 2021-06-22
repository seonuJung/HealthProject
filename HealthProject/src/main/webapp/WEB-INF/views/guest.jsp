<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/comm.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/comm.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#viewCount").change(function() {
		var value = $(this).val();
		sendPost('guest', {"p":${pv.currentPage},"s":value,"b":${pv.blockSize}})
	});
});
</script>
</head>
<body>
	<table>
		<tr>
			<td colspan="5" align="center" class="title">자유게시판</td>
		</tr>
		<tr>
			<td colspan="5" class="info">
				${pv.pageInfo }
				<select id="viewCount">
					<option value="3"  ${pv.pageSize==3 ? "selected='selected'" : "" }> 3개씩보기</option>
					<option value="5"  ${pv.pageSize==5 ? "selected='selected'" : "" }> 5개씩보기</option>
					<option value="10" ${pv.pageSize==10 ? "selected='selected'" : "" }>10개씩보기</option>
					<option value="15" ${pv.pageSize==15 ? "selected='selected'" : "" }>15개씩보기</option>
					<option value="20" ${pv.pageSize==20 ? "selected='selected'" : "" }>20개씩보기</option>
					<option value="30" ${pv.pageSize==30 ? "selected='selected'" : "" }>30개씩보기</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>No</th>
			<th width="60%">제목</th>
			<th>작성자</th>
			<th>작성자ID</th>
			<th>작성일</th>
		</tr>
			<c:if test="${not empty pv.list }">
				<c:set var="no" value="${pv.totalCount - (pv.currentPage-1) * pv.pageSize }"/>
				<c:forEach var="vo" items="${pv.list }" varStatus="vs">
					<tr align="center"  onmouseover="this.style.backgroundColor='#9ce7ef'" onmouseout="this.style.backgroundColor='white'">
						<td>${no-vs.index}</td>
						<td align="left"  onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'">
								<span style="cursor: pointer" onclick="sendPost('${pageContext.request.contextPath }/guestview',{'sg_idx': ${vo.sg_idx },'p': ${pv.currentPage },'s': ${pv.pageSize },'b': ${pv.blockSize }});">
								
								<c:if test="${fn:length(vo.member_title) lt 30 }">
									<c:out value="${vo.member_title }"/>	
								</c:if>
								<c:if test="${fn:length(vo.member_title) ge 30 }">
									<span title="${vo.member_title }">
										<c:out value="${fn:substring(vo.member_title,0,30) }"/> ...	
									</span>
								</c:if>
								</span>
						</td>
								<td>
									<c:out value="${vo.member_name }"/>
								</td>
								<td>
									<c:out value="${vo.member_id }"/>
								</td>
								<td>
									<fmt:formatDate value="${vo.member_date }" pattern="yy-MM-dd"/>
								</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="5" class="content">${pv.pageList }</td>
				</tr>
			</c:if>
		<c:if test="${empty pv.list }">
			<tr>
				<td class="content" colspan="5" style="border: 1px solid gray;">등록된 글이 존재하지 않습니다.</td>
			</tr>
		</c:if>
		<tr>
			<td colspan="5" class="info">
				<button onclick="sendPost('${pageContext.request.contextPath }/guestinsert',{'p': ${pv.currentPage },'s': ${pv.pageSize },'b': ${pv.blockSize }});">글쓰기</button>
				<h4 align="right"><a href="${pageContext.request.contextPath }/">돌아가기</a></h4>
			</td>
		</tr>
	</table>
</body>
</html>
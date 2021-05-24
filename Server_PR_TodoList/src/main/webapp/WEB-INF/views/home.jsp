<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
document.addEventListener("DOMContentLoaded", function() {
	document.querySelector("table").addEventListener("click",function(ev) {
		let tag_name = ev.target.tagName;
		if(tag_name == "TD") {
			let td_seq = ev.target.closest("TR").dataset.seq
			document.location.href="${rootPath}/todo/select?td_seq=" + td_seq
		}
	})
	document.querySelector("button").addEventListener("click", function(ev){
		
		let text = ev.target.textContent
		// alert(text + " 클릭") // 테스트
		
		let url = "${rootPath}/todo"
		
		if(text == "추가") {
			url += "/insert"
		} else if(text == "수정") {
			url += "/update"
		} else if(text == "삭제") {
			url += "/delete"
		}
		
		document.location.href = url
		
	})
	
})
</script>
<body>
	<h1> TO DO List </h1>
	<button>추가</button>
	<p>
	<table>
		<tr>
			<th>No.</th>
			<th>할일</th>
			<th>작성일자</th>
			<th>장소</th>
		</tr>
		<c:forEach items="${TDLIST}" var="TD" varStatus="index">
		<tr data-seq="${TD.td_seq}">
			<td>${index.count}</td>
			<td>${TD.td_todo}</td>
			<td>${TD.td_date}</td>
			<td>${TD.td_place}</td>
		</tr>
		</c:forEach>
	</table>
	
</body>
</html>
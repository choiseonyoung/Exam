<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TO DO LIST</title>
<link href="${rootPath}/static/css/home.css?ver2021-05-25-001" rel="stylesheet"/>

<style>
	
	div.main {
		width: 60%;
		margin: auto;
		padding-top: 20px;
		padding-bottom: 60px;
		padding-right: 50px;
	}
	
	table tr#tr_hover:hover {
		cursor: pointer;
		background-color: #F4F4F4;
	}
	
	div.main button {
		float: right;
	}
	
	
</style>
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
		
		document.location.href = "${rootPath}/todo/insert"
		
	})
	
})
</script>
</head>
<body>
	<h1> &#127872; TO DO LIST &#127872; </h1>
	<hr>
	<div class="main">
		<button class="btn_insert">추가</button>
	</div>
	<table>
		<tr>
			<th>No.</th>
			<th>할일</th>
			<th>작성일자</th>
			<th>장소</th>
			<th>check</th>
		</tr>
		<c:forEach items="${TDLIST}" var="TD" varStatus="index">
		<tr data-seq="${TD.td_seq}" id="tr_hover">
			<td>${index.count}</td>
			<td>${TD.td_todo}</td>
			<td>${TD.td_date}</td>
			<td>${TD.td_place}</td>
			<td><input type=checkbox></td>
		</tr>
		</c:forEach>
	</table>
	
</body>
</html>
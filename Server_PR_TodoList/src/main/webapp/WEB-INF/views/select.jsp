<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SELECT</title>
<link href="${rootPath}/static/css/home.css?ver2021-05-25-001" rel="stylesheet"/>
<style>
	
	table {
		width: 30%;
	}
	
	div {
		width: 30%;
		margin: auto;
		text-align: center;
	}
	
	div button.btn_update, div button.btn_delete {
		padding: 5px;
		border: 2;
		border-color: pink;
		border-radius: 10px;
		color: hotpink;
		background-color: white;
		width: 80px;
		height: 40px;
		font-size: 15px;
		margin-top: 20px;
	}
	

</style>
<script>

document.addEventListener("DOMContentLoaded", function() {
	document.querySelector("div").addEventListener("click", function(ev) {
		
		let className = ev.target.className
		if (className == "btn_update") {
			document.location.href = "${rootPath}/todo/update?td_seq=" + ${TD.td_seq}
		} else if (className == "btn_delete") {
			if(confirm("⚠ 삭제하시겠습니까?")) {
				document.location.replace("${rootPath}/todo/delete?td_seq="+${TD.td_seq})
			}
		}
	})
})

</script>
</head>
<body>
	<h1> &#128204; SELECT </h1>
	<table>
		<tr>
			<th>작성일자</th><td>${TD.td_date}</td>
		</tr>
		<tr>
			<th>작성시각</th><td>${TD.td_time}</td>
		</tr>
		<tr>
			<th>할일</th><td>${TD.td_todo}</td>
		</tr>
		<tr>
			<th>장소</th><td>${TD.td_place}</td>
		</tr>
	</table>
	<div class="main">
		<button class="btn_update">수정</button>
		<button class="btn_delete">삭제</button>
	</div>
</body>
</html>
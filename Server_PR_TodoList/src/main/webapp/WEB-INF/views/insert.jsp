<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INPUT</title>
<link href="${rootPath}/static/css/home.css?ver2021-05-25-001" rel="stylesheet"/>
<style>

	fieldset {
		padding-top: 30px;
		padding-bottom: 30px;
		width: 30%;
		margin: auto;
		text-align: center;
	}
	
	div.main button.btn_save {
		margin-top: 30px;
	}
	
	
</style>
<script>
document.addEventListener("DOMContentLoaded",function() {
	document.querySelector("button.btn_save").addEventListener("click",function(ev) {
	
	let dom = document;
	let td_date = dom.querySelector("input[name='td_date']")
	let td_time = dom.querySelector("input[name='td_time']")
	let td_todo = dom.querySelector("input[name='td_todo']")
	let td_place = dom.querySelector("input[name='td_place']")
	
	if (td_date.value=="") {
		alert("⚠ 작성일자를 입력하세요")
		td_date.focus()
		return false
	}
	if (td_time.value=="") {
		alert("⚠ 작성시각을 입력하세요")
		td_time.focus()
		return false
	}
	if (td_todo.value=="") {
		alert("⚠ 할일을 입력하세요")
		td_todo.focus()
		return false
	}
	
	dom.querySelector("form.in").submit()
	})
	
})
</script>
</head>
<body>
	<form class="in" method="POST">
	<h1> &#128397; INPUT</h1>
	<fieldset>
		<div>
			<label>작성일자</label>
			<input name="td_date" type="date" value="${TD.td_date}">
		</div>
		<br>
		<div>
			<label>작성시각</label>
			<input name="td_time" type="time" value="${TD.td_time}">
		</div>
		<br>
		<div>
			<label>할일</label>
			<input name="td_todo" type="text" value="${TD.td_todo}">
		</div>
		<br>
		<div>
			<label>장소</label>
			<input name="td_place" type="text" value="${TD.td_place}">
		</div>
	</fieldset>
	
	<div class="main">
		<button class="btn_save" type="button">추가</button>
		<button type="reset">초기화</button>
	</div>
	</form>
</body>

</html>
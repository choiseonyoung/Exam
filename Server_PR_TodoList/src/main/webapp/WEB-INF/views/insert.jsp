<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
document.addEventListener("DOMContentLoaded",function() {
	document.querySelector("button.btn_save").addEventListener("click",function(ev) {
	
	let dom = document;
	let td_date = dom.querySelector("input[name='td_date']")
	let td_time = dom.querySelector("input[name='td_time']")
	let td_todo = dom.querySelector("input[name='td_todo']")
	let td_place = dom.querySelector("input[name='td_place']")
	
	if (td_date.value=="") {
		alert("작성일자를 입력하세요")
		td_date.focus()
		return false
	}
	if (td_time.value=="") {
		alert("작성시각을 입력하세요")
		td_time.focus()
		return false
	}
	if (td_todo.value=="") {
		alert("할일을 입력하세요")
		td_todo.focus()
		return false
	}
	
	dom.querySelector("form.in").submit()
	})
	
	
	
})
</script>

<body>
	<form class="in" method="POST">
	<fieldset>
	<div>
		<label>작성일자</label>
		<input name="td_date" type="date" value="${TD.td_date}">
	</div>
	<div>
		<label>작성시각</label>
		<input name="td_time" type="time" value="${TD.td_time}">
	</div>
	<div>
		<label>할일</label>
		<input name="td_todo" type="text" value="${TD.td_todo}">
	</div>
	<div>
		<label>장소</label>
		<input name="td_place" type="text" value="${TD.td_place}">
	</div>
	</fieldset>
	<div>
		<button class="btn_save" type="button">추가</button>
		<button type="reset">초기화</button>
	</div>
	</form>
</body>

</html>
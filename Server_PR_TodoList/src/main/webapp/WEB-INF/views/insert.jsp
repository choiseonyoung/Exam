<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
document.addEventListener("DOMContentLoaded",function() {
	document.querySelector("button.btn_save").addEventListener("click", function(ev) {
	
	let td_date = document.querySelector("input[name='td_date']");
	let td_time = document.querySelector("input[name='td_time']");
	let td_todo = document.querySelector("input[name='td_todo']");
	let td_place = document.querySelector("input[name='td_place']");
	
	if (td_date.value == "") {
		alert("작성일자를 선택하세요");
		td_date.focus();
		return false;
	}
	if (td_time.value == "") {
		alert("작성시각을 선택하세요");
		td_time.focus();
		return false;
	}
	if (td_todo.value == "") {
		alert("할일을 입력하세요");
		td_todo.focus();
		return false;
	}
	
	alert("저장버튼"
			+ "\n"
			+ td_date.value + "\n"
			+ td_time.value + "\n"
			+ td_todo.value + "\n"
			+ td_place.value + "\n"
	)
	
	dom.querySelector("form.in").submit();
	})
	
})
</script>

<body>
	<form class="in"method="POST">
		<p><label>작성일자</label>
			<input name="td_date" type="date"/>
		<label>작성시각</label>
			<input name="td_time" type="time"/>
		<p><label>할일</label>
			<input name="td_todo" type="text"/>
		<p><label>장소</label>
			<input NAME="td_place" type="text"/>
		</form>
		<p><button class="btn_save" type="button">추가</button>
	</form>
</body>

</html>
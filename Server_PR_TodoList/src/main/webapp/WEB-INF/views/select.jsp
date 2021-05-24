<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

document.addEventListener("DOMContentLoded", function() {
	document.querySelect("div").addEventListener("click", function(ev) {
		
		let className = ev.target.className
		if (className == "btn_update") {
			document.location.href = "${rootPath}/todo/update?td_seq=" + ${TD.td_seq}
		} else if (className == "btn_delete") {
			if(confirm("이 할일을 삭제하시겠습니까?")) {
				document.location.replace("${rootPath}/todo/delete?td_seq="+${TD.td_seq})
			}
		}
	})
	
	
})

</script>
</head>
<body>
	<h1> 선택한 할일 </h1>
	<table>
		<tr>
			<th>작성일자</th><td>${TD.td_date}</td>
			<th>작성시간</th><td>${TD.td_time}</td>
		</tr>
		<tr>
			<th>할일</th><td>${TD.td_todo}</td>
		</tr>
		<tr>
			<th>장소</th><td>${TD.td_place}</td>
		</tr>
	</table>
	<div>
		<button class="btn_update">수정</button>
		<button class="btn_delete">삭제</button>
	</div>
</body>
</html>
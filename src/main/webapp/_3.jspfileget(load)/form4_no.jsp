<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax</title>
<style>
body{text-align: center}
</style>
<link rel="icon" href="${pageContext.request.contextPath}/image/home.ico" />
<link href="../css/form.css" rel="stylesheet" type="text/css">
<script src="../js/jquery-3.7.1.js"></script>
<script>
$(function() {
	$("button").click(function(e) { // 전송 버튼 클릭 시 
		const data = { 
						"name"   : $("#name").val(),
						"age"    : $("#age").val(),
						"address": $("#address").val()
					 };
		$("div").load("process.jsp", data);
	});
})
</script>
</head>
<body>
	<span>이름</span><input type="text" placeholder="이름" id="name" name="name" 		required><br>
	<span>나이</span><input type="text" placeholder="나이" id="age" name="age" 		required><br>
	<span>주소</span><input type="text" placeholder="주소" id="address" name="address" required><br>
	<button type="button">전송</button>
	<div></div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax</title>
<link rel="icon" href="${pageContext.request.contextPath}/image/home.ico" />
<link href="../css/form.css" rel="stylesheet" type="text/css">
<script src="../js/jquery-3.7.1.js"></script>
<script>
$(function() {
	$("form").submit(function(e) { // 전송 버튼 클릭 시
		e.preventDefault(); // 기본 이벤트 제거
		
		const $name = $('#name');
		const $age = $('#age');
		const $address = $('#address');
		// 쿼리스트링 작성 시 매개변수와 "=" 사이에 공백없이 작성합니다.
		const data = "name="+$name.val()+"&age="+$age.val()+"&address="+$address.val();
		
		// console.log("name="+$name.val()+"&age="+$age.val()+"&address="+$address.val());
		
		// 쿼리스트링 형식으로 파라미터의 이름과 값의 형태로 전달합니다.
		// $("div").load("process.jsp", 
		//				 "name=love&age=21&address=서울시");
		$("div").load("process.jsp", data);
	});
})
</script>
</head>
<body>
<%--
	form 태그의 action 속성 없습니다. 이 상태에서 전송을 클릭하면 현재 URL를 다시 불러옵니다.
 --%>
 	<form>
		<span>이름</span><input type="text" placeholder="이름" id="name" name="name" required><br>
		<span>나이</span><input type="text" placeholder="나이" id="age" name="age" required><br>
		<span>주소</span><input type="text" placeholder="주소" id="address" name="address" required><br>
		<input type="submit" value="전송">
	</form>
	<div></div>
</body>
</html>
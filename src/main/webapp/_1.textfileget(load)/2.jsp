<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서버의 데이터를 대상 엘리먼트에 삽입하기</title>
<link rel="icon" href="${pageContext.request.contextPath}/image/home.ico" />
<link href="../css/ex2.css" rel="stylesheet" type="text/css">
<style>
div {
	width: 180px; height: 80px;
	margin: 3px; float: left;
}
</style>
<script src="../js/jquery-3.7.1.js"></script>
<script>
/*
 	- jQuery에서 제공해주는 load()메서드를 사용해서 서버의 menu.html 페이지의 
 		데이터를 가져와서 특정 엘리먼트에 추가합니다.
 */
$(function() {
	$("#menu1").click(function () {
		// load() 메서드를 이용해서 menu.html 문서 전체를 로드하여
		// id가 message1인 엘리먼트에 넣습니다.
		$('#message1').load('menu.html');
	});
	
	$("#menu2").click(function () {
		// load() 메서드를 이용해서 menu.html 문서의 내용 중 li 엘리먼트만 읽어서
		// id가 message2인 엘리먼트에 넣습니다.
		$('#message2').load('menu.html li');
	});
});
</script>
</head>
<body>
<div>
<%-- href="#"는 클릭 시 현재  페이지 상단으로 이동합니다. --%>
	<a href="#" id="menu1">메뉴 보기 1</a>
	<p>
		<span id="message1"></span>
	</p>
</div>
<div>
	<a href="#" id="menu2">메뉴 보기 2</a>
	<p>
		<span id="message2"></span>
	</p>
</div>	
</body>
</html>
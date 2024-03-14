<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서버의 데이터를 대상 엘리먼트에 삽입하기</title>
<link rel="icon" href="${pageContext.request.contextPath}/image/home.ico" />
<link href="../css/ex2.css" rel="stylesheet" type="text/css">
<script src="../js/jquery-3.7.1.js"></script>
<script>
	$(function() {
		$('button').click(function() {
			$('button').text('로딩 완료').css('color','red');
			
			//html 파일을 가져옵니다.
			$('#container').load('resource1.html');
		});
	});
</script>
</head>
<body>
	<button>서버로부터 데이터 가져오기</button>
	<div id="container">데이터 가져오기 전</div>
</body>
</html>
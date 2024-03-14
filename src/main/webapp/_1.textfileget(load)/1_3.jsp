<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax 1_3</title>
<link rel="icon" href="${pageContext.request.contextPath}/image/home.ico" />
<link href="../css/ex1.css" rel="stylesheet" type="text/css">
<script src="../js/jquery-3.7.1.js"></script>
<script>
$(function() {
	function error(responseTxt, status, xhr) {
		console.log(responseTxt);
		
		if(xhr.status=="404"){
			alert("해당 파일이 존재하지 않습니다.")
		}
	}
	
	$("button").click(function() { // 변경을 클릭하면 
		$("button").text('로딩완료').css('color','red');
	
		// <p>태그 영역에 "sample12.txt"의 내용을 불러옵니다.
		$("p").load("resource1.html", error);
		// $("pre").load("sample1.txt", error);
	});
});
</script>
</head>
<body>
	<button>변경</button>
	<p>변경 전 : 줄이 안 바뀌어요</p>
	<br>
	<pre>변경 전 : 줄이 바뀝니다. (입력한 대로 출력됩니다.)</pre>
</body>
</html>
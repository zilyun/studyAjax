<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<title>회원가입</title>
<!-- 회원가입 디자인 -->
<link href="${pageContext.request.contextPath}/css/NewFile.css"
	rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/js/validate.js"></script>
<!-- 우편 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<script>
$(function() {
	$("#id").keyup(function() {
		const $id = $("#id");
		// $.trim(문자열)는 문자열의 앞, 뒤 공백을 제거합니다.
		const id_value = $.trim($id.val());
		
		const pattern = /^[A-Z][a-zA-Z_0-9]{3,19}$/;
		
		if (pattern.test(id_value)) {
			$.ajax({
					url : "${pageContext.request.contextPath}/idcheck",
					data: { "id" : id_value },
					success: function(data) {
						if(data == '-1'){
							$("#opener_message").text("아이디가 존재합니다.").css('color','red');
						}else if(data == '0'){
							$("#opener_message").text("사용가능한 아이디 입니다.").css('color','green');
						}
					} // success
			}) // ajax
		} else {
			$("#opener_message").text("형식에 맞게 입력하세요.").css('color','red');
		}
	}); // keyup
}) // $(function(){})
</script>
<body style="background-color: #474e5d">
	<div class="container">
		<form method="post" action="joinProcess.net" name="myform" id="myform">
			<fieldset>
				<legend>유효성 검사</legend>
				<div>
					<label for="id">ID</label>
					<input type="text" size="10" name="id"
						id="id" placeholder="Enter ID">
					<div id="opener_message"></div>
				</div>

				<div>
					<label for="pass">Password</label> 
					<input type="password"
						name="pass" id="pass" placeholder="Enter Password">
				</div>
				
				<label for="jumin1">주민번호</label> <input type="text" size="6"
					maxLength="6" name="jumin1" id="jumin1" placeholder="주민번호 앞자리">
				<b> - </b> <input type="text" size="7" maxLength="7" name="jumin2"
					id="jumin2" placeholder="주민번호 뒷자리"> <label for="email">E-Mail</label>
				<input type="text" name="email" id="email"> <b> @ </b> 
				<input type="text" name="domain" id="domain"> 
				<select name=sel id=sel>
					<option value="">직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="nate.com">nate.com</option>
					<option value="gmail.com">gmail.com</option>
				</select> 
				
				<label>성별</label>
				<div class="container2">
					<input type="radio" name="gender" value="m" id="gender1">남자
					<input type="radio" name="gender" value="f" id="gender2">여자
				</div>

				<label>취미</label>
				<div class="container2">
					<input type="checkbox" name="hobby" id="hobby1" value="공부">공부
					<input type="checkbox" name="hobby" id="hobby2" value="게임">게임
					<input type="checkbox" name="hobby" id="hobby3" value="운동">운동
					<input type="checkbox" name="hobby" id="hobby4" value="등산">등산
					<input type="checkbox" name="hobby" id="hobby5" value="낚시">낚시
				</div>

				<label for="post1">우편번호</label> 
				<input type="text" maxLength="5"
					name="post1" id="post1"> 
				<input type="button" value="우편검색"
					id="postcode" onclick="Postcode()"> 
				
				<label for="address">주소</label>
				<input type="text" name="address" id="address"> <label
					for="intro">자기소개</label>
				<textarea rows="10" cols="75" name="intro" id="intro"></textarea>
				
				<div class="clearfix">
					<button type="submit" class="signupbtn" value="회원가입">회원가입</button>
					<button type="reset" class="cancelbtn" value="취소">취소</button>
				</div>
			</fieldset>
		</form>
	</div>
</body>
</html>
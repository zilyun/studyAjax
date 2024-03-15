<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dept array lib</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="icon" href="${pageContext.request.contextPath}/image/home.ico" />
<style>
	#error{color:green}
	#com{color:blue}
</style>
<script src="../js/jquery-3.7.1.js"></script>
<script>
$(function () {
	$("button").click(function() { // 버튼을 클릭하면
		// 기존 데이터가있는 요소들을 제거합니다.
		$(".container div").remove() // div 요소 제거합니다.
		
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/dept_lib", // 요청 전송 url
			dataType : "json", 		   // return data의 Type(에이잭스 성공 후 돌려받은 자료 형을 정의)
			cache : false,			   // 브라우저 캐시 값이 아닌 현재의 데이터를 받아오도록 합니다.
			success : function(rdata){ // HTTP 요청이 성공한 경우 실행할 함수 정의(이벤트 핸들러)
									   // rdata는 서버에서 보낸 데이터입니다.
				
				console.log("성공" + rdata)
				$("button+div").remove()
									   
				if(rdata.length>0) {
					let table = '<div id="result"><table class="table">'
								+ "<thead><tr>"
								+ "<th>부서번호</th>"
								+ "<th>부서명</th>"					   
								+ "<th>지역</th>"
								+ "</tr></thead><tbody>";
								
					$(rdata).each(function(index, item) { // item = this
						table += "<tr>";
						table += "	<td>" + item.deptno + "</td>";
						table += "	<td>" + item.dname + "</td>";
						table += "	<td>" + item.loc + "</td>";
						table += "</tr>";
					}); // each end
					
					table += "</tbody></table></div>";
					$(".container").append(table);
				} else {
					$(".container").append('<div>데이터가 존재하지 않습니다.</div>');
				}
			},
			error : function(request, status, error){
				$(".container").append(
								"<div id='error'>code :" + request.status + "<br>"
							  + "받은 데이터 :" + request.responseText + "<br>"
							  + "error status" + status + "<br>"
							  + "error 메시지 : " + error + "</div>");	
			},
			complete : function(){ // 요청의 실패, 성공과 상관 없이 완료 될 경우 호출
				// $(".container").append("<div id='com'>Ajax가 완료되었습니다.</div>");
			}
		}); // ajax end
	}); // click end
}); // ready end
</script>
</head>
<body>
	<div class="container">
		<button class="btn btn-info">라이브러리를 이용한 json 형식으로 dept 내용 가져오기</button>
	</div>
</body>
</html>
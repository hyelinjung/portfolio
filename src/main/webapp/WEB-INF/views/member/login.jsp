<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/member/login.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

<div class="wrapper">
	
	
	<div class="wrap">
	<form id="loginSend" method="post">
		<div class="logo_wrap">
			<span>Login</span>
		</div>
		<div class="login_wrap"> 
			<div class="id_wrap">
					<div class="id_input_box">
					<input class="id_input" name="memberId" placeholder="Id">
				</div>
			</div>
			<div class="pw_wrap">
				<div class="pw_input_box">
					<input class="pw_iput" name="memberPw" placeholder="Password">
				</div>
			</div>
			<c:if test="${result == 0}">
			<div class="login_false">
			사용자의 ID 또는 비밀번호를 잘못입력하셨습니다. 다시 입력헤 주세요!
			</div>
			</c:if>
			<div class="login_button_wrap">
				<input type="button" class="login_button" value="로그인">
			</div>			
		</div>
		
		</form>
		
	</div>
	
</div>
<script>

	$(".login_button").click(function(){
		
		$("#loginSend").attr("action","/member/login"); //.이 아니라 # 사용
		$("#loginSend").submit();
});

</script>

</body>
</html>
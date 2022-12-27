<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/member/join.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

<div class="wrapper">
	<form id="join_form" method="post">
	<div class="wrap">
			<div class="subjecet">
				<span>회원가입</span>
			</div>
			<div class="id_wrap">
				<div class="id_name">아이디</div>
				<div class="id_input_box">
					<input class="id_input" name="memberId">
				</div>
				<span class="id_input1">사용 가능한 아이디 입니다</span>
				<span class="id_input2">중복 아이디 입니다</span>
				<span class="id_input3">아이디를 입력해주세요</span>
			</div>
			<div class="pw_wrap">
				<div class="pw_name">비밀번호</div>
				<div class="pw_input_box">
					<input class="pw_input" name="memberPw">
				</div>
				<span class="pw_input1">비밀번호를 입력해주세요</span>
			</div>
			<div class="pwck_wrap">
				<div class="pwck_name">비밀번호 확인</div>
				<div class="pwck_input_box">
					<input class="pwck_input" >
				</div>
				<span class="pw_input2">비밀번호 확인을 입력해주세요</span>
				<span class="pw_input3">일치하지않습니다</span>
				<span class="pw_input4">일치</span>
				
			</div>
			<div class="user_wrap">
				<div class="user_name">이름</div>
				<div class="user_input_box">
					<input class="user_input" name="memberName">
				</div>
				<span class="name_input1">이름을 입력해주세요</span>
			</div>
			<div class="mail_wrap">
				<div class="mail_name">이메일</div> 
				<div class="mail_input_box">
					<input class="mail_input" name="memberMail">
				</div>
				<span class="mail_input1">이메일을 입력해주세요</span>				
				<span class="mail_form_warn"></span>
				<div class="mail_check_wrap">
					<div class="mail_check_input_box" id=fail>
						<input class="mail_check_inputs" disabled="disabled">
						
					</div>
					<div class="mail_check_button">
						<span>인증번호 전송</span>
					</div>
					<div class="clearfix"></div>
					<span id="write_num1"></span> <!-- 인증번호 일치 경고문 -->
					<span class="mail_input2">인증번호를 입력해주세요</span>
				</div>
			</div>
			<div class="address_wrap">
				<div class="address_name">주소</div>
				<div class="address_input_1_wrap">
					<div class="address_input_1_box">
						<input class="address_input_1" name="memberAddr1" readonly="readonly">
					</div>
					<div class="address_button" onclick="address_button_click()">
						<span>주소 찾기</span>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class ="address_input_2_wrap">
					<div class="address_input_2_box">
						<input class="address_input_2" name="memberAddr2" readonly="readonly">
					</div>
				</div>
				<div class ="address_input_3_wrap">
					<div class="address_input_3_box">
						<input class="address_input_3" name="memberAddr3" readonly="readonly">
					</div>
					<span class="addr_input1">주소를 입력해주세요</span>
				</div>
			</div>
			<div class="join_button_wrap">
				<input type="button" class="join_button" value="가입하기">
			</div>
		</div>
	</form>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
  var savenum; //내가입력하는 인증번호
  
  /* 유효성 디폴트값을 저장할 변수 지정 */
  var idcheck1 =false;  //아이디
  var idcheck2 =false;  //아이디 중복확인
  
  var pwcheck1 =false; //비밀번호
  var pw_double_check1 =false; //비밀번호 확인
  var pw_double_check2 =false; //비밀번호 일치확인  
  var namecheck1 =false; //이름
  var mailcheck1 =false; //이메일
  var mail_num_check1 =false; //인증번호
  var addrcheck1 =false; //주소
  
  //============= 입력값 대입==========
  
  
	$(document).ready(function(){
		$(".join_button").click(function(){
			
			var pwcheck2 =$('.pw_input').val(); //비밀번호
			  var pw_double_check3 =$('.pwck_input').val(); //비밀번호 확인
			  var namecheck2 =$('.user_input').val(); //이름
			  var mameberId2 =$('.id_input').val();
			  var addrcheck2 =$('.address_input_3').val(); //주소
			  var mail2 = $('.mail_input').val();
			console.log(mameberId2);
			if(mameberId2 == ""){
				$(".id_input3").css("display",'block');
				idcheck1 =false;
			}else{
				$(".id_input3").css("display",'none');
				idcheck1 =true;
				
			}
			//=============비밀번호 유효성========
				console.log(pwcheck2);
			if(pwcheck2 == ''){
				$(".pw_input1").css("display",'block');
				pwcheck1 =false;
			}else{
				$(".pw_input1").css("display",'none');
				pwcheck1 =true;
			}
				
			//=============비밀번호확인 유효성========
			if(pw_double_check3 != ''){
				$(".pw_input2").css("display",'none');
				pw_double_check1 =true;
			
			}else{
				pw_double_check1 =false;
				$('.pw_input2').css("display",'block');
				
			}console.log(pw_double_check3);
			
			//=============이름 유효성========
			
			if(namecheck2 == ''){
				$(".name_input1").css("display",'block');
				namecheck1 =false;
			}else{
				$(".name_input1").css("display",'none');
				namecheck1 =true;
			} console.log(namecheck2);
			
			//=============주소 유효성========
			if(addrcheck2 == ''){
				$(".addr_input1").css("display",'block');
				addrcheck1 =false;
			}else{
				$(".addr_input1").css("display",'none');
				addrcheck1 =true;
			}
			//=============메일 유효성========

			if(mail2 == ''){
				$(".mail_input1").css("display",'block');
				mailcheck1 =false;
			}else{
				$(".mail_input1").css("display",'none');
				mailcheck1 =true;
			}
			
			
			
       if(idcheck1&& idcheck2&& pwcheck1&&pw_double_check1&&pw_double_check2&&namecheck1&&
    		   mailcheck1&&mail_num_check1&&addrcheck1){
				$("#join_form").attr("action","/member/join")
				$("#join_form").submit();
			}
			 //return false; 
		}); 
	});
	

	$('.pwck_input').on("propertychange change keyup paste input",function(){
		var pwcheck2= $('.pw_input').val();
			var pw_double_check3=  $('.pwck_input').val();
		 $('.pw_input2').css('display', 'none');
		if(pwcheck2 ==pw_double_check3) {
			pw_double_check2 =true;
			$('.pw_input3').css("display",'none');
			$('.pw_input4').css("display",'block');
			
		}else{
			pw_double_check2 =false;
			$('.pw_input3').css("display",'block');
			$('.pw_input4').css("display",'none');
		}
		
	});
	
	/* 아이디 중복검사 */
	$('.id_input').on("propertychange change keyup paste input",function(){
		/* console.log("keyup테스트") */
		
		var memberId = $('.id_input').val();
		var data = {memberId :memberId}
		
		$.ajax({
			type:"post",
			url: "/member/idCheck",
			data: data,
			success:function(result){  //result 값으로 css를 나타내는 함수 코드
				//console.log("성공"+result);
				
			if(result != 'fail'){ //사용가능
				$('.id_input1').css("display","inline-block");
				$('.id_input2').css("display","none");
				idcheck2 =true;
				
			}else{
				$('.id_input1').css("display","none");
				$('.id_input2').css("display","inline-block");
				idcheck2 =false;
			}	
			}
		});
	});
	
	$(".mail_check_button").click(function(){
		
		var mail = $('.mail_input').val();
		var inputbox = $('.mail_check_input_box'); //인증번호 쓰는 칸 색깔 
		var inputtext =$('.mail_check_inputs');  //인증번호칸 사용할수 있는지
		var formwarn=$('.mail_form_warn'); //메일 형식 경고글
		if(mailform(mail)){
			formwarn.html("메일이 전송되었습니다!");
				formwarn.css("display","inline-block");	
		}else{
			formwarn.html("메일의 형식이 맞지않습니다!");
				formwarn.css("display","inline-block");
			return false;
		}
		
		
		$.ajax({
			type:"get",
			url:"mailSend?mail=" + mail,
			success:function(data){
				console.log(data);
				inputtext.attr("disabled",false);
				inputbox.attr("id","success");
				savenum=data; //컨트롤러에서 전달받은 인증번호를 지정한 변수에다가 저장함
			}
			
			
		});
		
	});
	
	$('.mail_check_inputs').blur(function(){
		
		
		var writenum = $('.mail_check_inputs').val();
		var see = $("#write_num1");
			if(savenum == writenum){
				see.html("일치");
				see.attr("class","correct");
				mail_num_check1 =true;
				
			}else{
				see.html("불일치");
				see.attr("class","incorrect");
				mail_num_check1 =false;		
			}
			
	});
	
	//========이메일 형식 검사로 사용할 수 있는 함수 생성==========
		
		function mailform(mail){ //파라미터를 받는다
			var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		return form.test(mail);
		}
	
	
	 function address_button_click() {
		 new daum.Postcode({
			 
			 oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	                
	                
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    //document.getElementById("sample6_extraAddress").value = extraAddr;
	                   
	                    addr += extraAddr;
	                
	                } else {
	                    //document.getElementById("sample6_extraAddress").value = '';
	                    addr+='';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	              //  document.getElementById('sample6_postcode').value = data.zonecode;
	               // document.getElementById("sample6_address").value = addr;
	                $(".address_input_1").val( data.zonecode);
	                  $(".address_input_2").val(addr);
	                 
	               
	                // 커서를 상세주소 필드로 이동한다.
	                //document.getElementById("sample6_detailAddress").focus();
	                  $(".address_input_3").attr("readonly", false);
	                $(".address_input_3").focus();
	            }
		 }).open();
		
	}
</script>

</body>
</html>
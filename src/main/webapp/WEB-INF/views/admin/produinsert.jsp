<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="icon" type="image/x-icon"
	href="./resources/assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="./resources/css/styles.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/styles.css" rel="stylesheet" />


<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/35.3.2/classic/ckeditor.js"></script>
</head>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="/main">Shopping mall</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#!">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">About</a></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#!">All Products</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="#!">Popular Items</a></li>
							<li><a class="dropdown-item" href="#!">New Arrivals</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> 상의 </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">긴팔T</a> <a
								class="dropdown-item" href="#">반팔T</a> <a class="dropdown-item"
								href="#">맨투맨</a>

						</div></li>

				</ul>
				<form class="d-flex">
					<button class="btn btn-outline-dark" type="submit">
						<i class="bi-cart-fill me-1"></i> Cart <span
							class="badge bg-dark text-white ms-1 rounded-pill">0</span>
					</button>
				</form>
			</div>
		</div>
	</nav>
	<!-- contents-area -->

	<!-- 
                    <div class="admin_list_01">
                        <a>상품 관리</a>
                    </div>
                     -->
	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<div class="admin_content_main">
				<form action="/admin/produinsert" method="post" id="enrollForm">
					<div class="form_section">
						<div class="form_section_title">
							<label>상품명</label>
						</div>
						<div class="form_section_content">
							<input name="p_name">
						</div>
					</div>
					<div class="form_section">
						<div class="form_section_title">
							<label>카테고리</label>
						</div>
						<div class="form_section_content">
							<div class="cate_wrap">
								<span>대분류</span> <select class="cate1">
									<option value="">선택</option>
								</select>
							</div>
							<div class="cate_wrap">
								<span>소분류</span> <select class="cate2" name="cateCode">
									<option value="">선택</option>
								</select>
							</div>
						</div>
					</div>
					<div class="form_section">
						<div class="form_section_title">
							<label>코드</label>
						</div>
						<div class="form_section_content">
							<input name="p_code">
						</div>
					</div>
					<div class="form_section">
						<div class="form_section_title">
							<label>상품 가격</label>
						</div>
						<div class="form_section_content">
							<input name="p_price" value="0">
						</div>
					</div>
					<div class="form_section">
						<div class="form_section_title">
							<label>상품 재고</label>
						</div>
						<div class="form_section_content">
							<input name="p_Stock" value="0">
						</div>
					</div>
					<div class="form_section">
						<div class="form_section_title">
							<label>상품 할인율</label>
						</div>
						<div class="form_section_content">
							<input id="discount_interface" maxlength="2" value="0"> 
								<input name="p_Discount" type="hidden" value="0"> 
								<span class="step_val">할인 가격 : <span class="span_discount"></span></span>
						</div>
					</div>
					<div class="form_section">
						<div class="form_section_title">
							<label>상품 짧은소개</label>
						</div>
						<div class="form_section_content">

							<textarea name="p_info" id="p_info_textarea"></textarea>
						</div>
					</div>
					<div class="form_section">
						<div class="form_section_title">
							<label>상품 긴내용</label>
						</div>
						<div class="form_section_content">

							<textarea name="p_content" id="p_content_textarea"></textarea>
						</div>
					</div>
					<div class="imginput">
						<label for="pImg">이미지</label> <input type="file" id="pImg"
							name="img" />
						<div id="uploadResult"></div>
					</div>


				</form>
				<div class="btn_section">
					<button id="cancelBtn" class="btn">취 소</button>
					<button id="enrollBtn" class="btn enroll_btn">등 록</button>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>

	<script>
 
 
 

 /* 이미지 업로드 */
	$("input[type='file']").on("change", function(e){ //사진이 업로드 되면
		
		/* 이미지 존재시 삭제 */
		if($(".imgDeleteBtn").length > 0){ //미리보기 태그가 생겼으면 이미 사진이 등록 되었다는 말
			deleteFile();
		}
		
		//파일이 여러개선택할때 첫 인덱스
		let formData = new FormData();
		let fileInput = $('input[name="img"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];
		
		console.log("fileList : " + fileList);
		console.log("fileObj : " + fileObj);
		console.log("fileName : " + fileObj.name);
		console.log("fileSize : " + fileObj.size);
		console.log("fileType(MimeType) : " + fileObj.type);
		
		if(!fileCheck(fileObj.name, fileObj.size)){ //파일조건 체크
			return false;
		}
		
		alert("통과");
		
		
		for(let i = 0; i < fileList.length; i++){
			formData.append("uploadFile", fileList[i]); //서버단으로 파일객체 보냄
		}
		
		$.ajax({ //비동기로 서버에 내가 지정한 파일저장경로에 파일 저장하기위해
			url: '/admin/uploadfile',
	    	processData : false,
	    	contentType : false,
	    	data : formData,
	    	type : 'POST',
	    	dataType : 'json',
	    	success : function(result){
	    		console.log(result);
	    		showUploadImage(result); //화면에 선택한 이미지 보여줌
	    	}
		});	
		
		
	});

	/* 등록할수 있는 파일 조건*/
	let regex = new RegExp("(.*?)\.(jpg|jpeg)$");
	let maxSize = 1048576; //1MB	
	
	function fileCheck(fileName, fileSize){

		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
			  
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		
		return true;		
		
	}
	
	/* 이미지 출력 */
	function showUploadImage(uploadResultArr){
		/* 전달받은 데이터 검증 */
		if(!uploadResultArr || uploadResultArr.length == 0){
			return
			}
		let uploadResult = $("#uploadResult");
		/* 전달받은 데이터 검증 */

		
		 let obj = uploadResultArr[0]; //서버에서 받은 imagevo 리스트 객체 의 인덱스 첫번깨 객체를 변수에 저장
		
		let str = ""; //집어넣을 태그를 담을 변수 초기화
		

		let fileCallPath= encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.uploadFileName); //썸네일이미지 뷰로 보여주기위한 함수 파라미터 초기화
		console.log(fileCallPath);
		//ajax성공후 이미지 뷰로 보여주기위한
		str += "<div id='result_card'>";
		str += "<img src='/display?fileName=" + fileCallPath +"'>"; //파라미터 전달
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>"; //삭제 파라미터
		//db로 저장하기위해 productvo객체에 넣음
		str += "<input type='hidden' name='imageList[0].uploadFileName' value='"+ obj.uploadFileName +"'>";
		str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
		str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";	
		str += "</div>";	
		uploadResult.append(str); //태그아래에 str태그 저장
	}
 
 
	/* 파일 삭제 메서드 */
	function deleteFile(){
		
		let targetFile = $(".imgDeleteBtn").data("file"); // 미리보기 이미지 태그안에 넣어둔 삭제 파일경로
		
		let targetDiv = $("#result_card"); //이미지 비리보기 부분 태그
		
		$.ajax({
			url: '/admin/deleteFile',
			data : {fileName : targetFile},
			dataType : 'text',
			type : 'POST',
			success : function(result){
				console.log(result);
				
				targetDiv.remove();
				$("input[type='file']").val(""); //파일input 초기화
				
			},
			error : function(result){  //서버에서 실패할경우
				console.log(result);
				
				alert("파일을 삭제하지 못하였습니다.")
			}
		});
	}
 
	/* 이미지 삭제 버튼 동작 */
	$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
		
		deleteFile();
		
	});
 

	let enrollForm = $("#enrollForm")
	
/* 취소 버튼 */
$("#cancelBtn").click(function(){
	
	location.href="/admin/main"
	
});

/* 상품 등록 버튼 */
$("#enrollBtn").on("click",function(e){
	
	e.preventDefault();
	
	enrollForm.submit();
	
	
}); 
		/* 위지윅 적용 */
		
		/* 책 소개 */
		ClassicEditor
			.create(document.querySelector('#p_info_textarea'))
			.catch(error=>{
				console.error(error);
			});
			
		/* 책 목차 */	
		ClassicEditor
		.create(document.querySelector('#p_content_textarea'))
		.catch(error=>{
			console.error(error);
		});

	//컨트롤러에서 데이터 받기
	var jsonData = JSON.parse('${cateList}');
	console.log(jsonData);
	
	var cate1Arr = new Array(); //카테고리 배열 초기화
	var cate1Obj = new Object(); //카테고리 객체 초기화
	
	//1차 분류 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {
	
	if(jsonData[i].level == "1") { //대분류일때
	cate1Obj = new Object();  //초기화
	cate1Obj.cateCode = jsonData[i].cateCode; //카테고리 코드 객체에 삽입
	cate1Obj.cateName = jsonData[i].cateName; //카테고리 이름 객체에 삽입
	cate1Arr.push(cate1Obj); //객체를 배열에 삽입
	}
	}

//1차 분류 셀렉트 박스에 데이터 삽입
var cate1Select = $("select.cate1")

for(var i = 0; i < cate1Arr.length; i++) {
cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
   + cate1Arr[i].cateName + "</option>"); 
}

//대분류를 변경할때 소분류 변경
$(document).on("change", "select.cate1", function(){

	 var cate2Arr = new Array();
	 var cate2Obj = new Object();
	 
	 // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
	 for(var i = 0; i < jsonData.length; i++) {
	  
	  if(jsonData[i].level == "2") {
	   cate2Obj = new Object();  //초기화
	   cate2Obj.cateCode = jsonData[i].cateCode;
	   cate2Obj.cateName = jsonData[i].cateName;
	   cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
	   
	   cate2Arr.push(cate2Obj);
	  }
	 }
	 
	 var cate2Select = $("select.cate2");
	
	 
	 cate2Select.children().remove(); //대분류를 바꿨을때 소분류의 중복을 제거

	 //선택된 분류 값
	 $("option:selected", this).each(function(){
	  
	  var selectVal = $(this).val();   //대분류에 선택된 값을 삽입
	  cate2Select.append("<option value='" + selectVal + "'>전체</option>"); //소분류 전체 칸설정후 대분류 값 삽입
	  
	  for(var i = 0; i < cate2Arr.length; i++) {
	   if(selectVal == cate2Arr[i].cateCodeRef) { //선택된 대분류의 값이랑 소분류 cateCodeRef 가 같을 경우  
	    cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
	         + cate2Arr[i].cateName + "</option>");
	   }
	  }
	  
	 });
	 
	});
/* 할인율 Input 설정 */
$("#discount_interface").on("propertychange change keyup paste input", function(){
	
	let userInput = $("#discount_interface"); //할인율 인터페이스 input태그
	let discountInput = $("input[name='p_Discount']"); //할인율 작성 태그
	
	let discountRate = userInput.val();					// 사용자가 입력할 할인값(정수)
	let sendDiscountRate = discountRate / 100;					// 서버에 전송할 할인값(소수점을 만들기위해)
	
	discountInput.val(sendDiscountRate);	
	
	let goodsPrice = $("input[name='p_price']").val();			// 원가
	let discountPrice = goodsPrice * (1 - sendDiscountRate);		// 할인가격
	        
	$(".span_discount").html(discountPrice);//할인가격에 작성
	
});	
//원가가 바뀔경우 ->할인가격변경
$("input[name='p_price']").on("change", function(){
	
	let userInput = $("#discount_interface");
	let discountInput = $("input[name='p_Discount']");
	
	let discountRate = userInput.val();					// 사용자가 입력한 할인값
	let sendDiscountRate = discountRate / 100;			// 서버에 전송할 할인값
	let goodsPrice = $("input[name='p_price']").val();			// 원가
	let discountPrice = goodsPrice * (1 - sendDiscountRate);		// 할인가격
	
	$(".span_discount").html(discountPrice);
	
});

</script>
</body>
</html>
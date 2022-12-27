<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/productModify.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
 <script src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>
 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
<body>

<div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>상품 상세</span></div>

                    <div class="admin_content_main">
                  <form action="/admin/productModify" method="post" id="modifyForm">

                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품번호</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="product_num" disabled="disabled" value="${detail.product_num}"/>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>등록 날짜</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="p_regdate" value="${detail.p_regdate}" pattern='yyyy-MM-dd' disabled="disabled"/>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>최근 수정 날짜</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="p_regdate" value="${detail.p_update}" pattern='yyyy-MM-dd' disabled="disabled"/>
                    			</div>
                    		</div>                    		                    		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품코드</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="p_code" readonly="readonly" value="${detail.p_code }" disabled>
                    				                    				
                    			</div>
                    		</div>            
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>이름</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="p_name" value="${detail.p_name }">
                    				                    				
                    			</div>
                    		</div>            
                    		
                    		 <div class="form_section">
                    			<div class="form_section_title">
                    				<label>카테고리</label>
                    			</div>
                    			<div class="form_section_content">
                    				<div class="cate_wrap">
                    					<span>대분류</span>
                    					<select class="cate1">
                    						<option selected value="none">선택</option>
                    					</select>
                    				</div>
                    				<div class="cate_wrap">
                    					<span>소분류</span>
                    					<select class="cate2" name="cateCode">
                    						<option selected value="none">선택</option>
                    					</select>
                    				</div>
                    				  
                    				                 				                    				
                    			</div>
                    		</div>          
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 가격</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="p_price" value="${detail.p_price}"/> 
                    			</div>
                    		</div>               
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 재고</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="p_Stock" value="${detail.p_Stock}"/>
                    			</div>
                    		</div>          
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 할인율</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input id="discount_interface" maxlength="2" value="0">
                    				<input name="p_Discount" type="hidden" value="${detail.p_Discount}">
                    				<span class="step_val">할인 가격 : <span class="span_discount"></span></span>
                    				
                    			</div>
                    		</div>          	
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>소개</label>
                    			</div>
                    			<div class="form_section_content bit">
                    				<textarea name="p_info" id="bookIntro_textarea">${detail.p_info}</textarea>
                    			</div>
                    		</div>        		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>목차</label>
                    			</div>
                    			<div class="form_section_content bct">
                    				<textarea name="p_content" id="bookContents_textarea">${detail.p_content}</textarea>
                    			</div>
                    		</div>
                   		
                   		</form>
                   			<div class="btn_section">
                   				<button id="cancelBtn" class="btn">취 소</button>
	                    		<button id="modifyBtn" class="btn modify_btn">수 정</button>
	                    		<button id="deleteBtn" class="btn delete_btn">삭 제</button>
	                    	</div> 
                    </div>      
</div>
                	 
                	<form id="moveForm" action="/admin/produList" method="get" >
 						<input type="hidden" name="pageNum" value="${cri.pageNum}">
						<input type="hidden" name="amount" value="${cri.amount}">
						<input type="hidden" name="keyword" value="${cri.keyword}">
						<input type="hidden" name='product_num' value="${detail.product_num}">
                	</form>                     
              
<script>
/* 삭제 버튼 */
$("#deleteBtn").on("click", function(e){
	e.preventDefault();
	let moveForm = $("#moveForm");
	moveForm.find("input").remove();
	moveForm.append('<input type="hidden" name="product_num" value="${detail.product_num}">');
	moveForm.attr("action", "/admin/proDelete");
	moveForm.attr("method", "post");
	moveForm.submit();
});
/* 취소 버튼 */
$("#cancelBtn").on("click", function(e){
	e.preventDefault();
	$("#moveForm").submit();
});

/* 수정 버튼 */
$("#modifyBtn").on("click", function(e){
	e.preventDefault();
	$("#modifyForm").submit();
});

/* 수정 성공 이벤트 */
/* let modify_result = '${modify_result}';


	alert(modify_result); */
	

$(document).ready(function(){

/* 할인율 인터페이스 출력 */
let proPriceInput = $("input[name='p_price']");
let discountInput = $("input[name='p_Discount']");

let proPrice = proPriceInput.val();
let rawDiscountRate = discountInput.val();
let discountRate = rawDiscountRate * 100;


let discountPrice = proPrice * (1-rawDiscountRate);
$(".span_discount").html(discountPrice);
$("#discount_interface").val(discountRate);

});


/* 할인율 Input 설정 */

$("#discount_interface").on("propertychange change keyup paste input", function(){
	
	let userInput = $("#discount_interface");
	let discountInput = $("input[name='p_Discount']");
	
	let discountRate = userInput.val();					// 사용자가 입력한 할인값
	let sendDiscountRate = discountRate / 100;			// 서버에 전송할 할인값
	let goodsPrice = $("input[name='p_price']").val();			// 원가
	let discountPrice = goodsPrice * (1 - sendDiscountRate);		// 할인가격
	
	if(!isNaN(discountRate)){
		$(".span_discount").html(discountPrice);		
		discountInput.val(sendDiscountRate);				
	}

	
});	

$("input[name='p_price']").on("change", function(){
	
	let userInput = $("#discount_interface");
	let discountInput = $("input[name='p_Discount']");
	
	let discountRate = userInput.val();					// 사용자가 입력한 할인값
	let sendDiscountRate = discountRate / 100;			// 서버에 전송할 할인값
	let goodsPrice = $("input[name='p_price']").val();			// 원가
	let discountPrice = goodsPrice * (1 - sendDiscountRate);		// 할인가격
	
	if(!isNaN(discountRate)){
		$(".span_discount").html(discountPrice);	
	}
	
	
});		


//컨트롤러에서 데이터 받기
var jsonData = JSON.parse('${cateList}');
console.log(jsonData);

var cate1Arr = new Array();
var cate1Obj = new Object();

//1차 분류 셀렉트 박스에 삽입할 데이터 준비
for(var i = 0; i < jsonData.length; i++) {

if(jsonData[i].level == "1") {
cate1Obj = new Object();  //초기화
cate1Obj.cateCode = jsonData[i].cateCode;
cate1Obj.cateName = jsonData[i].cateName;
cate1Arr.push(cate1Obj);
}
}

//1차 분류 셀렉트 박스에 데이터 삽입
var cate1Select = $("select.cate1")

for(var i = 0; i < cate1Arr.length; i++) {
cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
   + cate1Arr[i].cateName + "</option>"); 
}


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
	 
	 /*
	 for(var i = 0; i < cate2Arr.length; i++) {
	   cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
	        + cate2Arr[i].cateName + "</option>");
	 }
	 */
	 
	 cate2Select.children().remove();

	 $("option:selected", this).each(function(){
	  
	  var selectVal = $(this).val();  
	  cate2Select.append("<option value='" + selectVal + "'>전체</option>");
	  
	  for(var i = 0; i < cate2Arr.length; i++) {
	   if(selectVal == cate2Arr[i].cateCodeRef) {
	    cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
	         + cate2Arr[i].cateName + "</option>");
	   }
	  }
	  
	 });
	 
	});
/* 위지윅 적용 */

/* 책 소개 */
ClassicEditor
	.create(document.querySelector('#bookIntro_textarea'))
	.catch(error=>{
		console.error(error);
	});
	
/* 책 목차 */	
ClassicEditor
.create(document.querySelector('#bookContents_textarea'))
.catch(error=>{
	console.error(error);
});


</script>


</body>
</html>
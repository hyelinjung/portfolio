<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/productDetail.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <script src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>
</head>
<body>

 <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>상품 상세</span></div>

                    <div class="admin_content_main">
                  

                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품번호</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="product_num" value="<c:out value="${detail.product_num}"/>" disabled>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>등록 날짜</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input value="<fmt:formatDate value='${detail.p_regdate}' pattern='yyyy-MM-dd'/>" disabled>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>최근 수정 날짜</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input value="<fmt:formatDate value='${detail.p_update}' pattern='yyyy-MM-dd'/>" disabled>
                    			</div>
                    		</div>                    		                    		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품코드</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input id="authorName_input" readonly="readonly" value="${detail.p_code }" disabled>
                    				                    				
                    			</div>
                    		</div>            
                    		
                    		<%--  <div class="form_section">
                    			<div class="form_section_title">
                    				<label>카테고리</label>
                    			</div>
                    			
                    				<div class="cate_wrap">
                    					<label></label>
                    				
                    					 <span class="cate2" disabled>${detail.cateCode }</span> 
                    				</div>
                    				      				                    				
                    			</div>
                    		           --%>
                    		           <%-- <div class="inputArea"> 
								 <label>1차 분류</label>
								 <span class="category1"></span>        
								 <label>2차 분류</label>
								 
								 <span class="category2">${detail.cateCode}</span>
								</div> --%>
                    		          
                    		          <div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 카테고리</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="cate2" value="<c:out value="${detail.cateCode}"/>" disabled>
                    			</div>
                    		</div>   
                    		          
                    		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 가격</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="p_price" value="<c:out value="${detail.p_price}"/>" disabled>
                    			</div>
                    		</div>               
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 재고</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="p_Stock" value="<c:out value="${detail.p_Stock}"/>" disabled>
                    			</div>
                    		</div>          
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 할인율</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input id="discount_interface" maxlength="2" disabled>
                    				<%-- <input name="p_Discount" value="<c:out value="${detail.p_Discount}"/>" disabled> --%>
                    			</div>
                    		</div>          		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>소개</label>
                    			</div>
                    			<div class="form_section_content bit">
                    				<textarea name="p_info" id="bookIntro_textarea"readonly="readonly">${detail.p_info}</textarea>
                    			</div>
                    		</div>        		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>목차</label>
                    			</div>
                    			<div class="form_section_content bct">
                    				<textarea name="p_content" id="bookContents_textarea" readonly="readonly">${detail.p_content}</textarea>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 이미지</label>
                    			</div>
                    			<div class="form_section_content">

									<div id="uploadReslut">
																		
									</div>
                    			</div>
                    		</div>
                   		
                   			<div class="btn_section">
                   				<button id="cancelBtn" class="btn">상품 목록</button>
	                    		<button id="modifyBtn" class="btn enroll_btn">수정 </button>
	                    	</div> 
                    </div>      
<div>
</div>
                	
                	<form id="moveForm" action="/admin/produList" method="get" >
 						<input type="hidden" name="pageNum" value="${cri.pageNum}"> <!-- ..? -->
						<input type="hidden" name="amount" value="${cri.amount}">
						<input type="hidden" name="keyword" value="${cri.keyword}">
                	</form>
                	
               </body>
                
                <script>
                
                /* 목록 이동 버튼 */
            	$("#cancelBtn").on("click", function(e){
            		e.preventDefault();
            		$("#moveForm").submit();	
            	});	
            	
            	/* 수정 페이지 이동 */
            	$("#modifyBtn").on("click", function(e){
            		e.preventDefault();
            		let addInput = '<input type="hidden" name="product_num" value="${detail.product_num}">';
            		$("#moveForm").append(addInput);
            		$("#moveForm").attr("action", "/admin/productModify");
            		$("#moveForm").submit();
            	});	
                
               
                /*  소개 */
        		ClassicEditor
        			.create(document.querySelector('#bookIntro_textarea'))
        			.catch(error=>{
        				console.error(error);
        			});
        			
        		/*  목차 */	
        		ClassicEditor
        		.create(document.querySelector('#bookContents_textarea'))
        		.catch(error=>{
        			console.error(error);
        		});		   
              
                
                
                
                
	
		$(document).ready(function(){
			let Discount = '<c:out value="${detail.p_Discount}"/>' * 100;
			$("#discount_interface").attr("value",Discount);
		
			/* 이미지 정보 호출 하기위해 변수에 초기화*/
			let product_num = '<c:out value="${detail.product_num}"/>';
			let uploadReslut = $("#uploadReslut");
			 $.getJSON("/getAttachList", {product_num : product_num}, function(arr){ //서버에 요청
				if(arr.length === 0){			
					return;
				}	 
				let str = "";
				let obj = arr[0];	
				
				let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.uploadFileName);
				str += "<div id='result_card'";
				str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.uploadFileName + "'";
				str += ">";
				str += "<img src='/display?fileName=" + fileCallPath +"'>";
				str += "</div>";
				uploadReslut.html(str);	
			});
		});
	
		
		
		 
	</script>

</html>
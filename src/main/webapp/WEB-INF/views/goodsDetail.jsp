<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="./includes/header.jsp" %>


			<div class="content_area">
				<div class="line"></div>
				<div class="content_top">
					<div class="ct_left_area">
						<div class="image_wrap"
							data-product_num="${goodsInfo.imageList[0].product_num}"
							data-path="${goodsInfo.imageList[0].uploadPath}"
							data-uuid="${goodsInfo.imageList[0].uuid}"
							data-filename="${goodsInfo.imageList[0].uploadFileName}">
							<img>
						</div>
					</div>
					<div class="ct_right_area">
						<div class="title">
							<h1>${goodsInfo.p_name}</h1>
						</div>
						<div class="line"></div>

						<div class="line"></div>
						<div class="price">
							<div class="sale_price">
								정가 :
								<fmt:formatNumber value="${goodsInfo.p_price}" pattern="#,### 원" />
							</div>
							<div class="discount_price">
							<!-- 판매가 -> 원가-(원가*할인율) -->
								판매가 : <span class="discount_price_number"><fmt:formatNumber
										value="${goodsInfo.p_price - (goodsInfo.p_price*goodsInfo.p_Discount)}"
										pattern="#,### 원" /></span> [
										<!-- 할인율 -->
								<fmt:formatNumber value="${goodsInfo.p_Discount*100}" pattern="###" />
								%
								<%-- 할인된가격 --%><fmt:formatNumber value="${goodsInfo.p_price*goodsInfo.p_Discount}"pattern="#,### 원" />
								할인]
							</div>
						</div>
						<div class="line"></div>
						<div class="button">
							<div class="button_quantity">
								주문수량 <input type="text" class="qinput" value="1"> <span>
									<button class="plus">+</button>
									<button class="minus">-</button>
								</span>
							</div>
							<div class="button_set">
								<a class="btn_cart">장바구니 담기</a> 
								<a class="btn_buy">바로구매</a>
							</div>
						</div>
					</div>
				</div>
				<div class="line"></div>
				<div class="content_middle">
			<!-- 	등록한 정보글 -->
					<div class="book_intro">${goodsInfo.p_info}</div>
					<div class="book_content">${goodsInfo.p_content }</div>
				</div>
				<div class="line"></div>
				<div class="content_bottom">리뷰</div>

			</div>

			<!-- Footer 영역 -->
		<%@include file="./includes/footer.jsp" %>


	
	<script>
		/* 로그아웃 자바스크립트 함수 */
		$("#logout_post").click(function() {

			$.ajax({ //비동기식으로 화면 변환이 없음
				type : "post",
				url : "/member/logout",
				success : function(data) {
					//console.log("로그아웃처리 완");
					document.location.reload(); //새로고침을 해줘야 세션정보가 화면에 전달됨
				}
			});

		});

		const a = $(".image_wrap");

		if (a.data("product_num")) {
			const uploadPath = a.data("path");
			const uuid = a.data("uuid");
			const fileName = a.data("filename")
			const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid
					+ "_" + fileName);

			a.find("img").attr('src', '/display?fileName=' + fileCallPath);
		} else {
			a.find("img").attr('src', '../resources/img/noimg.jpg');
		}
		
		//수량 등록
		let count = $(".qinput").val(); //수량 등록값
		$(".plus").on("click", function(){
			$(".qinput").val(++count); //등록한 값에 +
			
		});
		$(".minus").on("click", function(){
			if(count>1){
				$(".qinput").val(--count); //등록한 값에 -
			}
			
		});
		
		const data ={ //json형식으로 보냄
				memberId : '${member.memberId}',	
				product_num :'${goodsInfo.product_num}',
				productCount : ''
		}
		
		$(".btn_cart").on("click", function(e){
			data.productCount = $(".qinput").val(); //버튼클릭시 입력되는값 -> json에 담는다
			//비동기 형식으로 보냄
			$.ajax({
				url : '/cart/add',
				type : 'POST',
				data : data,
				success : function(result){
					cc(result);
				}
			})
		});
		//비동기로 서버에보낸 리턴값
		function cc(result){
			if(result=='0'){
				alert('장바구니에 추가하지 못했습니다.');
			}else if(result =='1'){
					alert('장바구니추가되었습니다.');	
			}else if(result =='2'){
				alert('장바구니에 이미 존재합니다.');	
			
		}else if(result =='3'){
			alert('로그인이 필요합니다.');	
		}	
		}
		
	</script>



</html>
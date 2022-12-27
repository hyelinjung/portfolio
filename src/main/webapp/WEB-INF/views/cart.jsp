<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="./includes/header.jsp" %>


			<div class="content_area">
				
				<!-- 장바구니 리스트 -->
				<div class="content_middle_section"></div>
				<!-- 장바구니 가격 합계 -->
				<!-- cartInfo -->
				<div class="content_totalCount_section">

					<table class="table">
  <thead class="thead-light">
    <tr>
      <th scope="col">#</th>
      <th scope="col">이미지</th>
      <th scope="col">상품명</th>
      <th scope="col">가격</th>
      <th scope="col">수량</th>
      <th scope="col">합계</th>
      <th scope="col">삭제</th>
    </tr>
  </thead>

					
					
							<c:forEach items="${cartInfo}" var="ci">
								<tr>
									<td class="td_width_1 cart_info_td">
									<input type="hidden"class="individual_Price_input" value="${ci.p_price}">
										<input type="hidden" class="individual_salePrice_input"value="${ci.salePrice}"> 
										<input type="hidden"class="individual_Count_input" value="${ci.productCount}">
										<input type="hidden" class="individual_totalPrice_input"value="${ci.salePrice * ci.productCount}">
										</td>
									<td class="td_width_2">
										<div class="image_wrap"
											data-product_num="${ci.imageList[0].product_num}"
											data-path="${ci.imageList[0].uploadPath}"
											data-uuid="${ci.imageList[0].uuid}"
											data-filename="${ci.imageList[0].uploadFileName}">
											<img>
										</div>
									</td>
									<td class="td_width_3">${ci.p_name}</td>
									<td class="td_width_4 price_td"><del>
											정가 :
											<fmt:formatNumber value="${ci.p_price}" pattern="#,### 원" />
										</del><br> 판매가 : <span class="red_color"><fmt:formatNumber
												value="${ci.salePrice}" pattern="#,### 원" /></span><br></td>
									<!-- 수량변경 -->
									<td class="td_width_4 table_text_align_center">
										<div class="table_text_align_center quantity_div">
											<input type="text" value="${ci.productCount}"
												class="quantity_input">
											<button class="quantity_btn plus_btn">+</button>
											<button class="quantity_btn minus_btn">-</button>
										</div> <a class="quantity_modify_btn" data-cartId="${ci.cartId}">변경</a>
									</td>
									<td class="td_width_4 table_text_align_center"><fmt:formatNumber
											value="${ci.salePrice * ci.productCount}" pattern="#,### 원" />
									</td>
									<td class="td_width_4 table_text_align_center ">
									<button class="delete_btn" data-cartId="${ci.cartId}">삭제</button></td>
								</tr>
							</c:forEach>
						
					</table>
					
				</div>
				<!-- 가격 종합 -->
				<div class="content_total_section">
					<div class="total_wrap">
						<table>
							<tr>
								<td>
									<table>
										<tr>
											<td>총 상품 가격</td>
											<td><span class="totalPrice_span">70000</span> 원</td>
										</tr>
										<tr>
											<td>배송비</td>
											<td><span class="delivery_price">3000</span>원</td>
										</tr>
										<tr>
											<td>총 주문 상품수</td>
											<td><span class="totalCount_span"></span>개</td>
										</tr>
									</table>
								</td>
								<td>
									<table>
										<tr>
											<td></td>
											<td></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						
						<table>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td><strong>총 결제 예상 금액</strong></td>
												<td><span class="finalTotalPrice_span">70000</span> 원</td>
											</tr>
										</tbody>
									</table>
								</td>

							</tr>
						</table>
					</div>
				</div>
				<!-- 구매 버튼 영역 -->
				<div class="content_btn_section">
					<a>주문하기</a>
				</div>

				<!-- 수량 조정 form -->
				<form action="/cart/update" method="post"
					class="quantity_update_form">
					<input type="hidden" name="cartId" class="update_cartId"> <input
						type="hidden" name="productCount" class="update_productCount">
					<input type="hidden" name="memberId" value="${member.memberId}"> <!-- 카트 리스트 페이지로 넘어가기위해서 아이디가 필요함 -->
				</form>
				<!-- 삭제 form -->
			<form action="/cart/delete" method="post" class="quantity_delete_form">
				<input type="hidden" name="cartId" class="delete_cartId">
				<input type="hidden" name="memberId" value="${member.memberId}">
			</form>
			</div>

			
			

  <%@include file="./includes/footer.jsp" %>
	

	<script>
		$(document).ready(function() {

		totalinfo();

		$(".image_wrap").each(function(i, obj) {//i(인덱스)순서만큼 obj(객체)를 돌린다

		const q = $(obj);

		if (q.data("product_num")) {
			const uploadPath = q.data("path");
			const uuid = q.data("uuid");
			const fileName = q.data("filename");
			const fileCallPath = encodeURIComponent(uploadPath
															+ "/s_"
															+ uuid
															+ "_" + fileName);

			$(this).find("img").attr('src','/display?fileName='+ fileCallPath)
			//console.log("=========="+fileCallPath);
			} else { //image_wrap 에서 이미지태그 찾아 소스 부여
			$(this).find("img").attr('src','/resources/img/noimg.jpg');}

			});

			});

		function totalinfo() {
			let totalPrice = 0; // 총 가격
			let totalCount = 0; // 총 갯수
			let deliveryPrice = 0; // 배송비
			let finalTotalPrice = 0; //최종가격(총 가격 + 배송비)	

			$(".cart_info_td").each(
					function(index, element) {

						// 총 가격
						totalPrice += parseInt($(element).find( //parseInt()사용이유->input 타입은 string형태여서 int으로 바꿔주기위해서
								".individual_totalPrice_input").val());
						// 총 갯수
						totalCount += parseInt($(element).find(
								".individual_Count_input").val());

					});

			/* 배송비 결정 */
			if (totalPrice >= 30000) {
				deliveryPrice = 0;
			} else if (totalPrice == 0) {
				deliveryPrice = 0;
			} else {
				deliveryPrice = 3000;
			}

			/* 최종 가격 */
			finalTotalPrice = totalPrice + deliveryPrice;

			/* 값 삽입 */
			// 총 가격
			$(".totalPrice_span").text(totalPrice.toLocaleString());
			// 총 갯수
			$(".totalCount_span").text(totalCount);

			// 배송비
			$(".delivery_price").text(deliveryPrice);
			// 최종 가격(총 가격 + 배송비)
			$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());
		}

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

		/* 수량버튼 */
		$(".plus_btn").on("click", function() { //플러스 버튼을 클릭하면
			let quantity = $(this).parent("div").find("input").val(); //그 태그의 위 태그에서 input 값을 찾아서 내가 정한 변수에 저장
			$(this).parent("div").find("input").val(++quantity); //그 태그(내가 클릭한 플러스태그)에 위태그에서  input태그에 들어갈 값ㅇ르 하나 증가시켜서 저장
		});
		$(".minus_btn").on("click", function() { //마이너스 버튼을 클릭하면
			let quantity = $(this).parent("div").find("input").val(); //그 태그 위태그에서 input태그를 찾아서 그 태그에 저장하는 값ㅇ르 변수에 저장
			if (quantity > 1) { //0보다 안내려가게 설정
				$(this).parent("div").find("input").val(--quantity);//input태그를 찾아서 애가 입력한 값보다 하나 적게 input태그에 저장
			}
		});

		/* 수량 수정 버튼 */
		$(".quantity_modify_btn").on("click", function() { //변경버튼을 클릭하면
			let cartId = $(this).data("cartid"); // data속성을 이용해서 불러온값을 변수에 저장
			let productCount = $(this).parent("td").find("input").val(); //태그td안에서 input 태그를 찾아서 그안에 집어넣을 값을 변수에 저장
			$(".update_cartId").val(cartId); //서버로 넘어갈 form 태그안에있는 속성값에 지정한 값을 저장
			$(".update_productCount").val(productCount);
			$(".quantity_update_form").submit();

		});
		
		/* 장바구니 삭제 버튼 */
		$(".delete_btn").on("click", function(e){
			e.preventDefault();
			const cartId = $(this).data("cartid");
			$(".delete_cartId").val(cartId);
			$(".quantity_delete_form").submit();
		});
	</script>



</html>
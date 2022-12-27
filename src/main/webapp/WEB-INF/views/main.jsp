<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="resources/css/main.css">
<%@include file="./includes/header.jsp" %>

        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Shopping mall</h1>
                    <p class="lead fw-normal text-white-50 mb-0">With daily clothes</p>
                </div>
            </div>
        </header>
        <!-- Section-->
       <div class="content_area">
				<!-- 게시물 o -->
				<c:if test="${listcheck != 'empty'}">
					<div class="list_search_result">
						<table class="type_list">
							<colgroup>
								<col width="110">
								<col width="*">
								<col width="120">
								<col width="120">
								<col width="120">
							</colgroup>
							<tbody id="searchList>">
								<c:forEach items="${list}" var="list">
									<tr>
										<td class="image">
											<div class="image_wrap"
												data-product_num="${list.imageList[0].product_num}"
												data-path="${list.imageList[0].uploadPath}"
												data-uuid="${list.imageList[0].uuid}"
												data-filename="${list.imageList[0].uploadFileName}">
												<img>
											</div>

										</td>
										<td class="detail">
											<div class="category">[${list.cateName}]</div>
											<div class="title">
												<a href="/goodsDetail/${list.product_num}">

													${list.p_name}</a>
											</div>
											<div class="date">${list.p_regdate}</div>

										</td>
										
										<td class="price">
											<div class="org_price">
												<del> ${list.p_price} </del>
											</div>
											<div class="sell_price">
												<strong> <c:out
														value="${list.p_price * (1-list.p_Discount)}" />
												</strong>
											</div>
										</td>
										<td class="option"></td>
									</tr>
								</c:forEach>
							</tbody>

						</table>
					</div>
					<!-- 페이지 이동 인터페이스 -->
					<div class="pageMaker_wrap">
						<ul class="pageMaker">

							<!-- 이전 버튼 -->
							<c:if test="${pageMaker.prev }">
								<li class="pageMaker_btn prev"><a
									href="${pageMaker.pageStart -1}">이전</a></li>
							</c:if>

							<!-- 페이지 번호 -->
							<c:forEach begin="${pageMaker.pageStart }"
								end="${pageMaker.pageEnd }" var="num">
								<li
									class="pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active':''}">
									<a href="${num}">${num}</a>
								</li>
							</c:forEach>

							<!-- 다음 버튼 -->
							<c:if test="${pageMaker.next}">
								<li class="pageMaker_btn next"><a
									href="${pageMaker.pageEnd + 1 }">다음</a></li>
							</c:if>
						</ul>
					</div>
					<!-- 서버에 페이지에대한 정보를 보냄 -->
					<form id="moveForm" action="/main" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> 
							<input type="hidden"name="amount" value="${pageMaker.cri.amount}">
							 <input type="hidden" name="type" value="${pageMaker.cri.type}">
					</form>
				</c:if>
				<!-- 게시물 x -->
				<c:if test="${listcheck == 'empty'}">
					<div class="table_empty">정보가 없습니다.</div>
				</c:if>
			</div>
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
		//서버에서 전달받은 이미지 list 화면에 보이기위한
		$(".image_wrap").each(
				function(i, obj) { // 들어온 객체(obj)의 인덱스(i)
					const a = $(obj);
					//이미지관련 변수 초기화	
					if (a.data("product_num")) {
						const uploadPath = a.data("path");
						const uuid = a.data("uuid");
						const fileName = a.data("filename")
						const fileCallPath = encodeURIComponent(uploadPath //썸네일이미지 화면에 보여주기위해 조합
								+ "/s_" + uuid + "_" + fileName);

						$(this).find("img").attr('src', //db에 등록된 이미지가있으면 사진 보여줌
								'/display?fileName=' + fileCallPath);
					} else {
						$(this).find("img").attr('src', //없으면 특정 사진 보여줌
								'../resources/img/noimg.jpg');
					}
				});
		/* 페이지 이동 버튼 */
		const moveForm = $('#moveForm');

		$(".pageMaker_btn a").on("click", function(e) {

			e.preventDefault();

			moveForm.find("input[name='pageNum']").val($(this).attr("href")); //선택한 페이지 번호(num) 이동 링크 삽입

			moveForm.submit();

		});
		</script>	
</html>

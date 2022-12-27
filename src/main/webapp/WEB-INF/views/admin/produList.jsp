<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../includes/header.jsp" %>
           
                    
                     
                 <div class="admin_content_wrap">
                    <div class="admin_content_subject">
                    <div class="goods_table_wrap">
                    	<!-- 상품 리스트 O -->
	                    <c:if test="${listcheck != 'empty'}">
	                    	<table class="table">
  <thead class="thead-light">
    <tr>
      <th scope="col">상품번호</th>
      <th scope="col">상품코드</th>
      <th scope="col">상품이름</th>
      <th scope="col">카테고리이름</th>
      <th scope="col">상품수량</th>
      <th scope="col">상품등록일</th>
    </tr>
  </thead>
	                    		<c:forEach items="${list}" var="list">
	                    		<tr>
	                    		<td>
	                    		<a class="move" href='<c:out value="${list.product_num}"/>'>
	                    			<c:out value="${list.product_num}"></c:out>
	                    			</a>
	                    			</td>
	                    			<td><c:out value="${list.p_code}"></c:out></td>
	                    			<td><c:out value="${list.p_name}"></c:out></td>
	                    			<td><c:out value="${list.cateName}"></c:out></td>
	                    			<td><c:out value="${list.p_Stock}"></c:out></td>
	                    			<td><fmt:formatDate value="${list.p_regdate}" pattern="yyyy-MM-dd"/></td>
	                    		</tr>
	                    		</c:forEach>
	                    	</table>
	                    </c:if>
	                    <!-- 상품 리스트 X -->
                		<c:if test="${listCheck == 'empty'}">
                			<div class="table_empty">
                				등록된 작가가 없습니다.
                			</div>
                		</c:if> 
                	</div>
                	</div>
                	<!-- 검색 영역 -->
                	<div class="search_wrap">
                		<form id="searchForm" action="/admin/produList" method="get">
                			<div class="search_input">
                    			<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
                    			<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
                    			<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
                    			<input type="hidden" name="type" value="G">
                    			<button class='btn search_btn'>검 색</button>                				
                			</div>
                		</form>
                	</div>
                	
                	<!-- 페이지 이름 인터페이스 영역 -->
                	<div >
                		<ul class="pagination">
                			
                			<!-- 이전 버튼 -->
                			<c:if test="${pageMaker.prev }">
                				<li class="pageMaker_btn prev">
                					<a href="${pageMaker.pageStart -1}">이전</a>
                				</li>
                			</c:if>
                			
                			<!-- 페이지 번호 -->
                			<c:forEach begin="${pageMaker.pageStart }" end="${pageMaker.pageEnd }" var="num">
                				<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active':''}">
                					<a href="${num}">${num}</a>
                				</li>	
                			</c:forEach>
                		
	                    	<!-- 다음 버튼 -->
	                    	<c:if test="${pageMaker.next}">
	                    		<li class="pageMaker_btn next">
	                    			<a href="${pageMaker.pageEnd + 1 }">다음</a>
	                    		</li>
	                    	</c:if>
	                    </ul>
                	</div>
                	
                	<form id="moveForm" action="/admin/produList" method="get" >
 						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
                	</form>
                    
                    </div>
               
                <div class="clearfix"></div>
               <%@include file="../includes/footer.jsp" %>
    
 <script>
$(document).ready(function(){
	
	let Result = '<c:out value="${result}"/>';
	
	checkResult(Result);
	
	function checkResult(result){
		
		if(result === ''){
			return;
		}
		
		alert("상품'"+ Result +"'을 등록하였습니다.");
		
	}
	
	/* 삭제 결과 경고창 */
	let delete_result = '${delete_result}';
	
	if(delete_result == 1){
		alert("삭제 완료");
	}

});
let searchForm = $('#searchForm');
let moveForm = $('#moveForm');

/*  검색 버튼 동작 */
$("#searchForm button").on("click", function(e){
	
	e.preventDefault();
	
	/* 검색 키워드 유효성 검사 */
	if(!searchForm.find("input[name='keyword']").val()){
		alert("키워드를 입력하십시오");
		return false;
	}
	
	searchForm.find("input[name='pageNum']").val("1");
	
	searchForm.submit();
	
});


/* 페이지 이동 버튼 */
$(".pageMaker_btn a").on("click", function(e){
	
	e.preventDefault();
	
	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	
	moveForm.submit();
});

/* 상품 조회 페이지 */
$(".move").on("click", function(e){
	
	e.preventDefault();
	
	moveForm.append("<input type='hidden' name='product_num' value='"+$(this).attr("href") + "'>");
	moveForm.attr("action", "/admin/productDetail");
	moveForm.submit();
	
	
});

</script>

</html>
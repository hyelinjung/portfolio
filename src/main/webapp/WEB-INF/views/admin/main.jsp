<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="resources/css/main.css">
<%@include file="../includes/header.jsp" %>
            <!-- contents-area -->
            <div class="admin_wrap">
                <!-- 네비영역 -->
                <div class="admin_navi_wrap">
                    <ul>
                        <li >
                            <a class="admin_list_01" href="/admin/produinsert">상품 등록</a>
                        </li>
                        <li>
                            <a class="admin_list_02" href="/admin/produList">상품 목록</a>
                        </li>
                                                                 
                    </ul>
<!-- 
                    <div class="admin_list_01">
                        <a>상품 관리</a>
                    </div>
                     -->
                 
            </div>
        </div>
     <%@include file="../includes/footer.jsp" %>
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
</script>


</html>
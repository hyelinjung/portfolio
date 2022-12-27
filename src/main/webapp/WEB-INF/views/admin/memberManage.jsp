<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/memberManage.css">
 
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
</head>
<body>
 
    <div class="wrapper">
        <div class="wrap">
            <!-- gnv_area -->    
            <div class="top_gnb_area">
                <ul class="list">    
                    <li><a href="/main">메인 페이지</a></li>
                    <!-- get방식사용 왜냐하면 로그아웃되었을떈 관리자페이지에 있을 수 없어 측정 페이지로 이동이 필요함 -->
                    <li><a href="/member/logout.do">로그아웃</a></li> 
                    <li>고객센터</li>            
                </ul>
            </div>
            <!-- top_subject_area -->
            <div class="admin_top_wrap">
                <span>관리자 페이지</span>
                
            </div>
            <!-- contents-area -->
            <div class="admin_wrap">
                <!-- 네비영역 -->
                <div class="admin_navi_wrap">
                    <ul>
                        <li >
                            <a class="admin_list_01" href="/admin/produEnrol">상품 등록</a>
                        </li>
                        <li>
                            <a class="admin_list_02" href="/admin/produList">상품 목록</a>
                        </li>
                        <lI>
                            <a class="admin_list_03">작가 등록</a>                            
                        </lI>
                        <lI>
                            <a class="admin_list_04">작가 관리</a>                            
                        </lI>
                        <lI>
                            <a class="admin_list_05" href="/admin/memberManage">회원 관리</a>                            
                        </lI>                                                                                             
                    </ul>
<!-- 
                    <div class="admin_list_01">
                        <a>상품 관리</a>
                    </div>
                     -->
                 <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>회원 관리</span></div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
 
</body>
</html>
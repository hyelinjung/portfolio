<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="./resources/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="../resources/css/styles.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/css/styles.css" rel="stylesheet" />
        
   <script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
    </head>
<body>
 
     <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/main">Shopping mall</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">아우터</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">숏패딩</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">롱패딩</a></li>
                                <li><a class="dropdown-item" href="#!">자켓</a></li>
                            </ul>
                        </li>
                       <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">상의</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!"> 긴팔티셔츠</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">반팔티셔츠 </a></li>
                                <li><a class="dropdown-item" href="#!">맨투맨</a></li>
                            </ul>
                        </li>
                        
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">하의</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">긴바지</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">반바지</a></li>
                                <li><a class="dropdown-item" href="#!">치마</a></li>
                            </ul>
                        </li>
            <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">신발</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">슬리퍼</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">부츠</a></li>
                                <li><a class="dropdown-item" href="#!">운동화</a></li>
                            </ul>
                        </li>
                   
                    </ul>
                     <ul class="nav justify-content-end">
                  <c:if test="${member == null }">
						<li class="nav-item">
						    <a class="nav-link active" href="/member/login">로그인</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link" href="/member/join">회원가입</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link" href="#">고객센터</a>
						  </li>
					</c:if>


					<c:if test="${member != null }">
						<c:if test="${member.adminCk ==1}">
							<li class="nav-item">
						    <a class="nav-link active" href="/admin/main">관리자페이지</a>
						  </li>
						</c:if>
						<li class="nav-item">
						    <a class="nav-link active" id="logout_post" href="#">로그아웃</a>
						  </li>
						<li class="nav-item">
						    <a class="nav-link" href="#">마이페이지</a>
						  </li>
						 
						
					</c:if>
  
  
</ul>
             <form action="/cart/${member.memberId}" class="d-flex">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </button>
                    </form>
                </div>
            </div>
        </nav>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header class="site-header sticky-top py-1 bg-light">
<nav class="navbar navbar-expand-lg bg-body-tertiary text-dark fw-bold">
  <div class="container-fluid">
 	 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart3" viewBox="0 0 16 16">
		<path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l.84 4.479 9.144-.459L13.89 4zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
	</svg>  
    <a class="navbar-brand" href="/user/main">DailyMarket</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse col-md-2" id="navbarSupportedContent">
      <ul class="navbar-nav  ">
       <li class="nav-item me-4">
      	 <div class="dropdown">
			  <a href="/user/main" class="dropdown-toggle nav-link" type="button" data-bs-toggle="dropdown" aria-expanded="false">
		    	글쓰기
			  </a>
			  <ul class="dropdown-menu">
			    <li><a class="dropdown-item" href="/user/job/write">알바 지원하기</a></li>
			    <li><a class="dropdown-item" href="/user/estate/writeOne">부동산 매물 올리기</a></li>
			    <li><a class="dropdown-item" href="/user/car/regist">중고차 직거래</a></li>
			    <li><hr class="dropdown-divider"></li>
			    <li><a class="dropdown-item" href="/user/product/write">내 물건 팔기</a></li>
			  </ul>
		  </div>
		</li>
        <li class="nav-item me-4">
          <a class="nav-link"  href="/user/product/main">중고거래</a>
        </li>
        <li class="nav-item me-4">
          <a class="nav-link" href="/user/company/main">동네업체</a>
        </li>
        <li class="nav-item me-4">
          <a class="nav-link" href="/user/job/main">알바</a>
        </li>
        <li class="nav-item me-4">
          <a class="nav-link" href="/user/estate/main">부동산</a>
        </li>
        <li class="nav-item me-4">
          <a class="nav-link" href="/user/car/main">중고차직거래</a>
        </li>
        <li class="nav-item me-4">
          <a class="nav-link" href="/user/mypage/main">마이페이지</a>
        </li>
        <li class="nav-item me-4">
          <a class="nav-link" href="/user/logout" onclick="javascript: alert('로그아웃 되었습니다.')" >로그아웃</a>
        </li>
        <li>
       	 <form class="d-flex justify-content-right" id="searchForm" >
        	<input id="keyword" value="${param.keyword }" class="form-control col-md-4 me-4 text-center text-dark fw-bold" type="search" placeholder="물품이나 동네를 검색해보세요" aria-label="Search">
        	<button id="searchBtn" type="button" class="btn btn-outline-dark col-md-4" type="button" >검색</button>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
			<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
			<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 		 	<script type="text/javascript">
 		 	$(document).ready(function(){
 		 		//enter로 검색 결과 찾기
 		 		$("#keyword").on("keydown",function(e){
 		 			if(e.key=="Enter"){
	 		 			location.href="/user/product/main?keyword="+$("#keyword").val()
	 					return false;
	 		 		}
 		 		});
 		 		//검색 버튼 클릭으로 검색 결과 찾기
 		 		$("#searchBtn").on("click",function(){
 		 			location.href="/user/product/main?keyword="+$("#keyword").val()
 		 		});
 		 		
 		 	});
 		 	
 		 	</script>
 		 
 		 </form>
        </li>
      </ul>
    </div>
  </div>
   
</nav>
</header>


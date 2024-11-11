<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사장님 사이트</title>
<style type="text/css"> 
/* stylelint-disable selector-list-comma-newline-after */

.blog-header {
  border-bottom: 1px solid #e5e5e5;
}

.blog-header-logo {
  font-family: "Playfair Display", Georgia, "Times New Roman", serif/*rtl:Amiri, Georgia, "Times New Roman", serif*/;
  font-size: 2.25rem;
}

.blog-header-logo:hover {
  text-decoration: none;
}

h1, h2, h3, h4, h5, h6 {
  font-family: "Playfair Display", Georgia, "Times New Roman", serif/*rtl:Amiri, Georgia, "Times New Roman", serif*/;
}

.display-4 {
  font-size: 2.5rem;
}
@media (min-width: 768px) {
  .display-4 {
    font-size: 3rem;
  }
}

.flex-auto {
  flex: 0 0 auto;
}

.h-250 { height: 250px; }
@media (min-width: 768px) {
  .h-md-250 { height: 250px; }
}

/* Pagination */
.blog-pagination {
  margin-bottom: 4rem;
}

/*
 * Blog posts
 */
.blog-post {
  margin-bottom: 4rem;
}
.blog-post-title {
  font-size: 2.5rem;
}
.blog-post-meta {
  margin-bottom: 1.25rem;

  color: #727272;
}

/*
 * Footer
 */
.blog-footer {
  padding: 2.5rem 0;
  color: #727272;
  text-align: center;
  background-color: #f9f9f9;
  border-top: .05rem solid #e5e5e5;
}
.blog-footer p:last-child {
  margin-bottom: 0;
}

</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
    
<div class="container">
  <header class="blog-header lh-1 py-3">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col-4 pt-1">
        <a class="link-secondary h4 fw-bold text-dark" href="#">${userId }</a>
      </div>
      <div class="col-4 text-center">
        <p class="blog-header-logo text-dark" href="#">Daily Business</p>
      </div>
      <div class="col-4 d-flex justify-content-end align-items-center">
        <p class="blog-header-logo text-dark" href="#" id="logoutBtn" >LogOut</p>
      </div>
    </div>
  </header>

  <div class="nav-scroller py-1 mb-2">
    <nav class="nav justify-content-center ">
		<c:if test="${empty busiVO.busiNo }">
  			<a class="p-2 btn btn-light fw-bold" href="/owner/company/regist">비즈프로필 등록</a>&nbsp;
  		</c:if>
  		<c:if test="${not empty busiVO.busiNo }">
  			<c:if test="${ busiVO.status eq 'S'}">
  				<a class="p-2 btn btn-light fw-bold" href="/owner/company/detail?busiNo=${busiVO.busiNo }">업체 등록 대기중</a>&nbsp;
  			</c:if>
  			<c:if test="${  busiVO.status eq 'Y'}">
				<div class="btn-group ">
				  <button type="button" class="fw-bold btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
				    등록
				  </button>
				  <ul class="dropdown-menu">
				  	<li>
				  	<c:if test="${empty busiVO.menuNo }">
 						<a class="p-2 btn  fw-bold" href="/owner/company/menu/regist">물품등록</a> &nbsp;
		 			</c:if>
		 			</li>
				  	<li>
				 	<c:if test="${empty busiVO.jobNo }">
						<a class="p-2 btn  fw-bold" href="/owner/job/regist">알바구인</a>&nbsp;
					</c:if>
					</li>
				    <li>
				    <c:if test="${empty advertVO.advertNo }">
				    	<a class="p-2 btn  fw-bold" href="/owner/advert/write?busiNo=${busiVO.busiNo }">광고등록</a>&nbsp;
				    </c:if>
				    </li>
				    <li><a class="p-2 btn  fw-bold" href="/owner/notice/write">소식등록</a>&nbsp;</li>
				  </ul>
				</div>
				&nbsp;&nbsp;
				<div class="btn-group ">
				  <button type="button" class="fw-bold btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
				    수정
				  </button>
				  <ul class="dropdown-menu">
				    <li>
				    	<a class="p-2 btn  fw-bold" href="/owner/company/detail?busiNo=${busiVO.busiNo }">비즈프로필 수정</a>&nbsp;&nbsp;</li>
				     <li>
				    <c:if test="${ busiVO.status eq 'N'}">
  						<a class="p-2 btn  fw-bold" href="/owner/company/detail?busiNo=${busiVO.busiNo }">업체 재 등록</a> 
  					</c:if>
  					</li>
  					<li>
  						<c:if test="${not empty advertVO.advertNo }">
  							<a class="p-2 btn  fw-bold" href="/owner/advert/write?busiNo=${busiVO.busiNo }">광고 수정</a>&nbsp;&nbsp;&nbsp;</li>
  						</c:if>
				     <li>
				     <li>
				     <c:if test="${not empty busiVO.jobNo }">
		 				<a class="p-2 btn  fw-bold" href="/owner/job/detail">구인정보수정</a>&nbsp;
		 			</c:if>
		 			</li>
				  </ul>
				</div>
  				&nbsp;&nbsp;
				<div class="btn-group ">
				  <button type="button" class="fw-bold btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
				    채팅
				  </button>
				  <ul class="dropdown-menu">
				    <li>
				    	<a class="p-2 btn  fw-bold" href="/chat/roomList">채팅</a>&nbsp;&nbsp;</li>
				     <li>
  				
  			</c:if>
  			
  		</c:if>
    </nav>
  </div>
</div>

<main class="container">
  <div class="p-4 p-md-5 mb-4 rounded text-bg-dark">
    <div class="col-md-6 px-0">
      <h1 class="display-4 fst-italic">Daily Market For Your Business</h1>
    </div>
  </div>

  <div class="row mb-2">
    <div class="col-md-6">
      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <span>
          		<strong class="d-inline-block mb-2 text-warning h5 fw-bold">Price</strong>
          		<strong class="d-inline-block mb-2 text-primary h5 fw-bold">Value</strong>
          </span>
          <br>
          <h3 class="mb-0">가격과 품질의 조화</h3>
          <br>
          <p class="card-text mb-auto">데일리 비즈니스에서는 사장님과 데일리마켓이 함께하여
          							고객 분들께 저렴한 가격에 더 좋은 서비스를 제공 하실 수 있어요.
          </p>
        </div>
        <div class="col-auto d-none d-lg-block">
          <img src="/resources/img/ownerMain1.jpg" class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/>
			
        </div>
      </div>
    </div><div class="col-md-6">
    <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
      <div class="col p-4 d-flex flex-column position-static">
        <span>
        		<strong class="d-inline-block mb-2 text-success h5 fw-bold">Q</strong>
        		<strong class="d-inline-block mb-2 text-danger h5 fw-bold">A</strong>
        </span>
        <br>
        <h3 class="mb-0">정확하고 더 빠른 소통</h3>
        <br>
        <p class="card-text mb-auto">위치 설정으로 해당 지역의 고객 분들에게 더 손쉽게 다가갈수 있어요.
        							 고객의 문의사항이나 요청사항을 더 정확하게 알 수 있어요.
        </p>
      </div>
      <div class="col-auto d-none d-lg-block">
        <img src="/resources/img/ownerMain2.jpg" class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/>
	
      </div>
    </div>
  </div>
 </div>

  <div class="row g-5">
    <div class="col-md-12">
      <h3 class="pb-4 mb-4 border-bottom fw-bold text-dark text-center">
        	데일리 비즈니스를 소개합니다.
      </h3>
    </div>
    <div class="col-6">
	     <article class="blog-post">
	       <h2 class="blog-post-title mb-1 h4 fw-bold">가게 등록이 쉬워졌어요.</h2>
	       <br>
	       <img class="img-thumbnail w-50"  src="/resources/img/store.jpg">
	       <hr>
	     </article>
	</div>
	<div class="col-6">
	     <article class="blog-post">
	       <h2 class="blog-post-title mb-1 h4 fw-bold">메뉴 등록도 신속하게-!</h2>
	       <br>
	       <img class="img-thumbnail w-50"  src="/resources/img/menu.jpg">
	       <hr>
	     </article>
	</div>
	<div class="col-6">
	     <article class="blog-post ">
	       <h2 class="blog-post-title mb-1 h4 fw-bold">더 빠르게 , 편리한 구인 활동.</h2>
	       <br>
	       <img  class="img-thumbnail w-50" src="/resources/img/job.jpg">
	       <br>
	       <hr>
	     </article>
	</div>
	<div class="col-6">
	     <article class="blog-post">
<pre class="blog-post-title mb-1 h4 fw-bold">
더욱 편리하고 손쉽게 
가게 정보를 변경할 수 있어요.
</pre>
	       <br>
	       <img class="img-thumbnail w-50" src="/resources/img/mypage.jpg">
	       <br><br>
	       <hr>
	     </article>
	  </div>
    </div>

</main>

<%@include file="/resources/common/owner/footer.jsp" %>

    
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#logoutBtn").on("click",function(){
		location.href="/owner/logout"
		alert("로그아웃 되었습니다.")
	})

})

</script>
</html>
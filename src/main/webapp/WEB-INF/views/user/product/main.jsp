<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고거래 메인 페이지</title>
<style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
      
      img{
      	width: 300px;
      	height: 200px;
      }
    </style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

</head>
<body>
<%@ include file="/resources/common/user/header.jsp" %>

<main>

  <section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-dark fw-bold"><pre>믿을만한</pre>
        					 <pre>이웃 간 중고거래</pre>
        </h1>
        <p class="lead text-muted"><pre class="h5">동네 주민들과 가깝고 따뜻한 거래를 </pre>
        						   <pre class="h5">지금 경험해보세요.</pre>
       	</p>
        <p>
          <a href="#" class="btn btn-primary my-2">인기 매물 보기</a>
          <a href="#" class="btn btn-secondary my-2">새로운 매물 보기</a>
        </p>
      </div>
    </div>
  </section>
  
<!--   <form  id="increaseRowForm" action="/user/product/main"  method="get"> -->
<%--   	<input type="hidden" name="startRow" value="${param.startRow }"> --%>
<!--   </form>	 -->
	
  <div class="album py-5 bg-light">
    <div class="container">
    <div class="row">
    <c:forEach var="list" items="${list }" >
        <div class="col selectTag">
          <div class="card w-30" style="width: 18rem;">
			  <img src="/resources/upload/user/product/${list.productStoredFileName }" class="card-img-top">
			  <div class="card-body">
			    <p class="card-text">&nbsp;<a href="/user/product/detail?productNo=${list.productNo}" class="text-dark fw-bold">${list.title }</a></p>
			    <p class="card-text fw-bold">
			    	<fmt:formatNumber var="price" type="number" maxFractionDigits="3" value="${list.price }" />
			    	&nbsp;${price }
			    </p>
			    <p class="card-text">&nbsp;${list.location }</p>
			    <p class="card-text"><span>&nbsp;조회수 (${list.hitCnt })</span><span>&nbsp;추천 (${list.likeCnt}) </span></p>
			  </div>
         </div>
         <br><br><br><br>
       </div>
      </c:forEach> 
      </div>
       
       <br><br><br><br>
       	<div id="increaseRowBtn"  class="text-center">
	       <svg style="width:25px; height: 25px;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle-fill" viewBox="0 0 16 16">
	  			<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3z"/>
			</svg>
	        <h4>
	       		<span class="fw-bold">더보기</span>
	       	</h4>
        </div>
     </div>
    </div>
 </main>

<%@ include file="/resources/common/user/footer.jsp" %>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	//var startRow=12;
	//$("#increaseRowBtn").on("click",function(){
	//	startRow +=12;
	//	location.href ="/user/product/main?startRow="+startRow
	//});

})

</script>
</html>
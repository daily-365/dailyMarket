<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동네 업체</title>
<style type="text/css">
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
 	width: 200px;
 	height: 200px;
 	
 }
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body class="container-fluid">
<%@include file="/resources/common/user/header.jsp" %>
<main>
	<section class="py-5 text-center container ">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-dark fw-bold"><pre>동네 이웃들이</pre>
        					 <pre>자주 가는 동네 업체</pre>
        </h1>
        <p class="lead text-muted"><pre class="h5">우리 동네 사람들이 </pre>
        						   <pre class="h5">이용하는 업체를 찾아보세요.</pre>
       	</p>
      </div>
    </div>
  </section>
</main>
 <div class="container-fluid bg-light">
 	<div class="container">
	 	<div class="text-center">
	 	<br><br>
	  	<h5 class="text-dark fw-bold">다양한 동네 업체를 볼 수 있어요</h5>
	  	<form class="form form-inline"><br>
	  		<button type="button" class="btn btn-outline-dark active">전체</button>
	  		<button type="button" class="btn btn-outline-dark">식당</button>
	  		<button type="button" class="btn btn-outline-dark">카페</button>
	  		<button type="button" class="btn btn-outline-dark">포장이사</button>
	  		<button type="button" class="btn btn-outline-dark">뷰티/미용</button>
	  		<button type="button" class="btn btn-outline-dark">헬스/필라테스/요가</button>
	  		<br><br><br><br>
	  		<div class="row d-flex justify-content-center">
	  			<c:forEach var="list" items="${list }">
	  			<div class="col-4">
	  				<img class="img-thumbnail" src="/resources/upload/owner/company/${list.storedFileName}" style="width:200px; height: 200px;">
	  				<br><br>
	  				<p><a href="/user/company/detail?busiNo=${list.busiNo }" class="fw-bold h5 text-dark">${list.busiName }</a><span class="text-dark">&nbsp;( ${fn:substring(list.storeAddr,3,9) } )</span></p>
	  				<p><span>${list.title }</span></p>
	  				<p class="fw-bold"><span >후기 0 &nbsp;</span><span>&nbsp;단골 0 &nbsp;</span><span>&nbsp; ${list.busiType1 }</span></p>
	  			</div>
	  			</c:forEach>
	  			<div class="col-4">
	  				<img class="img-thumbnail" src="/resources/img/에어컨.jpg">
	  				<br><br>
	  				<p><span class="fw-bold h5 text-dark">드롭플라워-송파</span><span class="text-dark">&nbsp;( 가락 1동 )</span></p>
	  				<p><span>송파구 꽃집 순위 1위-!</span></p>
	  				<p class="fw-bold"><span >후기 0 &nbsp;</span><span>&nbsp;단골 0 &nbsp;</span><span>&nbsp; 꽃집/꽃배달</span></p>
	  			</div>
	  			<div class="col-4">
	  				<img class="img-thumbnail" src="/resources/img/책.jpg">
	  				<br><br>
	  				<p><span class="fw-bold h5 text-dark">드롭플라워-송파</span><span class="text-dark">&nbsp;( 가락 1동 )</span></p>
	  				<p><span>송파구 꽃집 순위 1위-!</span></p>
	  				<p class="fw-bold"><span >후기 0 &nbsp;</span><span>&nbsp;단골 0 &nbsp;</span><span>&nbsp; 꽃집/꽃배달</span></p>
	  			</div>
	  		</div>
	  		<br><br>
	  		<hr><br><br>
	  		
	  		<div class="row d-flex justify-content-center">
	  			<div class="col-4">
	  				<img class="img-thumbnail" src="/resources/img/서랍장.jpg">
	  				<br><br>
	  				<p><span class="fw-bold h5 text-dark">드롭플라워-송파</span><span class="text-dark">&nbsp;( 가락 1동 )</span></p>
	  				<p><span>송파구 꽃집 순위 1위-!</span></p>
	  				<p class="fw-bold"><span >후기 0 &nbsp;</span><span>&nbsp;단골 0 &nbsp;</span><span>&nbsp; 꽃집/꽃배달</span></p>
	  			</div>
	  			<div class="col-4">
	  				<img class="img-thumbnail" src="/resources/img/선풍기.jpg">
	  				<br><br>
	  				<p><span class="fw-bold h5 text-dark">드롭플라워-송파</span><span class="text-dark">&nbsp;( 가락 1동 )</span></p>
	  				<p><span>송파구 꽃집 순위 1위-!</span></p>
	  				<p class="fw-bold"><span >후기 0 &nbsp;</span><span>&nbsp;단골 0 &nbsp;</span><span>&nbsp; 꽃집/꽃배달</span></p>
	  			</div>
	  			<div class="col-4">
	  				<img class="img-thumbnail" src="/resources/img/세탁기.jpg">
	  				<br><br>
	  				<p><span class="fw-bold h5 text-dark">드롭플라워-송파</span><span class="text-dark">&nbsp;( 가락 1동 )</span></p>
	  				<p><span>송파구 꽃집 순위 1위-!</span></p>
	  				<p class="fw-bold"><span >후기 0 &nbsp;</span><span>&nbsp;단골 0 &nbsp;</span><span>&nbsp; 꽃집/꽃배달</span></p>
	  			</div>
	  		</div>
	  		<br><br>
	  		<hr><br><br>
	  		</form>
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="container">
		<br><br>
		<h5 class="text-dark fw-bold text-center">동네 이웃이 남긴 후기를 찾아보세요</h5>
		<div class="row">
			
			<div class="col">
		 	<br><br>
	  		<div class="col-2" style="border: 2px solid black; border-radius: 30px; width: 300px; height: 500px;">
	  			<br>
	  			<div class="text-center">
			  		<img style="width: 100px; height: 100px;" class="rounded-circle" src="/resources/img/책.jpg">
			  		<p class="fw-bold h5 text-dark"> ${userId }</p>
			  		<span class="fw-bold">삼산동 </span><span> ( 인증 8회 )</span> 
	  			</div><br><br>
	  			<img class="img-thumbnail" style="width: 100px; height: 100px;" src="/resources/img/mainImg1.jpg"><span class="fw-bold"> 다이어트뷰티카페 미타임</span>
	  			<br>
	  			<p class="fw-bold"><span >후기 0 &nbsp;</span><span>&nbsp;단골 0 &nbsp;</span><span>&nbsp; 카페</span></p>
	  			<br>
	  			<div>사장님 센스 덕분에 즐겁고 재밌게 놀고 맛있게 먹고 갔습니다. 다음에 또 와보고 싶어요
	  				즐거운 일 , 즐거운 기억 가지고 가요-~~ 다음엔 꼭 ...	
	  			</div>
	  		</div>
	  		<br>
	  		</div>
	  		
	  		
	  		<div class="col">
	  		<br><br>
	  		<div class="col-2" style="border: 2px solid black; border-radius: 30px; width: 300px; height: 500px;">
	  			<br>
	  			<div class="text-center">
			  		<img style="width: 100px; height: 100px;" class="rounded-circle" src="/resources/img/피아노.jpg">
			  		<p class="fw-bold h5 text-dark"> ${userId }</p>
			  		<span class="fw-bold">삼산동 </span><span> ( 인증 8회 )</span> 
	  			</div><br><br>
	  			<img class="img-thumbnail" style="width: 100px; height: 100px;" src="/resources/img/mainImg2.jpg"><span class="fw-bold"> 다이어트뷰티카페 미타임</span>
	  			<br>
	  			<p class="fw-bold"><span >후기 0 &nbsp;</span><span>&nbsp;단골 0 &nbsp;</span><span>&nbsp; 카페</span></p>
	  			<br>
	  			<div>사장님 센스 덕분에 즐겁고 재밌게 놀고 맛있게 먹고 갔습니다. 다음에 또 와보고 싶어요
	  				즐거운 일 , 즐거운 기억 가지고 가요-~~ 다음엔 꼭 ...	
	  			</div>
	  		</div>
	  		<br>
	  		</div>
	  		
	  		
	  		<div class="col">
	  		<br><br>
	  		<div class="col-2" style="border: 2px solid black; border-radius: 30px; width: 300px; height: 500px;">
	  			<br>
	  			<div class="text-center">
			  		<img style="width: 100px; height: 100px;" class="rounded-circle" src="/resources/img/커피머신.jpg">
			  		<p class="fw-bold h5 text-dark"> ${userId }</p>
			  		<span class="fw-bold">삼산동 </span><span> ( 인증 8회 )</span> 
	  			</div><br><br>
	  			<img class="img-thumbnail" style="width: 100px; height: 100px;" src="/resources/img/mainImg3.jpg"><span class="fw-bold"> 다이어트뷰티카페 미타임</span>
	  			<br>
	  			<p class="fw-bold"><span >후기 0 &nbsp;</span><span>&nbsp;단골 0 &nbsp;</span><span>&nbsp; 카페</span></p>
	  			<br>
	  			<div>사장님 센스 덕분에 즐겁고 재밌게 놀고 맛있게 먹고 갔습니다. 다음에 또 와보고 싶어요
	  				즐거운 일 , 즐거운 기억 가지고 가요-~~ 다음엔 꼭 ...	
	  			</div>
	  		</div>
	  		<br>
  			</div>
  			
  			
  			<div class="col">
	  		<br><br>
	  		<div class="col-2" style="border: 2px solid black; border-radius: 30px; width: 300px; height: 500px;">
	  			<br>
	  			<div class="text-center">
			  		<img style="width: 100px; height: 100px;" class="rounded-circle" src="/resources/img/침대.jpg">
			  		<p class="fw-bold h5 text-dark"> ${userId }</p>
			  		<span class="fw-bold">삼산동 </span><span> ( 인증 8회 )</span> 
	  			</div><br><br>
	  			<img class="img-thumbnail" style="width: 100px; height: 100px;" src="/resources/img/market4.jpg"><span class="fw-bold"> 다이어트뷰티카페 미타임</span>
	  			<br>
	  			<p class="fw-bold"><span >후기 0 &nbsp;</span><span>&nbsp;단골 0 &nbsp;</span><span>&nbsp; 카페</span></p>
	  			<br>
	  			<div>사장님 센스 덕분에 즐겁고 재밌게 놀고 맛있게 먹고 갔습니다. 다음에 또 와보고 싶어요
	  				즐거운 일 , 즐거운 기억 가지고 가요-~~ 다음엔 꼭 ...	
	  			</div>
	  		</div>
	  		<br>
	  		</div>
  		</div>
  	</div>
  	
	<div class="container bg-light">
		<br><br>
		<div class="text-center">
			<h4>업체를 운영하고 계신가요?</h4>
			<p>데일리에 등록하고 이웃에게 알려보세요-!</p>
			<button type="button" class="btn btn-secondary" onclick="javascript: location.href='/owner/main'">비즈프로필 만들기</button>
		</div>
		<br><br>
	</div>
</div>



<%@include file="/resources/common/user/footer.jsp" %>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</html>
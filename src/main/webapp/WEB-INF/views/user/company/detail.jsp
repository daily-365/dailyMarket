<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동내 업체 상세페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style type="text/css">
.imgSvg {
 width: 50px;
 height: 50px;
}
.img {
	margin-left: 33%;
	width: 800px;
	height: 500px;
}

.svg{
	margin-left:20px;
	width: 25px;
	height: 25px;
}

</style>
</head>
<body class="container-fluid">
<%@ include file="/resources/common/user/header.jsp" %>	
<div class="container">
	<main>
		<br><br>
		<div class="topCard cycle-slideshow  " 
			data-cycle-fx="carousel"
			data-cycle-timeout="1000"
			data-cycle-speed="1000"
			data-cycle-slides="> .slide"
			data-cycle-carousel-visible="1"
			data-cycle-carousel-vertical="false"
			data-cycle-log="false"
			data-cycle-pause-on-hover="true"
			data-cycle-pager="#per-slide-template"
			data-cycle-next="#next"
		    data-cycle-prev="#prev"
		    data-cycle-pager="#pager"
		    data-cylce-page-template="<li><a href='#'></a></li>"
			>
			<c:forEach var="store" items="${store }">
				<div class="slide" data-cycle-pager-template="<span></span>">
					<a href="#" ><img  class="img"src="/resources/upload/owner/company/${store.storedFileName }" /></a>
				</div>
			</c:forEach>
			<br>
			<div id="buttons" class="text-center fw-bold text-dark h4">
		    <span data-cycle-cmd="prev">
		    	<svg class="imgSvg" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-left-fill" viewBox="0 0 16 16">
		  			<path d="m3.86 8.753 5.482 4.796c.646.566 1.658.106 1.658-.753V3.204a1 1 0 0 0-1.659-.753l-5.48 4.796a1 1 0 0 0 0 1.506z"/>
				</svg>
			</span>
		    <span data-cycle-cmd="next">
		    	<svg class="imgSvg" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
		  			<path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
				</svg>
			</span>
		</div>
	</div>
	<br><br>
	<div class="row">
		<div class="col-3">
		</div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<div class="col-5">
			<span><img class="rounded-circle bg-secondary" style="padding:35px;"></span>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="fw-bold">${busiVO.busiName}- ${fn:substring(busiVO.storeAddr,3,6) }</span>
			<span>${fn:substring(busiVO.storeAddr,6,9) }. ${busiVO.busiType1 } 단골 1,854</span>
		</div>
		<div class="col-2">
		<br>
		<button class="fw-bold btn btn-danger text-light" type="button">+ 단골맺기</button>
		</div>
	</div>	
	<br><br>
	<div class="row">
		<div class="col-3">
		</div>
		<c:set var="storeTel" value="${fn:substring(busiVO.storeTel,0,2)}" />
		<c:choose>
			<c:when test="${storeTel eq 02 }">
				<fmt:formatNumber var="storeTel1" value="${busiVO.storeTel }" pattern="##,####,####" />
				
				<c:if test="${fn:length(storeTel1) eq 11 }">
					<div class="col-3">
						<svg  data-toggle="tooltip" data-placement="top" title="연락처 : 0${fn:replace(storeTel1,',','-') }"
							class="svg" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone-fill" viewBox="0 0 16 16">
			 				<path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877z"/>
						</svg>
						<br>
						<p class="fw-bold text-dark " >전화문의</p>
					</div>
				</c:if>
				<c:if test="${fn:length(storeTel1) eq 12 }">
					<div class="col-3">
						<svg  data-toggle="tooltip" data-placement="top" title="연락처 : ${fn:replace(storeTel1,',','-') }"
							class="svg" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone-fill" viewBox="0 0 16 16">
			 				<path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877z"/>
						</svg>
						<br>
						<p class="fw-bold text-dark " >전화문의</p>
					</div>
				</c:if>
			</c:when>
			<c:otherwise>
				<fmt:formatNumber var="storeTel2"  value="${busiVO.storeTel }" pattern="###,###,####" />
				<c:if test="${fn:length(storeTel2) eq 11 }">
					<div class="col-3">
						<svg  data-toggle="tooltip" data-placement="top" title="연락처 : 0${fn:replace(storeTel2,',','-') }"
							class="svg" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone-fill" viewBox="0 0 16 16">
			 				<path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877z"/>
						</svg>
						<br>
						<p class="fw-bold text-dark " >전화문의</p>
					</div>
				</c:if>
				<c:if test="${fn:length(storeTel2) eq 12 }">
					<div class="col-3">
						<svg  data-toggle="tooltip" data-placement="top" title="연락처 : ${fn:replace(storeTel2,',','-') }"
							class="svg" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone-fill" viewBox="0 0 16 16">
			 				<path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877z"/>
						</svg>
						<br>
						<p class="fw-bold text-dark " >전화문의</p>
					</div>
				</c:if>
			</c:otherwise>
		</c:choose>
		
		
		<div class="col-3">
			<svg class="svg" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16">
  				<path d="M2.678 11.894a1 1 0 0 1 .287.801 11 11 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8 8 0 0 0 8 14c3.996 0 7-2.807 7-6s-3.004-6-7-6-7 2.808-7 6c0 1.468.617 2.83 1.678 3.894m-.493 3.905a22 22 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a10 10 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9 9 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105"/>
			</svg>
			<br>
			<p class="fw-bold text-dark">채팅문의</p>
		</div>
		<div class="col-3">
			<svg class="svg" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
  				<path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.5.5 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11z"/>
			</svg>
			<p class="fw-bold text-dark">후기작성</p>
		</div>
	</div>
	<br>
	<hr>
	<br>
	<div class="row">
		<div class="col-3">
		</div>
		<div class="col-2">
			<a href="/user/company/detail?busiNo=${param.busiNo}" class="text-dark fw-bold h5 ">홈</a>
		</div>
		<div class="col-2">
			<a href="#" class="text-dark fw-bold h5">소식</a>
		</div>
		<div class="col-2">
			<a href="/user/company/product/main?busiNo=${param.busiNo}" class="text-dark fw-bold h5">상품</a>
		</div>
		<div class="col-3">
			<a href="#" class="text-dark fw-bold h5">후기</a>
		</div>
	</div>
	<br>
	<hr>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col">
			<h4 class="fw-bold text-secondary">정보</h4>
		</div>
	</div>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col">
			<p class="fw-bold">${busiVO.introduce }</p>
		</div>
	</div>
	<div class="row">	
		<div class="col-2">
		</div>
		<div class="col">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
	  			<path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A32 32 0 0 1 8 14.58a32 32 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10"/>
	 			<path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4m0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
			</svg>
			<span id="address" class="fw-bold">${busiVO.storeAddr } ${busiVO.storeAddrDetail }</span>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div id="map" style="width:500px;height:400px;"></div>
	</div>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-globe" viewBox="0 0 16 16">
  				<path d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m7.5-6.923c-.67.204-1.335.82-1.887 1.855A8 8 0 0 0 5.145 4H7.5zM4.09 4a9.3 9.3 0 0 1 .64-1.539 7 7 0 0 1 .597-.933A7.03 7.03 0 0 0 2.255 4zm-.582 3.5c.03-.877.138-1.718.312-2.5H1.674a7 7 0 0 0-.656 2.5zM4.847 5a12.5 12.5 0 0 0-.338 2.5H7.5V5zM8.5 5v2.5h2.99a12.5 12.5 0 0 0-.337-2.5zM4.51 8.5a12.5 12.5 0 0 0 .337 2.5H7.5V8.5zm3.99 0V11h2.653c.187-.765.306-1.608.338-2.5zM5.145 12q.208.58.468 1.068c.552 1.035 1.218 1.65 1.887 1.855V12zm.182 2.472a7 7 0 0 1-.597-.933A9.3 9.3 0 0 1 4.09 12H2.255a7 7 0 0 0 3.072 2.472M3.82 11a13.7 13.7 0 0 1-.312-2.5h-2.49c.062.89.291 1.733.656 2.5zm6.853 3.472A7 7 0 0 0 13.745 12H11.91a9.3 9.3 0 0 1-.64 1.539 7 7 0 0 1-.597.933M8.5 12v2.923c.67-.204 1.335-.82 1.887-1.855q.26-.487.468-1.068zm3.68-1h2.146c.365-.767.594-1.61.656-2.5h-2.49a13.7 13.7 0 0 1-.312 2.5m2.802-3.5a7 7 0 0 0-.656-2.5H12.18c.174.782.282 1.623.312 2.5zM11.27 2.461c.247.464.462.98.64 1.539h1.835a7 7 0 0 0-3.072-2.472c.218.284.418.598.597.933M10.855 4a8 8 0 0 0-.468-1.068C9.835 1.897 9.17 1.282 8.5 1.077V4z"/>
			</svg>
			<span><a href="#">${busiVO.homePage }</a></span>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col bg-light text-dark fw-bold" style="padding:25px;">
		"단골 맺기" 를 눌러서 ${busiVO.busiName }의 매주 다양한 특가 할인소식을 놓치지말고 받아보세요.
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col-4">
			<h4 class="fw-bold text-secondary">가격</h4>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col-4">
			<c:forEach var="menu" items="${menu }">
			<p class="fw-bold">${menu.name }</p>
			<p class="text-secondary">${menu.content }</p><span class="fw-bold"><fmt:formatNumber value="${menu.price }" pattern="#,###원" /></span>
			<hr>
			</c:forEach>
		</div>
	</div>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col">
			<h4 class="fw-bold text-secondary">후기</h4>
		</div>
	</div>
	<br><br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col">
			<img  class="bg-secondary rounded-circle" style="padding: 25px;">
			<br><br>
			<p class="fw-bold">매너당근</span><span class="fw-bold h5 text-dark">( 단골 )</p>
			<p>가락2동 인증 30회 ∙ 6일</p>
		</div>
	</div>
	<div class="row">
		<div class="col-2">
		</div>
		<img src="https://dnvefa72aowie.cloudfront.net/business_review/business_review/undefined/1987705/1718976333510/SU1HXzI5MzguanBlZw==.jpeg" style="width: 350px; height: 350px;">
	</div>
	<div class="row">
		<div class="col-2"></div>
<pre class="col-6">
<br>
사진이 꽃을 못담네요. 
제가 좋아하는 색감과 질감의 꽃들로 심지어 싱싱한 친구들인데 가격이 너무 좋아요🧡
전부터 주변 추천했었는데 더 많이 확장해주세요~ 
아침에 가면 싱싱한 꽃내음으로 가게가 어디에 있는지 한번에 알 수 있더라구요 
가는 길이 행복했어요
<br>
</pre>
	</div>
	</div>
	<br>
	<div class="row">
		<div class="col-2"></div>
		<div class="col form-control text-center fw-bold">후기 더보기</div>
		<div class="col-2"></div>
	</div>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col">
			<h4 class="fw-bold text-secondary">소식</h4>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col">
			<img style="width: 100px; height: 100px;" src="https://dnvefa72aowie.cloudfront.net/businessPlatform/bizPlatform/profile/center_biz_557497/1719369834410/1b107083bbd763f2cb24f781bd458cb8423cea9a2ced044e552951320299a55c.jpeg?q=95&s=1440x1440&t=inside" class="img-thumbnail" >
<span class="col-4 fw-bold text-secondary">
<br>
저희 가게의 다양한 소식을 만나실 수 있어요.
저렴한 가격에 좋은 물건을 드려요-~!!
</span>
		</div>
		<div class="col">
			<img style="width: 100px; height: 100px;" src="https://dnvefa72aowie.cloudfront.net/businessPlatform/bizPlatform/profile/center_biz_557497/1719203679529/15e5796c2bd54ea2485c593b01e1f0e22852c09b0f121617c7d751b80c4d8421.jpeg?q=95&s=1440x1440&t=inside" class="img-thumbnail" >
<span class="col-4 fw-bold text-secondary">
<br>
저희 가게의 다양한 소식을 만나실 수 있어요.
저렴한 가격에 좋은 물건을 드려요-~!!
</span>
		</div>
		<div class="col">
			<img style="width: 100px; height: 100px;" src="https://dnvefa72aowie.cloudfront.net/businessPlatform/bizPlatform/profile/center_biz_557497/1718951389294/55ee527fc867c0af9d6e6a43cb6e864f440bdff5406e3b231e662d2b9af364ca.jpeg?q=95&s=1440x1440&t=inside" class="img-thumbnail" >
<span class="col-4 fw-bold text-secondary">
<br>
저희 가게의 다양한 소식을 만나실 수 있어요.
저렴한 가격에 좋은 물건을 드려요-~!!
</span>
		</div>
		<div class="col">
			<img style="width: 100px; height: 100px;" src="https://dnvefa72aowie.cloudfront.net/businessPlatform/bizPlatform/profile/center_biz_557497/1718765425156/c32329a25fc9cd418d3000227f78d7971bca56c2cd405d4294082dd2525cf786.jpeg?q=95&s=1440x1440&t=inside" class="img-thumbnail" >
<span class="col-4 fw-bold text-secondary">
<br>
저희 가게의 다양한 소식을 만나실 수 있어요.
저렴한 가격에 좋은 물건을 드려요-~!!
<br><br><br>
</span>
		</div>
		
	<div class="row">
			<div class="col-2"></div>
		<div class="col form-control text-center fw-bold bg-light">소식 더보기</div>
		<div class="col-2"></div>
	</div>
	<br>
	</div>
	</main>
</div>
<%@ include file="/resources/common/user/footer.jsp" %>	
</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- jQuery Cycle2 Plugin CDN JS -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery.cycle2/20140216/jquery.cycle2.min.js" type="text/javascript"></script>
<!-- 카카오지도 -->
<!-- services 라이브러리 불러오기 --> 
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7e7eda9c8086805cb16eb9832f3a8b1e&libraries=services"></script>
<script type="text/javascript">

var address = document.getElementById('address')
var addrVal = address.innerText

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(''+addrVal+'', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+addrVal+'</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});   

$(document).ready(function(){
	//툴팁
	$('[data-toggle="tooltip"]').tooltip()
	
}) 
</script>
</html>
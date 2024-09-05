<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고차 직거래 상세페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style type="text/css">
.img {
	margin-left : 34%;
	width: 800px;
	height: 500px;
}
</style>
</head>
<body class="container-fluid">
<%@ include file="/resources/common/user/header.jsp" %>
<div class="container">
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
			<c:forEach var="file" items="${file }">
				<div class="slide" data-cycle-pager-template="<span></span>">
					<a href="#" ><img  class="img"src="/resources/upload/user/car/${file.storedFileName }" /></a>
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
		<div class="col d-flex justify-content-center">
			<img style="width: 100px; height: 100px;" class="rounded-circle bg-secondary" src="/resources/upload/user/profile/${carVO.storedFileName }">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<p class="fw-bold">${carVO.carWriter }</p>
			&nbsp;&nbsp;&nbsp;
			<p>${fn:substring(carVO.carLoc ,0,6)}</p>
		</div>
	</div>	
	<hr>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col-4">
			<p class="h5">${carVO.carType }</p>
			<fmt:parseNumber var="carPrice" value="${carVO.carPrice }" integerOnly="true"/>
			<fmt:formatNumber var="price" value="${carPrice div 10000 }" pattern="#,###"/> 
			<p class="fw-bold h5"><span>${price } 만원 &nbsp;</span>⸱<span>${fn:substring(carVO.carRegDate,2,4) }년식&nbsp;</span><span>${carVO.carDistance }만km</span></p>
			<p><span class="fw-bold">등록 : </span><fmt:formatDate value="${carVO.regDate }" pattern="yyyy년 MM 월dd일 HH시 mm분"/> </p>
			<p><span>채팅 5 &nbsp;</span><span>관심 137 &nbsp;</span><span>조회 9904</span></p> <!--  datediff ,,,  마감된 경우 마감으로 표시-->
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col">
			<span class="h5 fw-bold ">가격 정보 </span>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col">
			<span class="h5  text-secondary">총 구매 예상 비용 </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="h5  text-dark">${carVO.carPrice }원</span>
			<br>
		</div>
	</div>
	<br>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col">
			<span class="h5 fw-bold">정보 </span>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col">
			<span class="h5  text-secondary">제조사 </span><span class="h5  text-dark">&nbsp;&nbsp; ( ${carVO.carManuFacturing } )</span>
			<br>
			<span class="h5  text-secondary">모델 </span><span class="h5  text-dark">&nbsp;&nbsp; ( ${carVO.carModel } )</span>
			<br>
			<span class="h5  text-secondary">등급 / 세부등급</span><span class="h5  text-dark">&nbsp;&nbsp; ( ${carVO.carRank } / ${carVO.carDetailRank }마력 )</span>
			<br>
			<span class="h5  text-secondary">연식 / 등록일</span><span class="h5  text-dark">&nbsp;&nbsp; ( ${carVO.carDiffDate} 년식 / ${carVO.carRegDate } )</span>
			<br>
			<span class="h5  text-secondary">배기량 /연료 </span><span class="h5  text-dark">&nbsp;&nbsp; ( ${carVO.carDisplaceMent }cc / ${carVO.carFuel } )</span>
			<br>
			<span class="h5  text-secondary">주행거리 / 변속기 </span><span class="h5  text-dark">&nbsp;&nbsp; ( ${carVO.carDistance }만k.m /  ${carVO.carTransMission } )</span>
			<br>
		</div>
	</div>
	<br>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col">
			<span class="h5 fw-bold">보험이력  정보</span>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col">
			<span class="h5  text-secondary">보험사고 이력 </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="h5  text-dark">${carVO.carAccidentCnt }회</span>
			<br>
			<span class="h5  text-secondary">자동차 특수 용도 이력 </span>&nbsp;<span class="h5  text-dark">
				<c:if test="${carVO.carSpecialUseYn  eq 'Y'}">있음</c:if>
				<c:if test="${carVO.carSpecialUseYn  eq 'N'}">없음</c:if>
			</span>
			<br>
			<span class="h5  text-secondary">소유자 변경 이력 </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="h5  text-dark">${carVO.carChangeCnt }회</span>
		</div>
	</div>
	<br>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col">
			<span class="h5 fw-bold">차량 옵션</span>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col">
			<p class="h5 fw-bold">내외장</p>
			<span class="h5 text-dark">${carVO.carOption1 }</span>
			<p class="h5 fw-bold">안전</p>
			<span class="h5 text-dark">${carVO.carOption2 }</span>
			<p class="h5 fw-bold">편의</p>
			<span class="h5 text-dark">${carVO.carOption3 }</span>
		</div>
	</div>
	<br>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col">
			<span class="h5 fw-bold">추가 정보</span>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col-6 fw-bold">
			<button class="btn btn-light" type="button" >
				<p>${carVO.carAdditionInfo }</p>
			</button>
		</div>
	</div>
	<br>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col">
			<span class="h5 fw-bold">소개</span>
		</div>
	</div>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col-8">
<br>
<pre class="h5" >
${carVO.carIntro }
</pre>			
		</div>
	</div>
	<br>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col">
			<span class="h5 fw-bold">위치</span>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col-8 text-center">
			<div id="map" style="width:100%;height:350px;"></div>
			<br><br>
			<h6 id="location" class="fw-bold h5">${carVO.carLoc }</h6>
		</div>
	</div>
	<br>	
<input type="text" id="carLoc" style="display: none;" value="${carVO.carLoc }">
<%@ include file="/resources/common/user/footer.jsp" %>
</div>
</body>
<!-- 카카오지도 API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7e7eda9c8086805cb16eb9832f3a8b1e&libraries=services"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!--  CYCLE 2  -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery.cycle2/20140216/jquery.cycle2.min.js" type="text/javascript"></script>
<script type="text/javascript">

var address = document.getElementById('carLoc')
var addrVal = address.value


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

</script>
</html>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부동산 상세 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style type="text/css">
.img {
	margin-left: 43%;
	width: 800px;
	height: 500px;
}
</style>
</head>
<body class="container-fluid">
<%@ include file="/resources/common/user/header.jsp" %>
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
					<a href="#" ><img  class="img"src="/resources/upload/user/estate/${file.storedFileName }" /></a>
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
			<img style="width: 100px; height: 100px;" class="rounded-circle bg-secondary" src="/resources/upload/user/profile/${profileFile.storedFileName }">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<p class="fw-bold">${estate.esWriter }</p>
			&nbsp;&nbsp;&nbsp;
			<c:set value="${estate.esLoc}" var="esLoc" />
			${fn:substring(esLoc,0,6 ) }
			
		</div>
	</div>	
	<hr>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col-3">
			<p class="fw-bold h5">${estate.esHumType }</p>
			<p class="h5">${estate.esRoomType }</p>
		</div>
		<div class="col-3">
			<h4 class="fw-bold">																	
				<span class="text-dark"><c:if test="${estate.esTradeYn eq 'N' }"> 판매중 </c:if></span>
					${estate.esTradeType }  
					<c:set var="estatePriceLen" value="${fn:length(estate.esPrice) }"/>
				<c:choose>
					<c:when test="${estate.esTradeType eq '월세'}">
						  <fmt:formatNumber type="number" maxFractionDigits="3" value="${fn:substring(estate.esPrice,0,(fn:indexOf(estate.esPrice,'/')))}"/>
						/ <fmt:formatNumber type="number" maxFractionDigits="3" value="${fn:replace(fn:substring(estate.esPrice,(fn:indexOf(estate.esPrice,'/')),estatePriceLen),'/','' )}" />
					</c:when>
					<c:otherwise>
						${estate.esPrice }
					</c:otherwise>
				</c:choose>
				<span class="text-danger"><c:if test="${estate.esTradeYn eq 'Y' }"> 거래완료 </c:if></span>
			</h4>
			<% Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String now = sdf.format(date);
			%>
			<c:set value="<%=now %>" var="today" />
			<c:choose>
				<c:when test="${estate.esMoveYn eq 'N' }">
					<c:choose>
						<c:when test="${estate.esMoveDate eq today}">
							<p class="h5 text-danger fw-bold ">마감 </p>
						</c:when>
						<c:otherwise>
							<p class="h5 ">${fn:substring(estate.regDate3,0,10)} ~ ${estate.esMoveDate } </p> 
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<p class="h5 text-primary fw-bold ">즉시입주가능 </p>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
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
			<span class="h5 fw-bold text-secondary">면적 </span>&nbsp;&nbsp;&nbsp;<span class="h5 fw-bold text-dark">
				공급 ${estate.esSize1 }m2 전용  ${estate.esSize2 }m2
			</span>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col">
			<span class="h5 fw-bold text-secondary">방/욕실 수 </span>&nbsp;&nbsp;&nbsp;<span class="h5 fw-bold text-dark">
				방 ${estate.esOption1 }개/ 욕실 ${estate.esOption2 }개
			</span>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col">
			<span class="h5 fw-bold text-secondary">층 </span>&nbsp;&nbsp;&nbsp;<span class="h5 fw-bold text-dark">${estate.esOption3 }층</span>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col">
			<span class="h5 fw-bold text-secondary">대출가능여부 </span>&nbsp;&nbsp;&nbsp;
			<span class="h5 fw-bold text-dark">
				<c:choose>
					<c:when test="${estate.esLoanYn eq 'S' }">확인필요</c:when>
					<c:when test="${estate.esLoanYn eq 'Y' }">가능</c:when>
					<c:when test="${estate.esLoanYn eq 'N' }">불가능</c:when>
				</c:choose>
			</span>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col">
			<span class="h5 fw-bold text-secondary">입주 가능일 </span>&nbsp;&nbsp;&nbsp;
			 <span class="h5 fw-bold text-dark">
			 	<c:if test="${estate.esMoveYn eq 'Y' }"> 즉시 가능</c:if>
				<c:if test="${estate.esMoveYn eq 'N' }">${estate.esMoveDate}</c:if>
			 </span>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col">
			<span class="h5 fw-bold text-secondary">반려동물 </span>&nbsp;&nbsp;&nbsp;<span class="h5 fw-bold text-dark">
				<c:choose>
					<c:when test="${estate.esAnimalYn eq 'S' }">확인필요</c:when>
					<c:when test="${estate.esAnimalYn eq 'Y' }">가능</c:when>
					<c:when test="${estate.esAnimalYn eq 'N' }">불가능</c:when>
				</c:choose>
			</span>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col">
			<span class="h5 fw-bold text-secondary">주차 </span>&nbsp;&nbsp;&nbsp;<span class="h5 fw-bold text-dark">
				<c:choose>
					<c:when test="${estate.esParkingYn eq 'S' }">확인필요</c:when>
					<c:when test="${estate.esParkingYn eq 'Y' }">가능</c:when>
					<c:when test="${estate.esParkingYn eq 'N' }">불가능</c:when>
				</c:choose>
			</span>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col">
			<span class="h5 fw-bold text-secondary">내부 시설 </span>&nbsp;&nbsp;&nbsp;<span class="h5 fw-bold text-dark">
				${estate.esFacility }
			</span>
		</div>
	</div>
	<br><br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col">
			<span class="h5 fw-bold">소개 </span>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col-8">
			<p class="h5 fw-bold">${estate.esAdvantage }</p>
			<p class="h5">${estate.esHouseIntro }</p>
		</div>	
	</div>
		<br><br>
	<c:if test="${estate.esCostYn eq 'Y' }">
		<div class="row">
			<div class="col-2">
			</div>
			<div class="col">
				<span class="h5 fw-bold">관리비</span>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-2">
			</div>
			<div class="col-8">
				<p class="h5 fw-bold"><fmt:formatNumber value="${estate.esCost }" pattern="#,###"/>원</p><br>
				<p class="h5 text-secondary fw-bold">관리비 포함 항목 <span class="fw-bold text-dark">&nbsp;&nbsp;&nbsp;${estate.esCostChk }</span></p>
				<p class="h5 text-secondary fw-bold">관리비와 별도인 항목 <span class="fw-bold text-dark">&nbsp;&nbsp;&nbsp;${estate.esSeperCostChk }</span></p>
				<br>
				<p class="h5">${estate.esCostContent}</p>
			</div>	
		</div>
	</c:if>
	<br><br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col">
			<span class="h5 fw-bold">위치 </span>
		</div>
	</div>
	<br><br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col-8 text-center">
			<div id="map" style="width:100%;height:350px;"></div>
			<br><br>
			<h6 id="location" class="fw-bold h5">${estate.esLoc } ${estate.esLocDetail }</h6>
			<p class="fw-bold">${estate.esLocContent }</p>
		</div>
	</div>
	<br>	
<input type="text" value="${estate.esLoc}" id="esLoc" style="display: none;">
<input type="text" value="${estate.esLocDetail}" id="esLocDetail" style="display: none;">
</div>
<%@ include file="/resources/common/user/footer.jsp" %>
</body>
<!-- jQuery Cycle2 Plugin CDN JS -->

<!-- 카카오지도 API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7e7eda9c8086805cb16eb9832f3a8b1e&libraries=services"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!--  CYCLE 2  -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery.cycle2/20140216/jquery.cycle2.min.js" type="text/javascript"></script>
<script type="text/javascript">
var address = document.getElementById('esLoc')
var addrVal = address.value

var addrDetail = document.getElementById('esLocDetail').value

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
            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+addrVal+"  "+addrDetail +'</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});  

</script>
</html>
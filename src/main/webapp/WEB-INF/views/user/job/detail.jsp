<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알바 상세페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style type="text/css">
.img {
	margin-left: 32%;
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
					<a href="#" ><img  class="img"src="/resources/upload/owner/company/job/${file.storedFileName }" /></a>
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
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<c:forEach var="file" items="${file }" begin="0" end="0">
				<img style="width: 100px; height: 100px; position: relative; right:30px;" class="img rounded"src="/resources/upload/owner/company/job/${file.storedFileName }" />
				<br>
			</c:forEach>
			<br>
			<p class="fw-bold">&nbsp;${jobVO.jobCompany }</p>
			<p class="fw-bold">&nbsp;${fn:substring(jobVO.jobLoc,0,7)}</p>
		</div>
	</div>	
	<hr>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col-4">
			<h4 class="fw-bold">${jobVO.jobTitle }</h4>
			<c:if test="${ jobVO.regMinute ne 0 and jobVO.regMinute lt 60 }"><p>${jobVO.regMinute } 분 전 작성</p></c:if>
			<c:if test="${ jobVO.regHour ne 0  and jobVO.regHour lt 24 }"><p>${jobVO.regHour } 시간 전 작성</p></c:if>
			<c:if test="${ jobVO.regDay ne 0 and jobVO.regDay lt 7 }"><p>${jobVO.regDay } 일 전 작성</p></c:if>
			<c:if test="${ jobVO.regWeek ne 0 and jobVO.regWeek lt 4}"><p>${jobVO.regWeek } 주 전 작성</p></c:if>
			<c:if test="${ jobVO.regMonth ne 0 and jobVO.regMonth lt 12 }"><p>${jobVO.regMonth } 달 전 작성</p></c:if>
			<c:if test="${ jobVO.regYear ne 0 }"><p>${jobVO.regYear } 년</p></c:if>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col-4 h5">
			<h5 class="fw-bold h4">정보</h5>
			<br>
			<p>
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-exchange" viewBox="0 0 16 16">
				<path d="M0 5a5 5 0 0 0 4.027 4.905 6.5 6.5 0 0 1 .544-2.073C3.695 7.536 3.132 6.864 3 5.91h-.5v-.426h.466V5.05q-.001-.07.004-.135H2.5v-.427h.511C3.236 3.24 4.213 2.5 5.681 2.5c.316 0 .59.031.819.085v.733a3.5 3.5 0 0 0-.815-.082c-.919 0-1.538.466-1.734 1.252h1.917v.427h-1.98q-.004.07-.003.147v.422h1.983v.427H3.93c.118.602.468 1.03 1.005 1.229a6.5 6.5 0 0 1 4.97-3.113A5.002 5.002 0 0 0 0 5m16 5.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0m-7.75 1.322c.069.835.746 1.485 1.964 1.562V14h.54v-.62c1.259-.086 1.996-.74 1.996-1.69 0-.865-.563-1.31-1.57-1.54l-.426-.1V8.374c.54.06.884.347.966.745h.948c-.07-.804-.779-1.433-1.914-1.502V7h-.54v.629c-1.076.103-1.808.732-1.808 1.622 0 .787.544 1.288 1.45 1.493l.358.085v1.78c-.554-.08-.92-.376-1.003-.787zm1.96-1.895c-.532-.12-.82-.364-.82-.732 0-.41.311-.719.824-.809v1.54h-.005zm.622 1.044c.645.145.943.38.943.796 0 .474-.37.8-1.02.86v-1.674z"/>
			</svg>
			<span class="fw-bold">${jobVO.jobType } ${jobVO.jobMoney }원</span>
			</p> 
			<p>
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
  				<path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A32 32 0 0 1 8 14.58a32 32 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10"/>
  				<path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4m0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
			</svg>
			<span>${jobVO.jobLoc }</span>
			</p>
			<p>
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar2-check" viewBox="0 0 16 16">
				<path d="M10.854 8.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L7.5 10.793l2.646-2.647a.5.5 0 0 1 .708 0"/>
 					<path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5M2 2a1 1 0 0 0-1 1v11a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1z"/>
 					<path d="M2.5 4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H3a.5.5 0 0 1-.5-.5z"/>
			</svg>	
			<c:choose>
				<c:when test="${jobVO.jobWorkDate eq '평일'}"><span>월~금</span></c:when>
				<c:when test="${jobVO.jobWorkDate eq '주말'}"><span>토~일</span></c:when>
				<c:otherwise><span>${jobVO.jobWorkDate }</span></c:otherwise>
			</c:choose>
			</p>
			<p>
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">
  				<path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71z"/>
  				<path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16m7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0"/>
			</svg>	
			<span>${jobVO.jobWorkTime }</span>
			</p>
		</div>
	</div>
	
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col-10">
			<h4 class="fw-bold">상세 내용</h4>
<br>
		<h6>
		${jobVO.jobContent }
		</h6>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col">
			<h4 class="fw-bold ">주소</h4>
		</div>
		
	</div>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col-8">
			<div id="map" style="width:100%;height:350px;"></div>
			<br>
			<h6 id="location" class="fw-bold">${jobVO.jobLoc }</h6>
			<h6>${jobVO.jobLocContent }</h6>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<c:if test="${getJobYn eq false}">
			<div class="col-8">
				<button class="form-control fw-bold btn btn-outline-dark" type="button" id="getJobBtn">데일리 알바 지원하기</button>
			</div>
		</c:if>
		<c:if test="${getJobYn eq true }">
			<div class="col-8">
				<button class="form-control fw-bold btn btn-outline-danger" type="button" >지원 취소</button>
			</div>
		</c:if>
	</div>
	<br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col">
			<h5 id="loc" class="fw-bold">${fn:substring(jobVO.jobLoc,0,7)} 근처 알바</h5>
		</div>
	</div>
	<br>
	<div class="row justify-content-center">
		<c:forEach var="list" items="${list}">
			<c:if test="${list.jobCompany ne jobVO.jobCompany }">
				<div class="col-2">
					<img style="width: 100px; height: 100px;" src="/resources/upload/owner/company/job/${list.storedFileName }">
					<br><br>
					<p class="fw-bold">${list.jobTitle }</p>
					<p  >${list.jobCompany}<span class="fw-bold"> ( ${fn:substring(list.jobLoc,0,7)})</span> </p>
					<p class="fw-bold">${list.jobType } ${list.jobMoney }원</p>
				</div>
			</c:if>
		</c:forEach>
	</div>
</div>

<input type="text" id="jobLoc" value="${jobVO.jobLoc }" style="display: none;">
<input type="text" id="jobLocDetail" value="${jobVO.jobLocDetail }" style="display: none;">
<input type="text" value="${jobWriteYn }" id="jobWriteYn" style="display: none;">
<input type="text" value="${param.jobNo }" id="jobNo" style="display: none;">

<%@ include file="/resources/common/user/footer.jsp" %>
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
var address = document.getElementById('jobLoc')
var addrVal = address.value

var addrDetail = document.getElementById('jobLocDetail').value

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

$(document).ready(function(){
	
	$("#getJobBtn").on("click",function(){
				
		//String형식으로 true/false를 받아온다.
		if($("#jobWriteYn").val()=="false"){
			alert("아직 이력서가 없네요 - 이력서 작성 페이지로 이동합니다.")
			location.href='/user/job/write'
		}else{
			if(!confirm("지원하시겠습니까?")){
				return false;
			}else{
				$.ajax({
					url:"/user/job/get",
					type:"post",
					data : {"jobNo":$("#jobNo").val()},
					success:function(result){
						alert(result)
					}
				})
			}
		}
	});

});

</script>
</html>
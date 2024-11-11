<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부동산 메인 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
<%@ include file="/resources/common/user/header.jsp" %>
 <section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-dark fw-bold"><pre>간편하고 따뜻한</pre>
        					 <pre>데일리 부동산</pre>
        </h1>
        <p class="lead text-muted"><pre class="h5">이웃이 살던 집, 데일리 에서</pre>
        						   <pre class="h5">편하게 거래해 보세요.</pre>
       	</p>
        <p>
          <a href="#" class="btn btn-info my-2" onclick="javascript: location.href='/user/estate/writeOne'">매물 올리기</a>
        </p>
      </div>
    </div>
  </section>
  <div class="container">
  	<div class="row">
  		<div class="col text-center">
  			<h4 class="fw-bold">인기 데일리 부동산</h4>
  		</div>
  	</div>
 
<br><br>
  	<div class="row text-center" id="hitEstateWrap">
  		<c:forEach var="hitList" items="${ hitEstate}">
  		<c:set var="hitListPriceLen" value="${fn:length(hitList.esPrice) }"/>
  		<c:if test="${not empty hitList.regDate3 }">
	  		<div class="col-3">
  				<img src="/resources/upload/user/estate/${hitList.storedFileName }" style="width: 120px; height: 120px;">		
		  		<br><br>
		  		<a href="/user/estate/detail?esNo=${hitList.esNo }" class="fw-bold text-dark">${hitList.esRoomType } ( ${hitList.esTradeType } ) 
		  		<c:choose>
					<c:when test="${hitList.esTradeType eq '월세'}">
						  <fmt:formatNumber type="number" maxFractionDigits="3" value="${fn:substring(hitList.esPrice,0,(fn:indexOf(hitList.esPrice,'/')))}"/>/<fmt:formatNumber type="number" maxFractionDigits="3" value="${fn:replace(fn:substring(hitList.esPrice,(fn:indexOf(hitList.esPrice,'/')),hitListPriceLen),'/','' )}" />
					</c:when>
					<c:otherwise>
						${hitList.esPrice } 
					</c:otherwise>
				</c:choose>
		  		</a>
		  		<br><br>
		  		<p class="col-auto fw-bold">${hitList.esLoc }</p>
		  		<p class=" col-auto">${fn:substring(hitList.esLocContent ,0,40) }..</p>
		  	</div>
  		</c:if>
  		</c:forEach>
  		</div>
  	</div>	
  			
  	<br>
  	<div class="row">
  		<div class="col">
  			<button class="form-control fw-bold h5 btn btn-light" type="button" id="hitEstateBtn">인기 매물 더보기</button>		
  		</div> 
  	</div>
  
  <input type="hidden" id="hitEstateEndRow" >
 
  <br><br>
  	<div class="row">
  		<div class="col text-center">
  			<h4 class="fw-bold">내 근처 매물</h4>
  		</div>
  	</div>
  	<br><br>
	<div class="row text-center" id="locEstateWrap">
  		<c:forEach var="locList" items="${ locEstate}">
  		<c:set var="locListPriceLen" value="${fn:length(locList.esPrice) }"/>
  		<c:if test="${not empty locList.regDate3 }">
	  		<div class="col-3">
  				<img src="/resources/upload/user/estate/${locList.storedFileName }" style="width: 120px; height: 120px;">		
		  		<br><br>
		  		<a href="/user/estate/detail?esNo=${locList.esNo }" class="fw-bold text-dark">${locList.esRoomType } ( ${locList.esTradeType } )
		  		 <c:choose>
					<c:when test="${locList.esTradeType eq '월세'}">
						 <fmt:formatNumber type="number" maxFractionDigits="3" value="${fn:substring(locList.esPrice,0,(fn:indexOf(locList.esPrice,'/')))}"/>/<fmt:formatNumber type="number" maxFractionDigits="3" value="${fn:replace(fn:substring(locList.esPrice,(fn:indexOf(locList.esPrice,'/')),locListPriceLen),'/','' )}" />
					</c:when>
					<c:otherwise>
						${locList.esPrice } 
					</c:otherwise>
				</c:choose>
		  		 </a>
		  		<br><br>
		  		<p class="col-auto fw-bold">${locList.esLoc }</p>
		  		<p class=" col-auto">${fn:substring(locList.esLocContent ,0,40) }..</p>
		  	</div>
  		</c:if>
  		</c:forEach>
  	<br>
  	</div>
 	<div class="row">
 		<div class="col">
 			<button class="form-control fw-bold h5 btn btn-info" type="button" id="LocEstateBtn">내 근처 매물 더보기</button>		
 		</div> 
 	</div>		

<input type="hidden" id="locEstateEndRow" >

  
<%@ include file="/resources/common/user/footer.jsp" %>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	function hitEstateMoreFunc(){
		$.ajax({
			url:"/user/estate/hit",
			type:"post",
			data : {"endRow": $("#hitEstateEndRow").val() },
			success:function(result){
				var hitMoreContent =''
				
				result.forEach(function(item){
						hitMoreContent+='<div class="col-3">'
						hitMoreContent+='<img src="/resources/upload/user/estate/'+item.storedFileName  +'" style="width: 120px; height: 120px;">'		
		  				hitMoreContent+='<br><br>'
		  				hitMoreContent+='<a href="/user/estate/detail?esNo='+item.esNo+'" class="fw-bold text-dark">'+item.esRoomType +' ( '+item.esTradeType +' ) '+item.esPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,",") +' </a>'
		  				hitMoreContent+='<br><br>'
		  				hitMoreContent+='<p class="col-auto fw-bold">'+item.esLoc +'</p>'
		  				hitMoreContent+='<p class="col-auto">'+item.esLocContent.substr(0,40) +'..</p>'
	  					hitMoreContent+='</div>'
  			
						$("#hitEstateWrap").html(hitMoreContent)
				});		
			}
		})
	}


	var hitCount =8;
	
	$("#hitEstateBtn").on("click",function(){
		hitCount+=8
		$("#hitEstateEndRow").val(hitCount)
		hitEstateMoreFunc()
	});



	function locEstateMoreFunc(){

		if(!localStorage.getItem("roadNameAddr")){
			if(!confirm("위치가 설정되어있지 않습니다. 위치 설정페이지로 이동할까요?")){
				return false;
			}else{
				location.href="/user/mypage/location"	
			}
			
		}else{
		
			$.ajax({
				url:"/user/estate/loc",
				type:"post",
				data : {"endRow": $("#locEstateEndRow").val() ,
						"esLoc" : localStorage.getItem("roadNameAddr").substring(0,8)},
				success:function(result){
					var locMoreContent =''
					
					result.forEach(function(item){
							locMoreContent+='<div class="col-3">'
							locMoreContent+='<img src="/resources/upload/user/estate/'+item.storedFileName  +'" style="width: 120px; height: 120px;">'		
			  				locMoreContent+='<br><br>'
			  				locMoreContent+='<a href="/user/estate/detail?esNo='+item.esNo+'" class="fw-bold text-dark">'+item.esRoomType +' ( '+item.esTradeType +' ) '+item.esPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,",") +' </a>'
			  				locMoreContent+='<br><br>'
			  				locMoreContent+='<p class="col-auto fw-bold">'+item.esLoc +'</p>'
			  				locMoreContent+='<p class="col-auto">'+item.esLocContent.substr(0,40) +'..</p>'
		  					locMoreContent+='</div>'
	  			
							$("#locEstateWrap").html(locMoreContent)
					});		
				}
			})
		}
	}
	
	var locCount =8;
	
	$("#LocEstateBtn").on("click",function(){
		locCount+=8
		$("#locEstateEndRow").val(locCount)
		locEstateMoreFunc()
	});
	


});

</script>
</html>
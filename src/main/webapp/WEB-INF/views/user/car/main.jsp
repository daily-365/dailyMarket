<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고차 직거래 메인 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body class="container-fluid">
<%@ include file="/resources/common/user/header.jsp" %>
 <section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-dark fw-bold"><pre>딜러 수수료 없는</pre>
        					 <pre>중고차 직거래</pre>
        </h1>
        <p class="lead text-muted"><pre class="h5">딜러 없이 믿고 살 수 있는 중고차</pre>
        						   <pre class="h5">데일리에서 직거래 해보세요.</pre>
       	</p>
        <p>
          <a href="#" class="btn btn-light my-2" onclick="javascript: location.href='/user/car/regist'">내 차 판매하기</a>
        </p>
      </div>
    </div>
  </section>
<div class="container">
  	<div class="row">
  		<div class="col text-center">
  			<h4 class="fw-bold">인기 중고차</h4>
  		</div>
  	</div>
	<br><br>
	<div class="row justify-content-center text-center" id="moreHitCarWrap" >
		<c:forEach var="hitCar" items="${hitCar }">
	  		<div class="col-3">
	  			<img src="/resources/upload/user/car/${hitCar.storedFileName }" style="width:120px; height: 120px;">
	  			<br><br>
	  			<a href="/user/car/detail?carNo=${hitCar.carNo}" class="fw-bold text-dark">${hitCar.carModel }</a>
	  			<br><br>
	  			<p><span class="fw-bold"> ${fn:substring(hitCar.carRegDate,2,4) }년식</span>&nbsp;&nbsp;&nbsp;
	  				<span class="fw-bold">${hitCar.carDistance }만km</span>
	  			</p>
	  			<p><span class="fw-bold">${fn:substring(hitCar.carLoc,0,6 )}</span></p>
	  			<fmt:parseNumber var="carPrice"  value="${hitCar.carPrice}" integerOnly="true"/>
	  			<fmt:formatNumber var="price"  value="${carPrice div 10000 }"  type="number" pattern="#,###" />
	  			<p class="fw-bold">￦ ${price } 만원</p>
			</div>
  		</c:forEach>
  			<br>
  	</div>
  	<div class="row">
  		<div class="col">
  			<button id="moreHitCarBtn" class="form-control fw-bold h5 btn btn-light" type="button">인기 중고차 더보기</button>		
  		</div> 
  	</div>
  	<br><br> <br><br>
  	<div class="row">
  		<div class="col text-center">
  			<h4 class="fw-bold">내 근처 중고차</h4>
  		</div>
  	</div>
  	<br><br>
  	<div class="row justify-content-center text-center" id="moreLocCarWrap">
  		<c:forEach var="locCar" items="${locCar }">
	  		<div class="col-3">
	  			<img src="/resources/upload/user/car/${locCar.storedFileName }" style="width:120px; height: 120px;">
	  			<br><br>
	  			<a href="/user/car/detail?carNo=${locCar.carNo}" class="fw-bold text-dark">${locCar.carModel }</a>
	  			<br><br>
	  			<p><span class="fw-bold"> ${fn:substring(locCar.carRegDate,2,4) }년식</span>&nbsp;&nbsp;&nbsp;
	  				<span class="fw-bold">${locCar.carDistance }만km</span>
	  			</p>
	  			<p><span class="fw-bold">${fn:substring(locCar.carLoc,0,6 )}</span></p>
	  			<fmt:parseNumber var="carPrice"  value="${locCar.carPrice}" integerOnly="true"/>
	  			<fmt:formatNumber var="price"  value="${carPrice div 10000 }"  type="number" pattern="#,###" />
	  			<p class="fw-bold">￦ ${price } 만원</p>
			</div>
  		</c:forEach>
  	</div>
  	<br>
  	<div class="row">
  		<div class="col">
  			<button id="moreLocCarBtn" class="form-control fw-bold h5 btn btn-secondary" type="button">내 근처 중고차 더보기</button>		
  		</div> 
  	</div>
</div>
<%@ include file="/resources/common/user/footer.jsp" %>
<input type="hidden" id="hitCarEndRow">
<input type="hidden" id="locCarEndRow">
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	var count =8;
	
	$("#moreHitCarBtn").on("click",function(){
		count+=8;
		$("#hitCarEndRow").val(count)
		
		$.ajax({
			url : "/user/car/main/hit",
			type :"post",
			data: {"endRow" : $("#hitCarEndRow").val()},
			success:function(result){
				
				var moreHitCarContent='';
			
				result.forEach(function(item){
					moreHitCarContent+='<div class="col-3">'
		  			moreHitCarContent+='<img src="/resources/upload/user/car/'+item.storedFileName+'" style="width:120px; height: 120px;">'
		  			moreHitCarContent+='<br><br>'
		  			moreHitCarContent+='<a href="/user/car/detail?carNo='+item.carNo+'" class="fw-bold text-dark">'+item.carModel+'</a>'
		  			moreHitCarContent+='<br><br>'
		  			moreHitCarContent+='<p><span class="fw-bold">'+ item.carRegDate.substring(2,4) +'년식</span>&nbsp;&nbsp;&nbsp;&nbsp;'
		  			moreHitCarContent+='<span class="fw-bold">'+item.carDistance +'만km</span>'
		  			moreHitCarContent+='</p>'
		  			moreHitCarContent+='<p><span class="fw-bold">'+item.carLoc.substring(0,6)+'</span></p>'
		  			moreHitCarContent+='<p class="fw-bold">￦ '+(Number(item.carPrice.replaceAll(",",""))/10000).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,",") +' 만원</p>'
					moreHitCarContent+='</div>'
					
					$("#moreHitCarWrap").html(moreHitCarContent)
				});
			}
		
		})
	
	});
	
	$("#moreLocCarBtn").on("click",function(){
		
		count +=8;
		$("#locCarEndRow").val(count)
		
		if(!localStorage.getItem("roadNameAddr")){
			if(!confirm("위치가 설정되어있지 않습니다. 위치 설정페이지로 이동할까요?")){
				return false;
			}else{
				location.href="/user/mypage/location"	
			}
		}else{
			
			$.ajax({
				url :"/user/car/main/loc",
				type:"post",
				data : {"endRow" : $("#locCarEndRow").val(),
						"carLoc" :localStorage.getItem("roadNameAddr").substring(0,8)},
				success:function(result){
					
					var moreLocCarContent =''
					
					result.forEach(function(item){
					
						moreLocCarContent+='<div class="col-3">'
			  			moreLocCarContent+='<img src="/resources/upload/user/car/'+item.storedFileName+'" style="width:120px; height: 120px;">'
			  			moreLocCarContent+='<br><br>'
			  			moreLocCarContent+='<a href="/user/car/detail?carNo='+item.carNo+'" class="fw-bold text-dark">'+item.carModel+'</a>'
			  			moreLocCarContent+='<br><br>'
			  			moreLocCarContent+='<p><span class="fw-bold">'+ item.carRegDate.substring(2,4) +'년식</span>&nbsp;&nbsp;&nbsp;&nbsp;'
			  			moreLocCarContent+='<span class="fw-bold">'+item.carDistance +'만km</span>'
			  			moreLocCarContent+='</p>'
			  			moreLocCarContent+='<p><span class="fw-bold">'+item.carLoc.substring(0,6)+'</span></p>'
			  			moreLocCarContent+='<p class="fw-bold">￦ '+Number(item.carPrice.replaceAll(',','')/10000).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,",") +' 만원</p>'
						moreLocCarContent+='</div>'
						
						$("#moreLocCarWrap").html(moreLocCarContent)
					
					});
				
				}
			
			});
		}
	
	});
	

});

</script>
</html>
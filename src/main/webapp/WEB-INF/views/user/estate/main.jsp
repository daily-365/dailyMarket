<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  	<div class="row text-center">
  		<c:forEach var="list" items="${ estate}">
	  		<div class="col-3">
		  		<c:forEach var="file" items="${estateFile }" begin="0" end="0">
	  				<img src="/resources/upload/user/estate/${file.storedFileName }" style="width: 120px; height: 120px;">		
		  		</c:forEach>
		  		<br><br>
		  		<a href="/user/estate/detail?esNo=${list.esNo }" class="fw-bold text-dark">${list.esRoomType } ${list.esPrice } </a>
		  		<br><br>
		  		<p class="col-auto"></p>
		  		<p class="fw-bold col-auto">${list.esLocContent }</p>
		  		<p class="col-auto">${list.esLoc }</p>
	  			<p class="fw-bold col-auto">${list.esTradeType } ${list.esPrice }</p>
  			</div> 
  		</c:forEach>
  		</div>
  	</div>	
  			
  	<br>
  	<div class="row">
  		<div class="col">
  			<button class="form-control fw-bold h5 btn btn-light" type="button">인기 매물 더보기</button>		
  		</div> 
  	</div>
  
  <br><br>
  	<div class="row">
  		<div class="col text-center">
  			<h4 class="fw-bold">내 근처 매물</h4>
  		</div>
  	</div>
  	<br><br>
	<div class="row text-center">
  		<div class="col-3">
  			<img src="https://dnvefa72aowie.cloudfront.net/realty/realty/articles/794a9a86adcfcd73445c27ba93be0b5d4c27bc98b8c5d0ff9c87d5b5821b0e82_1661947977509.jpeg?q=95&s=1440x1440&t=inside" style="width: 120px; height: 120px;">		
  			<br><br>
  			<p class="fw-bold">투룸이상 500만원/40만원 - 2층</p>
  			<p>목3동</p>
  			<p class="fw-bold">월세 500/40</p>
  		</div>
  		<div class="col-3">
  			<img src="https://dnvefa72aowie.cloudfront.net/realty/realty/articles/794a9a86adcfcd73445c27ba93be0b5d4c27bc98b8c5d0ff9c87d5b5821b0e82_1661947977509.jpeg?q=95&s=1440x1440&t=inside" style="width: 120px; height: 120px;">		
  			<br><br>
  			<p class="fw-bold">투룸이상 500만원/40만원 - 2층</p>
  			<p>목3동</p>
  			<p class="fw-bold">월세 500/40</p>
  		</div>
  		<div class="col-3">
  			<img src="https://dnvefa72aowie.cloudfront.net/realty/realty/articles/794a9a86adcfcd73445c27ba93be0b5d4c27bc98b8c5d0ff9c87d5b5821b0e82_1661947977509.jpeg?q=95&s=1440x1440&t=inside" style="width: 120px; height: 120px;">		
  			<br><br>
  			<p class="fw-bold">투룸이상 500만원/40만원 - 2층</p>
  			<p>목3동</p>
  			<p class="fw-bold">월세 500/40</p>
  		</div>
  		<div class="col-3">
  			<img src="https://dnvefa72aowie.cloudfront.net/realty/realty/articles/794a9a86adcfcd73445c27ba93be0b5d4c27bc98b8c5d0ff9c87d5b5821b0e82_1661947977509.jpeg?q=95&s=1440x1440&t=inside" style="width: 120px; height: 120px;">		
  			<br><br>
  			<p class="fw-bold">투룸이상 500만원/40만원 - 2층</p>
  			<p>목3동</p>
  			<p class="fw-bold">월세 500/40</p>
  		</div>
  		
  		<div class="col-3">
  			<img src="https://dnvefa72aowie.cloudfront.net/realty/realty/articles/794a9a86adcfcd73445c27ba93be0b5d4c27bc98b8c5d0ff9c87d5b5821b0e82_1661947977509.jpeg?q=95&s=1440x1440&t=inside" style="width: 120px; height: 120px;">		
  			<br><br>
  			<p class="fw-bold">투룸이상 500만원/40만원 - 2층</p>
  			<p>목3동</p>
  			<p class="fw-bold">월세 500/40</p>
  		</div>
  		<div class="col-3">
  			<img src="https://dnvefa72aowie.cloudfront.net/realty/realty/articles/794a9a86adcfcd73445c27ba93be0b5d4c27bc98b8c5d0ff9c87d5b5821b0e82_1661947977509.jpeg?q=95&s=1440x1440&t=inside" style="width: 120px; height: 120px;">		
  			<br><br>
  			<p class="fw-bold">투룸이상 500만원/40만원 - 2층</p>
  			<p>목3동</p>
  			<p class="fw-bold">월세 500/40</p>
  		</div>
  		<div class="col-3">
  			<img src="https://dnvefa72aowie.cloudfront.net/realty/realty/articles/794a9a86adcfcd73445c27ba93be0b5d4c27bc98b8c5d0ff9c87d5b5821b0e82_1661947977509.jpeg?q=95&s=1440x1440&t=inside" style="width: 120px; height: 120px;">		
  			<br><br>
  			<p class="fw-bold">투룸이상 500만원/40만원 - 2층</p>
  			<p>목3동</p>
  			<p class="fw-bold">월세 500/40</p>
  		</div>
  		<div class="col-3">
  			<img src="https://dnvefa72aowie.cloudfront.net/realty/realty/articles/794a9a86adcfcd73445c27ba93be0b5d4c27bc98b8c5d0ff9c87d5b5821b0e82_1661947977509.jpeg?q=95&s=1440x1440&t=inside" style="width: 120px; height: 120px;">		
  			<br><br>
  			<p class="fw-bold">투룸이상 500만원/40만원 - 2층</p>
  			<p>목3동</p>
  			<p class="fw-bold">월세 500/40</p>
  		</div>
  	</div>
  	<br>
  	<div class="row">
  		<div class="col">
  			<button class="form-control fw-bold h5 btn btn-info" type="button">내 근처 매물 더보기</button>		
  		</div> 
  	</div>		
</div>
  
  
<%@ include file="/resources/common/user/footer.jsp" %>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">


</script>
</html>
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
	<div class="row text-center">
  		<div class="col-3">
  		<c:forEach var="file" items="${file }" begin="0" end="0">
  			<img src="/resources/upload/user/car/${file.storedFileName }" style="width:120px; height: 120px;">
  		</c:forEach>
  		<c:forEach var="list" items="${list }">
  			<br><br>
  			<a href="/user/car/detail?carNo=${list.carNo}" class="fw-bold text-dark">${list.carType }</a>
  			<br><br>
  			<p><span> ${fn:substring(list.carRegDate,2,4) }년식</span>&nbsp;&nbsp;&nbsp;<span>${list.carDistance }만km</span></p>
  			<p><span>${list.carLoc }</span></p>
  			<fmt:parseNumber var="carPrice"  value="${list.carPrice}" integerOnly="true"/>
  			<fmt:formatNumber var="price"  value="${carPrice div 10000 }"  type="number" pattern="#,###" />
  			<p class="fw-bold">￦ ${price } 만원</p>
  		</c:forEach>
  		</div>
  		
  
   <br><br>
  	<div class="row">
  		<div class="col text-center">
  			<h4 class="fw-bold">내 근처 중고차</h4>
  		</div>
  	</div>
  	<br><br>
  	<div class="row text-center">
  		<div class="col-3">
  			<img src="https://dnvefa72aowie.cloudfront.net/car/articles/910f5980b98942a891b0c396d23d7fbcdcbbc86d51d7f3919a849bfcbeb8ed8f_1711850045897.jpeg?q=95&s=1440x1440&t=inside" style="width: 120px; height: 120px;">		
  			<br><br>
  			<a href="/user/car/detail" class="fw-bold text-dark">르노코리아 뉴 SM5 신형 L43 2.0 CVTC Ⅱ LE</a>
  			<br><br>
  			<p><span>10년식</span>&nbsp;&nbsp;&nbsp;<span>13.7만km</span>&nbsp;&nbsp;&nbsp;<span>목3동</span></p>
  			<p class="fw-bold">260만원</p>
  		</div>
  		<div class="col-3">
  			<img src="https://dnvefa72aowie.cloudfront.net/car/articles/910f5980b98942a891b0c396d23d7fbcdcbbc86d51d7f3919a849bfcbeb8ed8f_1711850045897.jpeg?q=95&s=1440x1440&t=inside" style="width: 120px; height: 120px;">		
  			<br><br>
  			<a href="/user/car/detail" class="fw-bold text-dark">르노코리아 뉴 SM5 신형 L43 2.0 CVTC Ⅱ LE</a>
  			<br><br>
  			<p><span>10년식</span>&nbsp;&nbsp;&nbsp;<span>13.7만km</span>&nbsp;&nbsp;&nbsp;<span>목3동</span></p>
  			<p class="fw-bold">260만원</p>
  		</div>
  		<div class="col-3">
  			<img src="https://dnvefa72aowie.cloudfront.net/car/articles/910f5980b98942a891b0c396d23d7fbcdcbbc86d51d7f3919a849bfcbeb8ed8f_1711850045897.jpeg?q=95&s=1440x1440&t=inside" style="width: 120px; height: 120px;">		
  			<br><br>
  			<a href="/user/car/detail" class="fw-bold text-dark">르노코리아 뉴 SM5 신형 L43 2.0 CVTC Ⅱ LE</a>
  			<br><br>
  			<p><span>10년식</span>&nbsp;&nbsp;&nbsp;<span>13.7만km</span>&nbsp;&nbsp;&nbsp;<span>목3동</span></p>
  			<p class="fw-bold">260만원</p>
  		</div>
  		<div class="col-3">
  			<img src="https://dnvefa72aowie.cloudfront.net/car/articles/910f5980b98942a891b0c396d23d7fbcdcbbc86d51d7f3919a849bfcbeb8ed8f_1711850045897.jpeg?q=95&s=1440x1440&t=inside" style="width: 120px; height: 120px;">		
  			<br><br>
  			<a href="/user/car/detail" class="fw-bold text-dark">르노코리아 뉴 SM5 신형 L43 2.0 CVTC Ⅱ LE</a>
  			<br><br>
  			<p><span>10년식</span>&nbsp;&nbsp;&nbsp;<span>13.7만km</span>&nbsp;&nbsp;&nbsp;<span>목3동</span></p>
  			<p class="fw-bold">260만원</p>
  		</div>
  		
  		<div class="col-3">
  			<img src="https://dnvefa72aowie.cloudfront.net/car/articles/910f5980b98942a891b0c396d23d7fbcdcbbc86d51d7f3919a849bfcbeb8ed8f_1711850045897.jpeg?q=95&s=1440x1440&t=inside" style="width: 120px; height: 120px;">		
  			<br><br>
  			<a href="/user/car/detail" class="fw-bold text-dark">르노코리아 뉴 SM5 신형 L43 2.0 CVTC Ⅱ LE</a>
  			<br><br>
  			<p><span>10년식</span>&nbsp;&nbsp;&nbsp;<span>13.7만km</span>&nbsp;&nbsp;&nbsp;<span>목3동</span></p>
  			<p class="fw-bold">260만원</p>
  		</div>
  		<div class="col-3">
  			<img src="https://dnvefa72aowie.cloudfront.net/car/articles/910f5980b98942a891b0c396d23d7fbcdcbbc86d51d7f3919a849bfcbeb8ed8f_1711850045897.jpeg?q=95&s=1440x1440&t=inside" style="width: 120px; height: 120px;">		
  			<br><br>
  			<a href="/user/car/detail" class="fw-bold text-dark">르노코리아 뉴 SM5 신형 L43 2.0 CVTC Ⅱ LE</a>
  			<br><br>
  			<p><span>10년식</span>&nbsp;&nbsp;&nbsp;<span>13.7만km</span>&nbsp;&nbsp;&nbsp;<span>목3동</span></p>
  			<p class="fw-bold">260만원</p>
  		</div>
  		<div class="col-3">
  			<img src="https://dnvefa72aowie.cloudfront.net/car/articles/910f5980b98942a891b0c396d23d7fbcdcbbc86d51d7f3919a849bfcbeb8ed8f_1711850045897.jpeg?q=95&s=1440x1440&t=inside" style="width: 120px; height: 120px;">		
  			<br><br>
  			<a href="/user/car/detail" class="fw-bold text-dark">르노코리아 뉴 SM5 신형 L43 2.0 CVTC Ⅱ LE</a>
  			<br><br>
  			<p><span>10년식</span>&nbsp;&nbsp;&nbsp;<span>13.7만km</span>&nbsp;&nbsp;&nbsp;<span>목3동</span></p>
  			<p class="fw-bold">260만원</p>
  		</div>
  		<div class="col-3">
  			<img src="https://dnvefa72aowie.cloudfront.net/car/articles/910f5980b98942a891b0c396d23d7fbcdcbbc86d51d7f3919a849bfcbeb8ed8f_1711850045897.jpeg?q=95&s=1440x1440&t=inside" style="width: 120px; height: 120px;">		
  			<br><br>
  			<a href="/user/car/detail" class="fw-bold text-dark">르노코리아 뉴 SM5 신형 L43 2.0 CVTC Ⅱ LE</a>
  			<br><br>
  			<p><span>10년식</span>&nbsp;&nbsp;&nbsp;<span>13.7만km</span>&nbsp;&nbsp;&nbsp;<span>목3동</span></p>
  			<p class="fw-bold">260만원</p>
  		</div>
  	</div>
  	  		
  	<br>
  	<div class="row">
  		<div class="col">
  			<button class="form-control fw-bold h5 btn btn-secondary" type="button">내 근처 중고차 더보기</button>		
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
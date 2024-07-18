<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
          <a href="#" class="btn btn-info my-2" onclick="javascript: location.href='/user/estate/write'">매물 올리기</a>
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
  		<div class="col-3">
  			<img src="https://dnvefa72aowie.cloudfront.net/realty/realty/articles/64c72dedbb25e018123c23a1fe2ed0597f6a4f7fd0e086fcd58d65e12818423b_1661987156388.jpeg?q=95&s=1440x1440&t=inside" style="width: 120px; height: 120px;">		
  			<br><br>
  			<a href="/user/estate/detail" class="fw-bold text-dark">투룸이상 300만원 -인천 광역시 남동구</a>
  			<br><br>
  			<p>만수동</p>
  			<p class="fw-bold">단기 300/1</p> 
  		</div>
  		<div class="col-3">
  			<img src="https://dnvefa72aowie.cloudfront.net/realty/realty/articles/acfb317c1b8a692b60920aae5776d3fd92c7a2dec564051e003ff5f0b6f64209_1662040154700.jpeg?q=95&s=1440x1440&t=inside" style="width: 120px; height: 120px;">		
  			<br><br>
  			<a href="/user/estate/detail" class="fw-bold text-dark">오픈형 원룸 -대잠동</a>
  			<br><br>
  			<p>만수동</p>
  			<p class="fw-bold">월세 200/33</p> 
  		</div>
  		<div class="col-3">
  			<img src="https://dnvefa72aowie.cloudfront.net/realty/realty/articles/e5d6dff6b8404b57dc7991b5aacb5a97a86083760da225ae16bdeb8dd954bede_1661946322611.jpeg?q=95&s=1440x1440&t=inside" style="width: 120px; height: 120px;">		
  			<br><br>
  			<a href="/user/estate/detail" class="fw-bold text-dark">상가 - 해바라기 옷가게</a>
  			<br><br>
  			<p>만수동</p>
  			<p class="fw-bold">연세 1,000/2,000</p> 
  		</div>
  		<div class="col-3">
  			<img src="https://dnvefa72aowie.cloudfront.net/realty/realty/articles/94dd9fc22042178f220f68a8a5600fbf5627f67233eb0b60fb61ad3183ee9c9b_1661943112946.jpeg?q=95&s=1440x1440&t=inside" style="width: 120px; height: 120px;">		
  			<br><br>
  			<a href="/user/estate/detail" class="fw-bold text-dark">아파트 매매 - 제주도 서귀포시</a>
  			<br><br>
  			<p>만수동</p>
  			<p class="fw-bold">매매 1억 9,100</p> 
  		</div>
  	
  			<div class="col-3">
  			<img src="https://dnvefa72aowie.cloudfront.net/realty/realty/articles/64c72dedbb25e018123c23a1fe2ed0597f6a4f7fd0e086fcd58d65e12818423b_1661987156388.jpeg?q=95&s=1440x1440&t=inside" style="width: 120px; height: 120px;">		
  			<br><br>
  			<a href="/user/estate/detail" class="fw-bold text-dark">투룸이상 300만원 -인천 광역시 남동구</a>
  			<br><br>
  			<p>만수동</p>
  			<p class="fw-bold">단기 300/1</p> 
  		</div>
  		<div class="col-3">
  			<img src="https://dnvefa72aowie.cloudfront.net/realty/realty/articles/acfb317c1b8a692b60920aae5776d3fd92c7a2dec564051e003ff5f0b6f64209_1662040154700.jpeg?q=95&s=1440x1440&t=inside" style="width: 120px; height: 120px;">		
  			<br><br>
  			<a href="/user/estate/detail" class="fw-bold text-dark">오픈형 원룸 -대잠동</a>
  			<br><br>
  			<p>만수동</p>
  			<p class="fw-bold">월세 200/33</p> 
  		</div>
  		<div class="col-3">
  			<img src="https://dnvefa72aowie.cloudfront.net/realty/realty/articles/e5d6dff6b8404b57dc7991b5aacb5a97a86083760da225ae16bdeb8dd954bede_1661946322611.jpeg?q=95&s=1440x1440&t=inside" style="width: 120px; height: 120px;">		
  			<br><br>
  			<a href="/user/estate/detail" class="fw-bold text-dark">상가 - 해바라기 옷가게</a>
  			<br><br>
  			<p>만수동</p>
  			<p class="fw-bold">연세 1,000/2,000</p> 
  		</div>
  		<div class="col-3">
  			<img src="https://dnvefa72aowie.cloudfront.net/realty/realty/articles/94dd9fc22042178f220f68a8a5600fbf5627f67233eb0b60fb61ad3183ee9c9b_1661943112946.jpeg?q=95&s=1440x1440&t=inside" style="width: 120px; height: 120px;">		
  			<br><br>
  			<a href="/user/estate/detail" class="fw-bold text-dark">아파트 매매 - 제주도 서귀포시</a>
  			<br><br>
  			<p>만수동</p>
  			<p class="fw-bold">매매 1억 9,100</p> 
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
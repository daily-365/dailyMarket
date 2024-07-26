<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데일리 알바 메인 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body class="container-fluid">
<%@ include file="/resources/common/user/header.jsp" %>
<main>
 <section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-dark fw-bold"><pre>우리 동네에서 찾는</pre>
        					 <pre>데일리 알바</pre>
        </h1>
        <p class="lead text-muted"><pre class="h5">걸어서 10분 거리의</pre>
        						   <pre class="h5">동네 알바들 여기 다 있어요.</pre>
       	</p>
        <p>
          <a href="#" class="btn btn-warning my-2" onclick="javascript: location.href='/owner/job/main'">공고 올리기</a>
        </p>
      </div>
    </div>
  </section>
  
  <div class="container">
  	<div class="row">
  		<div class="col text-center">
  			<h4 class="fw-bold">인기 데일리 알바</h4>
  		</div>
  	</div>
  	<br><br>
  	<div class="row text-center">
  		<div class="col-3">
  			<c:forEach var="file" items="${file }" begin="0" end="0">
  				<img  src="/resources/upload/owner/company/job/${file.storedFileName }" style="width: 120px; height: 120px;">
  			</c:forEach>
  			<br><br>
	  		<c:forEach var="list" items="${list }">
	  			<a href="/user/job/detail?jobNo=${list.jobNo }" class="fw-bold text-dark">${list.jobTitle }</a>
	  			<br><br>
	  			<p>${list.jobLoc }</p>
	  			<p class="fw-bold">${list.jobType } ${list.jobMoney }원</p>
	  		</c:forEach>		
  		</div>
  		
  	<br>
  	<div class="row">
  		<div class="col">
  			<button class="form-control fw-bold h5 btn btn-warning" type="button">인기 알바 더보기</button>		
  		</div> 
  	</div>
  	
  	
  	<br><br>
  	<div class="row">
  		<div class="col text-center">
  			<h4 class="fw-bold">내 근처 알바</h4>
  		</div>
  	</div>
  	<br><br>
  	<div class="row text-center">
  		<div class="col-3">
  			<img src="https://dnvefa72aowie.cloudfront.net/jobs/article/8142178/1718845223461/job-post-2551321589.jpeg?q=95&s=1440x1440&t=inside" style="width: 120px; height: 120px;">		
  			<br><br>
  			<p class="fw-bold">가정 손 부업 하실분 구합니다.</p>
  			<p>목3동</p>
  			<p class="fw-bold">건방 15원</p>
  		</div>
  		<div class="col-3">
  			<img src="https://dnvefa72aowie.cloudfront.net/jobs/article/24244100/1718957976643/job-post-506539948.jpeg?q=95&s=1440x1440&t=inside" style="width: 120px; height: 120px;">		
  			<br><br>
  			<p class="fw-bold">알바 하실 분 구함</p>
  			<p>목3동</p>
  			<p class="fw-bold">시급 1,0000원</p>
  		</div>
  		<div class="col-3">
  			<img src="https://dnvefa72aowie.cloudfront.net/jobs/article/77569817/1719021513191/job-post-2940472606.png?q=95&s=1440x1440&t=inside" style="width: 120px; height: 120px;">		
  			<br><br>
  			<p class="fw-bold">방청객 알바 구합니다.</p>
  			<p>목3동</p>
  			<p class="fw-bold">시급 15,000원</p>
  		</div>
  		<div class="col-3">
  			<img src="https://dnvefa72aowie.cloudfront.net/jobs/article/74980233/1717483668762/job-post-938193881.jpeg?q=95&s=1440x1440&t=inside" style="width: 120px; height: 120px;">		
  			<br><br>
  			<p class="fw-bold">입주 청소 투잡으로 가능해요</p>
  			<p>목3동</p>
  			<p class="fw-bold">건방 80,000원</p>
  		</div>
  		<div class="col-3">
  			<img src="https://dnvefa72aowie.cloudfront.net/jobs/article/8142178/1718845223461/job-post-2551321589.jpeg?q=95&s=1440x1440&t=inside" style="width: 120px; height: 120px;">		
  			<br><br>
  			<p class="fw-bold">가정 손 부업 하실분 구합니다.</p>
  			<p>목3동</p>
  			<p class="fw-bold">건방 15원</p>
  		</div>
  		<div class="col-3">
  			<img src="https://dnvefa72aowie.cloudfront.net/jobs/article/24244100/1718957976643/job-post-506539948.jpeg?q=95&s=1440x1440&t=inside" style="width: 120px; height: 120px;">		
  			<br><br>
  			<p class="fw-bold">알바 하실 분 구함</p>
  			<p>목3동</p>
  			<p class="fw-bold">시급 1,0000원</p>
  		</div>
  		<div class="col-3">
  			<img src="https://dnvefa72aowie.cloudfront.net/jobs/article/77569817/1719021513191/job-post-2940472606.png?q=95&s=1440x1440&t=inside" style="width: 120px; height: 120px;">		
  			<br><br>
  			<p class="fw-bold">방청객 알바 구합니다.</p>
  			<p>목3동</p>
  			<p class="fw-bold">시급 15,000원</p>
  		</div>
  		<div class="col-3">
  			<img src="https://dnvefa72aowie.cloudfront.net/jobs/article/74980233/1717483668762/job-post-938193881.jpeg?q=95&s=1440x1440&t=inside" style="width: 120px; height: 120px;">		
  			<br><br>
  			<p class="fw-bold">입주 청소 투잡으로 가능해요</p>
  			<p>목3동</p>
  			<p class="fw-bold">건방 80,000원</p>
  		</div>
  	</div>
  	<br>
  	<div class="row">
  		<div class="col">
  			<button class="form-control fw-bold h5 btn btn-success" type="button">내 근처 알바 더보기</button>		
  		</div> 
  	</div>
  </div>

</main>

<%@ include file="/resources/common/user/footer.jsp" %>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">


</script>
</html>
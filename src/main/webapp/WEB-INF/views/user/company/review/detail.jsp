<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 상세페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body class="container-fluid">
<main class="container">
<br>
	<hr>
	<br>
	<div class="row">
		<div class="col-3">
		</div>
		<div class="col-2">
			<a href="/user/company/detail?busiNo=${param.busiNo}&busiNoticeNo=${param.busiNoticeNo}&busiReviewNo=${param.busiReviewNo}" class="text-dark fw-bold h5 ">홈</a>
		</div>
		<div class="col-2">
			<a href="/user/company/notice/main?busiNo=${param.busiNo}&busiNoticeNo=${param.busiNoticeNo}&busiReviewNo=${param.busiReviewNo}" class="text-dark fw-bold h5">소식</a>
		</div>
		<div class="col-2">
			<a href="/user/company/product/main?busiNo=${param.busiNo}&busiNoticeNo=${param.busiNoticeNo}&busiReviewNo=${param.busiReviewNo}" class="text-dark fw-bold h5">상품</a>
		</div>
		<div class="col-3">
			<a href="/user/company/review/main?busiNo=${param.busiNo}&busiNoticeNo=${param.busiNoticeNo}&busiReviewNo=${param.busiReviewNo}" class="text-dark fw-bold h5">후기</a>
		</div>
	</div>
	<br>
	<hr>
	<br>
	<h1 class="fw-bold text-center" style="font-family: '맑은고딕';  ">Review Detail</h1>
	<br>
	<div class="row d-flex justify-content-center">
		<div class="col-6">
			<p class="fw-bold text-center">${vo.title }</p>	
		</div>
		
	</div>
	<div class="row d-flex justify-content-center">
		<div class="col-2"></div>
		<div class="col-6">
			<c:forEach var="file" items="${file }">
				<img src="/resources/upload/user/company/review/${file.storedFileName }" style="width: 400px; height: 400px;">	
			</c:forEach>
		</div>
	</div>
	<br>
	<div class="row d-flex justify-content-center">
		<div class="col-6">
			<p class=" text-center">${vo.content }</p>
		</div>
	</div>
	<br>
	<div class="row d-flex justify-content-center">
		<div class="col-6">
			<p class="fw-bold text-center">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-mouse3" viewBox="0 0 16 16">
 			 <path d="M7 0q-.891.002-1.527.463c-.418.302-.717.726-.93 1.208C4.123 2.619 4 3.879 4 5.187v.504L3.382 6A2.5 2.5 0 0 0 2 8.236v2.576C2 13.659 4.22 16 7 16h2c2.78 0 5-2.342 5-5.188V5.186c0-1.13-.272-2.044-.748-2.772-.474-.726-1.13-1.235-1.849-1.59C9.981.123 8.26 0 7 0m2.5 6.099V1.232c.51.11 1.008.267 1.46.49.596.293 1.099.694 1.455 1.24.355.543.585 1.262.585 2.225v1.69zm-1-5.025v4.803L5 5.099c.006-1.242.134-2.293.457-3.024.162-.366.363-.63.602-.801C6.292 1.105 6.593 1 7 1c.468 0 .98.018 1.5.074M5 6.124 13 7.9v2.912C13 13.145 11.19 15 9 15H7c-2.19 0-4-1.855-4-4.188V8.236a1.5 1.5 0 0 1 .83-1.342l.187-.093c.01.265.024.58.047.92.062.938.19 2.12.462 2.937a.5.5 0 1 0 .948-.316c-.227-.683-.35-1.75-.413-2.688a29 29 0 0 1-.06-1.528v-.002z"/>
			</svg>
			조회수 ( ${vo.hitCnt } ) 회</p>
		</div>
	</div>
	<br><br>
</main>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</html>
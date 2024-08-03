<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 리스트</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body class="container-fluid">
<%@ include file="/resources/common/user/header.jsp" %>	
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
			<a href="/user/company/review/main?busiNo=${param.busiNo}&busiNoticeNo=${param.busiNoticeNo}&busiReviewNo=${review.busiReviewNo}" class="text-dark fw-bold h5">후기</a>
		</div>
	</div>
	<br>
	<hr>
	<br>
	<h1 class="fw-bold text-center" style="font-family: '맑은고딕';  ">Review</h1>
	<br>
	<br>
	<br>
	<div class="row">
		<c:forEach var="list" items="${list }" varStatus="status">
			<div class="col-3"></div>
			<div class="col-6">
					<img class="bg-secondary rounded-circle" style="width:50px; height: 50px;">
					<br><br>
					<div class="fw-bold"> 	
						<span>${fn:substring(list.userAddr1,3,6) } </span><span>조회수 ${list.hitCnt } </span>
						<span>
						<c:if test="${list.regMinute ne 0 and list.regMinute lt 60 }">${list.regMinute }분 전</c:if>
						<c:if test="${list.regHour ne 0 and list.regHour lt 24 }">${list.regHour }시간 전</c:if>
						<c:if test="${list.regDay ne 0 and list.regDay lt 7 }">${list.regDay }일 전</c:if>
						<c:if test="${list.regWeek ne 0 and list.regWeek lt 4 }">${list.regWeek }주 전</c:if>
						<c:if test="${list.regMonth ne 0 and list.regMonth lt 12 }">${list.regMonth }달 전</c:if>
						<c:if test="${list.regYear ne 0  }">${list.regYear }년 전</c:if>
						</span>
					</div>
					<br>
					<p class="fw-bold h5">${list.title }</p>
					<br>
					<p class="fw-bold">${list.content }</p>
				<c:forEach var="file" items="${file }">
					<img  src="/resources/upload/user/company/review/${file.storedFileName }" style="width: 300px; height: 300px;">
				</c:forEach>
				
			<br><br>
			</div>
			<div class="col-3"></div>
		</c:forEach>
	</div>
	<br>
	<div class="row">
		<div class="col-3"></div>
		<div class="col-6">
			<button type="button" class="btn btn-dark form-control">후기 더보기</button>
		</div>
	</div>
	<br><br>
</main>
<%@ include file="/resources/common/user/footer.jsp" %>	
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</html>
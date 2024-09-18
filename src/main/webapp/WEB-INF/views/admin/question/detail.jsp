<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 상세 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body class="container-fluid">
	<main class="container">
		<br><br>
		<div class="row justify-content-center">
			<h5 class="fw-bold text-center">제목</h5><br><br>
			<div class="col-6 fw-bold text-center" >${inquiryVO.title }</div>
		</div>
		<br>
		<hr class="col-6 offset-md-3">
		<div class="row justify-content-center">
			<h5 class="fw-bold text-center">내용</h5><br><br>
			<div class="col-6 text-center" >${inquiryVO.content }</div>
		</div>
		<br>
		<hr class="col-6 offset-md-3">
		<div class="row justify-content-center">
			<h5 class="fw-bold text-center">첨부파일</h5><br>
			<div class="col-6 text-center"> 
			<br>
				<c:forEach var="file" items="${file }">
					<img style="width: 150px; height: 150px;" src="/resources/upload/user/inquiry/${file.storedFileName }">
				</c:forEach> 
			</div>
		</div>
		<br>
		<hr class="col-6 offset-md-3">
		<br>
		<div class="row justify-content-center">
			<div class="col-6 text-center"> 
				<a class="form-control btn btn-dark" href="/admin/question/write?inquiryNo=${inquiryVO.inquiryNo}">답변 작성</a>
			</div>
		</div>
	</main>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</html>
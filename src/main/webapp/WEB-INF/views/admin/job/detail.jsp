<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구인/구직 상세페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body class="conatainer-fluid">
<%@ include file="/resources/common/admin/header.jsp" %>
<br><br>
<main class='container table' style="border: 1px solid black;">
	<div class="text-center fw-bold">
		<div class="col">
			<span>번호 : </span>	
			<span>${jobVO.jobNo}</span>
		</div>
		<br>
		<div class="col">
			<span>작성자 : </span>	
			<span>${jobVO.jobWriter}</span>
		</div>
		<br>
		<div class="col">
			<span>업체명 : </span>	
			<span>${jobVO.jobCompany}</span>
		</div>
		<br>
		<div class="col">
			<span>제목 : </span>	
			<span>${jobVO.jobTitle}</span>
		</div>
		<br>
		<div class="col">
			<span>급여형태 : </span>	
			<span>${jobVO.jobType}</span>
		</div>
		<br>
		<div class="col">
			<span>급여 : </span>	
			<span>${jobVO.jobMoney}</span>
		</div>
		<br>
		<div class="col">
			<span>위치 : </span>	
			<span>${jobVO.jobLoc} ${jobVO.jobLocDetail}</span>
		</div>
		<br>
		<div class="col">
			<span>위치설명 : </span>	
			<span>${jobVO.jobLocContent}</span>
		</div>
		<br>
		<div class="col">
			<span>근무요일 : </span>	
			<span>${jobVO.jobWorkDate}</span>
		</div>
		<br>
		<div class="col">
			<span>근무시간 : </span>	
			<span>${jobVO.jobWorkTime}</span>
		</div>
		<br>
		<div class="col">
			<span>내용 : </span>	
			<span>${jobVO.jobContent}</span>
		</div>
		<br>
		<div class="col table" >
			<p>등록 파일 </p>	
			<c:forEach var="file" items="${file }">
				<span><img style="width: 300px; height: 300px;" src="/resources/upload/owner/company/job/${file.storedFileName }"></span>	
			</c:forEach>
		</div>
		<br>
		<div class="row justify-content-center" >
			<div class="col-4">
				<button type="button" class="text-warning btn btn-outline-warning form-control" onclick="location.href='/admin/job/main'">목록으로</button>
			</div>
		</div>
		<br>
	</div>
</main>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</html>
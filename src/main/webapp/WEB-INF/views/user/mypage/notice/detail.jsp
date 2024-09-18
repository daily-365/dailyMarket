<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body class="container-fluid">
<main class="container">

<br><br>
	<h5 class="fw-bold text-center">데일리 공지사항</h5>
	<br>
	<div class="row justify-content-center">
		<div class="col-4">
			<label class="form-label fw-bold">제목</label><br>	
			<p class="fw-bold">${noticeVO.title } </p>
		</div>
	</div>
	<br>
	<div class="row justify-content-center">
		<div class="col-4">
			<hr>
			<c:forEach var="file" items="${file }" varStatus="status">
				<p  class="fw-bold"> ${file.originFileName } 
					<button  type="button" class="fileDownBtn btn btn-light text-dark fw-bold" style="height: 35px;" value="${file.fileNo }">다운로드</button>
				<p>
			</c:forEach>
			<hr>
		</div>
	</div>
	<br>
	<div class="row justify-content-center">
		<div class="col-4">
			<label class="form-label fw-bold">내용</label>	
			<p  id="content" >
				${noticeVO.content }
			</p>
		</div>
	</div>
	<script src="//cdn.ckeditor.com/4.19.0/full/ckeditor.js"></script>
	
	<br>
	
	<div class="row justify-content-center">
		<div class="col-4">
			<button onclick="javascript: location.href='/user/mypage/notice/main'" type="button" id="modNoticeBtn" class="btn form-control btn-dark text-light fw-bold">목록으로</button>
		</div>
	</div>
	<br>
	
	<form id="fileDownForm" method="post">
		<input type="hidden" id="fileNo" name="fileNo">
		<input type="hidden" id="noticeNo" value="${param.noticeNo }">
	</form>
	
</main>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	$(".fileDownBtn ").on("click",function(){
	
		$("#fileNo").val($(this).val())
		$("#fileDownForm").attr("action","/user/mypage/notice/filedown")
		$("#fileDownForm").submit()
	
	});
})

</script>
</html>
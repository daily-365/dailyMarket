<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 답변</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body class="container-fluid">
	<main class="container">
	<br>
	<h5 class="text-center fw-bold">답변 작성</h5>
	<br>
	<form action="">
		<div class="row justify-content-center">
			<div class="col-8">
				<label class="form-label fw-bold">제목</label>
				<input id="title" type="text" class="form-control" value="${answerVO.title }">
			</div>
		</div>
		<br>
		<div class="row justify-content-center">
			<div class="col-8">
			<label class="form-label fw-bold">내용</label>
			<textarea id="content" class="form-control">${answerVO.content }</textarea>
			<script src="//cdn.ckeditor.com/4.19.0/full/ckeditor.js"></script>
			<script type="text/javascript">
			$(function () {
				CKEDITOR.replace('content', {
					filebrowserUploadUrl : '${pageContext.request.contextPath}/admin/ckeditor/upload'
				});
				
			});
			</script>
			</div>
		</div>
		<br>
		<c:if test="${empty answerVO }">
		<div class="row justify-content-center">
			<div class="col-4">
				<button type="button" class="form-control btn btn-dark" id="answerWriteBtn">작성</button>
			</div>
		</div>
		</c:if>
		<c:if test="${not empty answerVO }">
		<div class="row justify-content-center">
			<div class="col-2">
				<button type="button" class="form-control btn btn-warning" id="answerModBtn">수정</button>
			</div>
			<div class="col-2">
				<button type="button" class="form-control btn btn-danger" id="answerDelBtn">삭제</button>
			</div>
		</div>
		</c:if>
	</form>
	<input id="inquiryNo" type="hidden" value="${param.inquiryNo }">
	</main>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	
	
	
	$('#answerWriteBtn').on("click",function(){
		if(!confirm("등록하시겠습니까?")){
			return false;
		}else{
			var params = {
					"inquiryNo" : $("#inquiryNo").val(),
					"title" : $("#title").val(),
					"content" : CKEDITOR.instances.content.getData()
					}
			$.ajax({
				url:"/admin/question/write",
				type:"post",
				data:params,
				success:function(result){
					alert(result)
					location.reload(true)
				}
			})
		}
	});
	
	$("#answerModBtn").on("click",function(){
		if(!confirm("수정하시겠습니까?")){
			return false;
		}else{
			var params = {
					"inquiryNo" : $("#inquiryNo").val(),
					"title" : $("#title").val(),
					"content" : CKEDITOR.instances.content.getData()
					}
			$.ajax({
				url:"/admin/question/update",
				type:"post",
				data:params,
				success:function(result){
					alert(result)
					location.reload(true)
				}
			})
		}
	});
	
	$("#answerDelBtn").on("click",function(){
		if(!confirm("삭제하시겠습니까?")){
			return false;
		}else{
			$.ajax({
				url:"/admin/question/delete",
				type:"post",
				data:{"inquiryNo":$("#inquiryNo").val()},
				success:function(result){
					alert(result)
					location.reload(true)
				}
			})
		}
	});
	
	
	
});


</script>



</html>
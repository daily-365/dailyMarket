<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 상세 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body class="container">
	<br><br>
 <h2 class="fw-bold text-center">이벤트 상세페이지</h2>
	<div class="row justify-content-center">
		<div class="col-8">
			<label class="form-label fw-bold">제목</label>	
			<input type="text" value="${eventVO.title }" id="title" class="form-control">
		</div>
	</div>
	<br>
	<div class="row justify-content-center">
		<div class="col-8">
			<label class="form-label fw-bold">내용</label>	
			<textarea id="content">
				${eventVO.content }
			</textarea>
		</div>
	</div>
	<script src="//cdn.ckeditor.com/4.19.0/full/ckeditor.js"></script>
	<script type="text/javascript">
	$(function () {
		CKEDITOR.replace('content', {
			filebrowserUploadUrl : '${pageContext.request.contextPath}/admin/ckeditor/upload'
		});
		
	});
	</script>
	<br><br> 
<div class="row justify-content-center">
	<div class="col-4">
		<button type="button" class="btn btn-primary form-control" id="modEventBtn">수정하기</button>
	</div>
	<div class="col-4">
		<button type="button" class="btn btn-danger form-control" id="delEventBtn">삭제하기</button>
	</div>
</div>
<br><br>
<input type="hidden" value="${param.eventNo }" id="eventNo">
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#modEventBtn").on("click",function(){
		$.ajax({
			url :"/admin/event/modify",
			type:"post",
			data: { "eventNo" :$("#eventNo").val(),
					"title" : $("#title").val(),
					"content" : CKEDITOR.instances.content.getData()
					},
			success:function(result){
				alert(result)
				location.reload(true)
			
			}
		});
	});
	
	$("#delEventBtn").on("click",function(){
		if(!confirm("삭제하시겠습니까?")){
			return false
		}else{
			$.ajax({
				url :"/admin/event/delete",
				data : {"eventNo" : $("#eventNo").val()},
				type: "post",
				success:function(result){
					alert(result)
					location.href="/admin/event/main"
				}
			})
		}
	});

});



</script>
</html>
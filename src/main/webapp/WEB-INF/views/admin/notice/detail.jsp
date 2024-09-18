<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body class="container">
	<br><br>

 <h2 class="fw-bold text-center">공지사항 상세페이지</h2>
	<div class="row justify-content-center">
		<div class="col-8">
			<label class="form-label fw-bold">제목</label>	
			<input type="text" value="${noticeVO.title }" id="title" class="form-control">
		</div>
	</div>
	<br>
	<div class="row justify-content-center">
		<div class="col-8">
			<label class="form-label fw-bold">내용</label>	
			<textarea  id="content" class="form-control" rows="10">
				${noticeVO.content }
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
		<div class="col-8">
				<div class="col-6">
					<label class="form-label fw-bold">첨부파일</label>	
					<button type="button" class="btn btn-light text-dark fw-bold form-control" id="fileAddBtn"> 추가</button>
				</div>
				<br><br>
				<c:forEach var="file" items="${file }" varStatus="status">
					<p  class="fw-bold"> ${file.originFileName } 
						<button type="button" class="fileDownBtn btn btn-primary" style="height: 35px;" value="${file.fileNo }">다운로드</button>
						<button type="button" class="fileDelBtn btn btn-danger" style="height: 35px;" value="${file.fileNo }">삭제</button>
					<p>
				</c:forEach>
					<p id="fileContent">
					</p>
				<input type="file" id="fileInput" style="display: none;" multiple="multiple">
		</div>
	</div>
	<br>
	<div class="row justify-content-center">
		<div class="col-4">
			<button type="button" id="modNoticeBtn" class="btn form-control btn-primary">수정하기</button>
		</div>
		<div class="col-4">
			<button type="button" id="delNoticeBtn" class="btn form-control btn-danger">삭제하기</button>
		</div>
	</div>
	<br>
	<form id="fileDownForm" method="post">
		<input type="hidden" id="fileNo" name="fileNo">
		<input type="hidden" id="noticeNo" value="${param.noticeNo }">
	</form>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
		
	$(".fileDownBtn ").on("click",function(){
	
		$("#fileNo").val($(this).val())
		$("#fileDownForm").attr("action","/admin/notice/filedown")
		$("#fileDownForm").submit()
	
	});
	
	$("#fileAddBtn").on("click",function(){
		$("#fileInput").click()
	});
	
	//기존 파일 삭제
	$(".fileDelBtn").on("click",function(){
		if(!confirm("해당 파일을 삭제하시겠습니까?")){
			return false;
		}else{
			$.ajax({
				url :"/admin/notice/filedel",
				type:"post",
				data : {"fileNo" :$(this).val() },
				success:function(result){
					alert(result)
					location.reload(true)
				}
			});
		}
	});
	
	//파일 추가
	$("#fileInput").on("change",fileAddFunc)
	
	var fileContent = new Array()
	var fileNum =0;
	var fileCnt =0;
	
	var extError = false
	
	function fileAddFunc(e){
	
		var files =e.target.files
		var fileArr = Array.prototype.slice.call(files)
		
		fileExt =files[0].name.substring(files[0].name.lastIndexOf(".")).replace(".","")
		
		fileArr.forEach(function(f){
		
			if( fileExt!='jpg'&&fileExt!='jpeg'&&fileExt!='png'&&fileExt!='gif'&& fileExt!='txt'&&fileExt!='hwp'&&fileExt!='pdf'&&fileExt!='xls'&&fileExt!='xlsx'&&fileExt!='ppt'&&fileExt!='pptx'&&fileExt!='doc'&&fileExt!='docx'){
					extError=true;
					return true;
				
			}else{
				var reader = new FileReader()
				
				reader.onload=function(e){
					
					fileNum++;
					fileContent.push(f)
					
					$("#fileContent").append(
											'<p class="fw-bold">'+f.name+'<span>'
											+'&nbsp;&nbsp;<button id="btn'+fileNum+'" type="button" class="btn btn-danger" style="height: 35px;">X</button>'
											+'</span></p>'
											)
				
					$("#btn"+fileNum).on("click",function(){
						fileNum--;
						fileContent.pop(f)
						$(this).parent().parent().remove()
					
					})
				}
					reader.readAsDataURL(f)
			}
		})
		
		if(extError){
			alert("지원하지 않는 파일 형식 입니다.")
		}

	}
	
	//새로운 파일 등록 함수
	function uploadFileFunc(){
		
		var formData = new FormData()
		
		for(var i=0; i<fileContent.length; i++){
			formData.append("fileContent",fileContent[i])
			formData.append("noticeNo",$("#noticeNo").val())
		}
		
		$.ajax({
			url: "/admin/notice/upload",
			type:"post",
			async:false,
			data : formData,
			encType : "multipart-form/data",
			processData:false,
			contentType:false,
			success:function(result){
				console.log(result)
			}
		});
	}
	
	//수정
	$("#modNoticeBtn").on("click",function(){
		
		var params = {	"title" :$("#title").val(),
					"content" :  CKEDITOR.instances.content.getData(),
					"noticeNo" : $("#noticeNo").val()
				     }
						
		if(!confirm("저장하시겠습니까?")){
			return false;
		}else{
			$.ajax({
				url:"/admin/notice/modify",
				type:"post",
				data : params,
				success:function(result){
					alert(result)	
					location.reload(true)
				}
			});
			
			 uploadFileFunc()
		}
	});
	
	//삭제
	$("#delNoticeBtn").on("click",function(){
		if(!confirm("삭제시 모든 내용이 삭제됩니다. 삭제하시겠습니까?")){
			return false;
		}else{
			$.ajax({
				url:"/admin/notice/delete",
				type: "post",
				data:{"noticeNo" : $("#noticeNo").val()},
				success:function(result){
					alert(result)
					location.href="/admin/notice/main"
				}
			});
		}
	
	});
	
	
	
});

</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body class="container-fluid">
	<main class="container">
		<br><br>
		 <h2 class="fw-bold text-center">공지사항 등록</h2>
		 
		<div class="row justify-content-center">
		 	<div class="col-8">
			 <label class="form-label fw-bold">제목</label>
			 <input id="title" type="text" class="form-control">
			 <br>
		  	</div>
		</div>
		<div class="row justify-content-center">
		 	<div class="col-8">
			 <label class="form-label fw-bold">내용</label>
			 <textarea id="content"  class="form-control" rows="10"></textarea>
			 <br>
		  	</div>
		  	<script src="//cdn.ckeditor.com/4.19.0/full/ckeditor.js"></script>
			<script type="text/javascript">
			$(function () {
				CKEDITOR.replace('content', {
					filebrowserUploadUrl : '${pageContext.request.contextPath}/admin/event/upload'
				});
				
			});
			</script>
		</div>
		<div class="row justify-content-center">
		 	<div class="col-4 text-center">
			 <label class="form-label fw-bold ">파일첨부</label>
			 <input id="fileInput" type="file" class="form-control" style="display: none;" multiple="multiple">
			 <button id="fileAddBtn" type="button" class="btn btn-outline-success form-control">파일추가</button>
			 <br>
		  	</div>
		</div>
		<br>
		<div class="row justify-content-center">
			<div id="fileContent" class="col-4 text-center">
			</div>
		</div>
		<br><br>
		<div  class="row justify-content-center fileContent">
		
		</div>
		<div class="row justify-content-center">
		 	<div class="col-4">
			 <button id="registBtn" type="button" class="btn btn-outline-primary form-control">등록하기</button>
		  	</div>
		  	<div class="col-4">
			 <button  type="button" class="btn btn-outline-danger form-control" onclick="javascript: location.href='/admin/notice/main'">취소하기</button>
		  	</div>
		</div>
	</main>
	
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#fileAddBtn").on("click",function(){
		$("#fileInput").click()
	});

		
	$("#fileInput").on("change",fileAddFunc)
		
//	HWP : 한글과 컴퓨터(사)의 한글 프로그램
//	PDF : Adobe(사)의 PDF 프로그램
//	XLS/XLSX : MS 오피스(사)의 엑셀 프로그램
//	PPT/PPTX : MS 오피스(사)의 파워포인트 프로그램
//	DOC/DOCX : MS 오피스(사)의 워드 프로그램	
//  TXT
		
	var fileContent = new Array()
	var fileNum = 0;
	var fileCnt =0;	
		
	var extError = false;
		
	function fileAddFunc(e){
		
		files = e.target.files
		fileArr = Array.prototype.slice.call(files)
		
		fileCnt = fileArr.length+fileNum
		
		fileExt =files[0].name.substring(files[0].name.lastIndexOf(".")).replace(".","")
		
			fileArr.forEach(function(f){
			
				if( fileExt!='jpg'&&fileExt!='jpeg'&&fileExt!='png'&&fileExt!='gif'&& fileExt!='txt'&&fileExt!='hwp'&&fileExt!='pdf'&&fileExt!='xls'&&fileExt!='xlsx'&&fileExt!='ppt'&&fileExt!='pptx'&&fileExt!='doc'&&fileExt!='docx'){
					extError=true;
					return false;
				
				}else{
					extError=false;
					
					var reader = new FileReader()
					
					reader.onload=function(e){
						
						fileNum++
						fileContent.push(f)
						
						$("#fileContent").append(
												"<div>"
												+"<p class='fw-bold'>"+f.name+" <button type='button' id='btn"+fileNum+"' class='btn btn-danger'>X</button></p>"	
												+"</div>"	
												)
												
						$("#btn"+fileNum).on("click",function(){
							//증가값 다시 감소
							fileNum--
							
							fileContent.pop(f) // 콘텐츠 삭제
							$(this).parent().parent().remove(); //화면에서 삭제
						});
					}
					reader.readAsDataURL(f)
				}
			})
		
			if(extError){
				alert("지원하지 않는 파일 형식 입니다.")
			}

		}
		
		
		function uploadFileFunc(){
		
			var formData = new FormData()
			
			for(var i=0; i<fileContent.length; i++){
				formData.append("fileContent",fileContent[i])
				
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
		
		$("#registBtn").on("click",function(){
			
			$.ajax({
				url :"/admin/notice/write",
				type:"post",
				data : {
						"title" : $("#title").val(),
						"content" :CKEDITOR.instances.content.getData()
						},
				async:false,
				success:function(result){
					alert(result)
					location.href='/admin/notice/main'
				}
			});
			
			 uploadFileFunc()
		
		});

});

</script>


</html>
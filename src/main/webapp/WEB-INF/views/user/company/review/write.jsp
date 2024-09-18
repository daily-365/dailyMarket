<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 작성</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body class="container-fluid">
<main class="container">
<br><br>
<h5 class="fw-bold text-center">
	<svg style="width:30px; height: 30px;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-stars" viewBox="0 0 16 16">
	  <path d="M7.657 6.247c.11-.33.576-.33.686 0l.645 1.937a2.89 2.89 0 0 0 1.829 1.828l1.936.645c.33.11.33.576 0 .686l-1.937.645a2.89 2.89 0 0 0-1.828 1.829l-.645 1.936a.361.361 0 0 1-.686 0l-.645-1.937a2.89 2.89 0 0 0-1.828-1.828l-1.937-.645a.361.361 0 0 1 0-.686l1.937-.645a2.89 2.89 0 0 0 1.828-1.828zM3.794 1.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387A1.73 1.73 0 0 0 4.593 5.69l-.387 1.162a.217.217 0 0 1-.412 0L3.407 5.69A1.73 1.73 0 0 0 2.31 4.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387A1.73 1.73 0 0 0 3.407 2.31zM10.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.16 1.16 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.16 1.16 0 0 0-.732-.732L9.1 2.137a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732z"/>
	</svg>
	<span>리뷰 남기기</span>
</h5>
<br><br>
<form id="regReviewForm" method="post">
	<input type="text" name="busiNo" value="${param.busiNo }" style="display: none;">
	<input type="text" name="writer" value="${userId }" style="display:none;">
	<div class="row">
		<div class="col-4"></div>
		<div class="col-4">
			<label class="form-label fw-bold">제목</label>
			<input type="text" class="form-control" name="title">
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-4"></div>
		<div class="col-4">
			<label class="form-label fw-bold">내용</label>
			<textarea class="form-control" rows="10" name="content" id="content"></textarea>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-4"></div>
		<div class="col-4">
			<label class="form-label fw-bold">사진 첨부</label>
			<input type="file"  id="fileInput" style="display: none;" multiple="multiple">
			<button type="button" class="btn btn-dark" id="fileAddBtn">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square-fill" viewBox="0 0 16 16">
				  <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm6.5 4.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3a.5.5 0 0 1 1 0"/>
				</svg>
			</button>
			<br><br>
			<div id="fileContent" class="row"></div>
		</div>
	</div>
</form>
</main>
<br><br>
<div class="row">
	<div class="col-4"></div>
	<div class="col-4">
		<button type="button" id="regReviewBtn" class="btn btn-secondary form-control">남기기</button>
	</div>
</div>
<br><br>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	$("#fileAddBtn").on("click",function(){
		$("#fileInput").click();
	});

	
	$("#fileInput").on("change",fileAddFunc)

	var fileNum =0;
	var fileContent = new Array()
	
	var fileCnt =0;
	var totalCnt =5;
	
	var fileSize =0;
	var totalSize =1024**2*3;

	//에러 문구 flag : (변수를 반복문 밖에 두어 alert창 한번만 띄우게.)
	var cntError = false;
	var extError = false;
	var sizeError = false;
	
	function fileAddFunc(e){
	
		var files = e.target.files
		var fileArr =Array.prototype.slice.call(files)
	
		fileCnt = fileArr.length+fileNum
		
		fileArr.forEach(function(f){
			
			var reader = new FileReader()
			var fileExt = f.type.substring(f.type.lastIndexOf("/")).replace("/","")
			
			if(fileCnt>totalCnt){
				cntError=true;
				return false;
				
			}if(fileExt!='jpeg' && fileExt!='jpg'  && fileExt!='png' && fileExt !='gif'  ){
				extError =true;
				return false;
			
			}if(fileSize>totalSize){
				sizeError =true;
				return false;
				
			}else{
				cntError = false;
				extError = false;
				sizeError = false;
				
				reader.onload=function(e){
				
					fileNum ++;
					fileSize +=f.size
					
					fileContent.push(f)
				
				
				$("#fileContent").append(
											"<div  id='file"+fileNum+"' class='fw-bold col-6' >"
											+"<img src='"+e.target.result+"' class='form-control fileImgs' style='width:200px; height:150px;' ></img>"
											+"<br>"
											+"<button id='btn"+fileNum+"' type='button' class='btn btn-danger form-control' >X </button>"
											+"</div>"
											+"<br>"
											)
				
					$("#btn"+fileNum).on("click",function(){
						fileNum--;
						fileCnt--;
						fileSize-=f.size;
						
						fileContent.pop(f)
						$(this).parent('div').remove();
					
					});
				}
				reader.readAsDataURL(f)
			}
		});
		if(cntError){
			alert("파일은 최대 10개까지 올릴 수 있습니다.")
		}if(extError){
			alert("jepg/jpg/png/gif파일만 올려주세요")
		}if(sizeError){
			alert("최대 용량은 10M까지 입니다.")
		}
		
	}
	
	function uploadFileFunc(){
		
		var formData = new FormData()
		
		for(var i=0; i<fileContent.length; i++){
			formData.append("fileContent",fileContent[i])
		}
		
		$.ajax({
			url : "/user/company/review/write/file",
			type : "post",
			data : formData,
			async : false,
			encType : "multipart/form-data",
			processData : false,
			contentType : false,
			success :function(result){
				console.log(result)	
			}
		});
	
	}

	
	$("#regReviewBtn").on("click",function(){
		if(!$("input[name=title]").val()){
			alert("제목을 입력해 주세요")
			$("input[name=title]").focus()
			return false;
		}else if(!$("#content").val()){
			alert("내용을 입력해 주세요")
			$("#content").focus()
			return false;
		}else{
			$("#regReviewForm").attr("action","/user/company/review/write")
			$("#regReviewForm").submit()
			uploadFileFunc()
			alert("리뷰가 작성 되었습니다.")
			
		}
		
	
	});



});


</script>
</html>
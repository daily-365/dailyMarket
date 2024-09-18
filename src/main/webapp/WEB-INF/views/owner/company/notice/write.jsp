<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체 소식 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body class="container">
	<br><br>
	<h5 class="fw-bold text-center">소식 알리기</h5>
	<br>
	<form class="form">
		<div class="row">
			<div class="col-3">
			</div>
			<div class="col-6">
				<label class="form-label fw-bold"><span class="text-danger">※</span> 제목</label>
				<textarea class="form-control" maxlength="50" rows="1" id="title"></textarea>
			</div>
		</div>
		<br><br>
		<div class="row">
			<div class="col-3">
			</div>
			<div class="col-6">
				<label class="form-label fw-bold">제목 설명</label>
				<textarea class="form-control" maxlength="100" rows="2" id="subTitle"></textarea>
			</div>
		</div>
		<br><br>
		<div class="row">
			<div class="col-3">
			</div>
			<div class="col-6">
				<label class="form-label fw-bold"><span class="text-danger">※</span> 내용</label>
				<textarea class="form-control" maxlength="200" rows="5" id="content"></textarea>
			</div>
		</div>
		<br><br>
		<div class="row">
			<div class="col-3">
			</div>
			<div class="col-6">
				<input type="file" multiple="multiple" id="fileInput" style="display:none;">
				<button type="button" id="fileAddBtn" class="btn btn-outline-warning">사진 추가</button>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-3">
			</div>
			<div class="col-6">
				<div id="fileContent" class="row"></div>
			</div>
		</div>
		<br><br>
		<div class="row">
			<div class="col-3">
			</div>
			<div class="col-6">
				<label class="form-label fw-bold">추가 설명</label>
				<textarea class="form-control" maxlength="200" rows="5" id="subContent"></textarea>
			</div>
		</div>
		<br><br>
		<div class="row">
			<div class="col-4 ">
			</div>
			<div class="col-4 ">
				<button type="button" id="regBtn" class="btn btn-outline-success form-control">등록</button>
			</div>
		</div>
	</form>
	<br><br>
	<input type="text" value="${busiVO.busiNo }" id="busiNo" style="display: none;">
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
	
	var fileNum =0;
	var fileContent = new Array()
	
	var fileCnt =0;
	var totalCnt = 10;
	
	var fileSize =0;
	var totalSize = 1024**2**5
	
	function fileAddFunc(e){
	
		var files = e.target.files
		var fileArr = Array.prototype.slice.call(files)
		
		fileCnt = fileArr.length+fileNum
		
		fileArr.forEach(function(f){
			var reader = new FileReader()
			var fileExt = f.type.substring(f.type.lastIndexOf("/")).replace("/","")
		
			if(fileCnt>totalCnt){
				alert("사진은 최대 10개까지 가능합니다.")
				f.preventDefault()
			}if(fileExt!='jpeg' &&fileExt!='jpg' &&fileExt!='png' && fileExt!='gif'){
				alert("jpeg/jpg/png/jif 파일 형식만 지원합니다.")
				f.preventDefault()
			}if(fileSize>totalSize){
				alert("파일은 최대 5M 까지 지원 합니다.")
				f.preventDefault()
			}else{
				reader.onload=function(e){
				
					fileNum++;
					fileSize +=f.size;
					
					fileContent.push(f)
					
					$("#fileContent").append("<div  id='file"+fileNum+"' class='fw-bold col-4' ><br><br>"
												+"&nbsp;<img src='"+e.target.result+"'  style='height: 200px;'class='form-control'></img><br>"
												+"&nbsp;<button id='btn"+fileNum+"' type='button' class='btn btn-danger form-control' >X </button>"
												+"<br>"
												+"</div>"
												)
					$("#btn"+fileNum).on("click",function(){
							//증가값 다시 감소
							fileNum--
							fileSize-=f.size
							
							fileContent.pop(f) // 콘텐츠 삭제
							$(this).parent('div').remove(); //화면에서 삭제
							
						});
					}
					reader.readAsDataURL(f)
				}
			});
		}
		
	function uploadFileFunc(){
		var formData = new FormData()
		
		for(var i=0; i<fileContent.length; i++){
			formData.append("fileContent",fileContent[i])
		}
		$.ajax({
			url :"/owner/notice/write/file",
			type: "post",
			data : formData,
			async :false,
			encType : "mutipart/form-data",
			processData : false,
			contentType : false,
			success:function(result){
				console.log(result)
			}
		})
	}
	
	$("#regBtn").on("click",function(){
	 	if(!confirm("소식을 등록하시겠습니까?")){
	 		return false;
	 	}else{
			params = {
					 "busiNo" : $("#busiNo").val(),
					 "title" : $("#title").val(),
					 "subTitle" : $("#subTitle").val(),
					 "content" : $("#content").val(),
					 "subContent" : $("#subContent").val()
					}
			
			$.ajax({
				url :"/owner/notice/write",
				type: "post",
				data : params ,
				success:function(result){
					alert(result)
					location.reload(true)
				}
			})
			uploadFileFunc()
		}
	});
	
	

});

</script>
</html>
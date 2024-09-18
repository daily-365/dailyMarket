<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body class="container-fluid">
	<main class="container">
		<br><br>
		<h5 class="fw-bold text-center">문의 하기 <span class="text-secondary"> ( 문의 사항을 전달합니다. )</span></h5>
		<br>
		<h6 class="fw-bold text-center"><span class="text-info">＊</span>필수 입력사항입니다.</h6>
		<br>
		<form>
			<div class="row justify-content-center">
				<label class="form-label fw-bold text-center"><span class="text-info">＊</span>제목</label>
				<div class="col-6">
					<input id="title" type="text" class="form-control">
				</div>
			</div>
			<br>
			<div class="row justify-content-center" >
				<label class="form-label fw-bold text-center">첨부파일</label>
				<div class="col-2">
					<input type="file" id="fileInput" multiple="multiple" style="display:none;">
					<button type="button" class="form-control btn btn-outline-info" id="fileAddBtn">추가</button>
				</div>
			</div>
			<br>
			<div  class="row justify-content-center" >
				<div id="fileContent" class="col-4">
				</div>
			</div>
			<br>
			<div class="row justify-content-center">
				<label class="form-label fw-bold text-center"><span class="text-info">＊</span>내용</label>
				<div class="col-6">
					<textarea id="content" class="form-control" rows="10"></textarea>
				</div>
			</div>
			<br>
			<br>
			<div class="row justify-content-center">
				<div class="col-4">
					<button type="button" class="form-control btn btn-info fw-bold text-light" id="writeInquiryBtn">문의하기</button>
				</div>
			</div>
		</form>
		<br><br>
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
	
	var fileNum =0;
	var fileCnt =0;
	var fileTotalCnt =5;
	var fileSize = 0
	var	fileTotalSize = 1024**2*5
	
	var fileContent = new Array()
	
	var fileCntFlag = false;
	var fileExtFlag = false;
	var fileSizeFlag  = false;

	
	function fileAddFunc(e){
		
		var files = e.target.files
		var fileArr = Array.prototype.slice.call(files)
		
		fileCnt = fileArr.length+fileNum
		
		fileArr.forEach(function(f){
			
			var reader = new FileReader()
			var fileExt = f.name.substring(f.name.lastIndexOf(".")).replace(".","")

			if(fileCnt>fileTotalCnt){
				fileCntFlag=true;
				return false
			}if(fileExt!='jpg'&&fileExt!='jpeg'&&fileExt!='png'&&fileExt!='gif'&& fileExt!='txt'&&fileExt!='hwp'&&fileExt!='pdf'&&fileExt!='xls'&&fileExt!='xlsx'&&fileExt!='ppt'&&fileExt!='pptx'&&fileExt!='doc'&&fileExt!='docx'){
				fileExtFlag=true
				
				return false
			}if(fileSize>fileTotalSize){
				fileSizeFlag=true;
				return false
			}else{
				fileCntFlag=false;
				fileExtFlag=false;
				fileSizeFlag=false;
				
				reader.onload=function(e){
					fileNum++;
					fileSize+=f.size
					
					fileContent.push(f)
					
					$("#fileContent").append(
							"<div>"
							+"<p class='fw-bold'>"+f.name+" <button type='button' id='btn"+fileNum+"' class='btn btn-danger'>X</button></p>"	
							+"</div>"	
							)
							
					$("#btn"+fileNum).on("click",function(){
						//증가값 다시 감소
						fileNum--;
						fileCnt--;
						fileSize-=f.size;
						
						fileContent.pop(f) // 콘텐츠 삭제
						$(this).parent().parent().remove(); //화면에서 삭제
					});
					
				}
				reader.readAsDataURL(f)
			}
		
		})
		if(fileCntFlag){
			alert("파일은 최대 5개까지 첨부 가능합니다.")
			return false;
		}if(fileExtFlag){
			alert("지원하지 않는 파일 형식입니다.")
			return false;
		}if(fileSizeFlag){
			alert("파일크기가 너무 큽니다.")
			return false;
		}
	}
	
	
	function uploadFileFunc(){
		var formData = new FormData()
		
		for(var i=0; i<fileContent.length; i++){
			formData.append("fileContent",fileContent[i])
		}
		
		$.ajax({
			url:"/user/inquiry/write/upload",
			type :"post",
			async: false,
			encType : "multipart/form-data",
			processData : false,
			contentType :false,
			data: formData,
			success:function(result){
				console.log(result)
			}
		})
		
	}
	$("#writeInquiryBtn").on("click",function(){
		if(!confirm("문의 내용을 등록하시겠습니까?")){
			return false;
		}else{
			$.ajax({
				url : "/user/inquiry/write",
				type: "post",
				async :false,
				data : {
						"title" : $("#title").val(),
						"content" : $("#content").val()
						},
				success : function(result){
					alert(result)
					location.href='/user/inquiry/main'
				}
			})
			uploadFileFunc()
		}
	})
	
	
	
	
})

</script>
</html>
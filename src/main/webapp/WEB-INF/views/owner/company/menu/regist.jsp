<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 등록 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body class="container">
	<br><br>
	<h5 class="fw-bold text-dark text-center">메뉴 등록</h5>
	<br><br>
	<div class="row">
		<div class="col-5"></div>
		<div class="col-2">
			<button id="addInputBtn" type="button" class="btn btn-outline-warning form-control">추가</button>
		</div>
	</div>
	<br><br>
	<div class="row">
		<div  class="col">
			<table class="table table-hover table-bordered">
				<thead>
					<tr>	
						<th>#</th>
						<th>이름</th>
						<th>가격</th>
						<th>재고</th>
						<th>설명</th>
						<th>배달/포장 ( N : 포장만  Y: 모두가능 )</th>
						<th>배달료</th>
						<th>사진</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody id="menuContent" > 
					
				</tbody>
			</table>
		
		</div>
	</div>
	<br><br>
	<div class="row ">
		<div class="col-4">
		</div>
		<div class="col-2">
			<button type="button" id="registBtn" class="btn btn-primary form-control">등록</button>	
		</div>
		<div class="col-2">
			<button type="button" class="btn btn-danger form-control" 
			onclick="javascript: if(!confirm('취소하시면 해당 내용은 저장되지않습니다. 그래도 취소하시겠습니까?')){return false}else{ location.reload(true)}">취소</button>	
		</div>
	</div>
	<!-- Button trigger modal -->
<button id="openModalBtn" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" style="display: none;">
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-center" id="exampleModalLabel">메뉴 등록</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body fw-bold">
         <p>이름</p>
         <input type="text" id="name" class="form-control">
         <br>
         <p>가격</p>
         <input type="number" id="price" step="1000" min="1000" class="form-control">
         <br>
         <p>재고</p>
         <input type="number" id="count" min="1" class="form-control">
         <br>
         <p>설명</p>
         <textarea id="content" class="form-control"></textarea>
         <br>
         <p>포장/배달</p>
         	포장만 <input type="radio"  id="deleveryYn" name="deleveryYn" value='N' >모두 가능 <input type="radio" id="deleveryYn" name="deleveryYn" value='Y' checked="checked">
      	 <br><br>
         <p>배달료</p>
         <input type="number" step="1000" min="0" id="deleveryPrice" class="form-control">
         <br>
         <p>사진</p>
         <input type="file" id="fileInput">
         <img id="menuImg" style="width: 150px; height: 150px;" alt="Menu Img">
         <br>
      </div>
      <div class="modal-footer">
        <button type="button" id="addContentBtn" class="btn btn-primary" >추가</button>
        <button type="button" id="closeBtn" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	
	// modal창 클릭
	
	$("#addInputBtn").on("click",function(){
		$("#openModalBtn").click()	
		
		//초기화
		$("#name").val("")
		$("#price").val("")
		$("#count").val("")
		$("#content").val("")
		$("#deleveryPrice").val("")
		$("#fileInput").val("")
		$("#menuImg").attr("src","")
		
	});
	
	$("#fileInput").on("change",addMenuContentFunc)
	
	var fileNum=0;
	var menuContent = new Array()
	var list = new Array()
	
	var extError = false;
	
	function addMenuContentFunc(e){
		var files = e.target.files;
		var fileArr = Array.prototype.slice.call(files)
		
		fileArr.forEach(function(f){
			var reader = new FileReader()
			var fileExt = f.type.substring(f.type.lastIndexOf("/")).replace("/","")
			
			if(fileExt!='jpeg'&&fileExt!='jpg'&&fileExt!='png'&&fileExt!='gif'){
				$("#fileInput").val("")
				$("#menuImg").attr("src","")
				return false
			}else{
				extError=true;
				
				reader.onload=function(e){
					fileNum++;
					
					menuContent.push(f)
					
					var listData = { "name" :$("#name").val() ,
								 "price" :$("#price").val() ,
								 "count" : $("#count").val(),
								 "content" : $("#content").val(),
								 "deleveryYn" : $('input[name=deleveryYn]:checked').val(),
								 "deleveryPrice" :$("#deleveryPrice").val() 
								 }
								 
					list.push(listData)
					
					$("#menuImg").attr("src",e.target.result)
					
					$("#menuContent").append(
								"<tr>"
								+"<td>"+fileNum+"</td>"
								+"<td id='tName'>"+$("#name").val()+"</td>"
								+"<td id='tPrice' >"+$("#price").val()+"</td>"
								+"<td id='tCount'>"+$("#count").val()+"</td>"
								+"<td id='tContent'>"+$("#content").val()+"</td>"
								+"<td id='tDeleveryYn'>"+$('input[name=deleveryYn]:checked').val()+"</td>"
								+"<td id='tDeleveryPrice'>"+$("#deleveryPrice").val()+"</td>"
								+"<td id='tImg'><img id='tImgSrc' src='"+e.target.result +"' style='width:100px; height:100px;'></td>"
								+"<td ><button id='btn"+fileNum+"'  type='button'  class='btn btn-danger form-control'>X</button></td>"
								+"</tr>"
								)
								
						$("#btn"+fileNum).on("click",function(){
								//증가값 다시 감소
								fileNum--
								
								menuContent.pop(f) // 콘텐츠 삭제
								list.pop(listData) //data 삭제
								
								$(this).parent().parent().remove(); //화면에서 삭제
								
							
							});
					
				}
				
				reader.readAsDataURL(f)
			}
				
		});
		
		if(extError){
			alert("jepg/jpg/png/gif파일만 올려주세요")
		}
	}
	
	//메뉴 정보 등록 함수						
	$("#registBtn").on("click",function(){
	
		if(!confirm("해당사항이 적용됩니다. 저장하시겠습니까?")){
			return false;
		}else{
			regFileFunc() //파일업로드
			
		var jsonData = JSON.stringify(list)
		
			$.ajax({
				url :"/owner/company/menu/regist",
				type: "post",
				data: {"menuData" : jsonData},
			    dataType : 'json',
				async : false,
				traditional: true,
				success:function(result){
					alert("메뉴가 등록 되었습니다.")
					console.log(result.msg)
					location.reload(true)
				},error : function(xhr,status,error){
					console.log(xhr,status,error)
				}
			});
			
		}
	});			
	
				
	function regFileFunc(){
	
		var formData = new FormData()
		
		for(var i=0; i<menuContent.length; i++){
			formData.append("menuContent",menuContent[i])
		}
		
		$.ajax({
				url :"/owner/company/menu/registFile",
				type: "post",
				data: formData,
				encType : "multipart/form-data",
				processData : false,
				contentType: false,
				async : false,
				traditional: true,
				success:function(result){
					console.log(result)
				}
			});
	}

});

</script>
</html>
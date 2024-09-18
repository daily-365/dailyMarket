<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body class="container-fluid">
<main class="container">
<br><br>
	<h5 class="fw-bold text-center">비밀번호 변경</h5>
<br><br>
<form class="form" id="modPassForm" method="post">
	
	<div class="row justify-content-center">
		<div class="col-4">
			<label class="form-label h6 fw-bold">현재 비밀번호</label>
			<input type="password"  id="userPass" class="form-control fw-bold">
			<div id="userPassYn" class="fw-bold "></div>
		</div>
	</div><br>
	<input type="text" value="${userId }" id="userId" name="userId" style="display: none;">
	<input type="text" value="" id="userPassChk" name="userPassChk" style="display: none;">
	
	<div class="row justify-content-center">
		<div class="col-4">
			<label class="form-label h6 fw-bold">새 비밀번호</label>
			<input type="password"  id="userNewPass" class="form-control fw-bold">
			<div id="userNewPassYn" class="fw-bold "></div>
		</div>
	</div><br>
	<div class="row justify-content-center">
		<div class="col-4">
			<label class="form-label h6 fw-bold">새 비밀번호 확인</label>
			<input type="password"  id="userNewPassChk" class="form-control fw-bold">
			<div id="userNewPassChkYn" class="fw-bold "></div>
		</div>
	</div><br>
	<div class="row justify-content-center">
		<div class="col-4">
			<button type="button" id="modPassBtn" class="btn btn-outline-success form-control">변경하기</button>
		</div>
	</div><br>
</form>

<input type="text" value="${msg }" id="resultMsg" style="display: none;">
</main>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" >
$(document).ready(function(){
	
	$("#userPass").focus()
	var userPassFlag = false;
	var userNewPassFlag =false;
	var userNewPassChkFlag = false;
	
	
	$("#userPass").on("blur",function(){
		if(!$("#userPass").val()){
			$("#userPassYn").text("비밀번호를 입력해 주세요")
			$("#userPassYn").attr("class","text-warning fw-bold")
		}else{
			$("#userPassChk").val($("#userPass").val())
			
			var params = {
							"userId" : $("#userId").val(),
							"userPass" : $("#userPass").val(),
							"userPassChk" : $("#userPassChk").val()
						}
			
			$.ajax({
				url :"/user/mypage/profile/passchk",
				type:"post",
				data: params,
				success:function(result){
					if(result){
						$("#userPassYn").text("확인되었습니다.")
						$("#userPassYn").attr("class","text-primary fw-bold")
						
						userPassFlag=true
						
					}else{
						$("#userPassYn").text("기존 비밀번호를 다시 확인해 주세요.")
						$("#userPassYn").attr("class","text-danger fw-bold")
					}
				}
			})
		}
	});
	
	//비밀번호 정규식
	var passReg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;//8 ~ 16자 영문, 숫자, 특수문자를 최소 한가지씩 조합
	
	$("#userNewPass").on("blur",function(){
		if(!$("#userNewPass").val()){
			$("#userNewPassYn").text("새 비밀번호를 입력해 주세요")
			$("#userNewPassYn").attr("class","text-warning fw-bold")
		
		}else{
			if(!passReg.test($("#userNewPass").val())){
				$("#userNewPassYn").text("비밀번호는 8 ~ 16자 영문, 숫자, 특수문자를 최소 한가지씩 조합해야 합니다. ")
				$("#userNewPassYn").attr("class","text-danger fw-bold")
			}else{
				
				$.ajax({
					url:"/user/mypage/profile/passchk/prev",
					type: "post",
					success:function(result){
						if(result!=$("#userNewPass").val()){
							$("#userNewPassYn").text("사용 가능한 비밀번호 입니다. ")
							$("#userNewPassYn").attr("class","text-primary fw-bold")
							
							userNewPassFlag=true;
							
						}else{
							$("#userNewPassYn").text("기존 비밀번호와 동일 합니다. ")
							$("#userNewPassYn").attr("class","text-danger fw-bold")
						}
					}
				});
			}
		}
	});
	
	$("#userNewPassChk").on("blur",function(){
		if(!$("#userNewPassChk").val()){
			$("#userNewPassChkYn").text("새 비밀번호를 확인해 주세요")
			$("#userNewPassChkYn").attr("class","text-warning fw-bold")
		}else{
			if($("#userNewPassChk").val()!=$("#userNewPass").val()){
				$("#userNewPassChkYn").text("비밀번호가 일치하지 않습니다.")
				$("#userNewPassChkYn").attr("class","text-danger fw-bold")
			}else{
				$("#userNewPassChkYn").text("비밀번호가 일치합니다.")
				$("#userNewPassChkYn").attr("class","text-primary fw-bold")
				
				userNewPassChkFlag=true;
			}
		}
	});
	
	$("#modPassBtn").on("click",function(){
	
		if(!userPassFlag||!userNewPassFlag||!userNewPassChkFlag){
			return false;
		}else{
			if(!confirm("비밀번호를 변경하시겠습니까?")){
				return false;
			}else{
				var params = {				
								"userPass" : $("#userNewPass").val(),
								"userPassChk" : $("#userNewPassChk").val()
							} 
				$.ajax({
					url:"/user/mypage/profile/modpass",
					type :"post",
					data :params,
					success:function(result){
					console.log(params)
						alert(result)
						location.reload(true)
					}
				});
			}
		}
	});
	
	
});

</script>
</html>
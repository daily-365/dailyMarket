<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데일리 페이 충전</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body class="container-fluid">
<main class="container">
<br><br>
	<h5 class="fw-bold text-center">데일리 페이 충전</h5>
<br><br>
<form id="accountRegistForm" method="post">
	<input type="text" value="${userId }" name="userId" style="display: none;">
	<div class="row justify-content-center">
		<div class="col-4">
			<label class="form-label fw-bold">실명(이름)</label>
			<input type="text" id="userName" name="userName" class="form-control fw-bold" maxlength="10">	
			<div id="userNameChk"></div>
		</div>
	</div><br>
	<div class="row justify-content-center">
		<div class="col-4">
			<label class="form-label fw-bold">계좌번호</label>
			<input type="text" id="accountNum" name="accountNum" class="form-control fw-bold" maxlength="14">	
			<div id="accountNumChk"></div>
		</div>
	</div><br>
	<div class="row justify-content-center">
		<div class="col-4">
			<label class="form-label fw-bold">은행</label>
			<select id="tradeBank" name="tradeBank" class="form-control fw-bold text-center">
				<option value="">선택</option>
				<option value="신한">신한</option>
				<option value="농협">농협</option>
				<option value="하나">하나</option>
				<option value="국민">국민</option>
				<option value="우리">우리</option>
				<option value="기업">기업</option>
				<option value="새마을금고">세마을금고</option>
				<option value="SC제일">SC제일</option>
			</select>
			<div id="tradeBankChk"></div>
		</div>
	</div><br>
	<div class="row justify-content-center">
		<div class="col-4">
			<label class="form-label fw-bold">충전금액</label>
			<input maxlength="7" type="text" id="saveMoney" name="saveMoney" class="form-control fw-bold" onkeyup='this.value = this.value.replace(/[^0-9]/g,""); this.value = this.value.replace(/\B(?=(\d{3})+(?!\d))/g,",");'>
			<div id="saveMoneyChk"></div>
		</div>
	</div><br>
	<div class="row justify-content-center">
		<div class="col-4">
			<button type="button" id="accountRegBtn" class="btn btn-light form-control">충전하기</button>
		</div>
	</div>
	<input type="hidden" id="userNo" value="${userNo }">
	<input type="hidden" id="resSaveMoney">
</form>
</main>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#saveMoney").on("keyup",function(){
		var saveMoney = Number($(this).val().replace(",",""))
		if(saveMoney<10000){
			$("#saveMoneyChk").text("10,000원 이상 충전 가능합니다.")
			$("#saveMoneyChk").attr("class","text-danger fw-bold text-center")
		}else{
			$("#saveMoneyChk").text("")
			$("#resSaveMoney").val(saveMoney)
		}
	});
	
	$("#accountRegBtn").on("click",function(){
		if(!$("#userName").val()){
			$("#userNameChk").text("실명을 입력해 주세요")
			$("#userNameChk").attr("class","text-warning fw-bold text-center")
			$("#userName").focus()
		}else if(!$("#accountNum").val()){
			$("#accountNumChk").text("계좌번호를 입력해 주세요")
			$("#accountNumChk").attr("class","text-warning fw-bold text-center")
			$("#accountNum").focus()
		}else if(!$("#tradeBank").val()){
			$("#tradeBankChk").text("은행을 선택해 주세요")
			$("#tradeBankChk").attr("class","text-warning fw-bold text-center")
			$("#tradeBank").focus()
		
		}else if(!$("#saveMoney").val()){
			$("#saveMoneyChk").text("금액을 입력해 주세요")
			$("#saveMoneyChk").attr("class","text-warning fw-bold text-center")
			$("#saveMoney").focus()
		}else{
			var params ={
					"userName" : $("#userName").val(),
					"accountNum" :$("#accountNum").val(),
					"tradeBank" : $("#tradeBank").val(),
					"saveMoney" :$("#resSaveMoney").val(),
					"targetUserNo" : $("#userNo").val(),
					"userType" : 'self'
					}
			
			$.ajax({
				url :"/user/mypage/account",
				type : "post",
				data :params ,
				success:function(result){
					alert(result)
					location.href="/user/mypage/main"
				}
			});
		}
	});
});

</script>


</html>
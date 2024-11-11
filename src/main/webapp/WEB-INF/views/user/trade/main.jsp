<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body class='container-fluid'>
	<main class="container">
		<br>
		<h4 class="fw-bold text-center">결제하기</h4>
		<br>
		<form id="" class="fw-bold">
			<input type="hidden" id="userId" value="${userId }">
			<div class="row justify-content-center">
				<div class="col-4">
					<label class="form-label">예금주</label>		
					<c:forEach var="account" items="${account }" begin="0" end="0">
					<input id="userName" type="text" readonly="readonly" class="form-control" name="userName" value="${account.userName }">
					</c:forEach>
				</div>
				<br>
			</div>
			<br>
			<div class="row justify-content-center">
					<div class="col-4">
					<label class="form-label">은행</label>		
					<select class="form-control" name="tradeBank" id="tradeBank">
						<c:forEach var="account" items="${account }">
							<option value="${account.tradeBank }">${account.tradeBank }</option>
						</c:forEach>
					</select>
				</div>
				<br>
			</div>
			<br>
			<div class="row justify-content-center">
				<div class="col-4">
					<label class="form-label">보내는 분 계좌번호</label>	
					<c:forEach var="account" items="${account }" begin="0" end="0">	
					<input type="text" id="accountNum" class="form-control" name="accountNum" value="${account.accountNum }">
					</c:forEach>
				</div>
				<br>
			</div>
			<br>
			
			<div class="row justify-content-center">
				<div class="col-4">
					<button type="button" class="form-control btn btn-light" onclick="javascript:location.href='/user/mypage/account'">계좌 추가</button>
				</div>
			</div>
			<br>
			
			<div class="row justify-content-center">
				<div class="col-4">
					<hr class="form-control bg-secondary">
				</div>
			</div>
			
			<div class="row justify-content-center">
				<div class="col-4">
					<label class="form-label">받는분</label>		
					<input type="text" id="targetUserName" class="form-control" name="userName" value="${remit.userName }" readonly="readonly">
				</div>
				<br>
			</div>
			<br>
			<div class="row justify-content-center">
					<div class="col-4">
					<label class="form-label">송금 은행</label>		
					<select class="form-control" id="targetTradeBank" name="tradeBank">
						<option value="${remit.tradeBank }">${remit.tradeBank }</option>
						
					</select>
				</div>
				<br>
			</div>
			<br>
			<div class="row justify-content-center">
				<div class="col-4">
					<label class="form-label">받는 분 계좌번호</label>		
					<input type="text" id="targetAccountNum" class="form-control" name="accountNum" value="${remit.accountNum }">
				</div>
				<br>
			</div>
			<br>
			<div class="row justify-content-center">
				<div class="col-4">
					<label class="form-label">결제할 금액</label>		
					<fmt:formatNumber var="price" value="${product.price }" maxFractionDigits="3" />
					<input type="text" class="form-control" readonly="readonly" value="${price }">
				</div>
				<br>
			</div>
			<br>
			<div class="row justify-content-center">
				<div class="col-2">
					<button type="button" class="btn btn-outline-primary form-control" id="purchaseBtn">결제하기</button>
				</div>
				<div class="col-2">
					<button type="button" class="btn btn-outline-danger form-control" onclick="javascript:location.href='/user/product/detail?productNo='+${param.productNo}">취소하기</button>
				</div>
				<br>
			</div>
			<br>
		</form>
	<input type="hidden" id="userNo" value="${userNo}">
	<input type="hidden" id="userId" value="<%=session.getAttribute("userId") %>">
	<input type="hidden" id="productNo" value="${param.productNo }">	
	<input type="hidden" id="price" value="${product.price }">		
	<input type="hidden" id="targetUserNo" value="${product.userNo }">
	<input type="hidden" id="targetUserId" value="${product.writer }">
	<input type="hidden" id="salesUserNo" value="${product.userNo }">
	<input type="hidden" id="salsesTargetUserNo" value="${userNo }">
	</main>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#purchaseBtn").on("click",function(){
		
		if(!confirm("상품을 결제 하시겠습니까?")){
			return false;
		}else{
			var params = {
					 "userNo" : Number($("#userNo").val()),
					 "userId" : $("#userId").val(),
					 "productNo" : Number($("#productNo").val()),
					 "userName" : $("#userName").val(),
					 "accountNum" : $("#accountNum").val(),
					 "tradeBank" : $("#tradeBank").val(),
					 "saveMoney" :  Number($("#price").val()),
					 "targetUserName" : $("#targetUserName").val(),
					 "targetAccountNum" : $("#targetAccountNum").val(),
					 "targetTradeBank" : $("#targetTradeBank option:selected").val(),
					 "targetUserNo" : Number($("#targetUserNo").val()),
					 "targetUserId" : $("#targetUserId").val(),
					 "salesUserNo" : Number($("#salesUserNo").val()),
					 "salesTargetUserNo" : Number($("#salesTargetUserNo").val()),
					 "targetSaveMoney" :  Number($("#price").val())
						}
		
			$.ajax({
				url:"/user/mypage/purchase",
				type:"post",
				data: params,
				success:function(result){
					alert(result)
				}
			})
			
		}
	});
	
});


</script>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 품목 결제 정보</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body class="container-fluid">
	<main class='container table' style="border: 1px solid black;">
	<br><br>
	<h5 class="fw-bold text-center">결제 정보</h5>
	<br><br>
		<div class="row">
			<div class="col-4">
				<p class="h4">상품 정보</p>	
				<br>
					<img src="/resources/upload/user/product/${detail.productStoredFileName}"  style="width: 200px; height: 150px;"/>
					<p>상품번호 : ${detail.productNo }</p>	
					<p>상품명 : ${detail.title }</p>	
					<p>가격 : <fmt:formatNumber value="${detail.price}" maxFractionDigits="3"/></p>	
					<p>판매 위치 : ${detail.location }</p>	
					<p>구매 일시 : ${detail.tradeDate }</p>	
				<hr>
			</div>
			
			<br><div class="col-4 ">
				<p class="h4 text-center">받는사람 정보</p>	
				<br>
				<div class="row justify-content-center fw-bold text-center">
					<p>받는사람 : ${detail.userName }</p>	
					<p>연락처 : ${fn:substring(detail.userTel,0,3)}-${fn:substring(detail.userTel,3,7)}-${fn:substring(detail.userTel,7,11)}</p>	
					<p>받는주소 : ${detail.userAddr1 } ${detail.userAddr2 }</p>
				</div>	
				<hr>
			</div>
			<br><div class="col-4 ">
				<p class="h4 text-center">결제 정보</p>	
				<br>
				<div class="row justify-content-center fw-bold text-center">
					<p>결제자 성명 : ${detail.userName }</p>
					<p>결제 은행 : ${detail.tradeBank }</p>
					<p>결제 계좌번호 :  ${detail.accountNum }</p>
					<p>결제 금액 : <fmt:formatNumber value="${detail.price }" maxFractionDigits="3"/></p>	
				</div>	
				<hr>
			</div>
		</div>
	</main>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</html>
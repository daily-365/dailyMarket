<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body class="container-fluid">
	<main class="container">
	<br><br>
	<h5 class="fw-bold text-center">구매 목록</h5>
	<br><br>
		<c:forEach var="list" items="${list }">
			<div id="wrap" style="border :1px solid black;">
		<br>
		<div class="row  justify-content-center">
			<div class="col-2 fw-bold">
				<img src="/resources/upload/user/product/${list.productStoredFileName }" style="width:150px; height: 150px;">
				<br><br>
			</div>
			<div class="col-2 fw-bold">
				${list.location }
			</div>
			<div class="col-2 fw-bold">
				<fmt:formatNumber value="${list.price }" pattern="#,###"/>
			</div>
			<div class="col-2 fw-bold ">
				${list.title }
			</div>
			<div class="col-3 fw-bold">
				${list.tradeDate }
			</div>
		</div>
		<div class="row  justify-content-center">
			<div class="col-9">
				<button type="button" class=" form-control btn btn-light" onclick="javascript: location.href='/user/mypage/purchase/detail?productNo=${list.productNo }&&tradeUserNo=${list.tradeUserNo }'">주문 상세정보 보기</button>
			</div>
		</div>
		<br>
	</div>
		</c:forEach>
	</main>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 계좌 입출금 조회</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<%@ include file="/resources/common/datepicker.jsp" %>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body class="conatainer-fluid">
<%@ include file="/resources/common/admin/header.jsp" %>
<br><br>
<main class='container table' style="border: 1px solid black;">
	<div class="text-center fw-bold">
		<c:forEach var="listGrp" items="${list }" begin="0" end="0">
		<div class="col">
			<span>아이디 : </span>	
			<span>${listGrp.userId} </span>
		</div>
		<br>
		<div class="col">
			<span>예금주 : </span>	
			<span>${listGrp.userName} </span>
		</div>
		<br>
		<div class="col">
			<span>계좌번호 : </span>	
			<span>${listGrp.accountNum} </span>
		</div>
		<br>
		<div class="col">
			<span>은행 : </span>	
			<span>${listGrp.tradeBank} </span>
		</div>
		</c:forEach>
		<hr>
		<c:forEach var="list" items="${list }" varStatus="status">
		<div class="col">
			<span>번호 : </span>	
			<span>${status.count} </span>
		</div>
		<br>
		
		<div class="col">
			<span>금액 : </span>	
			<span><fmt:formatNumber value="${list.saveMoney}" pattern="#,###" /> </span>
		</div>
		<br>
		<div class="col">
			<span>입/출금 : </span>	
			<span>${list.moneyType} </span>
		</div>
		<br>
		<div class="col">
			<span>일시 : </span>	
			<span><fmt:formatDate value="${list.modDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
		</div>
		<br>
		</c:forEach>
	</div>
</main>
	

</body>
</html>
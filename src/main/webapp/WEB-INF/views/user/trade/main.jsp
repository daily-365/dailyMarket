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
					<input type="text" class="form-control" name="userName">
				</div>
				<br>
			</div>
			<br>
			<div class="row justify-content-center">
					<div class="col-4">
					<label class="form-label">은행</label>		
					<select class="form-control" name="tradeBank">
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
				</div>
				<br>
			</div>
			<br>
			<div class="row justify-content-center">
				<div class="col-4">
					<label class="form-label">계좌번호</label>		
					<input type="text" class="form-control" name="accountNum">
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
					<button type="button" class="btn btn-outline-primary form-control">결제하기</button>
				</div>
				<div class="col-2">
					<button type="button" class="btn btn-outline-danger form-control">취소하기</button>
				</div>
				<br>
			</div>
			<br>
		</form>
	
	</main>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">



</script>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body class="conatainer-fluid">
<%@ include file="/resources/common/admin/header.jsp" %>
<br><br>
<main class='container table' style="border: 1px solid black;">
	<div class="text-center fw-bold">
		<div class="col">
			<span>아이디 : </span>	
			<span>${userVO.userId}</span>
		</div>
		<br>
		<div class="col">
			<span>이름 : </span>	
			<span>${userVO.userName}</span>
		</div>
		<br>
		<div class="col">
			<span>닉네임 : </span>	
			<span>${userVO.userNick}</span>
		</div>
		<br>
		<div class="col">
			<span>메일주소 : </span>	
			<span>${userVO.userMail}</span>
		</div>
		<br>
		<div class="col">
			<span>연락처 : </span>	
			<span>${userVO.userTel}</span>
		</div>
		<br>
		<div class="col">
			<span>생년월일 : </span>	
			<span>${userVO.userBirth}</span>
		</div>
		<br>
		<div class="col">
			<span>성별 : </span>	
			<c:if test="${userVO.userGender eq 'M'}">
				<span>남</span>
			</c:if>
			<c:if test="${userVO.userGender eq 'F'}">
				<span>여</span>
			</c:if>
		</div>
		<br>
		<div class="col">
			<span>주소 : </span>	
			<span>${userVO.userAddr1} ( ${userVO.userAddr2 } )</span>
		</div>
		<br>
		<div class="col">
			<span>가입일 : </span>	
			<span>${userVO.regDate}</span>
		</div>
		<br>
		<div class="col">
			<p>프로필 사진</p>	
			<c:forEach var="file" items="${file }">
				<img src="/resources/upload/user/profile/${file.storedFileName }" style="width: 300px; height: 300px;">
			</c:forEach>
		</div>
		<br>
		<hr>
		<div class="col">
			<p class="h4">계좌정보</p>	
			<c:forEach var="account" items="${account }">
				<c:choose>
					<c:when test="${not empty account }">
						<div class="col">
							<span>계좌번호 : </span>	
							<span>${account.accountNum}</span>
						</div>
						<div class="col">
							<span>은행 : </span>	
							<span>${account.tradeBank}</span>
						</div>
						<div class="col">
							<span>잔액 : </span>	
							<span>
								￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${account.saveMoney}"/>원
							</span>
						</div>
					</c:when>
					<c:otherwise>
						<div class="row">
							<div class="col">
								<p class="fw-bold">※ 계좌정보가 존재하지 않습니다.</p>	
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		<br>
		<hr>
		<div class="col">
			<p class="h4">거래내역</p>	
			<c:forEach var="trade" items="${trade }">
				<c:choose>
					<c:when test="${not empty trade }">
						<div class="row">
							<div class="col">
								<p>상품번호 : <a href="/admin/product/detail?productNo=${trade.productNo }">${trade.productNo}</a></p>	
							</div>
							<div class="col">
								<p>제목 : ${trade.title}</p>	
							</div>
							<c:if test="${trade.price ne 0}">
								<div class="col">
									<p>가격 : ￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${trade.price}"/>원 </p>	
								</div>
							</c:if>
							<c:if test="${trade.price eq 0}">
								<div class="col">
									<p>무료나눔
								</div>
							</c:if>
							<div class="col">
								<p>위치 : ${trade.location} </p>	
							</div>
						</div>	
						<hr>
					</c:when>
					<c:otherwise>
						<div class="row">
							<div class="col">
								<p class="fw-bold">※ 거래내역이 존재하지 않습니다.</p>	
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
	</div>
	<div class="row justify-content-center">
		<div class="col-4">
			<button type="button" class="btn btn-dark form-control" onclick="javascript: location.href='/admin/user/main'">목록 으로</button>
		</div>
	</div>
	<br>
</div>
</main>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</html>
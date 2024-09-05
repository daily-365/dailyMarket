<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부동산 상세 페이지</title>
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
			<span>번호 : </span>	
			<span>${estateVO.esNo }</span>
		</div>
		<br>
		<div class="col">
			<span>작성자 : </span>	
			<span>${estateVO.esWriter }</span>
		</div>
		<br>
		<div class="col">
			<span>집주인/세입자 : </span>	
			<span>${estateVO.esHumType }</span>
		</div>
		<br>
		<div class="col">
			<span>원룸/빌라/오피스텔/상가/아파트 : </span>	
			<span>${estateVO.esRoomType }</span>
		</div>
		<br>
		<div class="col">
			<span>위치 : </span>	
			<span>${estateVO.esLoc } ( ${estateVO.esLocDetail } ) </span>
		</div>
		<br>
		<div class="col">
			<span>위치 설명 : </span>	
			<span>${estateVO.esLocContent }</span>
		</div>
		<br>
		<div class="col">
			<span>단기/월세/전세/매매 : </span>	
			<span>${estateVO.esTradeType }</span>
		</div>
		<br>
		<div class="col">
			<span>가격: </span>	
			<span>￦ ${estateVO.esPrice }원</span>
		</div>
		<br>
		<div class="col">
			<span>방향 : </span>	
			<span>${estateVO.esPosiType }</span>
		</div>
		<br>
		<div class="col">
			<span>공급면적 : </span>	
			<span>${estateVO.esSize1 }m2</span>
		</div>
		<br>
		<div class="col">
			<span>전용면적 : </span>	
			<span>${estateVO.esSize2 }m2</span>
		</div>
		<br><div class="col">
			<span>구조 : </span>	
			<span>방 : ${estateVO.esOption1 }개 , 화장실 : ${estateVO.esOption1 }개 , 층수 : ${estateVO.esOption1 }층</span>
		</div>
		<br><div class="col">
			<span>관리비 여부 : </span>	
			<c:choose>
				<c:when test="${estateVO.esCostYn eq 'Y' }">
					<span>있음</span>
				</c:when>
				<c:otherwise>
					<span>없음</span>
				</c:otherwise>
			</c:choose>
		</div>
		<br><div class="col">
			<span>관리비 : </span>	
			<span><fmt:formatNumber type="number" value="${estateVO.esCost }" pattern="#,###" />원</span>
		</div>
		<br>
		<br><div class="col">
			<span>관리비에 포함 : </span>	
			<span>${estateVO.esCostChk }</span>
		</div>
		<br>
		<br><div class="col">
			<span>별도 : </span>	
			<span>${estateVO.esSeperCostChk }</span>
		</div>
		<br>
		<br><div class="col">
			<span>관리비 설명 : </span>	
			<span>${estateVO.esCostContent }</span>
		</div>
		<br>
		<br><div class="col">
			<span>대출가능여부 : </span>	
			<c:choose>
				<c:when test="${estateVO.esLoanYn eq 'Y' }">
					<span>가능</span>
				</c:when>
				<c:otherwise>
					<span>불가능</span>
				</c:otherwise>
			</c:choose>
		</div>
		<br>
		<br><div class="col">
			<span>반려동물가능여부 : </span>	
			<c:choose>
				<c:when test="${estateVO.esAnimalYn eq 'Y' }">
					<span>가능</span>
				</c:when>
				<c:otherwise>
					<span>불가능</span>
				</c:otherwise>
			</c:choose>
		</div>
		<br>
		<br><div class="col">
			<span>주차가능여부 : </span>	
			<c:choose>
				<c:when test="${estateVO.esParkingYn eq 'Y' }">
					<span>가능</span>
				</c:when>
				<c:otherwise>
					<span>불가능</span>
				</c:otherwise>
			</c:choose>
		</div>
		<br>
		<br><div class="col">
			<span>입주가능일 : </span>	
			<span>${estateVO.esMoveDate }</span>
		</div>
		<br>
		<br><div class="col">
			<span>옵션 : </span>	
			<span>${estateVO.esFacility }</span>
		</div>
		<br>
		<br><div class="col">
			<span>매물 장점 : </span>	
			<span>${estateVO.esAdvantage }</span>
		</div>
		<br>
		<br><div class="col">
			<span>거래상태 : </span>	
			<c:if test="${estateVO.esTradeYn eq 'Y' }">거래완료</c:if>
			<c:if test="${estateVO.esTradeYn eq 'S' }">거래중</c:if>
			<c:if test="${estateVO.esTradeYn eq 'N' }">거래취소</c:if>
		</div>
		<br>
		<br><div class="col">
			<span>조회수 : </span>	
			<span>${estateVO.hitCnt }</span>
		</div>
		<br><br><div class="col">
			<span>등록일 : </span>	
			<span>${estateVO.regDate3 }</span>
		</div>
		<div class="col table" >
			<p>등록 파일 </p>	
			<c:forEach var="file" items="${file }">
				<span><img style="width: 300px; height: 300px;" src="/resources/upload/user/estate/${file.storedFileName }"></span>	
			</c:forEach>
		</div>
		<br>
		<div class="row justify-content-center" >
			<div class="col-4">
				<button type="button" class="text-warning btn btn-outline-warning form-control" onclick="location.href='/admin/estate/main'">목록으로</button>
			</div>
		</div>
		<br>
	</div>
</main>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</html>
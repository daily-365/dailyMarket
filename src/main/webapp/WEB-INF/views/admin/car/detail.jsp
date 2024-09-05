<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자동차 상세페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<%@ include file="/resources/common/datepicker.jsp" %>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body class="conatainer-fluid">
<%@ include file="/resources/common/admin/header.jsp" %>
<br><br>
<div class="text-center fw-bold">
		<div class="col">
			<span>번호 : </span>	
			<span>${carVO.carNo }</span>
		</div>
		<br>
		<div class="col">
			<span>작성자 : </span>	
			<span>${carVO.carWriter }</span>
		</div>
		<br>
		<div class="col">
			<span>가격 : </span>	
			<span>${carVO.carPrice }</span>
		</div>
		<br>
		<div class="col">
			<span>거래상태 : </span>	
			<span>
				<c:if test="${carVO.carTradeYn eq 'Y' }">판매완료</c:if>
				<c:if test="${carVO.carTradeYn eq 'S'}">판매중</c:if>
				<c:if test="${carVO.carTradeYn eq 'N'}">판매취소</c:if>
			</span>
		</div>
		<br><div class="col">
			<span>차종 : </span>	
			<span>${carVO.carType }</span>
		</div>
		<br>
		<div class="col">
			<span>제조사 : </span>	
			<span>${carVO.carManuFacturing }</span>
		</div>
		<br>
		<div class="col">
			<span>이름 : </span>	
			<span>${carVO.carModel }</span>
		</div>
		<br>
		<div class="col">
			<span>둥급 : </span>	
			<span>${carVO.carRank }</span>
		</div>
		<br>
		<div class="col">
			<span>세부등급 : </span>	
			<span>${carVO.carDetailRank }</span>
		</div>
		<br>
		<div class="col">
			<span>연식 : </span>	
			<span>${carVO.carDiffDate }</span>
		</div>
		<br>
		<div class="col">
			<span>주행거리 : </span>	
			<span>${carVO.carDistance }</span>
		</div>
		<br>
		<div class="col">
			<span>배기량 : </span>	
			<span>${carVO.carDisplaceMent }</span>
		</div>
		<br>
		<div class="col">
			<span>연료 : </span>	
			<span>${carVO.carFuel }</span>
		</div>
		<br>
		<div class="col">
			<span>변속기 : </span>	
			<span>${carVO.carTransMission }</span>
		</div>
		<br><div class="col">
			<span>보험사고이력 (횟수) : </span>	
			<span>${carVO.carAccidentCnt }</span>
		</div>
		<br>
		<div class="col">
			<span>차량 특수용도 변경 여부 (Y/N) : </span>	
			<span>${carVO.carSpecialUseYn }</span>
		</div>
		<br>
		<div class="col">
			<span>소유자 변경이력 (횟수) : </span>	
			<span>${carVO.carChangeCnt }</span>
		</div>
		<br>
		<div class="col">
			<span>내외장 : </span>	
			<span>${carVO.carOption1 }</span>
		</div>
		<br>
		<div class="col">
			<span>안전 : </span>	
			<span>${carVO.carOption2 }</span>
		</div>
		<br>
		<div class="col">
			<span>편의 : </span>	
			<span>${carVO.carOption3 }</span>
		</div>
		<br>
		<div class="col">
			<span>추가정보 : </span>	
			<span>${carVO.carAdditionInfo }</span>
		</div>
		<br>
		<div class="col">
			<span>차량소개 : </span>	
			<span>${carVO.carIntro }</span>
		</div>
		<br>
		<div class="col">
			<span>위치 : </span>	
			<span>${carVO.carLoc }</span>
		</div>
		<br>
		<div class="col">
			<span>등록일 : </span>	
			<span><fmt:formatDate value="${carVO.regDate }" pattern="yyyy-MM-dd HH:mm:ss"/>	</span>
		</div>
		<br>
		<div class="col table" >
			<p>등록 파일 </p>	
			<c:forEach var="file" items="${file }">
				<span><img style="width: 300px; height: 300px;" src="/resources/upload/user/car/${file.storedFileName }"></span>	
			</c:forEach>
		</div>
		<br>
		<div class="row justify-content-center" >
			<div class="col-4">
				<button type="button" class="text-info btn btn-outline-info form-control" onclick="location.href='/admin/car/main'">목록으로</button>
			</div>
		</div>
		<br>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</html>
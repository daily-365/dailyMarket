<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고 상세페이지</title>
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
		<div class="col">
			<span>번호 : </span>	
			<span>${advertVO.advertNo} </span>
		</div>
		<br>
		<div class="col">
			<span>위치 : </span>	
			<span>${advertVO.location} </span>
		</div>
		<br>
		<div class="col">
			<span>연령 : </span>	
			<span>${advertVO.age} </span>
		</div>
		<br>
		<div class="col">
			<span>성별 : </span>	
			<c:if test="${advertVO.gender eq 'M'}">
				<span>남</span>
			</c:if>
			<c:if test="${advertVO.gender eq 'F'}">
				<span>여</span>
			</c:if>
		</div>
		<br>
		<div class="col">
			<span>등록일 : </span>	
			<span><fmt:formatDate value="${advertVO.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </span>
		</div>
		<br>
		<div class="col">
			<p>프로필 사진</p>	
			<img src="/resources/upload/owner/company/advert/${advertVO.storedFileName }" style="width: 300px; height: 300px;">
		</div>
		<br>
		<div class="col">
			<span>${advertVO.content } </span>
		</div>
		<br>
		<c:if test="${advertVO.priceType eq 'day' }">
		<div class="col">
			<span>예산형태 : </span>	
			<span class="text-primary">하루 예산</span>
		</div>
		<br>
		</c:if>
		<c:if test="${advertVO.priceType eq 'total' }">
		<div class="col">
			<span>예산형태 : </span>	
			<span  class="text-success">총 예산</span>
		</div>
		<br>
		</c:if>
		
		<div class="col">
			<span>예산 : </span>	
			<span><fmt:formatNumber value="${advertVO.price}" pattern="#,###"/> </span>
		</div>
		<br>
		
		<c:if test="${advertVO.startType eq 'now' }">
		<div class="col">
			<span>기간형태 : </span>	
			<span  class="text-primary">지금 시작 </span>
		</div>
		<br>
		</c:if>
		<c:if test="${advertVO.startType eq 'later' }">
		<div class="col">
			<span>기간형태 : </span>	
			<span  class="text-success">나중에 시작</span>
		</div>
		<br>
		</c:if>
		
		<div class="col">
			<span>기간 : </span>	
			<span>${advertVO.days} </span>
		</div>
		<br>
		<div class="col">
			<span>종료일 없이 계속 광고하기 : </span>	
			<span>${advertVO.endDateYn} </span>
		</div>
		<br>
		<div class="col">
			<span>상세 일정 설정하기 : </span>	
			<span>${advertVO.detailYn} </span>
		</div>
		<br>
		<div class="col">
			<span>광고비 지불 상태 : </span>	
			<c:if test="${advertVO.payStatus eq 'Y'}">
			<span class="text-primary">확인 완료</span>
			<button type="button" class="btn btn-danger text-danger" id="priceDisAgreeBtn">확인 불가</button>
			</c:if>
			<c:if test="${advertVO.payStatus eq 'S'}">
			<span class="text-warning">확인중</span>
			<button type="button" class="btn btn-primary text-primary" id="priceAgreeBtn">확인</button>
			<button type="button" class="btn btn-danger text-danger" id="priceDisAgreeBtn">확인 불가</button>
			</c:if>
			<c:if test="${advertVO.payStatus eq 'N'}">
			<span class="text-danger">확인 불가</span>
			<button type="button" class="btn btn-primary text-primary" id="priceAgreeBtn">확인</button>
			</c:if>
		</div>
		<br>
		<div class="col">
			<span>승인 상태 : </span>	
			<c:if test="${advertVO.approveStatus eq 'Y'}">
			<span class="text-primary">승인 완료</span>
			<button type="button" class="btn btn-danger text-danger" id="approveDisAgreeBtn">승인 불가</button>
			</c:if>
			<c:if test="${advertVO.approveStatus eq 'S'}">
			<span class="text-warning">승인 대기</span>
			<button type="button" class="btn btn-primary text-primary" id="approveAgreeBtn">승인</button>
			<button type="button" class="btn btn-danger text-danger" id="approveDisAgreeBtn">승인 불가</button>
			</c:if>
			<c:if test="${advertVO.approveStatus eq 'N'}">
			<span class="text-danger">승인 불가</span>
			<button type="button" class="btn btn-primary text-primary" id="approveAgreeBtn">승인</button>
			</c:if>
		</div>
		<br>
		
		<hr>
		<div class="col">
			<p class="h4">거래정보</p>	
			<div class="col">
				<span>계좌번호 : </span>	
				<span>${advertVO.accountNum}</span>
			</div>
			<div class="col">
				<span>은행 : </span>	
				<span>${advertVO.tradeBank}</span>
			</div>
			<div class="col">
				<span>입금액 : </span>	
				<span>
					￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${advertVO.saveMoney}"/>원
				</span>
			</div>
			<hr>
		</div>
		<br>
	<div class="row justify-content-center">
		<div class="col-4">
			<button type="button" class="btn btn-light form-control" onclick="javascript: location.href='/admin/advert/main'">목록 으로</button>
		</div>
	</div>
	<br>
</div>
</main>
<input type="hidden" id="advertNo" value="${param.advertNo }">
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	//입금 확인
	$("#priceAgreeBtn").on("click",function(){
		if(!confirm("입금 확인 처리하시겠습니까?")){
			return false;
		}else{
			$.ajax({
				url:"/admin/advert/payStatusY",
				type:"post",
				data: { "advertNo": $("#advertNo").val() },
				success:function(result){
					alert(result)
					location.reload(true)
				}
			})
		}
	});
	$("#priceDisAgreeBtn").on("click",function(){
		if(!confirm("입금 확인 불가 처리하시겠습니까?")){
			return false;
		}else{
			$.ajax({
				url:"/admin/advert/payStatusN",
				type:"post",
				data: { "advertNo": $("#advertNo").val() },
				success:function(result){
					alert(result)
					location.reload(true)
				}
			})
		}
	});
	
	//승인
	$("#approveAgreeBtn").on("click",function(){
		if(!confirm("승인 처리하시겠습니까?")){
			return false;
		}else{
			$.ajax({
				url:"/admin/advert/approveStatusY",
				type:"post",
				data: { "advertNo": $("#advertNo").val() },
				success:function(result){
					alert(result)
					location.reload(true)
				}
			})
		}
	});
	$("#approveDisAgreeBtn").on("click",function(){
		if(!confirm("승인 불가 처리하시겠습니까?")){
			return false;
		}else{
			$.ajax({
				url:"/admin/advert/approveStatusN",
				type:"post",
				data: { "advertNo": $("#advertNo").val() },
				success:function(result){
					alert(result)
					location.reload(true)
				}
			})
		}
	});
});

</script>



</html>
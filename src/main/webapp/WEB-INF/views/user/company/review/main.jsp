<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 리스트</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body class="container-fluid">
<%@ include file="/resources/common/user/header.jsp" %>	
<main class="container">
<br>
	<hr>
	<br>
	<div class="row">
		<div class="col-3">
		</div>
		<div class="col-2">
			<a href="/user/company/detail?busiNo=${param.busiNo}&busiNoticeNo=${param.busiNoticeNo}&busiReviewNo=${param.busiReviewNo}" class="text-dark fw-bold h5 ">홈</a>
		</div>
		<div class="col-2">
			<a href="/user/company/notice/main?busiNo=${param.busiNo}&busiNoticeNo=${param.busiNoticeNo}&busiReviewNo=${param.busiReviewNo}" class="text-dark fw-bold h5">소식</a>
		</div>
		<div class="col-2">
			<a href="/user/company/product/main?busiNo=${param.busiNo}&busiNoticeNo=${param.busiNoticeNo}&busiReviewNo=${param.busiReviewNo}" class="text-dark fw-bold h5">상품</a>
		</div>
		<div class="col-3">
			<a href="/user/company/review/main?busiNo=${param.busiNo}&busiNoticeNo=${param.busiNoticeNo}&busiReviewNo=${param.busiReviewNo}" class="text-dark fw-bold h5">후기</a>
		</div>
	</div>
	<br>
	<hr>
	<br>
	<h1 class="fw-bold text-center" style="font-family: '맑은고딕';  ">Review</h1>
	<br>
	<br>
	<br>
	<div class="row" id="reviewWrap">
		<c:forEach var="review" items="${review }" varStatus="status">
			<div class="col-3"></div>
			<div class="col-6">
			 	<img  class="bg-secondary rounded-circle"  src="/resources/upload/user/profile/${review.userStoredFileName }" style="width :100px; height: 100px;">  
					<br><br>
					<div class="fw-bold"> 	
						<span>${fn:substring(review.userAddr1,3,6) } </span>
						<span>
						<c:if test="${review.regMinute ne 0 and review.regMinute le 60 }">${review.regMinute }분 전</c:if>
						<c:if test="${review.regHour ne 0 and review.regHour le 24 }">${review.regHour }시간 전</c:if>
						<c:if test="${review.regDay ne 0 and review.regDay le 7 }">${review.regDay }일 전</c:if>
						<c:if test="${review.regWeek ne 0 and review.regWeek le 4 }">${review.regWeek }주 전</c:if>
						<c:if test="${review.regMonth ne 0 and review.regMonth le 12 }">${review.regMonth }달 전</c:if>
						<c:if test="${review.regYear ne 0  }">${review.regYear }년 전</c:if>
						</span>
					</div>
					<br>
					<a class="fw-bold h5" href="/user/company/review/detail?busiNo=${param.busiNo }&busiNoticeNo=${param.busiNoticeNo}&busiReviewNo=${review.busiReviewNo}">
						${review.title }
					</a>
					<br><br>
					<p class="fw-bold">${fn:substring(review.content,0,200 )}...</p>
					<img  src="/resources/upload/user/company/review/${review.reviewStoredFileName }" style="width: 300px; height: 300px;">
			<br><br>
			</div>
			<div class="col-3"></div>
		</c:forEach>
	</div>
	<br>
	<div class="row">
		<div class="col-3"></div>
		<div class="col-6">
			<button id="reviewMoreBtn" type="button" class="btn btn-dark form-control">후기 더보기</button>
		</div>
	</div>
	<br><br>
</main>
<input type="hidden" id="endRow">
<input type="hidden" id="busiNo" value="${param.busiNo }">
<input type="hidden" id="busiNoticeNo" value="${param.busiNoticeNo }">
<%@ include file="/resources/common/user/footer.jsp" %>	
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	var count =3;

	$("#reviewMoreBtn").on("click",function(){
		count+=3;
		$("#endRow").val(count)
		
		$.ajax({
			url :"/user/company/review/main",
			type:"post",
			data: {"endRow" :$("#endRow").val() ,
					"busiNo" : $("#busiNo").val()
					 },
			success:function(result){
				
				var reviewContent =''
				
				result.forEach(function(item,index){
				
					reviewContent+='<div class="col-3"></div>'
					reviewContent+='<div class="col-6">'
					reviewContent+='<img  class="bg-secondary rounded-circle"  src="/resources/upload/user/profile/'+item.userStoredFileName+'" style="width :100px; height: 100px;"> '
					reviewContent+='<br><br>'
					reviewContent+='<div class="fw-bold">' 	
					reviewContent+=	'<span>'+item.userAddr1.substring(3,6)+'</span>'
					reviewContent+=	'&nbsp;<span id="regDate_'+index +'">'
					reviewContent+=	'</span>'
					reviewContent+='</div>'
					reviewContent+='<br>'
					reviewContent+='<a class="fw-bold h5" href="/user/company/review/detail?busiNo='+$("#busiNo").val()+'&busiNoticeNo='+$("#busiNoticeNo").val()+'+&busiReviewNo='+item.busiReviewNo+'">'+item.title+'</a>'
					reviewContent+='<br>'
					reviewContent+='<p class="fw-bold">'+item.content.substring(0,200) +'...</p>'
					reviewContent+='<img  src="/resources/upload/user/company/review/'+item.reviewStoredFileName+'" style="width: 300px; height: 300px;">'
					reviewContent+='<br><br>'
					reviewContent+='</div>'
					reviewContent+='<div class="col-3"></div>'
				
				
					if(item.regMinute!=0 && item.regMinute<=60){
						$("#regDate_"+index).html(item.regMinute+"분 전")
						console.log(item.regMinute)
					}if(item.regHour!=0 && item.regHour<=24){
						$("#regDate_"+index).html(item.regHour+"시간 전")
						console.log(item.regHour)
					}
					if(item.regDay!=0 && item.regDay<=7){
						$("#regDate_"+index).html(item.regDay+"일 전")
						console.log(item.regDay)
					}
					if(item.regWeek!=0 && item.regMinute<=4){
						$("#regDate_"+index).html(item.regWeek+"주 전")
						console.log(item.regWeek)
					}
					if(item.regMonth!=0 && item.regMonth<=12){
						$("#regDate_"+index).html(item.regMonth+"달 전")
						console.log(item.regMonth)
					}
					if(item.regYear!=0 ){
						$("#regDate_"+index).html(item.regYear+"년 전")
						console.log(item.regYear)
					}
					
					
					$("#reviewWrap").html(reviewContent)
				
			
				});
			
			}
		
		});
	});
	
});


</script>
</html>
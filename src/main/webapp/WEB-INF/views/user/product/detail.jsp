<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style type="text/css">
svg {
 width: 30px;
 height: 30px;
}

img {
	margin-left: 80%;
	width: 500px;
	height: 500px;
}

</style>
</head>
<body class="container-fluid">
<%@include file="/resources/common/user/header.jsp"%>
<div class="container">
	
<main>
	<br><br>
	<div class="topCard cycle-slideshow  " 
		data-cycle-fx="carousel"
		data-cycle-timeout="1000"
		data-cycle-speed="1000"
		data-cycle-slides="> .slide"
		data-cycle-carousel-visible="1"
		data-cycle-carousel-vertical="false"
		data-cycle-log="false"
		data-cycle-pause-on-hover="true"
		data-cycle-pager="#per-slide-template"
		data-cycle-next="#next"
	    data-cycle-prev="#prev"
	    data-cycle-pager="#pager"
		>
	<c:forEach var="images" items="${productFile }">
		<div class="slide" data-cycle-pager-template="<span></span>">
			<a href="#" ><img src="/resources/upload/user/product/${images.productStoredFileName}" /></a>
		</div>
	</c:forEach>		
	</div>

	<br><br>

	<div id="buttons" class="text-center fw-bold text-dark h4">
	    <span data-cycle-cmd="prev">
	    	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-left-fill" viewBox="0 0 16 16">
	  			<path d="m3.86 8.753 5.482 4.796c.646.566 1.658.106 1.658-.753V3.204a1 1 0 0 0-1.659-.753l-5.48 4.796a1 1 0 0 0 0 1.506z"/>
			</svg>
		</span>
	    <span data-cycle-cmd="next">
	    	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
	  			<path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
			</svg>
		</span>
	</div>

	<div class="col-5 text-center" style="margin-left: 29%;">
		<hr>
		<span>
			<c:if test="${empty detail.profileFile  }">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
	  				<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
	  				<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"/>
				</svg>
			</c:if>
			<c:if test="${not empty detail.profileFile  }">
				<div class="">
					<img src="/resources/upload/user/profile/${detail.profileFile }" style="width: 100px; height: 100px; position:relative; right:220px;" class="img rounded-circle" >
				</div>
			</c:if>
		</span>
		
		<span class="fw-bold">&nbsp;${detail.writer }</span>
		<br><span class="fw-bold">&nbsp;${detail.location}</span>   
		<br>
		<hr>
		<p class="fw-bold text-dark h5">${detail.title }</p>
		<p><fmt:formatDate var="regDate" value="${detail.regDate }" pattern="yyyy년 MM월 dd일 HH시 mm분" />${regDate } </p>
		<p class="fw-bold text-dark h5"> <fmt:formatNumber var="price" value="${detail.price }" pattern="#,###"/>￦ ${price }원</p><br>
		<textarea class="form-control" rows="15"  readonly="readonly">${detail.content }</textarea> <br>
		<p class="fw-bold text-dark"><span>조회수 : ${detail.hitCnt } &nbsp;</span><span>추천 : ${detail.likeCnt } &nbsp;</span> </p>
	</div>
	<br>
	<div class="row text-center">
		<div class="col-4">
		</div>
		<div class="col-4">
			<c:if test="${detail.writer ne userId }">
				<c:if test="${empty product.productNo}">
					<svg class="text-danger" id="likeBtn" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
		 				<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/>
					</svg>
					<span id="likeChk" class="fw-bold text-danger">찜하기</span>
				</c:if>
				<c:if test="${not empty product.productNo}">
					<svg class="text-warning" id="likeCancleBtn" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
		 				<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/>
					</svg>
					<span id="likeCancleChk" class="fw-bold text-warning">취소하기</span>
				</c:if>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<svg class="text-warning" id="purChaseBtn" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-handbag" viewBox="0 0 16 16">
	  				<path d="M8 1a2 2 0 0 1 2 2v2H6V3a2 2 0 0 1 2-2m3 4V3a3 3 0 1 0-6 0v2H3.36a1.5 1.5 0 0 0-1.483 1.277L.85 13.13A2.5 2.5 0 0 0 3.322 16h9.355a2.5 2.5 0 0 0 2.473-2.87l-1.028-6.853A1.5 1.5 0 0 0 12.64 5zm-1 1v1.5a.5.5 0 0 0 1 0V6h1.639a.5.5 0 0 1 .494.426l1.028 6.851A1.5 1.5 0 0 1 12.678 15H3.322a1.5 1.5 0 0 1-1.483-1.723l1.028-6.851A.5.5 0 0 1 3.36 6H5v1.5a.5.5 0 1 0 1 0V6z"/>
				</svg>
				<span id="tradeBtn" class="fw-bold text-warning">채팅하기</span>
			</c:if>
					
		</div>
	</div>
</main>
</div>
<input type="text" id="productNo" value=${param.productNo } style="display: none;">
<input type="text" id="price" value=${detail.price } style="display: none;">
<input type="text" id="title" value="${detail.title }" style="display: none;">
<input type="text" id="content" value="${detail.content }" style="display: none;">
<input type="text" id="location" value="${detail.location }" style="display: none;">
<%@ include file="/resources/common/user/footer.jsp" %>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- jQuery Cycle2 Plugin CDN JS -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery.cycle2/20140216/jquery.cycle2.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	//찜하기
	$("#likeBtn").on("click",function(){
		$.ajax({
			url:"/user/product/like",
			type:"post",
			data: {"productNo" : $("#productNo").val(),
					"title" : $("#title").val(),
					"content" :$("#content").val(),
					"price" : $("#price").val(),
					"location" : $("#location").val()
					},
			success:function(result){
				alert(result)
				location.reload(true)
			}
		})
	});
	
	//찜하기 취소
	$("#likeCancleBtn").on("click",function(){
		$.ajax({
			url:"/user/product/like/cancle",
			type:"post",
			data: {"productNo" : $("#productNo").val()},
			success:function(result){
				alert(result)
				location.reload(true)
			}
		})
	});
	
	//바로구매
	$("#tradeBtn").on("click",function(){
		location.href="/user/trade/main?productNo="+$("#productNo").val()
	
	});
	
	
	
});
</script>
</html>
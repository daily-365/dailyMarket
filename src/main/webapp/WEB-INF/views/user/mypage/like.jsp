<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body class="container-fluid">
<main class="container">
<br>
<br>
<h4 class="text-center fw-bold">관심목록</h4>
<br>
<br>
	<c:forEach var="list" items="${likeList }" varStatus="status">
	<div id="wrap" style="border :1px solid black;">
		<br>
		<div class="row  justify-content-center">
			<div class="col-1 fw-bold">
				${status.count }
			</div>
			<div class="col-2">
				<img src="/resources/upload/user/product/${list.productStoredFileName }" style="width: 150px; height: 150px;">
				<br><br>
				<a href="/user/product/detail?productNo=${list.productNo }" class="fw-bold text-secondary"> ${fn:substring(list.content,0,50) }</a>
			</div>
			<div class="col-2 fw-bold">
				${list.title }
			</div>
			<div class="col-2 fw-bold">
			<c:choose>
				<c:when test="${list.price eq 0}">
					<p class="text-warning">나눔</p>
				</c:when>
				<c:otherwise>
					<p class="text-danger">￦<fmt:formatNumber type="number" value="${list.price }"  maxFractionDigits="3" />원</p>
				</c:otherwise>
			</c:choose>
			</div>
			<div class="col-3 fw-bold">
				<fmt:formatDate value="${list.likeDate }" pattern="yyyy-MM-dd HH:mm:ss"/> 
			</div>
		</div>
		<div class="row  justify-content-center">
			<div class="col-2">
				<button type="button" class="form-control btn btn-outline-warning">채팅하기</button>
			</div>
			<div class="col-2">
				<button type="button" class="form-control btn btn-outline-danger likeCancleBtn" value="${list.productNo }">취소하기</button>
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
<script type="text/javascript">
$(document).ready(function(){
	
	//찜하기 취소
	$(".likeCancleBtn").on("click",function(){
		$.ajax({
			url:"/user/product/like/cancle",
			type:"post",
			data: {"productNo" : $(this).val()},
			success:function(result){
				alert(result)
				location.reload(true)
			}
		})
	})
	
	
});
</script>
</html>
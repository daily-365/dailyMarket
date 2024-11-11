<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 동네생활</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body class="container-fluid">
<main class="container">
	<br>
	<h4 class="text-center fw-bold">내 동네생활</h4>
	<br>
	<br>
	<div class="row text-center jusitfy-content-center">	
	<div class="col-4">
		<p class="fw-bold">내 단골</p>
		<c:forEach var="connexion" items="${connexion }">
		<hr>
		<p class="fw-bold">${connexion.busiName }</p>
		<p>${connexion.busiType2 }</p>
		<p>${connexion.storeTel }</p>
		<p>${connexion.storeAddr } ${connexion.storeAddrDetail }</p>
		<p>${connexion.homePage }</p>
		<c:if test="${connexion.status eq 'Y' }">
		<p class="fw-bold text-primary">영업중</p>
		</c:if>
		<c:if test="${connexion.status eq 'N' }">
		<p class="fw-bold text-danger">영업정지</p>
		</c:if>
		<c:if test="${empty connexion.noticeYn or connexion.noticeYn eq 'N'  }">
		<button type="button" value="${connexion.busiNo }" class="fw-bold getBusiNoticeYBtn btn btn-light" >알림 받기
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
		 <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2M8 1.918l-.797.161A4 4 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4 4 0 0 0-3.203-3.92zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5 5 0 0 1 13 6c0 .88.32 4.2 1.22 6"/>
		</svg>
		</button>
		</c:if>
		<c:if test="${connexion.noticeYn eq 'Y' }">
		<button type="button" value="${connexion.busiNo }" class="fw-bold text-danger getBusiNoticeNBtn btn btn-light " >알림 해제
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
		 <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2M8 1.918l-.797.161A4 4 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4 4 0 0 0-3.203-3.92zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5 5 0 0 1 13 6c0 .88.32 4.2 1.22 6"/>
		</svg>
		</button >
		</c:if>
		
		</c:forEach>
	</div>
	<div class="col-4">
	 <p class="fw-bold">단골 소식</p>
		<c:forEach var="notice" items="${notice }">
	  	<hr>
	  	<p class="fw-bold">${notice.busiName }</p>
	  	<p>${notice.title }</p>
	  	<p>${notice.subTitle }</p>
	  	<p><img style="width: 300px; height: 200px;" src="/resources/upload/owner/company/notice/${notice.storedFileName }"></p>
	  	</c:forEach>
	</div>
	<div class="col-4">
	  <p class="fw-bold">내가 쓴 글</p>
	  <c:forEach var="review" items="${review }">
	  <hr>
	  <p class="fw-bold">${review.busiName }</p>
	  <p>${review.title }</p>
	  <p>${review.content }</p>
	  <p><fmt:formatDate value="${review.regDate }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></p>
	  </c:forEach>
	</div>
 </div>	
	
</main>
<br><br>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$(".getBusiNoticeYBtn").on("click",function(){
		if(!confirm("알림을 받으시겠습니까?")){
			return false;
		}else{
			$.ajax({
				url:"/user/mypage/connexion/noticeY",
				type:"post",
				data : {"busiNo" : $(this).val() },
				success:function(result){
					alert(result)
					location.reload(true)
				}
			});
		}
	});
	
	$(".getBusiNoticeNBtn").on("click",function(){
		if(!confirm("알림을 해제 하시겠습니까?")){
			return false;
		}else{
			$.ajax({
				url:"/user/mypage/connexion/noticeN",
				type:"post",
				data : {"busiNo" : $(this).val() },
				success:function(result){
					alert(result)
					location.reload(true)
				}
			});
		}
	});
	
});

</script>
</html>
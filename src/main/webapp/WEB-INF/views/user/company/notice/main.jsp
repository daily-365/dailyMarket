<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소식</title>
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
	<h1 class="fw-bold text-center" style="font-family: '맑은고딕';  ">Notice</h1>
 	<div id="noticeList" class="row justify-content-center">
		<c:forEach var="list" items="${noticeList }">
			<div class="row  justify-content-center">
				<div class="col-4">
					<br><br>
					<div class="text-center h5 fw-bold">${list.title}</div>
					<br>
					<a href="/user/company/notice/detail?busiNo=${param.busiNo}&busiNoticeNo=${list.busiNoticeNo }" class="text-center fw-bold text-dark">${list.subTitle }</a>
					<br><br>
				</div>
			</div>
			<div class="row  justify-content-center">
				<div class="col-2"></div>
				<div class="col-6">
					<img src="/resources/upload/owner/company/notice/${list.storedFileName }" style="width: 400px; height: 400px;">
					<br><br>
				</div>
			</div>
			<div class="row justify-content-center">
			<div class="col-5"></div>
			<div class="col-6">
				<span class="fw-bold ">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
					  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
					  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4"/>
					</svg>
					조회수 ${list.hitCnt }
				</span>
			</div>
		</div>
		</c:forEach>
	</div>
	<br><br>
	
	<br><br>
	<div class="row justify-content-center">
		<div class="col-6">
			<button type="button" id="noticeMoreBtn" class="btn btn-outline-secondary text-dark fw-bold form-control">소식 더보기</button>
		</div>
	</div>
</main>
<input type="hidden" id="endRow">
<input type="hidden" id="busiNo" value="${param.busiNo }">
<%@ include file="/resources/common/user/footer.jsp" %>	
<br><br>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var count =3;

	$("#noticeMoreBtn").on("click",function(){
		count+=3;
		$("#endRow").val(count)
		
		$.ajax({
			url :"/user/company/notice/main",
			type :"post",
			data : {"endRow" : $("#endRow").val(),
					"busiNo" : $("#busiNo").val()} ,
			success:function(result){
				
				var noticeMoreContent ='';
				
				result.forEach(function(item){
			
				noticeMoreContent+='<div class="row  justify-content-center">'
				noticeMoreContent+='<div class="col-4">'
				noticeMoreContent+='<br><br>'
				noticeMoreContent+='<div class="text-center h5 fw-bold">'+item.title+'</div>'
				noticeMoreContent+='<br>'
				noticeMoreContent+='<a href="/user/company/notice/detail?busiNo='+item.busiNo+'&busiNoticeNo='+item.busiNoticeNo +'" class="text-center fw-bold text-dark">'+item.subTitle +'</a>'
				noticeMoreContent+='<br><br>'
				noticeMoreContent+='</div>'
				noticeMoreContent+='</div>'
				noticeMoreContent+='<div class="row  justify-content-center">'
				noticeMoreContent+='<div class="col-2"></div>'
				noticeMoreContent+='<div class="col-6">'
				noticeMoreContent+='<img src="/resources/upload/owner/company/notice/'+item.storedFileName +'" style="width: 400px; height: 400px;">'
				noticeMoreContent+='<br><br>'
				noticeMoreContent+='</div>'
				noticeMoreContent+='</div>'
				noticeMoreContent+='<div class="row  justify-content-center">'
				noticeMoreContent+='<div class="col-2"></div>'
				noticeMoreContent+='<div class="col-6">'
				noticeMoreContent+='<span class="fw-bold h5">'
				noticeMoreContent+='<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">'
				noticeMoreContent+='<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/>'
				noticeMoreContent+='</svg>'
				noticeMoreContent+='관심 0'
				noticeMoreContent+='</span>'
				noticeMoreContent+='&nbsp;&nbsp;&nbsp;&nbsp;'
				noticeMoreContent+='<span class="fw-bold h5">'
				noticeMoreContent+='<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-emoji-laughing" viewBox="0 0 16 16">'
				noticeMoreContent+='<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>'
				noticeMoreContent+='<path d="M12.331 9.5a1 1 0 0 1 0 1A5 5 0 0 1 8 13a5 5 0 0 1-4.33-2.5A1 1 0 0 1 4.535 9h6.93a1 1 0 0 1 .866.5M7 6.5c0 .828-.448 0-1 0s-1 .828-1 0S5.448 5 6 5s1 .672 1 1.5m4 0c0 .828-.448 0-1 0s-1 .828-1 0S9.448 5 10 5s1 .672 1 1.5"/>'
				noticeMoreContent+='</svg>'
				noticeMoreContent+='댓글 0'
				noticeMoreContent+='</span>'
				noticeMoreContent+='</div>'
				noticeMoreContent+='</div>'
				
				$("#noticeList").html(noticeMoreContent)
				
				});
			
			}
		
		});
	
	});


});


</script>
</html>
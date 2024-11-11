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
			<c:if test="${list.tradeYn eq 'S' }">
				<c:if test="${chatYn eq false }">
					<div class="col-4">
						<button type="button" value="${list.productUserNo }"  class="form-control btn btn-outline-warning chatModalClickBtn" data-bs-toggle="modal" data-bs-target=".chatModal">채팅하기</button>
					</div>
				</c:if>
				<c:if test="${chatYn eq true }">
					<div class="col-4">
						<button type="button" onclick="javascript:location.href='/user/trade/main;'" class="form-control btn btn-outline-danger">구매하기</button>
					</div>
				</c:if>
				<div class="col-4">
					<button type="button" class="form-control btn btn-danger likeCancleBtn" value="${list.productNo }">취소하기</button>
				</div>
			</c:if>
			<c:if test="${list.tradeYn eq 'Y' }">
				<div class="col-4">
					<button type="button" class="btn btn-primary form-control" onclick="javascript: location.href='/user/mypage/purchase'">구매 완료</button>
				</div>
			</c:if>
		</div>
		<br>
	</div>
	</c:forEach>	
	

<!-- 채팅 모달 -->
<div class="modal fade chatModal" id="chatModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">채팅방 만들기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <input type="text" class="title form-control" id="title" placeholder="채팅방 제목을 입력해 주세요">
        <input type="hidden" id="targetUserNo" >
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary createChatRoomBtn" >채팅방 만들기</button>
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
</main>
<input type="hidden" id="userId" value="${userId }">
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
	
	
	//채팅 모달 띄우기 버튼 클릭시
	$(".chatModalClickBtn").on("click",function(){
		//모달버튼에 있는 value값 -> 모달 안에 있는 targetUserNo Input에 삽입 
		$("#targetUserNo").val($(this).val())
	
	});
	
	//판매자와의 채팅
	$(".createChatRoomBtn").on("click",function(){

			var params = {			
						"title" :$("#title").val()	,
						"targetUserNo" : $("#targetUserNo").val(),
						"userType" : 'user'
						}
			$.ajax({
				url:"/chat/openChatRoom",
				type:"post",
				data : params,
				success:function(result){
					location.href='/chat/room?roomNo='+result
				}
			});
		
	});
	
});
</script>
</html>
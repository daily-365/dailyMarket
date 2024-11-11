<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"></head>
</head>
<body class="container-fluid">
<main class="container">
	<br>
	<h4 class="fw-bold text-center">채팅</h4>
	<br>
	
	<div class="row justify-content-center" >
			
			<div class="row">
				<c:forEach var="joinMsg" items="${joinMsg}" >
					<c:if test="${joinMsg.userNo ne userNo }">
						<div class="fw-bold text-secondary col-6 offset-md-4">
							${joinMsg.userNick }님이 입장하셨습니다. 
							<fmt:formatDate value="${joinMsg.joinDate }" pattern="yyyy-MM-dd HH:mm:ss"/>   
						</div>
					</c:if>
					<br><br>
				</c:forEach>
			 </div>
			 
			 
			<c:forEach var="list" items="${list }" varStatus="status">
			  	<!-- 
			  	<div class="row">
					<c:if test="${ list.dateDiff lt 0 }">
						<div class="text-center fw-bold text-secondary"><fmt:formatDate value="${list.createDate }" pattern="yyyy-MM-dd(E)요일"/></div><br><br>
					</c:if>
					<c:if test="${ list.dateDiff eq 0}">
						<div class="text-center fw-bold text-secondary">오늘</div><br><br>
					</c:if>
				</div>
				 -->
				 
				<c:choose>
					<c:when test="${list.userNo eq userNo }">
						<div class="row">
							<div class="fw-bold text-warning text-end col-9" >
								<img class="rounded-circle" style="width:50px; height: 50px;" src="/resources/upload/user/profile/${list.storedFileName }">
								${fn:substring(list.message,0,50) }<br>
								<c:if test="${fn:length(list.message) gt 50 }">
									${fn:substring(list.message,50,100) }<br>
								</c:if>
								<c:if test="${fn:length(list.message) gt 60 }">
									${fn:substring(list.message,100,150) }<br>
								</c:if>
								<fmt:formatDate value="${list.createDate }" pattern="a H:mm"/>
								<br>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="row">
							<div class="fw-bold text-dark text-start offset-md-3 col-6" >
								<img class="rounded-circle" style="width:50px; height: 50px;" src="/resources/upload/user/profile/${list.storedFileName }">
								${list.userNick} : ${fn:substring(list.message,0,50) }<br>
								<c:if test="${fn:length(list.message) gt 50 }">
									${fn:substring(list.message,50,100) }<br>
								</c:if>
								<c:if test="${fn:length(list.message) gt 60 }">
									${fn:substring(list.message,100,150) }<br>
								</c:if>
								<fmt:formatDate value="${list.createDate }" pattern="a H:mm"/>
								<br>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
	<br>
	
	 <div class="row">
		<c:forEach var="exitMsg" items="${exitMsg}">
			<c:if test="${exitMsg.userNo ne userNo }">
				<div class="fw-bold text-secondary col-6 offset-md-4">
					${exitMsg.userNick }님이 퇴장하셨습니다. 
					<fmt:formatDate value="${exitMsg.joinDate }" pattern="yyyy-MM-dd HH:mm:ss"/>   
				</div>
			</c:if>
			<br><br>
		</c:forEach>
 	</div>
	
	 
	<div class="row justify-content-center ">
		<div class="col-4 offset-md-2">
			<input class="form-control" type="text" id="sendMessageInput" maxlength="150">
		</div>
		<div class="col-2">
			<button type="button" id="sendMessageBtn" class="btn btn-outline-warning form-control">메세지 보내기</button>
		</div>
		<div class="col-2">
			<button type="button" id="exitChatRoomBtn" class="btn btn-outline-danger form-control">채팅방 나가기</button>
		</div>
	</div>
	<br>
	<input type="hidden" id="roomNo" value="${param.roomNo }">
	<input type="hidden" id="userNo" value="${userNo }">
</main>
</body>
<!-- Jquery  -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- BootStrap  -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
 <!-- https://github.com/sockjs/sockjs-client -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	
	$("#sendMessageBtn").on("click",function(){
		if(!$("#sendMessageInput").val()){
			alert("메세지를 입력해 주세요")
			return false;
		}else{
			var params = {
					"userNo" : $("#userNo").val(),
					"roomNo" : $("#roomNo").val(),
					"message" : $("#sendMessageInput").val()
					}
			$.ajax({
				url:"/chat/room",
				type:"post",
				data: params,
				success:function(result){
					location.reload(true)
				}
			});
		}
	})
	
	//채팅방 나가기
	$("#exitChatRoomBtn").on("click",function(){
		
		if(!confirm("채팅방을 나가시겠습니까?")){
			return false;
		}else{
			var params = {
					      "userNo" : $("#userNo").val(),
					      "roomNo" : $("#roomNo").val()
							}
			$.ajax({
				url :"/chat/exit",
				type:"post",
				data : params,
				success:function(result){
					location.href='/chat/roomList'
				}
			})
		}
	});
	
	
});

</script>

</html>
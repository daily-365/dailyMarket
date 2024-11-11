<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"></head>
<body class="container-fluid">
	<main class="container">
		<br><br>
		<h4 class="fw-bold text-center">채팅 목록</h4>
		<br><br>
		<div class="row justify-content-center bg-dark text-white fw-bold" style="padding: 15px;">
			<div class="col-2">
				<div>#</div>
			</div>
			<div class="col-3">
				<div>제목</div>
			</div>
			<div class="col-2">
				<div>개설자</div>
			</div>
			<div class="col-2">
				<div>참여자</div>
			</div>
			<div class="col-3">
			</div>
		</div>
		
		<br>
		<hr>
		<p class="fw-bold text-center h5">관리자</p>
		<hr>
		<br>
		<c:forEach var="adminList" items="${adminList }" varStatus="status"> 
			<div class="row justify-content-center bg-light  text-dark fw-bold" style="padding: 15px;">
				<div class="col-2">
					<div>${status.count }</div>
				</div>
				<div class="col-3">
				</div>
				<div class="col-2">
					<div>${adminList.userId }</div>
				</div>
				<div class="col-2">
					<div>관리자</div>
				</div>
				<div  class="col-3">
					<button type="button" class="btn btn-secondary fw-bold adminChatBtn" data-bs-toggle="modal" data-bs-target="#chatModal" >들어가기</button>
				</div>
			</div>
		</c:forEach>
		
		<br>
		<hr>
		<p class="fw-bold text-center h5">사장님</p>
		<hr>
		<br>
	
		<c:forEach var="list" items="${list }" varStatus="status">
			<!-- 대화상대가 사장님일 경우 -->
			<c:if test="${list.userType eq 'owner' }">
				<div class="row justify-content-center bg-light  text-dark fw-bold" style="padding: 15px;">
					<div class="col-2">
						<div>${status.count }</div>
					</div>
					<div class="col-3">
						<div>${list.title }</div>
					</div>
					<div class="col-2">
						<div>${list.userNick }</div>
					</div>
					<div class="col-2">
						<div>${list.targetUserNick }</div>
					</div>
					<div  class="col-3">
						<button type="button" class="btn btn-secondary fw-bold joinChatRoomBtn"  value="${list.roomNo }">들어가기</button>
					</div>
				</div>
			</c:if>
		</c:forEach>
		
		<br>
		<hr>
		<p class="fw-bold text-center h5">사용자</p>
		<hr>
		<br>
		<c:forEach var="list" items="${list }" varStatus="status">
			<!-- 대화상대가 사용자일 경우 -->
			<c:if test="${list.userType eq 'user' }">
				<!-- 대화상대 사용자 번호일치 / 로그인한 사용자 번호일치 -->
				<c:if test="${list.targetUserNo eq userNo  or list.userNo eq userNo}">
					<div class="row justify-content-center bg-light  text-dark fw-bold" style="padding: 15px;">
						<div class="col-2">
							<div>${status.index }</div>
						</div>
						<div class="col-3">
							<div>${list.title }</div>
						</div>
						<div class="col-2">
							<div>${list.userNick }</div>
						</div>
						<div class="col-2">
							<div>${list.targetUserNick }</div>
						</div>
						<div  class="col-3">
							<button type="button" class="btn btn-secondary fw-bold joinChatRoomBtn"  value="${list.roomNo }">들어가기</button>
						</div>
					</div>
				</c:if>
			</c:if>
		</c:forEach>
		<br>
	</main>
<!-- 채팅 모달 -->
<div class="modal fade chatModal" id="chatModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">1:1 채팅 문의</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
		  <div class="container-fluid">
		  	<div class="row">
		 		<div id="messageList" ></div>
		 	</div>
		 	<br>
		   	<textarea  id="message" class="form-control" rows="5" maxlength="100">
		   	</textarea>
		  </div>
		</div>
      <div class="modal-footer">
      	<button type="button" id="writeChatMessageBtn" class="btn btn-dark text-light fw-bold" >메세지 입력</button>
        <button type="button" class="btn btn-secondary text-light fw-bold" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
</body>
<input type="hidden" value="<%=session.getAttribute("userNo") %>" id="userNo">
<input type="hidden" value="<%=session.getAttribute("userId") %>" id="userId">
<!-- Jquery  -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- BootStrap  -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
 <!-- https://github.com/sockjs/sockjs-client -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	
	//채팅방 참여하기
	$(".joinChatRoomBtn").on("click",function(){
		location.href="/chat/room?roomNo="+$(this).val()
	});
	
	//관리자와 채팅
	//메세지 보내기
	 $("#writeChatMessageBtn").on("click",function(){
		 
		 var params = {
				 		"targetUserNo" : $("#userNo").val(),
				 		"userId" : $("#userId").val(),
				 		"message" : $("#message").val()
				  
		 				}
		 
		 $.ajax({
			url :"/admin/chat",
			type:"post",
			data:  params,
			success: function(result){
				$("#messageList").append("<p>"+$("#userId").val()+"</p>"
						+"<p>"+result.substring(0,30)+"</p>"
						+"<p>"+result.substring(30,60)+"</p>"
						+"<p>"+result.substring(60,90)+"</p>"
						+"<p>"+result.substring(90,120)+"</p>"
						+"<p>"+result.substring(120,150)+"</p>"
												)
				$("#message").val('')
			}
		 })
	 });
	   
	   
	//메세지 리스트
	$.ajax({
		url :"/admin/chatList",
		type:"post",
		success: function(result){
		
			result.forEach(function(item){
				var year = new Date(item.createDate).getFullYear()
				var month = new Date(item.createDate).getMonth()+1
					if(String(month).length==1)
						month="0"+month
				var day = new Date(item.createDate).getDay()
					if(String(day).length==1)
						day="0"+day
						
				var hour = new Date(item.createDate).getHours()	
					if(String(hour).length==1)
						hour="0"+hour
				var minute = new Date(item.createDate).getMinutes()	
					if(String(minute).length==1)
						minute="0"+minute
				var second = new Date(item.createDate).getSeconds()	
					if(String(second).length==1)
						second="0"+second
				
				
				$("#messageList").append("<p class='fw-bold'>"+item.userId+"</p>"
												+"<p>"+year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second+"</p>"	
												+"<p>"+item.message.substring(0,30)+"</p>"
												+"<p>"+item.message.substring(30,60)+"</p>"
												+"<p>"+item.message.substring(60,90)+"</p>"
												+"<p>"+item.message.substring(90,120)+"</p>"
												+"<p>"+item.message.substring(120,150)+"</p>"
												)		
				
				
				
			})
			
		}
	})

 	
	
});

</script>
</html>
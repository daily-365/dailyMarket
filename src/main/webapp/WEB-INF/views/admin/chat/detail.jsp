<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅 상세페이지</title>
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
			
			<c:forEach var="list" items="${list }">
				<c:if test="${list.userId ne 'admin' }">
					<p><fmt:formatDate value="${list.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/> </p>
					<p>${list.userId }</p>
					<p class="col-4 offset-md-4">
						${list.message }
					</p>
				</c:if>
				<input type="hidden" value="${list.targetUserNo }" id="userNo">
				<c:if test="${list.userId eq 'admin' }">
					<p class="text-warning"><fmt:formatDate value="${list.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/> </p>
					<p class="text-warning">관리자</p>
					<p class="text-warning  col-4 offset-md-4 ">
						${list.message }
					</p>
				</c:if>
			</c:forEach>
		</div>
		<br>
		
		<div class="row justify-content-center" >
			<div class="col-4">
				<input type="text" id="adminMessageInput" class="form-control"><br>
				<button type="button" class="btn btn-light form-control" id="adminMessageBtn">답변하기</button>
			</div>
		</div>
		<br>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#adminMessageBtn").on("click",function(){
		$.ajax({
			url:"/admin/chat",
			type:"post",
			data : { "message": $("#adminMessageInput").val(),
					 "userId" : "admin", 
					 "targetUserNo" : $("#userNo").val()
					 },
			success:function(result){
				console.log(result)
				location.reload(true)
			}
		})
	});
	
})

</script>
</html>
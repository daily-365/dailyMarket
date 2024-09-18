<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.wrap {
	margin-top: 150px;
}
</style>
<!-- BootStrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>Admin Login</title>
</head>
<body class="container-fluid">
	<div class="wrap d-flex justify-content-center">
		<form class="form" method="post" id="loginForm">
		<h4 class="text-center">Admin Login</h4><br>
			<div class="col-auto">
				<label for="userId" class="form-label fw-bold"><span class="fw-bold text-danger">※ </span> 아이디</label>
				<input id="userId" type="text" class="form-control" name="userId">
			</div><br>
			<div class="col-auto">
				<label for="userId" class="form-label fw-bold"><span class="fw-bold text-danger">※ </span> 비밀번호</label>
				<input id="userPass" type="password" class="form-control" name="userPass">
			</div><br>
			<div class="col-auto">
				<button type="button" id="loginBtn" class="form-control btn btn-dark">로그인</button>
			</div>
			<c:if test="${not empty failMsg }">
			<br>
			<div class="col-auto">
				<div class="fw-bold"><span class="text-danger">※ </span> ${failMsg }</div>		
			</div>
			</c:if>
		</form>
	</div>
</body>
<!-- Jquery  -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- BootStrap  -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#loginBtn").on("click",function(){
		if(!$("#userId").val()){
			alert("아이디를 입력해 주세요")
			$("#userId").focus()
			return false;
		}else if(!$("#userPass").val()){
			alert("비밀번호를 입력해 주세요")
			$("#userPass").focus()
			return false;
		}else{
			$("#loginForm").attr("action","/admin/login")
			$("#loginForm").submit()
		}
	
	})

});

</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login Page</title>
<style type="text/css">
html,
body {
  height: 100%;
}

body {
  display: flex;
  align-items: center;
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #f5f5f5;
}

.form-signin {
  max-width: 330px;
  padding: 15px;
}

.form-signin .form-floating:focus-within {
  z-index: 2;
}

.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
.bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
      
   svg{
   	width:50px;
   	height:50px;
   }
</style>
</head>
<!-- BootStrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<body class="text-center">
    
<main class="form-signin w-100 m-auto">
  <form id="loginForm" method="post">
    <svg  xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-add" viewBox="0 0 16 16">
  		<path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h4a.5.5 0 1 0 0-1h-4a.5.5 0 0 1-.5-.5V7.207l5-5 6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293z"/>
 		<path d="M16 12.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0m-3.5-2a.5.5 0 0 0-.5.5v1h-1a.5.5 0 0 0 0 1h1v1a.5.5 0 1 0 1 0v-1h1a.5.5 0 1 0 0-1h-1v-1a.5.5 0 0 0-.5-.5"/>
	</svg>
    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

    <div class="form-floating">
      <input type="text" class="form-control userId" id="floatingInput"  name="userId" placeholder="Id">
      <label for="floatingInput">Id</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control userPass" id="floatingPassword " name="userPass" placeholder="Password">
      <label for="floatingPassword">Password</label>
    </div>
    
    <c:if test="${not empty failMsg }">
    <div class="form-floating"><br>
		<div id="failMsg" class="fw-bold"><span class="text-danger">※ </span> ${failMsg }</div>
	</div>
	<br>
	</c:if>
	
    <div class="checkbox mb-3">
      <label>
        <input id="reUserInfo" name="reUserInfo" type="checkbox" > Remember me
      </label>
    </div>
    <button class="w-100 btn btn-lg btn-primary" id="loginBtn" type="button">Sign in</button><br><br>
    <button class="w-100 btn btn-lg btn-danger" type="button" onclick="javascript: location.href='/user/regist'">Sign up</button>
    <p class="mt-5 mb-3 text-muted">&copy; 2019–2024</p>
  </form>
</main>


    
</body>
  <!-- Jquery  -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- BootStrap  -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<!-- chart js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	//아이디 기억하기를 체크한 후 아이디 값 넣어주기 (체크도 선택되도록)
	var id= localStorage.getItem("userId")
	
	if(id){
		$(".userId").val(id)
		$("#reUserInfo").attr("checked",true)
	}else{
		$("#reUserInfo").attr("checked",false)
		
	}
	
	
	
	$("#loginBtn").on("click",function(){
		if(!$(".userId").val()){
			alert("아이디를 입력해 주세요")
			$(".userId").focus()
			return false;
		}else if(!$(".userPass").val()){
			alert("비밀번호를 입력해 주세요")
			$(".userPass").focus()
			return false;
		}else{
			if($("#reUserInfo").is(":checked")){
				var userId =$(".userId").val()
				localStorage.setItem("userId",userId)
				
				$("#loginForm").attr("action","/user/login")
				$("#loginForm").submit()
			}else{
				$("#loginForm").attr("action","/user/login")
				$("#loginForm").submit()
			}
		}
		
	});
	
	
	$("#reUserInfo").on("click",function(){
		if($("#reUserInfo").is(":checked")){
			if(!confirm("아이디를 기억하시겠습니까?")){
				return false;
			}else {
				if(!$(".userId").val()){
					alert("아이디를 입력해 주세요")
					$(".userId").focus()
					return false;
				}else if(!$(".userPass").val()){
					alert("비밀번호를 입력해 주세요")
					$(".userPass").focus()
					return false;
				}else{
					var userId =$(".userId").val()
					localStorage.setItem("userId",userId)
				}
			}
		}else{
			alert("아이디를 기억하지 않습니다.")
			localStorage.removeItem("userId")
			location.reload(true)
		}
	});

});

</script>
</html>
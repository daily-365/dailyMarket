<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주묻는 질문</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body class="container-fluid">
<main class="container col-6 offset-md-3">
	<br><br>
	<h5 class="fw-bold">
		<svg style="width: 30px; height: 30px;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-quora" viewBox="0 0 16 16">
  		<path d="M8.73 12.476c-.554-1.091-1.204-2.193-2.473-2.193-.242 0-.484.04-.707.142l-.43-.863c.525-.45 1.373-.808 2.464-.808 1.697 0 2.568.818 3.26 1.86.41-.89.605-2.093.605-3.584 0-3.724-1.165-5.636-3.885-5.636-2.68 0-3.839 1.912-3.839 5.636 0 3.704 1.159 5.596 3.84 5.596.425 0 .811-.046 1.166-.15Zm.665 1.3a7 7 0 0 1-1.83.244C3.994 14.02.5 11.172.5 7.03.5 2.849 3.995 0 7.564 0c3.63 0 7.09 2.828 7.09 7.03 0 2.337-1.09 4.236-2.675 5.464.512.767 1.04 1.277 1.773 1.277.802 0 1.125-.62 1.179-1.105h1.043c.061.647-.262 3.334-3.178 3.334-1.767 0-2.7-1.024-3.4-2.224Z"/>
		</svg>고객센터
	</h5>
	<hr>
	<form class="form">
	<h4 class="fw-bold">안녕하세요,</h4>
	<h4 class="fw-bold">무엇을 도와드릴까요?
	<svg style="width: 30px; height: 30px;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-question-lg" viewBox="0 0 16 16">
  		<path fill-rule="evenodd" d="M4.475 5.458c-.284 0-.514-.237-.47-.517C4.28 3.24 5.576 2 7.825 2c2.25 0 3.767 1.36 3.767 3.215 0 1.344-.665 2.288-1.79 2.973-1.1.659-1.414 1.118-1.414 2.01v.03a.5.5 0 0 1-.5.5h-.77a.5.5 0 0 1-.5-.495l-.003-.2c-.043-1.221.477-2.001 1.645-2.712 1.03-.632 1.397-1.135 1.397-2.028 0-.979-.758-1.698-1.926-1.698-1.009 0-1.71.529-1.938 1.402-.066.254-.278.461-.54.461h-.777ZM7.496 14c.622 0 1.095-.474 1.095-1.09 0-.618-.473-1.092-1.095-1.092-.606 0-1.087.474-1.087 1.091S6.89 14 7.496 14"/>
	</svg>
	</h4>
	<br>
	<input type="text" placeholder="궁금한 것을 검색해보세요" class="form-control bg-light" id="keyword" value="${param.keyword }" >
	<br>
	<hr>
	<br>
	<c:if test="${empty param.keyword }">
	<h5 class="fw-bold">자주 묻는 질문</h5>
	<br>
	<hr>
	<br>
	<div class="row">
		<c:forEach var="list" items="${hitList}">
			<div class="col-9">
		 		<h6>${list.title}</h6><br>
		 	</div>
		 	<div class="col-3">
		 		<a href="/user/inquiry/detail?inquiryNo=${list.inquiryNo }" class="form-control btn btn-light">상세보기</a>
		 	</div>
		</c:forEach>
	</div>
	<br>
	<hr>
	<br>
	<c:set var="inquiryLen" value="${fn:length(writerList)}" />
	<c:if test="${inquiryLen gt 0}">
		<div class="row">
			<div class="col-9">
				<h5 class="fw-bold">내가 한 질문</h5>
			</div>
		</div>
		<br><br>
		<c:forEach var="inquiryVO" items="${writerList }">
			<div class="row">
				<div class="col-9">${inquiryVO.title }</div>
				<div class="col-3">
					<a href="/user/inquiry/detail?inquiryNo=${inquiryVO.inquiryNo }"   class="btn btn-light form-control">답변보기</a>
				</div>
			</div>
			<br>
		</c:forEach>
	</c:if>
	<br>
	<hr>
	<br>
	</c:if>
	
	<c:if test="${not empty param.keyword }">
		<div class="row">
			<div class="col-9">
				<h5 class="fw-bold">검색한 질문</h5>
			</div>
		</div>
		<br><br>
		<c:forEach var="list" items="${list }">
			<div class="row">
				<br><br>
				<div class="col-9">${list.title }</div>
				<div class="col-3">
					<a href="/user/inquiry/detail?inquiryNo=${list.inquiryNo }"   class="btn btn-light form-control">상세보기</a>
				</div>
			</div>
			<br>
		</c:forEach>
		<hr>
		<br>
	</c:if>
	
	<div class="row">
		<div class="col-9">
			<h6 class="fw-bold">도움이 필요하신가요?</h6>
		</div>
		<div class="col-3">
			<button type="button" onclick="javascript: location.href='/user/inquiry/write'" class="btn btn-light form-control">문의하기</button>
		</div>
	</div>
	</form>
</main>
<br><br>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#keyword").on("keydown",function(e){
		if(e.key=="Enter"){
			self.location="/user/inquiry/main?keyword="+$("#keyword").val()
		    return false;
			// return false 추가시 alert 사용 안해도 작동.
			// alert($("#keyword").val())
		}
	});
});


</script>
</html>
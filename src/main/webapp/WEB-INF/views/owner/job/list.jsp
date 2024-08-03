<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구인 정보 현황</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body class="container-fluid">
<main class="container">
	<br><br>
	<h5 class="fw-bold text-center">지원자 정보</h5>
	<br><br>
	<table class="table table-hover table-bordered table-light">
		<thead>
			<tr>
				<th>#</th>
				<th>사진</th>
				<th>지원일시</th>
				<th>지원자 아이디</th>
				<th>이름</th>
				<th>연락처</th>
				<th>성별</th>
				<th>출생연도</th>
				<th>경력</th>
				<th>회사명</th>
				<th>직무</th>
				<th>입사연도</th>
				<th>기간</th>
				<th>장점</th>
				<th>소개</th>
				<th>추가정보</th>
				<th>승인상태</th>
				<th>합격</th>
				<th>불합격</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${list }" varStatus="status">
			<tr>
				<td>${status.count }</td>
				<td><img src="/resources/upload/user/job/${list.storedFileName }" style="width:120px;; height: 120px;"></td>
				<td><fmt:formatDate value="${list.regDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${list.writer }</td>
				<td>${list.lastName }${list.firstName }</td>
				<td>${list.tel }</td>
				<td>${list.gender }</td>
				<td>${list.birthYear }</td>
				<td><c:if test="${empty list.careerYn  }">있음</c:if></td>
				<td>${list.careerLoc }</td>
				<td>${list.careerWork }</td>
				<td>${list.careerYear }</td>
				<td>${list.careerDiff }</td>
				<td>${list.advantage }</td>
				<td>${list.introduce }</td>
				<td>${list.addInfo }</td>
				<td class="fw-bold">
					<c:if test="${list.status  eq 'S'}"><span class="text-warning">대기</span></c:if>
					<c:if test="${list.status  eq 'Y'}"><span class="text-primary">합격</span></c:if>
					<c:if test="${list.status  eq 'N'}"><span class="text-danger">불합격</span></c:if>
				</td>
				<td>
					<button type="button" class="btn btn-outline-primary passBtn" value="${list.getUserJobNo }">합격</button>
				</td>
				<td>
					<button type="button" class="btn btn-outline-danger pailBtn"  value="${list.getUserJobNo }">불합격</button>
				</td>
			</tr>
			</c:forEach>
		</tbody>	
	</table>

</main>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	$(".passBtn").on("click",function(){
		if(!confirm("합격 처리 하시겠습니까?")){
			return false;
		}else{
			$.ajax({
				url : "/owner/job/statusY",
				type :"post",
				data : {  "getUserJobNo" :$(this).val() },
				success:function(result){
					alert(result)
					location.reload(true)
				}
			
			});
		}
	});

	$(".pailBtn").on("click",function(){
		if(!confirm("불 합격 처리 하시겠습니까?")){
			return false;
		}else{
			$.ajax({
				url : "/owner/job/statusN",
				type :"post",
				data : {  "getUserJobNo" :$(this).val() },
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
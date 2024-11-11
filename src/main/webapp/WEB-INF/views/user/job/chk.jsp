<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알바 지원 확인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body class="container-fluid">
<main class="container">
	<br>
	<h4 class="fw-bold text-center">데일리 알바 지원내역</h4>
	<br>
	<c:forEach var="list" items="${list}">
	<table class="row table table-hover justify-content-center">
		<tbody>
			<tr>	
				<td class="col-2"><fmt:formatDate value="${list.regDate }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
				<td class="col-2"><a href="/user/job/detail?jobNo=${list.jobNo }">${list.jobCompany }</a></td>
				<td class="col-2">${list.jobTitle }</td>
				<c:if test="${list.status eq 'S' }">
					<td class="text-success fw-bold col-2">지원완료</td>
					<td><button  type="button" class="jobCancleBtn btn btn-outline-danger col-3 " value="${list.jobNo }">지원 취소</button></td>
				</c:if>
				<c:if test="${list.status eq 'Y' }"><td class="text-primary fw-bold col-2">합격 </td></c:if>
				<c:if test="${list.status eq 'N' }"><td class="text-danger fw-bold col-2">불합격</td></c:if>
			</tr>
		</tbody>
	</table>
	</c:forEach>
		
</main>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$(".jobCancleBtn").on("click",function(){
		if(!confirm("지원을 취소 하시겠습니까?")){
			return false;
		}else{
			$.ajax({
				url:"/user/job/chk/del",
				type:"post",
				data :  { "jobNo" : $(this).val() },
				success :function(result){
					alert(result);
					location.reload(true);
				}
			})
		}
	})
	
});

</script>


</html>
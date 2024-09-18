<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body class="container-fluid">
<main class="container">
<br><br>
	<h5 class="fw-bold text-center">데일리 공지사항</h5>
	<br>
	<table class="table table-hover fw-bold">
		<thead>
			<tr class="row justify-content-center">
				<th class="col-2">#</th>
				<th class="col-4">제목</th>
				<th class="col-3">작성일</th>	
			</tr>
		</thead>
		<tbody>	
			<c:forEach var="list" items="${list}">
			<tr class="row justify-content-center">
				<td class="col-2">${list.rnum }</td>
				<td class="col-4"><a  class="text-dark" href="/user/mypage/notice/detail?noticeNo=${list.noticeNo }">${list.title }</a> </td>
				<td class="col-3"><fmt:formatDate value="${list.regDate }" pattern="yyyy-MM-dd"/></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<br><br>
	<div class="text-center">
		<a class="btn btn-light" href="${pageMaker.makeSearch(1) }">&laquo;&laquo;</a>
		<c:if test="${pageMaker.prev }">
			<a class="btn btn-light" href="${pageMaker.makeSearch(pageMaker.startPage-1) }">&laquo;</a>
		</c:if>
		<c:forEach var="idx" begin="${pageMaker.startPage }" end="${pageMaker.endPage}"  >
			<a class="btn btn-light <c:if test="${param.page eq idx}">active</c:if>"  href="${pageMaker.makeSearch(idx) }">${idx}</a>
		</c:forEach>
		<c:if test="${pageMaker.next && pageMaker.endPage>0}">
			<a class="btn btn-light" href="${pageMaker.makeSearch(pageMaker.endPage+1)}">&raquo;</a>
		</c:if>
		<a class="btn btn-light" href="${pageMaker.makeSearch(pageMaker.maxPage+1)}">&raquo;&raquo;</a>
	</div>
</main>
<body>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">


</script>
</html>
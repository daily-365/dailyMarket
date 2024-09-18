<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>물품 상세페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body class="conatainer-fluid">
<%@ include file="/resources/common/admin/header.jsp" %>
<br><br>
<input type="text" id="productNo" value="${param.productNo }" style="display: none;">
<main class='container table' style="border: 1px solid black;">
	<div class="text-center fw-bold">
		<div class="col">
			<span>번호 : </span>	
			<span>${productVO.productNo}</span>
		</div>
		<br>
		<div class="col">
			<span>제목 : </span>	
			<span>${productVO.title}</span>		
		</div>
		<br>
		<div class="col">
			<span>판매/나눔 : </span>	
			<c:if test="${productVO.type eq 'sale'}"><span class="text-success">판매</span>	</c:if>
			<c:if test="${productVO.type eq 'share'}"><span class="text-warning">나눔</span>	</c:if>
		</div>
		<br>
		<div class="col">
			<span>가격 : </span>	
			<span>${productVO.price}</span>	
		</div>
		<br>
		<div class="col">
			<span>내용 : </span>	
			<span>${productVO.content}</span>	
		</div>
		<br>
		<div class="col">
			<span>위치 : </span>	
			<span>${productVO.location }</span>	
		</div>
		<br>
		<div class="col">
			<span>작성자 : </span>	
			<span>${productVO.writer}</span>	
		</div>
		<br>
		<div class="col">
			<span>등록일 : </span>	
			<span><fmt:formatDate value="${productVO.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>	
		</div>
		<br>
		<div class="col">
			<span>삭제여부 : </span>	
			<c:if test="${productVO.deleteYn eq 'Y'}"><span class="text-danger">${productVO.deleteYn}</span></c:if>
			<c:if test="${productVO.deleteYn eq 'N'}"><span class="text-primary">${productVO.deleteYn}</span></c:if>
		</div>
		<br>
		<c:if test="${productVO.deleteYn eq 'Y' }">
		<div class="col">
			<span>삭제일 : </span>	
			<span><fmt:formatDate value="${productVO.delDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>	
		</div>
		<br>
		</c:if>
		<c:if test="${not empty productVO.modDate }">
		<div class="col">
			<span>변경일 : </span>	
			<span><fmt:formatDate value="${productVO.modDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>	
		</div>
		<br>
		</c:if>
		<div class="col table" >
			<p>등록 파일 </p>	
			<c:forEach var="file" items="${file }">
				<span><img style="width: 300px; height: 300px;" src="/resources/upload/user/product/${file.productStoredFileName }"></span>	
			</c:forEach>
		</div>
		<br>
	</div>
	<br><br>
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col-4">
			<button  type="button" class="btn btn-info form-control" onclick="javascript:location.href='/admin/product/main'">목록으로</button>	
		</div>
		<c:if test="${productVO.deleteYn eq 'N'  }">
		<div class="col-4">
			<button id="delProductBtn" type="button" class="btn btn-danger form-control">거래 중지</button>	
		</div>
		</c:if>
		<c:if test="${productVO.deleteYn eq 'Y' }">
		<div class="col-4">
			<button id="reRegProductBtn" type="button" class="btn btn-warning form-control">거래 재계</button>	
		</div>
		</c:if>
		<br><br>
	</div>
	<br><br>
</main>
<br>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#delProductBtn").on("click",function(){
		if(!confirm("삭제 하실 경우 모든 거래가 중지됩니다. 삭제하시겠습니까?")){
			return false;
		}else{
			$.ajax({
				url: "/admin/product/delete",
				type: "post",
				data : {"productNo" :$("#productNo").val() },
				success:function(result){
					alert(result)
					location.reload(true)
				}
			});
		}
	});
	
	$("#reRegProductBtn").on("click",function(){
		if(!confirm("해당 게시물의 거래를 다시 시작하시겠습니까?")){
			return false;
		}else{
			$.ajax({
				url: "/admin/product/update",
				type: "post",
				data : {"productNo" :$("#productNo").val() },
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
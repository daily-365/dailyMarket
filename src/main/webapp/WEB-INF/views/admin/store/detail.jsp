<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입점 상세페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body class="conatainer-fluid">
<%@ include file="/resources/common/admin/header.jsp" %>
<br><br>
<input type="text" id="busiNo" value="${param.busiNo }" style="display: none;">
<main class='container table' style="border: 1px solid black;">
	<div class="text-center fw-bold">
		<div class="col">
			<span>번호 : </span>	
			<span>${busiVO.busiNo}</span>
		</div>
		<br>
		<div class="col">
			<span>사업자 번호 : </span>	
			<span>${busiVO.busiNum}</span>		
		</div>
		<br>
		<div class="col">
			<span>사업자 아이디 : </span>	
			<span>${busiVO.writer}</span>	
		</div>
		<br>
		<div class="col">
			<span>사업자 이름 : </span>	
			<span>${busiVO.ownerName}</span>	
		</div>
		<br>
		<div class="col">
			<span>사업자 연락처 : </span>	
			<span>${busiVO.busiTel}</span>	
		</div>
		<br>
		<div class="col">
			<span>업종 : </span>	
			<span>${busiVO.busiType1 } ${busiVO.busiType2 } ${busiVO.busiType3 }</span>	
		</div>
		<br>
		<div class="col">
			<span>매장 번호 : </span>	
			<span>${busiVO.storeTel}</span>	
		</div>
		<br>
		<div class="col">
			<span>매장 주소 : </span>	
			<span>${busiVO.storeAddr} ${busiVO.storeAddrDetail}</span>	
		</div>
		<br>
		<div class="col">
			<span>약관 동의 여부 : </span>	
			<c:if test="${busiVO.agreeYn eq 'Y'}">동의</c:if>
			<c:if test="${busiVO.agreeYn eq 'N'}">비동의</c:if>
		</div>
		<br>
		<div class="col" >
			<span>승인 상태 : </span>	
			<c:choose>
				<c:when test="${busiVO.status eq 'Y'}"><span class="text-primary">승인 완료</span></c:when>
				<c:when test="${busiVO.status eq 'S'}"><span class="text-warning">승인 대기</span></c:when>
				<c:when test="${busiVO.status eq 'N'}"><span class="text-danger">반려 및 재검수 요청</span></c:when>
			</c:choose>	
		</div>
		<br>
		<c:choose>
			<c:when test="${busiVO.status eq 'S' }">
				<div class="col">
					<span>요청일 : </span>	
					<span><fmt:formatDate value="${busiVO.regDate }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
				</div>
				<br>
			</c:when>
			<c:when test="${busiVO.status eq 'Y' }">
				<div class="col">
					<span>승인일</span>	
					<span><fmt:formatDate value="${busiVO.modDate }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
				</div>
				<br>
			</c:when>
			<c:when test="${busiVO.status eq 'N' }">
				<div class="col">
					<span>재검수 요청 일</span>	
					<span><fmt:formatDate value="${busiVO.modDate }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
				</div>
				<br>
			</c:when>
			<c:when test="${busiVO.deleteYn eq 'Y' }">
				<div class="col">
					<span>입점 취소 일</span>	
					<span><fmt:formatDate value="${busiVO.delDate }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
				</div>
				<br>
			</c:when>
		</c:choose>
		<div class="col">
			<p>사업자 등록증 사본</p>	
			<c:forEach var="file" items="${file }">
				<img src="/resources/upload/owner/company/${file.busiStoredFileName }" style="width: 300px; height: 300px;">
			</c:forEach>
		</div>
		<br>
		<div class="col">
			<p>첨부 파일</p>	
			<c:forEach var="store" items="${store }">
			<img src="/resources/upload/owner/company/${store.storedFileName }" style="width: 150px; height: 150px;">
			</c:forEach>
		</div>
		<br>
		<hr>
		<div class="row">
			<p>메뉴</p>
			<br>
			<c:forEach var="menu" items="${menu }">
				<div class="col-2">
					<img src="/resources/upload/owner/company/menu/${menu.storedFileName }" style="width: 150px; height: 150px;">
				</div>
				<div class="col-2">
					<p>상품명</p>
					<p>${menu.name }</p>	
				</div>
				<br>
				<div class="col-2">
					<p>가격</p>	
					<p>${menu.price }</p>
				</div>
				<br>
				<div class="col-1">
					<p>재고</p>	
					<p>${menu.count }</p>
				</div>
				<br>
				<div class="col-2">
					<p>설명</p>	
					<p>${menu.content }</p>
				</div>
				<br>
				<div class="col-1">
					<p>배달가능여부 (Y/N)</p>
					<p>${menu.deleveryYn }</p>	
				</div>
				<br>
				<div class="col-2">
					<p>배달료</p>	
					<p>${menu.deleveryPrice }</p>
				</div>
				<br>
			</c:forEach>
		</div>
		<br>
	</div>
	<br><br>
	<div class="row">
		<div class="col-2">
		</div>
		<c:choose>
			<c:when test="${busiVO.status eq 'Y' }">
				<div class="col-4">
					<button type="button" class="btn btn-success form-control" onclick="javascript: location.href='/admin/store/main'">목록 으로</button>
				</div>
				<div class="col-4">
					<button id="cancleBusiBtn" type="button" class="btn btn-warning form-control">승인 취소</button>	
				</div>	
				<br><br>			
			</c:when>
			<c:otherwise>
				<div class="col-4">
					<button id="okBusiBtn" type="button" class="btn btn-primary form-control">승인</button>	
				</div>
				<div class="col-4">
					<button id="reBusiBtn" type="button" class="btn btn-danger form-control">반려 및 재검수 요청</button>	
				</div>
				<br><br>
			</c:otherwise>
		</c:choose>
		
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
	
	$("#okBusiBtn").on("click",function(){
		if(!confirm("승인을 완료 합니다.")){
			return false;
		}else{
			$.ajax({
				url : "/admin/store/detail/update",
				type: "post",
				data : { "busiNo" : $("#busiNo").val(),
						"status" : 'Y'  },
				success:function(result){
					alert(result)
					location.reload(true);
				}
			
			});
		}
		
	});
	
	$("#reBusiBtn").on("click",function(){
		if(!confirm("반려 및 재검수를 요청합니다.")){
			return false;
		}else{
			$.ajax({
					url : "/admin/store/detail/update",
				type: "post",
				data : { "busiNo" : $("#busiNo").val(),
						"status" : 'N'  },
				success:function(result){
					alert(result)
					location.reload(true);
				
				}
			
			});
		}
	
	});
	
	$("#cancleBusiBtn").on("click",function(){
		if(!confirm("승인을 취소 합니다.")){
			return false;
		}else{
			$.ajax({
				url : "/admin/store/detail/update",
				type: "post",
				data : { "busiNo" : $("#busiNo").val(),
						"status" : 'S'  },
				success:function(result){
					alert(result)
					location.reload(true);
				}
			
			});
		}
		
	});

});

</script>
</html>
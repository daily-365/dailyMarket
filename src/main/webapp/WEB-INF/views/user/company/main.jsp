<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동네 업체</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body class="container-fluid">
<%@include file="/resources/common/user/header.jsp" %>
<main>
	<section class="py-5 text-center container ">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-dark fw-bold"><pre>동네 이웃들이</pre>
        					 <pre>자주 가는 동네 업체</pre>
        </h1>
        <p class="lead text-muted"><pre class="h5">우리 동네 사람들이 </pre>
        						   <pre class="h5">이용하는 업체를 찾아보세요.</pre>
       	</p>
      </div>
    </div>
  </section>
</main>
 <div class="container-fluid bg-light">
 	<div class="container">
	 	<div class="text-center">
	 	<br><br>
	  	<h5 class="text-dark fw-bold">다양한 동네 업체를 볼 수 있어요</h5>
	  	<form class="form form-inline">
	  		<br>
	  		<button type="button" class="btn btn-dark busiType" >전체</button>
	  		<button type="button" class="btn btn-outline-dark busiType"  value="식당" >식당</button>
	  		<button type="button" class="btn btn-outline-dark busiType"  value="카페">카페</button>
	  		<button type="button" class="btn btn-outline-dark busiType"  value="용달/이사">용달/이사</button>
	  		<button type="button" class="btn btn-outline-dark busiType" value="뷰티/미용">뷰티/미용</button>
	  		<button type="button" class="btn btn-outline-dark busiType"  value="헬스/필라테스/요가">헬스/필라테스/요가</button>
	  		<br><br><br><br>
	  		<div class="row" id="busiListWrap">
	  			<c:forEach var="list" items="${list }">
	  			<div class="col-3">
	  				<img class="img-thumbnail" src="/resources/upload/owner/company/${list.storedFileName}" style="width:200px; height: 200px;">
  					<br><br>
	  				<p><a href="/user/company/detail?busiNo=${list.busiNo }" class="fw-bold h5 text-dark">${list.busiName }</a><span class="text-dark">&nbsp;( ${fn:substring(list.storeAddr,3,9) } )</span></p>
	  				<p><span>${list.title }</span></p>
	  				<p class="fw-bold"><span >후기 0 &nbsp;</span><span>&nbsp;단골 0 &nbsp;</span><span>&nbsp; ${list.busiType1 }</span></p>
	  			</div>
	  			</c:forEach>
	  		</div>
	  		
	  		<br><br>
	  		<hr><br><br>
	  		</form>
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="container">
		<br><br>
		<h5 class="text-dark fw-bold text-center">동네 이웃이 남긴 후기를 찾아보세요</h5>
		<div class="row">
			
			<c:forEach var="review" items="${review }">
			<div class="col">
		 		<div class="col-2" style=" width: 300px; height: 500px;">
	  				<br>
		  			<div class="text-center">
						<c:if test="${ empty review.fileNo }">
							<svg style="width: 100px; height: 100px;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
						  		<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
						  		<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"/>
							</svg>
						</c:if>
						<br><br>
						<img  id="fileDefaultIcon"  style="width: 100px; height: 100px; " src="/resources/upload/user/profile/${review.userStoredFileName }"  class="rounded-circle bg-secondary">
						<p class="fw-bold h5 text-dark"> ${review.writer }</p>
				  		<span class="fw-bold">${fn:substring(review.userAddr1,3,6) }</span><span class="fw-bold"> ( 조회수 ${review.hitCnt}회 )</span>
				  		</div>
				  		<br>
				  		<p class="fw-bold text-center h5">${review.busiName }</p><br>
			  			<img class="img-thumbnail" style="margin-left:50px; width: 200px; height: 150px;" src="/resources/upload/user/company/review/${review.reviewStoredFileName }">
			  			<br><br>
			  			<p class="fw-bold text-center "><a class="text-dark" href="/user/company/review/detail?busiReviewNo=${review.busiReviewNo }">${review.title }</a></p>
				  		<div> 
				  		${fn:substring(review.content,0,90)}...
			  			</div>
			  		</div>
			  		 <br><br><br><br>
		  		</div>
		  		</c:forEach>
	  		</div>
	  		
	  		</div>
	  	</div>
	  
	 <br><br><br><br><br><br><br>
	<div class="container bg-light">
	<br><br>
		<div class="text-center">
			<h4>업체를 운영하고 계신가요?</h4>
			<p>데일리에 등록하고 이웃에게 알려보세요-!</p>
			<button type="button" class="btn btn-secondary" onclick="javascript: location.href='/owner/main'">비즈프로필 만들기</button>
		</div>
	<br><br>
	</div>



<%@include file="/resources/common/user/footer.jsp" %>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
		
	$(".busiType").on("click",function(e){
	
	var busiList = ''	
		
		$.ajax({
			url : "/user/company/main/list",
			type :"post",
			data : {"busiType" : $(this).val() },
			success:function(result){
				
				result.forEach(function(item){
				
					busiList+='<div class="col-3">'
	  				busiList+='<img class="img-thumbnail" src="/resources/upload/owner/company/'+item.storedFileName+'" style="width:200px; height: 200px;">'
  					busiList+='<br><br>'
	  				busiList+='<p>'
	  				busiList+='<a href="/user/company/detail?busiNo='+item.busiNo +'" class="fw-bold h5 text-dark">'+item.busiName+'</a>'
	  				busiList+='<span class="text-dark fw-bold">&nbsp;( '+item.storeAddr.substr(0,6)+' )</span>'
	  				busiList+='</p>'
	  				busiList+='<p><span>'+item.title+'</span></p>'
	  				busiList+='<p class="fw-bold"><span >후기 0 &nbsp;</span><span>&nbsp;단골 0 &nbsp;</span><span>&nbsp; '+item.busiType1+'</span></p>'
	  				busiList+='</div>'
					
					$("#busiListWrap").html(busiList)
				});
				
			}
		
		});
	
	});
	
});

</script>
</html>
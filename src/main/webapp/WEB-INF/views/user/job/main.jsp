<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데일리 알바 메인 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body class="container-fluid">
<%@ include file="/resources/common/user/header.jsp" %>
<main>
 <section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-dark fw-bold"><pre>우리 동네에서 찾는</pre>
        					 <pre>데일리 알바</pre>
        </h1>
        <p class="lead text-muted"><pre class="h5">걸어서 10분 거리의</pre>
        						   <pre class="h5">동네 알바들 여기 다 있어요.</pre>
       	</p>
        <p>
          <a href="#" class="btn btn-warning my-2" onclick="javascript: location.href='/owner/job/regist'">공고 올리기</a>
        </p>
      </div>
    </div>
  </section>
  
<div class="container">
  	<div class="row">
  		<div class="col text-center">
  			<h4 class="fw-bold">인기 데일리 알바</h4>
  		</div>
  	</div>
  	<br><br>
  	<div id="hitListWrap" class="row justify-content-center text-center">
  		<c:forEach var="hitList" items="${hitList }">
	  		<div class="col-3">
  				<img  src="/resources/upload/owner/company/job/${hitList.storedFileName }" style="width: 120px; height: 120px;">
  				<br><br>
	  			<a href="/user/job/detail?jobNo=${hitList.jobNo }" class="fw-bold text-dark">${hitList.jobTitle }</a>
	  			<br><br>
	  			<p>${fn:substring(hitList.jobLoc,0,7) }</p>
	  			<p class="fw-bold">${hitList.jobType } ${hitList.jobMoney }원</p>
	  		</div>
  		</c:forEach>		
  	</div>
  	<br>
  	<div class="row">
  		<div class="col">
  			<button id="jobHitMoreBtn" class="form-control fw-bold h5 btn btn-warning" type="button">인기 알바 더보기</button>		
  		</div> 
  	</div>
  	<br><br>
  	<div class="row">
  		<div class="col text-center">
  			<h4 class="fw-bold">내 근처 알바</h4>
  		</div>
  	</div>
  	<br><br>
  	<div id="locListWrap" class="row justify-content-center text-center">
		<c:forEach var="locList" items="${locList }">
 				<div class="col-3">
 					<img  src="/resources/upload/owner/company/job/${locList.storedFileName }" style="width: 120px; height: 120px;">
 					<br><br>
  				<a href="/user/job/detail?jobNo=${locList.jobNo }" class="fw-bold text-dark">${locList.jobTitle }</a>
  				<br><br>
  				<p>${fn:substring(locList.jobLoc,0,6) }</p>
  				<p class="fw-bold">${locList.jobType } ${locList.jobMoney }원</p>
  			</div>
		</c:forEach>
  	</div>
  	<br>
  	<div class="row">
  		<div class="col">
  			<button id="jobLocMoreBtn" class="form-control fw-bold h5 btn btn-success" type="button">내 근처 알바 더보기</button>		
  		</div> 
  	</div>
  </div>
</main>
<input type="hidden" id="endRow">
<%@ include file="/resources/common/user/footer.jsp" %>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	var count =8;
	
	$("#jobHitMoreBtn").on("click",function(){
		count +=8;
		$("#endRow").val(count)
		
		$.ajax({
			url :"/user/job/main/hit",
			type: "post",
			data : {"endRow" :$("#endRow").val() },
			success:function(result){
				
				var hitMoreContent =''
				
				result.forEach(function(item){
				
					hitMoreContent+='<div class="col-3">'
  					hitMoreContent+='<img  src="/resources/upload/owner/company/job/'+item.storedFileName +'" style="width: 120px; height: 120px;">'
  					hitMoreContent+='<br><br>'
	  				hitMoreContent+='<a href="/user/job/detail?jobNo='+item.jobNo +'" class="fw-bold text-dark">'+item.jobTitle+'</a>'
	  				hitMoreContent+='<br><br>'
	  				hitMoreContent+='<p>'+item.jobLoc.substring(0,6)+'</p>'
	  				hitMoreContent+='<p class="fw-bold">'+item.jobType+' '+item.jobMoney +'원</p>'
	  				hitMoreContent+='</div>'
				
					$("#hitListWrap").html(hitMoreContent)
					
				});
			
			}
		
		});
	});
	
	$("#jobLocMoreBtn").on("click",function(){
		count +=8;
		$("#endRow").val(count)
		
		var location = localStorage.getItem("roadNameAddr").substring(0,8)

		$.ajax({
			url :"/user/job/main/loc",
			type: "post",
			data : {"endRow" :$("#endRow").val(),
					"jobLoc" :location },
			success:function(result){
				
			var locMoreContent =''
			
				result.forEach(function(item){
			
					locMoreContent+='<div class="col-3">'
  					locMoreContent+='<img  src="/resources/upload/owner/company/job/'+item.storedFileName +'" style="width: 120px; height: 120px;">'
  					locMoreContent+='<br><br>'
	  				locMoreContent+='<a href="/user/job/detail?jobNo='+item.jobNo +'" class="fw-bold text-dark">'+item.jobTitle+'</a>'
	  				locMoreContent+='<br><br>'
	  				locMoreContent+='<p>'+item.jobLoc.substring(0,6)+'</p>'
	  				locMoreContent+='<p class="fw-bold">'+item.jobType+' '+item.jobMoney +'원</p>'
	  				locMoreContent+='</div>'
				
					$("#locListWrap").html(locMoreContent)
				
				});
			}
		});
	});
});

</script>
</html>
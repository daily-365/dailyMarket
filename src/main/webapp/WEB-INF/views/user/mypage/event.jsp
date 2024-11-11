<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 메인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body class="container-fluid">
<main class="container">
<br><br>
	<h5 class="fw-bold text-center">데일리 이벤트</h5>
	<br>
	<div class="row justify-content-center">
		<div class="col-6" id="eventWrap">
		<c:forEach var="list" items="${list }" begin="0" end="0">
			<p  class="fw-bold text-center"><fmt:formatDate value="${list.regDate }" pattern="yyyy-MM-dd"/></p>
			<p class="fw-bold text-center">${list.title }</p>	
			<p>${list.content }</p>
			<br><br>
			<hr>
			<br><br>
		</c:forEach>
		</div>
	</div>
</main>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
var count =0;

$(document).scroll(function(e) {

  	var windowHeight = $(this).height(); // 현재 브라우저 창의 높이
  	var documentHeight = $(document).height(); //현재 문서의 전체 높이
  	var scrollTop = $(this).scrollTop(); //현재 스크롤 위치
  
  if (scrollTop + windowHeight == documentHeight) {
    // 스크롤이 맨 아래쪽에 도달한 경우 추가 콘텐츠를 동적으로 로드
   		count++;
	
	    var eventMoreContent =''
		  	  
			$.ajax({
				url : "/user/mypage/event",
				type: "post",
				data : {"endRow" :count },
				success:function(result){
					
					var year = new Date(result[count].regDate).getFullYear()
					var month = new Date(result[count].regDate).getMonth()+1
						if(String(month).length==1)
							month="0"+month
					var day = new Date(result[count].regDate).getDay()
						if(String(day).length==1)
							day="0"+day
				
					eventMoreContent+='<p  class="fw-bold text-center">'+year+"-"+month+"-"+day+'</p>'
					eventMoreContent+='<p class="fw-bold text-center">'+result[count].title+'</p>'	
					eventMoreContent+='<p>'+result[count].content +'</p>'
					eventMoreContent+='<br><br>'
					eventMoreContent+='<hr>'
					eventMoreContent+='<br><br>'
						
					$("#eventWrap").append(eventMoreContent)
				}
				
			}) 
	    }
  
});



</script>
</html>
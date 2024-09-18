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

//현재 스크롤 위치 저장
let lastScroll = 0;

var count =0;

$(document).scroll(function(e){
    //현재 높이 저장
    var currentScroll = $(this).scrollTop();
    //전체 문서의 높이
    var documentHeight = $(document).height();

    //(현재 화면상단 + 현재 화면 높이)
    var nowHeight = $(this).scrollTop() + $(window).height();
	
    //스크롤이 아래로 내려갔을때만 해당 이벤트 진행.
    if(currentScroll > lastScroll){
		
        //nowHeight을 통해 현재 화면의 끝이 어디까지 내려왔는지 파악가능 
        //즉 전체 문서의 높이에 일정량 근접했을때 글 더 불러오기)
        if(documentHeight < (nowHeight + (documentHeight*0.1))){
          
           var eventMoreContent =''
          	
   			 $.ajax({
				url : "/user/mypage/event",
				type: "post",
				data : {"endRow" :count },
				success:function(result){
					
					count++; //3개씩 불러와짐...
					console.log(count)
				
					eventMoreContent+='<p  class="fw-bold text-center">'+result[count].regDate+'</p>'
					eventMoreContent+='<p class="fw-bold text-center">'+result[count].title+'</p>'	
					eventMoreContent+='<p>'+result[count].content +'</p>'
					eventMoreContent+='<br><br>'
					eventMoreContent+='<hr>'
					eventMoreContent+='<br><br>'
						
					$("#eventWrap").append(eventMoreContent)
					
				}
			
			})
        }
    }
    //현재위치 최신화
    lastScroll = currentScroll;

});

</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자동차 정보 메인 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<%@ include file="/resources/common/datepicker.jsp" %>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body class="conatainer-fluid">
<%@ include file="/resources/common/admin/header.jsp" %>
<br><br>


<section class="container">
	<form id="excelForm" class="form" method="post">
		<div class="row">
			<div class="col-2">
				<span class="h5 fw-bold text-dark">※ 총 ${pageMaker.totalCount }건</span>
			</div>
			<div class="col-2">
				<select id="pagePerNum" name="pagePerNum" class="form-control">
					<option value=10 <c:if test="${param.pagePerNum eq 10 }">selected='selected'</c:if>>10개씩보기</option>
					<option value=20 <c:if test="${param.pagePerNum eq 20 }">selected='selected'</c:if>>20개씩보기</option>
					<option value=30 <c:if test="${param.pagePerNum eq 30 }">selected='selected'</c:if>>30개씩보기</option>
				</select>
			</div>
			<div class="col-2">
				<input id="startDate" name="startDate" type="text" readonly="readonly" class="form-control" placeholder="시작 날짜" value="${param.startDate }">
			</div>
			~
			<div class="col-2">
				<input id="endDate" name="endDate" type="text" readonly="readonly" class="form-control" placeholder="끝 날짜" value="${param.endDate }">
			</div>
			<div class="col-1">
				<button type="button" id="oneMonthBtn" class="btn btn-info form-control">1개월</button>
			</div>
			<div class="col-1">
				<button type="button"  id="threeMonthBtn" class="btn btn-info form-control">3개월</button>
			</div>
			<div class="col-1">
				<button type="button"  id="sixMonthBtn" class="btn btn-info form-control">6개월</button>
			</div>
		</div>
		<br><br>
		<div class="row">
			<div class="col-2">
				<select id="searchType" name="searchType" class="form-control">
					<option value="all" <c:if test="${param.searchType eq 'all' }">selected='selected'</c:if>>전체</option>
					<option value="writer" <c:if test="${param.searchType eq 'writer' }">selected='selected'</c:if>>작성자</option>
					<option value="type" <c:if test="${param.searchType eq 'type' }">selected='selected'</c:if>>차종</option>
					<option value="company"  <c:if test="${param.searchType eq 'company' }">selected='selected'</c:if>>제조사</option>
					<option value="name"  <c:if test="${param.searchType eq 'name' }">selected='selected'</c:if>>이름</option>
					<option value="fuel"  <c:if test="${param.searchType eq 'fuel' }">selected='selected'</c:if>>연료</option>
					<option value="distance"  <c:if test="${param.searchType eq 'distance' }">selected='selected'</c:if>>주행거리km</option>
					<option value="loc"  <c:if test="${param.searchType eq 'loc' }">selected='selected'</c:if>>위치</option>
				</select>
			</div>
			<div class="col-3">
				<input name="keyword" value="${param.keyword }" id="keyword" type="text" class="form-control">	
			</div>&nbsp;&nbsp;
			<div class="col-2">
				<button id="searchBtn"  type="button" class="form-control btn btn-outline-info">검색</button>
			</div>
			<div class="col-2">
				<button type="button" class="form-control btn btn-info" id="excelDown">엑셀 다운</button>
			</div>
			<div class="col-2">
				<button onclick="javascript: self.location='/admin/car/main'" type="button" class="form-control btn btn-outline-info">검색 초기화</button>
			</div>
		</div>
	</form>
</section>
<br>
<main class="container-fluid">
	<br>
	<h4 class="text-center">입점 현황</h4>
	<br>
	<table class="table table-hover table-bordered fw-bold">
		<tr>
			<th>#</th>
			<th>번호</th>
			<th>작성자</th>
			<th>판매상태</th>
			<th>차종</th>
			<th>제조사</th>
			<th>이름</th>
			<th>등급</th>
			<th>마력</th>
			<th>연료</th>
			<th>변속기</th>
			<th>배기량cc</th>
			<th>주행거리Km</th>
			<th>위치</th>
			<th>등록일</th>
		</tr>
		<c:forEach var="list" items="${list }" varStatus="status">		
		<tr>
			<td>${list.rnum }</td>
			<td>${list.carNo }</td>
			<td><a href="/admin/car/detail?carNo=${list.carNo}">${list.carWriter}</a></td>
			<td>
				<c:if test="${list.carTradeYn eq 'S'}">판매중</c:if>
				<c:if test="${list.carTradeYn eq 'N'}">판매취소</c:if>
				<c:if test="${list.carTradeYn eq 'Y'}">판매완료</c:if>
			</td>
			<td>${list.carType}</td>
			<td>${list.carManuFacturing }</td>
			<td>${list.carModel}</td>
			<td>${list.carRank }</td>
			<td>${list.carDetailRank }</td>
			<td>${list.carFuel }</td>
			<td>${list.carTransMission }</td>
			<td>${list.carDisplaceMent }</td>
			<td>${list.carDistance }</td>
			<td>${list.carLoc }</td>
			<td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
		</c:forEach>
		
	</table>
<br><br>
	<div class="text-center">
		<a class="btn btn-info" href="${pageMaker.makeSearch(1) }">&laquo;&laquo;</a>
		<c:if test="${pageMaker.prev }">
			<a class="btn btn-outline-info" href="${pageMaker.makeSearch(pageMaker.startPage-1) }">&laquo;</a>
		</c:if>
		<c:forEach var="idx" begin="${pageMaker.startPage }" end="${pageMaker.endPage+1}"  >
			<a class="btn btn-outline-info <c:if test="${param.page eq idx}">active</c:if>"  href="${pageMaker.makeSearch(idx) }">${idx}</a>
		</c:forEach>
		<c:if test="${pageMaker.next && pageMaker.endPage>0}">
			<a class="btn btn-outline-info" href="${pageMaker.makeSearch(pageMaker.endPage+1)}">&raquo;</a>
		</c:if>
		<a class="btn btn-info" href="${pageMaker.makeSearch(pageMaker.maxPage)}">&raquo;&raquo;</a>
	</div>
</main>
<br><br>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

$(document).ready(function(){

 	//모든 datepicker에 대한 공통 옵션 설정
      	$.datepicker.setDefaults({
          dateFormat: 'yy-mm-dd' //Input Display Format 변경
          ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
          ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
          ,changeYear: true //콤보박스에서 년 선택 가능
          ,changeMonth: true //콤보박스에서 월 선택 가능                
          ,showOn: "button" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
          ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
          ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
          ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
          ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
          ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
          ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
          ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
          ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트

     	 });
	
	$('#startDate').datepicker();
   	$('#startDate').datepicker("option", "maxDate", $("#endDate").val());
    $('#startDate').datepicker("option", "onClose", function ( selectedDate ) {
        $("#endDate").datepicker( "option", "minDate", selectedDate );
    });

    $('#endDate').datepicker();
    $('#endDate').datepicker("option", "minDate", $("#startDate").val());
    $('#endDate').datepicker("option", "onClose", function ( selectedDate ) {
        $("#startDate").datepicker( "option", "maxDate", selectedDate );
    });;
    
    
    $("#oneMonthBtn").on("click",function(){
    	$("#startDate").datepicker("setDate","-1M")
    	$("#endDate").datepicker("setDate","today")
    });
    
    $("#threeMonthBtn").on("click",function(){
    	$("#startDate").datepicker("setDate","-3M")
    	$("#endDate").datepicker("setDate","today")
    });
    
    $("#sixMonthBtn").on("click",function(){
  	 	$("#startDate").datepicker("setDate","-6M")
    	$("#endDate").datepicker("setDate","today")
    });
    
 
    //검색
    $("#searchBtn").on("click",function(){
    	self.location="/admin/car/main?keyword="+$("#keyword").val()+"&searchType="+$("#searchType").val()+"&startDate="+$("#startDate").val()+"&endDate="+$("#endDate").val()+"&pagePerNum="+$("#pagePerNum").val()
    });
    
    //pagePerNum
    $("#pagePerNum").on("change",function(){
    	self.location="/admin/car/main?keyword="+$("#keyword").val()+"&searchType="+$("#searchType").val()+"&startDate="+$("#startDate").val()+"&endDate="+$("#endDate").val()+"&pagePerNum="+$("#pagePerNum").val()
    });
    
    //엑셀 다운로드
    $("#excelDown").on("click",function(){
    	$("#excelForm").attr("action","/admin/car/excelDown")
		$("#excelForm").submit();
    
    });
    
});

</script>
</html>
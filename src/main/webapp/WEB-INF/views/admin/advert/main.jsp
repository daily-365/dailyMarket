<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 광고 메인 페이지</title>
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
				<button type="button" id="oneMonthBtn" class="btn btn-light form-control">1개월</button>
			</div>
			<div class="col-1">
				<button type="button"  id="threeMonthBtn" class="btn btn-light form-control">3개월</button>
			</div>
			<div class="col-1">
				<button type="button"  id="sixMonthBtn" class="btn btn-light form-control">6개월</button>
			</div>
		</div>
		<br><br>
		<div class="row">
			<div class="col-2">
				<select id="searchType" name="searchType" class="form-control">
					<option value="all" <c:if test="${param.searchType eq 'all' }">selected='selected'</c:if>>전체</option>
					<option value="loc" <c:if test="${param.searchType eq 'loc' }">selected='selected'</c:if>>위치</option>
					<option value="age" <c:if test="${param.searchType eq 'age' }">selected='selected'</c:if>>연령</option>
					<option value="gen"  <c:if test="${param.searchType eq 'gen' }">selected='selected'</c:if>>성별</option>
					<option value="pType"  <c:if test="${param.searchType eq 'pType' }">selected='selected'</c:if>>예산 형태</option>
					<option value="price"  <c:if test="${param.searchType eq 'price' }">selected='selected'</c:if>>예산</option>
					<option value="sType"  <c:if test="${param.searchType eq 'sType' }">selected='selected'</c:if>>기간 형태</option>
					<option value="days"  <c:if test="${param.searchType eq 'days' }">selected='selected'</c:if>>기간</option>
					<option value="payS"  <c:if test="${param.searchType eq 'payS' }">selected='selected'</c:if>>광고비 지불 상태</option>
					<option value="approveS"  <c:if test="${param.searchType eq 'approveS' }">selected='selected'</c:if>>광고 승인 상태</option>
				</select>
			</div>
			<div class="col-3" id="newKeyword">
				<c:choose>
					<c:when test="${param.searchType eq 'age' }">
						<select class='form-control' id='keyword'>
							<option value=''>선택</option>
							<option value='15-25세' <c:if test="${param.keyword eq '15-25세' }">selected='selected'</c:if>>15-25세</option>
							<option value='26-35세' <c:if test="${param.keyword eq '26-35세' }">selected='selected'</c:if>>26-35세</option>
							<option value='36-45세' <c:if test="${param.keyword eq '36-45세' }">selected='selected'</c:if>>36-45세</option>
							<option value='46-55세' <c:if test="${param.keyword eq '46-55세' }">selected='selected'</c:if>>46-55세</option>
							<option value='50세 이상' <c:if test="${param.keyword eq '50세 이상' }">selected='selected'</c:if>>50세 이상</option>
						</select> 
	    			</c:when>
	    			<c:when test="${param.searchType eq 'gen' }">
						<select class='form-control' id='keyword'>
							<option value=''>선택</option>
							<option value='M' <c:if test="${param.keyword eq 'M' }">selected='selected'</c:if>>남</option>
							<option value='F' <c:if test="${param.keyword eq 'F' }">selected='selected'</c:if>>여</option>
						</select> 
	    			</c:when>
	    			<c:when test="${param.searchType eq 'pType' }">
						<select class='form-control' id='keyword'>
							<option value=''>선택</option>
							<option value='day' <c:if test="${param.keyword eq 'day' }">selected='selected'</c:if>>하루 예산</option>
							<option value='total' <c:if test="${param.keyword eq 'total' }">selected='selected'</c:if>>총 예산</option>
						</select> 
	    			</c:when>
	    			<c:when test="${param.searchType eq 'sType' }">
						<select class='form-control' id='keyword'>
							<option value=''>선택</option>
							<option value='now' <c:if test="${param.keyword eq 'now' }">selected='selected'</c:if>>지금 시작</option>
							<option value='later' <c:if test="${param.keyword eq 'later' }">selected='selected'</c:if>>나중에 시작</option>
						</select> 
	    			</c:when>
	    			<c:when test="${param.searchType eq 'payS' }">
						<select class='form-control' id='keyword'>
							<option value=''>선택</option>
							<option value='Y' <c:if test="${param.keyword eq 'Y' }">selected='selected'</c:if>>확인</option>
							<option value='S' <c:if test="${param.keyword eq 'S' }">selected='selected'</c:if>>확인중</option>
							<option value='N' <c:if test="${param.keyword eq 'N' }">selected='selected'</c:if>>확인 불가</option>
						</select> 
	    			</c:when>
	    			<c:when test="${param.searchType eq 'approveS' }">
						<select class='form-control' id='keyword'>
							<option value=''>선택</option>
							<option value='Y' <c:if test="${param.keyword eq 'Y' }">selected='selected'</c:if>>승인</option>
							<option value='S' <c:if test="${param.keyword eq 'S' }">selected='selected'</c:if>>승인 대기</option>
							<option value='N' <c:if test="${param.keyword eq 'N' }">selected='selected'</c:if>>승인 불가</option>
						</select> 
	    			</c:when>
	    			<c:otherwise>
						<input name="keyword" value="${param.keyword }" id="keyword" type="text" class="form-control">	
	    			</c:otherwise>
    			</c:choose>
			</div>&nbsp;&nbsp;
			<div class="col-2">
				<button id="searchBtn"  type="button" class="form-control btn btn-light">검색</button>
			</div>
			<div class="col-2">
				<button type="button" class="form-control btn btn-light" id="excelDown">엑셀 다운</button>
			</div>
			<div class="col-2">
				<button onclick="javascript: self.location='/admin/advert/main'" type="button" class="form-control btn btn-light">검색 초기화</button>
			</div>
		</div>
	</form>
</section>
<br>
<main class="container-fluid">
	<br>
	<h4 class="text-center">광고 현황</h4>
	<br>
	<table class="table table-hover table-bordered fw-bold">
		<tr>
			<th>#</th>
			<th>번호</th>
			<th>업체정보</th>
			<th>사용자정보</th>
			<th>위치</th>
			<th>연령</th>
			<th>성별</th>
			<th>예산 형태</th>
			<th>예산</th>
			<th>기간 형태</th>
			<th>기간</th>
			<th>종료일 없이 계속 광고하기</th>
			<th>상세 일정 설정하기</th>
			<th>광고비 지불 상태</th>
			<th>승인 상태</th>
			<th>작성일</th>
		</tr>
		<c:forEach var="list" items="${list }" varStatus="status" >		
		<tr>	
			<td>${status.count }</td>
			<td><a href="/admin/advert/detail?advertNo=${list.advertNo}">${list.advertNo}</a></td>
			<td><a class="btn btn-primary" href="/admin/store/detail?busiNo=${list.busiNo}">페이지로이동</a></td>
			<td><a  class="btn btn-primary" href="/admin/user/detail?userNo=${list.userNo}">페이지로이동</a></td>
			<td>${list.location}</td>
			<td>${list.age}</td>
			<c:if test="${list.gender eq 'M'}">
				<td>남</td>
			</c:if>
			<c:if test="${list.gender eq 'F'}">
				<td>여</td>
			</c:if>
			<c:if test="${ list.priceType eq 'day' }">
				<td  class="text-primary">하루 예산</td>
			</c:if>
			<c:if test="${ list.priceType eq 'total' }">
				<td  class="text-danger">총 예산</td>
			</c:if>
			<td><fmt:formatNumber value="${list.price}" pattern="#,###" /></td>
			<c:if test="${list.startType eq 'now' }">
				<td  class="text-primary">지금 시작</td>
			</c:if>
			<c:if test="${list.startType eq 'later' }">
				<td  class="text-danger">나중에 시작</td>
			</c:if>
			<td>${list.days}</td>
			<c:if test="${list.endDateYn eq 'Y' }">
				<td class="text-primary">선택</td>
			</c:if>
			<c:if test="${list.endDateYn eq 'N' }">
				<td  class="text-danger">미 선택</td>
			</c:if>
			<c:if test="${list.detailYn eq 'Y' }">
				<td  class="text-primary">선택</td>
			</c:if>
			<c:if test="${list.detailYn eq 'N' }">
				<td  class="text-danger">미 선택</td>
			</c:if>
			<c:if test="${list.payStatus eq 'Y' }">
				<td  class="text-primary">확인</td>
			</c:if>
			<c:if test="${list.payStatus eq 'S' }">
				<td  class="text-warning">확인중</td>
			</c:if>
			<c:if test="${list.payStatus eq 'N' }">
				<td  class="text-danger">미 확인</td>
			</c:if>
			<c:if test="${list.approveStatus eq 'Y' }">
				<td  class="text-primary">승인</td>
			</c:if>
			<c:if test="${list.approveStatus eq 'S' }">
				<td  class="text-warning">승인 대기</td>
			</c:if>
			<c:if test="${list.approveStatus eq 'N' }">
				<td  class="text-danger">미 승인</td>
			</c:if>
			<td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
		</c:forEach>
		
	</table>
<br><br>
	<div class="text-center">
		<a class="btn btn-light" href="${pageMaker.makeSearch(1) }">&laquo;&laquo;</a>
		<c:if test="${pageMaker.prev }">
			<a class="btn btn-outline-light" href="${pageMaker.makeSearch(pageMaker.startPage-1) }">&laquo;</a>
		</c:if>
		<c:forEach var="idx" begin="${pageMaker.startPage }" end="${pageMaker.endPage+1}"  >
			<a class="btn btn-outline-light <c:if test="${param.page eq idx}">active</c:if>"  href="${pageMaker.makeSearch(idx) }">${idx}</a>
		</c:forEach>
		<c:if test="${pageMaker.next && pageMaker.endPage>0}">
			<a class="btn btn-outline-light" href="${pageMaker.makeSearch(pageMaker.endPage+1)}">&raquo;</a>
		</c:if>
		<a class="btn btn-light" href="${pageMaker.makeSearch(pageMaker.maxPage)}">&raquo;&raquo;</a>
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
    	self.location="/admin/advert/main?keyword="+$("#keyword").val()+"&searchType="+$("#searchType").val()+"&startDate="+$("#startDate").val()+"&endDate="+$("#endDate").val()+"&pagePerNum="+$("#pagePerNum").val()
    });
    
    //pagePerNum
    $("#pagePerNum").on("change",function(){
    	self.location="/admin/advert/main?keyword="+$("#keyword").val()+"&searchType="+$("#searchType").val()+"&startDate="+$("#startDate").val()+"&endDate="+$("#endDate").val()+"&pagePerNum="+$("#pagePerNum").val()
    });
    
    //엑셀 다운로드
    $("#excelDown").on("click",function(){
    	$("#excelForm").attr("action","/admin/advert/excelDown")
		$("#excelForm").submit();
    
    });
    
    //검색 타입에 따른 화면 설정
    $("#searchType").on("change",function(){
    	if($(this).val()=='all'){
    		$("#newKeyword").html('<input name="keyword" value="${param.keyword }" id="keyword" type="text" class="form-control">')	
    	}if($(this).val()=='loc'){
    		$("#newKeyword").html('<input name="keyword" value="${param.keyword }" id="keyword" type="text" class="form-control">')	
    	}if($(this).val()=='age'){
    		$("#newKeyword").html("<select class='form-control' id='keyword'>"
    							+"<option value=''>선택</option><option value='15-25세'>15-25세</option>"
    							+"<option value='26-35세'>26-35세</option><option value='36-45세'>36-45세</option>"
    							+"<option value='46-55세'>46-55세</option><option value='50세 이상'>50세 이상</option>"
    							+"</select>")
    	}if($(this).val()=='gen'){
    		$("#newKeyword").html("<select class='form-control' id='keyword'><option value=''>선택</option><option value='M'>남</option><option value='F'>여</option></select>")
    	}if($(this).val()=='pType'){
    		$("#newKeyword").html("<select class='form-control' id='keyword'>"
					+"<option value=''>선택</option><option value='day'>하루 예산</option>"
					+"<option value='total'>총 예산</option>"
					+"</select>")
    	}if($(this).val()=='price'){
    		$("#newKeyword").html('<input name="keyword" value="${param.keyword }" id="keyword" type="text" class="form-control">')	
    	}if($(this).val()=='sType'){
    		$("#newKeyword").html("<select class='form-control' id='keyword'>"
					+"<option value=''>선택</option><option value='now'>지금 시작</option>"
					+"<option value='later'>나중에 시작</option>"
					+"</select>")
    	}if($(this).val()=='days'){
    		$("#newKeyword").html('<input name="keyword" value="${param.keyword }" id="keyword" type="text" class="form-control">')	
    	}if($(this).val()=='payS'){
    		$("#newKeyword").html("<select class='form-control' id='keyword'>"
					+"<option value=''>선택</option><option value='Y'>확인</option>"
					+"<option value='S'>확인 중</option><option value='N'>확인 불가</option>"
					+"</select>")
    	}if($(this).val()=='approveS'){
    		$("#newKeyword").html("<select class='form-control' id='keyword'>"
					+"<option value=''>선택</option><option value='Y'>승인</option>"
					+"<option value='S'>승인 대기</option><option value='N'>승인 불가</option>"
					+"</select>")
    	}
    })
    
});

</script>


</html>
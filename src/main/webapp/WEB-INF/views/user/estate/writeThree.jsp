<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부동산 매물 올리기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<%@ include file="/resources/common/datepicker.jsp" %>
<style type="text/css">
input[type='text'] {
border-radius: 5px;
}
</style>
</head>
<body>
<%@ include file="/resources/common/user/header.jsp" %>
<main class="container">
	<br>
	<h5 class="text-center fw-bold">매물 정보</h5>
	<br>
	<div style="border: 1px solid black; border-radius: 10px; ">
		<form id="estateRegistForm" class="form ">
			<br>
			<div class="row text-center fw-bold">
				<p>대출</p>
				<br><br>
				<div class="col-3">
				</div>
				<div class="col-2">
					<label  class="form-label">확인필요</label>
					<input   type="radio" name="esLoanYn" value="S" checked="checked">
				</div>	
				<div class="col-2">
					<label  class="form-label">가능</label>
					<input   type="radio" name="esLoanYn" value="Y">
				</div>
				<div class="col-2">
					<label  class="form-label">불가능</label>
					<input   type="radio" name="esLoanYn" value="N">
				</div>
			</div>
			<hr>
			<div class="row text-center fw-bold">
				<p>반려동물</p>
				<br><br>
				<div class="col-3">
				</div>
				<div class="col-2">
					<label  class="form-label">확인필요</label>
					<input   type="radio" name="esAnimalYn" value="S" checked="checked">
				</div>	
				<div class="col-2">
					<label  class="form-label">가능</label>
					<input   type="radio" name="esAnimalYn" value="Y" >
				</div>
				<div class="col-2">
					<label  class="form-label">불가능</label>
					<input   type="radio" name="esAnimalYn" value="N">
				</div>
			</div>
			<hr>
			<div class="row text-center fw-bold">
				<p>주차</p>
				<br><br>
				<div class="col-3">
				</div>
				<div class="col-2">
					<label  class="form-label">확인필요</label>
					<input   type="radio" name="esParkingYn" value="S" checked="checked">
				</div>	
				<div class="col-2">
					<label  class="form-label">가능</label>
					<input   type="radio" name="esParkingYn" value="Y">
				</div>
				<div class="col-2">
					<label  class="form-label">불가능</label>
					<input   type="radio" name="esParkingYn" value="N">
				</div>
			</div>
			<hr>
			<div class="row text-center fw-bold">
				<p>입주가능일</p>
				<br><br>
				<div class="col-3">
				</div>
				<div class="col-3">
					<label class="form-label">입주 가능일</label>
					<input type="text"  readonly="readonly" id="esMoveDate">
				</div>
				<div class="col-3">
					<label class="form-label">즉시 입주 가능</label>
					<input type="checkbox"  id="esMoveYn" name="esMoveYn" value="Y">가능
					<input type="checkbox"  id="esMoveYn" name="esMoveYn" value="N" >확인필요
				</div>
			</div>
			<hr>
			<div class="row text-center fw-bold">
				<p>내 / 외부 시설 선택</p>
				<br><br>
				<div class="col-2">
					<label class="form-label">엘리베이터</label>
					<input type="checkbox" name="esFacility" value="엘리베이터">
				</div>
				<div class="col-1">
					<label class="form-label">복층</label>
					<input type="checkbox" name="esFacility" value="복층">
				</div>
				<div class="col-1">
					<label class="form-label">옥탑</label>
					<input type="checkbox" name="esFacility" value="옥탑">
				</div>
				
				<div class="col-1">
					<label class="form-label">세탁기</label>
					<input type="checkbox" name="esFacility" value="세탁기">
				</div>
				
				<div class="col-1">
					<label class="form-label">냉장고</label>
					<input type="checkbox" name="esFacility" value="냉장고">
				</div>
				
				<div class="col-1">
					<label class="form-label">에어컨</label>
					<input type="checkbox" name="esFacility"value="에어컨">
				</div>
				
				<div class="col-1">
					<label class="form-label">전자렌지</label>
					<input type="checkbox" name="esFacility"value="전자렌지">
				</div>
				
				<div class="col-1">
					<label class="form-label">가스렌지</label>
					<input type="checkbox" name="esFacility" value="가스렌지">
				</div>
				
				<div class="col-1">
					<label class="form-label">인덕션</label>
					<input type="checkbox" name="esFacility" value="인덕션">
				</div>
				
				<div class="col-1">
					<label class="form-label">침대</label>
					<input type="checkbox" name="esFacility" value="침대">
				</div>
			</div>
			<hr>
			<div class="row text-center fw-bold">
				<p>이 매물의 장점 ( 최대 3 개 )</p>
				<br><br>
				<div class="col-2">
					<label class="form-label">햇빛이 잘 들어요</label>
					<input type="checkbox" name="esAdvantage" value="햇빛이 잘 들어요">
				</div>
				<div class="col-2">
					<label class="form-label">교통이 편리해요</label>
					<input type="checkbox" name="esAdvantage" value="교통이 편리해요">
				</div>
				<div class="col-2">
					<label class="form-label">주변 편의시설이 많아요</label>
					<input type="checkbox" name="esAdvantage" value="주변 편의시설이 많아요">
				</div>
				<div class="col-2">
					<label class="form-label">전망이 좋아요</label>
					<input type="checkbox" name="esAdvantage"value="전망이 좋아요">
				</div>
				<div class="col-2">
					<label class="form-label">벌레가 없어요</label>
					<input type="checkbox" name="esAdvantage" value="벌레가 없어요">
				</div>
				<div class="col-2">
					<label class="form-label">주변보다 저렴해요</label>
					<input type="checkbox" name="esAdvantage" value="주변보다 저렴해요">
				</div>
				<div class="col-2">
					<label class="form-label">혼자 살아도 안전해요</label>
					<input type="checkbox" name="esAdvantage" value="혼자 살아도 안전해요">
				</div>
				<div class="col-2">
					<label class="form-label">테라스가 있어요</label>
					<input type="checkbox" name="esAdvantage" value="테라스가 있어요">
				</div><div class="col-2">
					<label class="form-label">집 상태가 깨끗해요</label>
					<input type="checkbox" name="esAdvantage" value="집 상태가 깨끗해요">
				</div>
				<div class="col-2">
					<label class="form-label">방음이 잘되요</label>
					<input type="checkbox" name="esAdvantage" value="방음이 잘되요">
				</div>
				
			</div>
			<hr>	
			<div class="row text-center fw-bold">
				<p>매물 소개</p>
				<br><br>
				<div class="col-3">
				</div>
				<div class="col-6">
					<textarea  id="esHouseIntro" class="form-control" name="esHouseIntro"></textarea>
				</div>
			</div>
			<br>
		</form>
		<br><br>
		<div class="row text-center fw-bold" >
			<div class="col-4">
			</div>
			<div class="col-4">
				<button id="estateWriteBtn" type="button" class="btn btn-primary form-control">작성 완료</button>
			</div>
		</div>
		<br><br>
	</div>
</main>
<!-- 체크 박스 데이터 저장 -->
<input type="text" id="esFacility" style="display: none;">
<input type="text" id="esAdvantage" style="display: none;">
<%@ include file="/resources/common/user/footer.jsp" %>
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
         // ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
         // ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
         // ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
          ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
          ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
          ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
          ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
          ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
          ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
		  ,yearRange: 'c-100:c+10'// 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.  
		  ,showButtonPanel: true // 캘린더 하단에 버튼 패널을 표시한다. 
		  ,showAnim: "slide"
		  ,prevText: 'prev' // prev 아이콘의 툴팁.
		  ,nextText: 'next' // next 아이콘의 툴팁. 
		  ,stepMonths: 1 // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가.
		  
		  ,minDate : 'today' // 현재 날짜 이후의 날짜만 지정 가능. 
     	 });
	   
	$('#esMoveDate').datepicker();


	$("#esMoveYn").on("click",function(){
		$("#esMoveDate").attr("disabled",true)
		
		if(!$("#esMoveYn").is(":checked")){
			$("#esMoveDate").val("")
			$("#esMoveDate").attr("disabled",false)
		
		}
	})
	
	// checkbox 값 가져오기
	$("input[name=esFacility]").on("change",function(){
		var esFacilityList = '';
		$("input[name=esFacility]:checked").each(function(){
			esFacilityList+=$(this).val()+" , "
		});
		$("#esFacility").val(esFacilityList)
	});
	
	//최대 선택 3개 제한 및 값 가져오기
	$("input[name=esAdvantage]").on("change",function(e){
		var esAdvantageList = '';
		var length =$("input[name=esAdvantage]:checked").length
		if(length<=3){
			esAdvantageList+=$(this).val()+" , "
		}else{
			alert("선택은 최대 3개까지만 가능합니다.")
			$(this).attr("checked",false)
			return false;
		}
		console.log(esAdvantageList,length)
		$("#esAdvantage").val(esAdvantageList)
	});

	//작성완료
	$("#estateWriteBtn").on("click",function(){
		if(!confirm("작성을 완료 하시겠습니까?")){
			return false;
		}else {
			var params = {
						"esLoanYn": $("input[name=esLoanYn]:checked").val(),
						"esAnimalYn": $("input[name=esAnimalYn]:checked").val(),
						"esParkingYn": $("input[name=esParkingYn]:checked").val(),
						"esMoveYn": $("input[name=esMoveYn]:checked").val(),
						"esMoveDate": $("#esMoveDate").val(),
						"esFacility": $("#esFacility").val(),
						"esAdvantage": $("#esAdvantage").val(),
						"esHouseIntro": $("#esHouseIntro").val()
						}
		
			$.ajax({
				url: "/user/estate/writeThree",
				data: params,
				type: "post",
				success:function(result){
					alert(result)
					location.href="/user/estate/main"
				}
			});
			
		
		
		}
	
	});

});

</script>
</html>
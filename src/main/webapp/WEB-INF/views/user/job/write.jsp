<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알바 지원하기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<%@ include file="/resources/common/datepicker.jsp" %>
</head>
<body class="container-fluid">
<main class="container">
	<br>
	<br>
	<h5 class="text-center fw-bold">먼저 알바 프로필을 만들어 주세요</h5>
	<p class="text-center fw-bold text-secondary">지원서는 처음 한 번만 작성하면 계속 사용할 수 있어요.</p>
	<br>
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<label class="form-label fw-bold">사진 <span class="text-secondary">(선택)</span></label>	
			<br>
			<svg id="fileAddBtn" style="width:50px; height: 50px;"  xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-camera-fill" viewBox="0 0 16 16">
			  <path d="M10.5 8.5a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0"/>
			  <path d="M2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4zm.5 2a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1m9 2.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0"/>
			</svg>
			<input type="file" id="fileInput" style="display: none;">
			<br>
			<p><span class="text-info fw-bold">Tip</span> 사진을 등록하면 채용될 확률이 6% 올라요.</p>
		</div>
	</div>
	<br>
	<div id="fileContent" class="row d-flex justify-content-center">
		<c:if test="${not empty vo.storedFileName }">
			<img src="/resources/upload/user/job/${vo.storedFileName }" style="width:150px; height: 150px;">
		</c:if>
	</div>
	<hr class="col-6 offset-md-3">
	<br>
	<div class="row g-3 d-flex justify-content-center">
		<div class="col-auto">
			<label class="form-label fw-bold ">이름</label>
		</div>
		<div class="col-auto">
			<input type="text" placeholder="성" class="form-control" id="lastName" maxlength="4" value="${vo.lastName }">
		</div>
		<div class="col-auto">
			<input type="text" placeholder="이름" class="form-control" id="firstName" maxlength="10" value="${vo.firstName }">
		</div>
	</div>
	<br>
	<div class="row g-3 d-flex justify-content-center">
		<div class="col-auto">
			<p><span class="text-info fw-bold">Tip</span> 실명을 입력하면 채용될 확률이 14% 올라요.</p>
		</div>
	</div>
	<hr class="col-6 offset-md-3">
	<br>
	<div class="row g-3 d-flex justify-content-center">
		<div class="col-auto">
			<label class="form-label fw-bold ">연락처</label>
		</div>
	</div>
	<div class="row g-3 d-flex justify-content-center">
		<div class="col-auto">
			<input type="text" class="form-control" id="tel" placeholder="-를 뺴고 입력해 주세요." maxlength="11" value="${vo.tel }">
		</div>
	</div>
	<hr class="col-6 offset-md-3">	
	<br>
	<div class="row g-3 d-flex justify-content-center">
		<div class="col-auto">
			<label class="form-label fw-bold ">성별</label>
		</div>
	</div>
	<div class="row g-3 d-flex justify-content-center">
		<div class="col-auto">
			<input type="radio" name="gender" <c:if test="${vo.gender eq '남' }">checked</c:if> value="남" >남
			<input type="radio" name="gender" <c:if test="${vo.gender eq '여' }">checked</c:if> value="여" >여
		</div>
	</div>
	<hr class="col-6 offset-md-3">	
	<br>
	<div class="row g-3 d-flex justify-content-center">
		<div class="col-auto">
			<label class="form-label fw-bold ">태어난 연도</label>
		</div>
	</div>
	<div class="row g-3 d-flex justify-content-center">
		<div class="col-4">
			<input type="text" id="birthYear" readonly="readonly" placeholder="선택" class="form-control text-center fw-bold" value="${vo.birthYear }">
		</div>
	</div>
	<br>
	<hr class="col-6 offset-md-3">	
	<br>
	<div class="row g-3 d-flex justify-content-center">
		<div class="col-auto">
			<label class="form-label fw-bold ">경력</label>
		</div>
	</div>
	<br>
	<div class="row g-3 d-flex justify-content-center">
		<div class="col-auto">
			<label class="form-label fw-bold ">일한곳</label>
		</div>
		<div class="col-4">
			<input type="text" placeholder="예) 데일리가게 역삼점" class="form-control" id="careerLoc" value="${vo.careerLoc }">
		</div>
	</div>
	<br>
	<div class="row g-3 d-flex justify-content-center">
		<div class="col-auto">
			<label class="form-label fw-bold ">했던 일</label>
		</div>
		<div class="col-4">
			<textarea placeholder="어떤 일을 했었는지 설명해 주세요." cols="60" class="form-control" id="careerWork">${vo.careerWork }</textarea>
		</div>
	</div>
	<br>
	<div class="row g-3 d-flex justify-content-center">
		<div class="col-auto">
			<label class="form-label fw-bold ">일한 연도</label>
		</div>
		<div class="col-4 ">
			<input type="text" id="careerYear" readonly="readonly" placeholder="선택" value="${vo.careerYear }" class="form-control text-center fw-bold">
		</div>
	</div>
	<br>
	<div class="row g-3 d-flex justify-content-center">
		<div class="col-auto">
			<label class="form-label fw-bold ">일한 기간</label>
		</div>
		<div class="col-4">
			<select class="form-control text-center fw-bold" id="careerDiff">
				<option value="">선택</option>
				<option value="3개월 이하" <c:if test="${vo.careerDiff eq '3개월 이하' }">selected</c:if>>3개월 이하</option>
				<option value="6개월 이하" <c:if test="${vo.careerDiff eq '6개월 이하' }">selected</c:if>>6개월 이하</option>
				<option value="6개월~1년"<c:if test="${vo.careerDiff eq '6개월~1년' }">selected</c:if>>6개월~1년</option>
				<option value="1년~2년"<c:if test="${vo.careerDiff eq '1년~2년' }">selected</c:if>>1년~2년</option>
				<option value="2년~3년"<c:if test="${vo.careerDiff eq '2년~3년' }">selected</c:if>>2년~3년</option>
				<option value="3년 이상"<c:if test="${vo.careerDiff eq '3년 이상' }">selected</c:if>>3년 이상</option>
			</select>
		</div>
	</div>
	<br><br>
	<div class="row g-3 d-flex justify-content-center">
		<div class="col-auto">
			<input type="checkbox" <c:if test="${vo.careerYn eq 'N' }">checked</c:if> name="careerYn" value="N">&nbsp;&nbsp;&nbsp;<span class="fw-bold text-secondary">아르바이트나 직무 경험이 없어요.</span>
			<input type="hidden"  name="careerYn" value="Y">
		</div>
	</div>
	<br>
	<div class="row g-3 d-flex justify-content-center">
		<div class="col-auto">
			<p><span class="text-info fw-bold">Tip</span> 1개만 작성해도 채용될 확률이 7% 올라요.</p>
		</div>
	</div>
	<hr class="col-6 offset-md-3">
	<br>
	<div class="row g-3 d-flex justify-content-center">
		<div class="col-auto">
			<label class="form-label fw-bold ">나의 장점</label>
			<p class="text-secondary fw-bold">나를 대표할 수  있는 장점을 선택해 주세요.</p>
		</div>
	</div>
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<button type="button" class="btn btn-light text-dark fw-bold advantage"  value="성실해요">성실해요</button>
			<button type="button" class="btn btn-light text-dark fw-bold advantage"  value="친절해요">친절해요</button>
			<button type="button" class="btn btn-light text-dark fw-bold advantage"  value="일처리가 꼼꼼해요">일처리가 꼼꼼해요</button>
			<button type="button" class="btn btn-light text-dark fw-bold advantage"  value="성격이 밝아요">성격이 밝아요</button>
		</div>
	</div>
	<br>
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<button type="button" class="btn btn-light text-dark fw-bold advantage"  value="적극적이에요">적극적이에요</button>
			<button type="button" class="btn btn-light text-dark fw-bold advantage" value="지각하지 않아요">지각하지 않아요</button>
			<button type="button" class="btn btn-light text-dark fw-bold advantage" value="일을 빨리 배우는 편이에요">일을 빨리 배우는 편이에요</button>
			<button type="button" class="btn btn-light text-dark fw-bold advantage"  value="예의가 발라요">예의가 발라요</button>
		</div>
	</div>
	<br>
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<button type="button" class="btn btn-light text-dark fw-bold advantage" value="체력이 좋아요">체력이 좋아요</button>
			<button type="button" class="btn btn-light text-dark fw-bold advantage"  value="손이 빨라요">손이 빨라요</button>
			<button type="button" class="btn btn-light text-dark fw-bold advantage" value="깔끔하고 청결해요">깔끔하고 청결해요</button>
			<button type="button" class="btn btn-light text-dark fw-bold advantage"  value="긍정적 이에요">긍정적 이에요</button>
		</div>
	</div>
	<br>
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<button type="button" class="btn btn-light text-dark fw-bold advantage"  value="책임감이 있어요">책임감이 있어요</button>
			<button type="button" class="btn btn-light text-dark fw-bold advantage" value="약속을 잘 지켜요">약속을 잘 지켜요</button>
			<button type="button" class="btn btn-light text-dark fw-bold advantage" value="신체가 건강해요">신체가 건강해요</button>
			<button type="button" class="btn btn-light text-dark fw-bold advantage"  value="센스 있어요">센스 있어요</button>
		</div>
	</div>
	<br>
	<div class="row d-flex justify-content-center">
		<div class="col-4">
			<textarea class="form-control fw-bold" id="advantage" rows="5">${vo.advantage }</textarea>
		</div>
	</div>
	<br>
	<div class="row d-flex justify-content-center">
		<div class="col-2">
			<button type="button" id="advantageResetBtn" class="form-control btn btn-warning">다시 선택하기</button>
		</div>
	</div>
	<hr class="col-6 offset-md-3">
	<br>
	<div class="row g-3 d-flex justify-content-center">
		<div class="col-auto">
			<label class="form-label fw-bold ">간단 자기소개</label>
			<ul>
				<li class="text-secondary fw-bold">나를 소개할 수 있는 인사말로 시작해봐요.</li>
				<li class="text-secondary fw-bold">나의 특징이나 장점을 적어보세요.</li>
				<li class="text-secondary fw-bold">그동안 경험이나, 자신있는 각오도 좋아요</li>
			</ul>
		</div>
	</div>
	<div class="row g-3 d-flex justify-content-center">
		<div class="col-4">	
			<textarea class="form-control fw-bold" rows="5"  placeholder="최소 15자리를 입력해 주세요." id="introduce">${vo.introduce }</textarea>
		</div>
	</div>
	<br>
	<div class="row g-3 d-flex justify-content-center">
		<div class="col-auto">
			<p><span class="text-info fw-bold">Tip</span> 50자 이상 작성하면 채용될 확률이 18% 올라요.</p>
		</div>
	</div>
	<hr class="col-6 offset-md-3">
	<br>
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<label class="form-label fw-bold">추가정보 <span class="text-secondary">(선택)</span></label>	
			<br>
		</div>
	</div>
	<br>
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<button type="button" class="btn btn-light text-dark fw-bold addInfo" value="보건증 있음">보건증 있음</button>
			<button type="button" class="btn btn-light text-dark fw-bold addInfo"   value="비흡연">비흡연</button>
			<button type="button" class="btn btn-light text-dark fw-bold addInfo" value="장기근무 가능">장기근무 가능</button>
		</div>
	</div>
	<br>
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<button type="button" class="btn btn-light text-dark fw-bold addInfo"   value="요리 능숙">요리 능숙</button>
			<button type="button" class="btn btn-light text-dark fw-bold addInfo"   value="조리자격증">조리자격증</button>
			<button type="button" class="btn btn-light text-dark fw-bold addInfo"   value="자동차 면허">자동차 면허</button>
		</div>
	</div>
	<br>
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<button type="button" class="btn btn-light text-dark fw-bold addInfo"   value="원동기 면허">원동기 면허</button>
			<button type="button" class="btn btn-light text-dark fw-bold addInfo"   value="영어 가능">영어 가능</button>
			<button type="button" class="btn btn-light text-dark fw-bold addInfo"  value="한국어 능통">한국어 능통</button>
		</div>
	</div>
	<br>
	<div class="row d-flex justify-content-center">
		<div class="col-auto">
			<button type="button" class="btn btn-light text-dark fw-bold addInfo"    value="컴퓨터 능숙">컴퓨터 능숙</button>
			<button type="button" class="btn btn-light text-dark fw-bold addInfo"   value="군필/면제">군필/면제</button>
			<button type="button" class="btn btn-light text-dark fw-bold addInfo"  value="요양보호사 자격증">요양보호사 자격증</button>
		</div>
	</div>
	<br>
	<div class="row d-flex justify-content-center">
		<div class="col-4">
			<textarea class="form-control fw-bold" id="addInfo" rows="5">${vo.addInfo }</textarea>
		</div>
	</div>
	<br><br>
	<div class="row d-flex justify-content-center">
		<div class="col-2">
			<button type="button" id="addInfoResetBtn" class="form-control btn btn-warning">다시 선택하기</button>
		</div>
	</div>
	<br><br>
	<div class="row d-flex justify-content-center">
		<c:if test="${empty vo.userJobNo }">
			<div class="col-4">
				<button id="userJobRegBtn" type="button" class="btn btn-info form-control text-light fw-bold">동의하고 시작하기</button>
			</div>
		</c:if>
		<c:if test="${not empty vo.userJobNo }">
			<div class="col-2">
				<button id="userJobModBtn" type="button" class="btn btn-warning form-control text-light fw-bold">수정하기</button>
			</div>
			<div class="col-2">
				<button id="userJobDelBtn" type="button" class="btn btn-danger form-control text-light fw-bold">삭제하기</button>
			</div>
		</c:if>
	</div>
	<br><br>
</main>


</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){

//모든 datepicker에 대한 공통 옵션 설정
      	$.datepicker.setDefaults({
          dateFormat: 'yy' //Input Display Format 변경
          ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
          ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
          ,changeYear: true //콤보박스에서 년 선택 가능
          ,changeMonth: true //콤보박스에서 월 선택 가능                
          ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
          ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
          ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
          ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
          ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
          ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
          ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
          ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
          ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
		  ,minDate: '-100y' // 현재날짜로부터 100년이전까지 년을 표시한다
		  ,maxDate : 'today' // 최대 오늘 날짜까지만 지정.
		  ,yearRange: 'c-100:c+0' // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
     	 });
	$("#birthYear").datepicker()
	$("#careerYear").datepicker()

	var advantageArr =''
	$(".advantage").on("click",function(){
		advantageArr+=$(this).val()+" "
		$("#advantage").val(advantageArr)	
	});
	var addInfoArr =''
	$(".addInfo").on("click",function(){
		addInfoArr+=$(this).val()+" "
		$("#addInfo").val(addInfoArr)
	});
	
	
	$("#advantageResetBtn").on("click",function(){
		$("#advantage").val("")	
	});
	$("#addInfoResetBtn").on("click",function(){
		$("#addInfo").val("")	
	});
	
	
	$("#fileAddBtn").on("click",function(){
		$("#fileInput").click()
	});
	
	$("#fileInput").on("change",fileAddFunc)
	
	
	var fileContent = new Array()
	
	var extError = false;
	
	function fileAddFunc(e){
		var files = e.target.files
		var fileArr = Array.prototype.slice.call(files)
		
		fileArr.forEach(function(f){
		
			var reader = new FileReader()
			var fileExt =  f.name.substring(f.name.lastIndexOf(".")).replace(".","")
			
			if(fileExt!='jpeg' &&fileExt!='jpg' &&fileExt!='png' &&fileExt!='gif' ){
				extError=true
				return false;
			}else{
				extError=false
				reader.onload=function(e){
				
					fileContent.push(f)
				
					$("#fileContent").html(
										"<img src='"+e.target.result+"' style='width:150px; height:150px;'></img>"	
										)
				
				}
				reader.readAsDataURL(f)
			}
		});
		
		if(extError){
			alert("지원하지 않는 파일 형식입니다.")
		}
	}
	
	
	function uploadFileFunc(){
		var formData = new FormData()
		
		for(var i=0; i<fileContent.length; i++){
			formData.append("fileContent",fileContent[i])
		}
	

		$.ajax({
			url:"/user/job/write/file",
			type:"post",
			data : formData,
			async:false,
			processData: false,
			contentType :false,
			encType :"multipart/form-data",
			success:function(result){
				console.log(result)
				location.reload(true)
				
				
			}
		});
	}
	
	function jobRegModFunc(btn,url,msg){
	
		$("#"+btn).on("click",function(){
			if(!$("#lastName").val()||!$("#firstName").val()||!$("#tel").val()
				||!$("input[name=gender]").val()||!$("#birthYear").val()||!$("#introduce").val() ){
				alert("필수 입력사항을 모두 기재해 주세요")
				return false;
			}else{
				if(!confirm(msg)){
					return false;
				}else{
					var params = {
								"lastName" : $("#lastName").val() ,
								"firstName" : $("#firstName").val() ,
								"tel" : $("#tel").val(),
								"gender" : $("input[name=gender]:checked").val() ,
								"birthYear" : $("#birthYear").val() ,
								"careerYn" : $("input[name=careerYn]:checked").val() ,
								"careerLoc" : $("#careerLoc").val() ,
								"careerWork" : $("#careerWork").val() ,
								"careerYear" : $("#careerYear").val() ,
								"careerDiff" : $("#careerDiff").val() ,
								"advantage" : $("#advantage").val() ,
								"introduce" :  $("#introduce").val(),
								"addInfo" : $("#addInfo").val()
								}
				
					$.ajax({
						url : url,
						type :"post",
						data :params,
						async:false,
						success:function(result){
							alert(result)
						}
					});
					
					uploadFileFunc()
				
				}
			
			}
		});
	}
	
	

	
	// =============== 수정 / 삭제 =========================
	
	var regBtn ="userJobRegBtn"
	var	regUrl ="/user/job/write"
	var regMsg = "작성을 마치시겠습니까?"
	jobRegModFunc(regBtn,regUrl,regMsg)
	
	var modBtn = "userJobModBtn"
	var modUrl = "/user/job/update"
	var modMsg ="수정하시겠습니까?"
	jobRegModFunc(modBtn,modUrl,modMsg)
	
	$("#userJobDelBtn").on("click",function(){
		if(!confirm("삭제된 데이터는 복구되지않습니다. 삭제하시겠습니까?")){
			return false;
		}else{
			$.ajax({
				url :"/user/job/delete",
				type:"post",
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
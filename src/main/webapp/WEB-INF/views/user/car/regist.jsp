<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고차 매물 올리기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<%@ include file="/resources/common/datepicker.jsp"  %>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
<%@ include file="/resources/common/user/header.jsp" %>
<main class="container">
	<br>
	<h5 class="text-center fw-bold">중고차 정보</h5>
	<br>
	<div style="border: 1px solid black; border-radius: 10px; padding: 30px; ">
		<form id="carRegistOneForm" class="form ">
			<br>
			<div class="row">
				<div class="col-3 text-center">
					<label class="form-lable fw-bold " >가격 (원)</label>	
					<br><br>
					<input type="text" class="form-control" id="carPrice" onkeyup="javascript: $(this).val($(this).val().replace(/\,/g, '').replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));">
				</div>
				<div class="col-3 text-center">
					<label class="form-lable fw-bold ">차종</label>	
					<br><br>
					<input type="text" class="form-control" id="carType">
				</div>
				<div class="col-3 text-center">
					<label class="form-lable fw-bold ">제조사</label>	
					<br><br>
					<input type="text" class="form-control" id="carManuFacturing">
				</div>
				<div class="col-3 text-center">
					<label class="form-lable fw-bold ">모델</label>	
					<br><br>
					<input type="text" class="form-control" id="carModel">
				</div>
				
			</div>
			<br>
			<div class="row">
				<div class="col-3 text-center">
					<label class="form-lable fw-bold ">등급</label>	
					<br><br>
					<input type="text" class="form-control" id="carRank">
				</div>
				<div class="col-3 text-center">
					<label class="form-lable fw-bold ">세부등급 (마력)</label>	
					<br><br>
					<input type="text" class="form-control" id="carDetailRank">
				</div>
				<div class="col-3 text-center">
					<label class="form-lable fw-bold ">연식</label>	
					<br><br>
					<input type="text" class="form-control" id="carDiffDate">	
				</div>
				<div class="col-2 text-center">
					<label class="form-lable fw-bold ">등록일</label>	
					<br><br>
					<select id="carRegYear" class="form-control text-center">
					<%	Date date = new Date();
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
						int now = Integer.parseInt(sdf.format(date));
						for(int i=now; i>=1950; i--){ %>
						<option value="<%=i %>"><%=i %></option>
					<%} %>
					</select>
				</div>
				<div class="col-1 text-center">
					<br><br>
					<select id="carRegMonth" class="form-control text-center">
					<%	for(int i=1; i<=12; i++){ %>
						<option value="<%=i %>"><%=i %></option>
					<%} %>
					</select>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-3 text-center">
					<label class="form-lable fw-bold ">주행거리 (만 km)</label>	
					<br><br>
					<input type="text" class="form-control" id="carDistance">
				</div>
				<div class="col-3 text-center">
					<label class="form-lable fw-bold ">배기량(cc)</label>	
					<br><br>
					<input type="text" class="form-control" id="carDisplaceMent"  onkeyup="javascript: $(this).val($(this).val().replace(/\,/g, '').replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));">
				</div>
				<div class="col-3 text-center">
					<label class="form-lable fw-bold ">연료</label>	
					<br><br>
					<input type="text" class="form-control" id="carFuel">
				</div>
				<div class="col-3 text-center">
					<label class="form-lable fw-bold " >변속기</label>	
					<br><br>
					<input type="text" class="form-control" id="carTransMission">
				</div>
				
			</div>
			<br>
			<div class="row">
				<div class="col-4 text-center">
					<label class="form-lable fw-bold ">보험사고이력 (횟수)</label>	
					<br><br>
					<input type="number" class="form-control" min="0"  id="carAccidentCnt">
				</div>
				<div class="col-4 text-center">
					<label class="form-lable fw-bold " >차량 특수용도 변경 (유/무)</label>	
					<br><br>
					<input type="checkbox"  value="Y" id="carSpecialUseYn">
				</div>
				<div class="col-4 text-center">
					<label class="form-lable fw-bold ">소유자 변경 이력 (횟수)</label> 
					<br><br>
					<input type="number" class="form-control" id="carChangeCnt" min="0">
				</div>
			</div>
			<br>
			<hr>
			<div class="row">
				<div class="col-12 text-center">
					<label class="form-lable fw-bold ">옵션</label> 
					<br><br>
					<hr>
					<label class="form-lable fw-bold ">내외장</label> 
					<br><br>
					<span class="fw-bold">가죽 시트</span><input type="checkbox" name="carOption1" value="가죽 시트"> 
					<span class="fw-bold">전동 시트</span><input type="checkbox" name="carOption1" value="전동 시트"> 
					<span class="fw-bold">통풍 시트</span><input type="checkbox" name="carOption1" value="통풍 시트">  
					<span class="fw-bold">열선 시트</span><input type="checkbox" name="carOption1" value="열선 시트"> 
					<span class="fw-bold">열선 스티어링휠</span><input type="checkbox" name="carOption1" value="열선 스티어링휠"> 
					<span class="fw-bold">파노라마 선루프</span><input type="checkbox" name="carOption1" value="파노라마 선루프"> 
					<span class="fw-bold">헤드 램프 (LED)</span><input type="checkbox" name="carOption1" value="헤드 램프 (LED)"> 
					<span class="fw-bold">전동트렁크</span><input type="checkbox" name="carOption1" value="전동트렁크">
					<span class="fw-bold">전동 접이식 미러</span><input type="checkbox" name="carOption1" value="전동 접이식 미러">
					<span class="fw-bold">하이패스</span><input type="checkbox" name="carOption1" value="하이패스">
					<hr>
					<label class="form-lable fw-bold ">안전</label> 
					<br><br>
					<span class="fw-bold">주차 센서 :전방</span><input type="checkbox" name="carOption2" value="주차 센서 :전방">
					<span class="fw-bold">주차 센서 :후방</span><input type="checkbox" name="carOption2" value="주차 센서 :후방">
					<span class="fw-bold">360도 어라운드 뷰</span><input type="checkbox" name="carOption2" value="360도 어라운드 뷰">
					<span class="fw-bold">차선 이탈 경보</span><input type="checkbox" name="carOption2" value="차선 이탈 경보">
					<span class="fw-bold">후측방 경보</span><input type="checkbox" name="carOption2" value="후측방 경보">
					<span class="fw-bold">긴급 제동 (AEB)</span><input type="checkbox" name="carOption2" value="긴급 제동 (AEB)">
					<span class="fw-bold">타이머 공기압 센서</span><input type="checkbox" name="carOption2" value="타이머 공기압 센서">
					<hr>
					<label class="form-lable fw-bold ">편의</label>
					<br><br>
					<span class="fw-bold">블루투스</span><input type="checkbox" name="carOption3" value="블루투스">
					<span class="fw-bold">내비게이션</span><input type="checkbox" name="carOption3" value="내비게이션">
					<span class="fw-bold">스마트 키</span><input type="checkbox" name="carOption3" value="스마트 키">
					<span class="fw-bold">크루즈 컨트롤</span><input type="checkbox" name="carOption3" value="크루즈 컨트롤">
					<span class="fw-bold">자동 와이퍼</span><input type="checkbox" name="carOption3" value="자동 와이퍼">
					<span class="fw-bold">헤드업 디스플레이</span><input type="checkbox" name="carOption3" value="헤드업 디스플레이">
					<span class="fw-bold">전자식 주차브레이크 (EPB)</span><input type="checkbox" name="carOption3" value="전자식 주차브레이크 (EPB)">
					<br><br>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-3"></div>
				<div class="col-6 text-center">
					<label class="form-lable fw-bold " >추가정보</label> 
					<br><br>
					<span class="fw-bold">1인 소유  </span><input type="checkbox" name="carAdditionInfo" value="1인 소유">
					<span class="fw-bold">키 2개  </span><input type="checkbox" name="carAdditionInfo" value="키 2개">
					<span class="fw-bold">블랙박스 포함  </span><input type="checkbox" name="carAdditionInfo" value="블랙박스 포함">
					<span class="fw-bold">금연 차량  </span><input type="checkbox" name="carAdditionInfo" value="금연 차량">
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-3"></div>
				<div class="col-6 text-center">
					<label class="form-lable fw-bold ">소개</label> 
					<br><br>
					<textarea class="form-control" id="carIntro"></textarea>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-4"></div>
				<div class="col-4 text-center">
					<label class="form-lable fw-bold ">위치</label> 
					<br><br>
					<input type="text" class="form-control" id="carLoc" readonly="readonly" onclick="javascript: carLocFunc();">
				</div>
			</div>
			<br>
			<div class="row ">
				<div class="col-5"></div>
				<div class="col-2 text-center">
					<label class="form-lable fw-bold ">사진</label> 
						<br><br>
					<input type="file" id="fileInput" style="display: none;" multiple="multiple">
					<button id="fileAddBtn" type="button" class="btn btn-dark form-control" >추가</button>
				</div>
			</div>
			<br>
			<div class="row " id="fileContent">
				
			</div>
			<br>
			<div class="row ">
				<div class="col-4"></div>
				<div class="col-4">
					<button id="carRegistBtn" type="button" class="btn btn-outline-success form-control">저장</button>
				</div>
			</div>
		</form>
	</div>
	<input type="text" id="carOption1Val" style="display: none;">
	<input type="text" id="carOption2Val" style="display: none;">
	<input type="text" id="carOption3Val" style="display: none;">
	<input type="text" id="carAdditionInfoVal" style="display: none;">
</main>
<%@ include file="/resources/common/user/footer.jsp" %>
</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- daum 우편번호 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script type="text/javascript">

//다음 주소 api

function carLocFunc() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	
	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	                // 조합된 참고항목을 해당 필드에 넣는다.
	                document.getElementById("carLoc").value = extraAddr;
	            
	            } 
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById("carLoc").value = addr;
	        }
	    }).open();
	}

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
	$("#carRegYear").datepicker({dateFormat: 'yy'})
	$("#carRegMonth").datepicker({dateFormat: 'mm'})
	
	//차량 옵션 체크박스    
	$("input[name=carOption1]").on("change",function(){
		var carOption1List ='';
		$("input[name=carOption1]:checked").each(function(){
			carOption1List+=$(this).val()+"<br>"
		});
		$("#carOption1Val").val(carOption1List)
	});   
	$("input[name=carOption2]").on("change",function(){
		var carOption2List ='';
		$("input[name=carOption2]:checked").each(function(){
			carOption2List+=$(this).val()+"<br>"
		});
		$("#carOption2Val").val(carOption2List)
	});  
	$("input[name=carOption3]").on("change",function(){
		var carOption3List ='';
		$("input[name=carOption3]:checked").each(function(){
			carOption3List+=$(this).val()+"<br>"
		});
		$("#carOption3Val").val(carOption3List)
	});  
	
	//추가 정보 체크박스 
	$("input[name=carAdditionInfo]").on("change",function(){
		var carAdditionInfoList ='';
		$("input[name=carAdditionInfo]:checked").each(function(){
			carAdditionInfoList+=$(this).val()+"<br>"
		});
		$("#carAdditionInfoVal").val(carAdditionInfoList)
	})
	
	
	// 파일 업로드 로직
	
	$("#fileAddBtn").on("click",function(){
		$("#fileInput").click()
	});
	
	$("#fileInput").on("change",fileAddFunc)
	
	var fileNum=0;
	var fileContent = new Array()
	
	var fileCnt =0;
	var totalCnt= 5;
	
	var fileSize =0;
	var totalSize = 1024**2*3
	
	//에러 문구 flag : (변수를 반복문 밖에 두어 alert창 한번만 띄우게.)
	var cntError = false;
	var extError = false;
	var sizeError = false;
	
	function fileAddFunc(e){
		var files = e.target.files
		var fileArr = Array.prototype.slice.call(files)
		
		fileCnt = fileArr.length+fileNum
		
		fileArr.forEach(function(f){
			var reader = new FileReader()
			var fileExt = f.type.substring(f.type.lastIndexOf("/")).replace("/","")
		
			if(fileCnt>totalCnt){
				cntError = true;
				return false;
			}if(fileExt!='jpeg' &&fileExt!='jpg' && fileExt!='png' && fileExt!='gif'){
				extError = true;
				return false;
			}if(fileSize>totalSize){
				sizeError = true;
				return false;
			}else{
				cntError = false;
				extError = false;
				sizeError = false;
				
				reader.onload=function(e){
					fileNum++;
					fileSize+=f.size
					
					fileContent.push(f)
					
					$("#fileContent").append(
											"<div  id='file"+fileNum+"' class='fw-bold col-2' >"
											+"<img src='"+e.target.result+"' class='form-control fileImgs' style='width:200px; height:150px;' ></img>"
											+"<br>"
											+"<button id='btn"+fileNum+"' type='button' class='btn btn-danger form-control' >X </button>"
											+"</div>"
											+"<br>"
											)
				
					$("#btn"+fileNum).on("click",function(){
						fileNum--;
						fileCnt--;
						fileSize-=f.size;
						
						fileContent.pop(f)
						$(this).parent('div').remove();
					
					});
				}
				reader.readAsDataURL(f)
			}
		})
		
		if(cntError){
			alert("파일은 최대 5개까지 올릴 수 있습니다.")
		}if(extError){
			alert("jepg/jpg/png/gif파일만 올려주세요")
		}if(sizeError){
			alert("최대 용량은 3M까지 입니다.")
		}
	
	}
	
	//파일 업로드 함수
	function uploadFileFunc(){
		var formData = new FormData()
		
		for(var i=0; i<fileContent.length; i++){
			formData.append("fileContent",fileContent[i]);	
		}
		$.ajax({
			url : "/user/car/regist/file",
			data : formData,
			type:"post",
			contentType : false,
			processData : false,
			async: false,
			success:function(result){
				console.log(result)
			}
		});
	}
	
	
	// 데이터 전송
	
	$("#carRegistBtn").on("click",function(){
		params ={
				"carPrice" : $("#carPrice").val(),
				"carType" : $("#carType").val(),
				"carManuFacturing" : $("#carManuFacturing").val(),
				"carModel" : $("#carModel").val(),
				"carRank" : $("#carRank").val(),
				"carDetailRank" : $("#carDetailRank").val(),
				"carDiffDate" : $("#carDiffDate").val(),
				"carRegDate" : $("#carRegYear").val()+"년 "+$("#carRegMonth").val()+"월",
				"carDistance" : $("#carDistance").val(),
				"carDisplaceMent" : $("#carDisplaceMent").val(),
				"carFuel" : $("#carFuel").val(),
				"carTransMission" : $("#carTransMission").val(),
				"carAccidentCnt" : $("#carAccidentCnt").val(),
				"carSpecialUseYn" : $("#carSpecialUseYn").val(),
				"carChangeCnt" : $("#carChangeCnt").val(),
				"carOption1" : $("#carOption1Val").val(),
				"carOption2" : $("#carOption2Val").val(),
				"carOption3" : $("#carOption3Val").val(),
				"carAdditionInfo" : $("#carAdditionInfoVal").val(),
				"carIntro" :  $("#carIntro").val(),
				"carLoc" : $("#carLoc").val()
		
				}
	
		$.ajax({
			url :"/user/car/regist",
			data:params,
			type:"post",
			async:false,
			success:function(result){
				alert(result)
				location.href="/user/car/main"
			}
		});
		
		//파일업로드 함수 실행
	 	 uploadFileFunc()
	 	
	});
	
	

})
</script>
</html>
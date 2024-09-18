<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사장님 알바 구하기</title>
<!-- timePicker -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body class="container">
	<br><br>
	<h5 class="text-center fw-bold">알바 구인 정보</h5>
	<br><br>
	<div class="row">
		<div class="col-3 " style="border: 1px solid black;">
			<br>
			<label class="form-label fw-bold ">업체이름</label><br><br>
			<input type="text" class="form-control" id="jobCompany">
			<br><br>
		</div>
		<div class="col-3 " style="border: 1px solid black;"> 
			<br>
			<label class="form-label fw-bold ">구인글 제목</label><br><br>
			<input type="text" class="form-control" id="jobTitle" >
			<br><br>
		</div>
		<div class="col-3 " style="border: 1px solid black;">
			<br>
			<label class="form-label fw-bold ">지급 형태</label><br><br>
			<select id="jobType" class="form-control text-center fw-bold" >
				<option value="">선택</option>
				<option value="건당" >건당</option>
				<option value="시급">시급</option>
				<option value="일급" >일급</option>
				<option value="월급">월급</option>
				<option value="연봉" >연봉</option>
			</select>
			<br><br>
		</div>
		<div class="col-3 " style="border: 1px solid black;">
			<br>
			<label class="form-label fw-bold ">급여</label><br><br>
			<input type="text" class="form-control" id="jobMoney"  onkeyup="javascript: $(this).val($(this).val().replace(/\,/g, '').replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));">
			<br><br>
		</div>	
	</div>
	<br><br>
	<div class="row">
		<div class="col-4 "style="border: 1px solid black;">
			<br>
			<label class="form-label fw-bold ">위치</label><br><br>
			<input type="text" class="form-control" id="jobLoc" readonly="readonly" onclick="javascript: jobLocFunc()">
			<br><br>
		</div>
		<div class="col-4" style="border: 1px solid black;">
			<br>
			<label class="form-label fw-bold ">상세 위치</label><br><br>
			<input type="text" class="form-control" id="jobLocDetail">
			<br><br>
		</div>
		<div class="col-4 " style="border: 1px solid black;">
			<br>
			<label class="form-label fw-bold ">근무 일</label><br><br>
			&nbsp;&nbsp;
			<span class="fw-bold">월</span><input type="checkbox" name="jobWorkDate"  value="월"  >
			<span class="fw-bold">화</span><input type="checkbox" name="jobWorkDate" value="화"  >
			<span class="fw-bold">수</span><input type="checkbox" name="jobWorkDate" value="수"  >
			<span class="fw-bold">목</span><input type="checkbox" name="jobWorkDate" value="목"  >
			<span class="fw-bold">금</span><input type="checkbox" name="jobWorkDate" value="금"  >
			<span class="fw-bold">토</span><input type="checkbox" name="jobWorkDate" value="토"  >
			<span class="fw-bold">일</span><input type="checkbox" name="jobWorkDate" value="일"  >
			&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="fw-bold">평일</span><input type="checkbox" name="jobWorkDate" value="평일" >
			<span class="fw-bold">주말</span><input type="checkbox" name="jobWorkDate" value="주말" >
			<span class="fw-bold">근무일정협의</span><input type="checkbox" name="jobWorkDate"  value="근무일정협의"  >
			<br><br>
		</div>
		<div style="border: 1px solid black;">
			<br>
			<label class="form-label fw-bold ">근무 시간</label><br><br>
			<div class="row">
				<div class="col-2 "></div>
				<div class="col-4">
					<input type="text" id="jobWorkStartTime" readonly="readonly"  class="form-control text-center w-50">
				</div>
				<div class="col-2 fw-bold">
					~
				</div>
				<div class="col-4">
					<input type="text" id="jobWorkEndTime"  readonly="readonly" class="form-control text-center w-50"></div>
			</div>
			<br><br>
		</div>	
	</div>
	<br><br>
	<div class="row">
		<br>
		<div class="col-6 "style="border: 1px solid black;">
			<br>
			<label class="form-label fw-bold ">위치 설명</label><br><br>
			<textarea  class="form-control" id="jobLocContent" ></textarea>
			<br><br>
		</div>
		<div class="col-6 "style="border: 1px solid black;">
			<br>
			<label class="form-label fw-bold ">상세 설명</label><br><br>
			<textarea  class="form-control" id="jobContent"></textarea>
			<br><br>
		</div>
	</div>
	<br><br>
	<div class="row text-center">
		<br>
		<div style="border: 1px solid black;">
			<br>
			<label class="form-label fw-bold ">업체 사진 등록</label><br><br>
			<input type="file" id="inputFile" style="display: none;" multiple="multiple">
			<button id="addFileBtn" type="button" class="btn btn-outline-warning col-2">추가</button>
			<div id="fileContent" class="row">

			</div>
			<br><br>
		</div>
	</div>
	<br><br>
	<div class="row">
		<div class="col-4">
		</div>
		<div class="col-4">
			<button type="button" id="jobRegistBtn" class="btn btn-success form-control">등록</button>
		</div>
	</div>
	<br><br>
	<input type="hidden" id="jobWorkDate">
	<input type="hidden" id="jobNo" value="${jobVO.jobNo }">
</body>
<!-- timePicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- daum 우편번호 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- timePicker -->
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script type="text/javascript">
//다음 주소 api

function jobLocFunc() {
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
	                document.getElementById("jobLoc").value = extraAddr;
	            
	            } else {
	                document.getElementById("jobLoc").value = '';
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            //document.getElementById('sample6_postcode').value = data.zonecode;
	            document.getElementById("jobLoc").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("jobLocDetail").focus();
	        }
	    }).open();
	}

$(document).ready(function(){

	 $('#jobWorkStartTime , #jobWorkEndTime')
        .timepicker({
            timeFormat: 'HH:mm',
            interval: 30,
            defaultTime: '00',
            startTime: '00:00',
            dynamic: false,
            dropdown: true,
            scrollbar: true
        });
   
    
	// 근무일 ( 다중 선택  = >체크박스 )
	$("input[name=jobWorkDate]").on("change",function(){
		var jobWorkDateList ='';
		$("input[name=jobWorkDate]:checked").each(function(){
			jobWorkDateList +=$(this).val()
		});
		$("#jobWorkDate").val(jobWorkDateList)
	});

	//근무 시간 start-end 합치기
	$("#jobWorkStartTime , #jobWorkEndTime").on("change",function(){
		var startTime =$(this).val()
		var endTime =$("#jobWorkEndTime").val()
		$("#jobWorkTime").val(startTime+"~"+endTime)
	});
	
	
	$("#addFileBtn").on("click",function(){
		$("#inputFile").click()
	});
	
	
	//파일업로드 
	$("#inputFile").on("change",fileAddFunc)
	
	var fileNum =0;
	var fileContent = new Array()
	
	var fileCnt =0;
	var totalCnt =5;
	
	var fileSize =0;
	var totalSize = 1024**2*3
	
	//에러 문구 flag : (변수를 반복문 밖에 두어 alert창 한번만 띄우게.)
	var cntError = false;
	var extError = false;
	var sizeError = false;
	
	function fileAddFunc(e){
	
		var files = e.target.files
		var fileArr = Array.prototype.slice.call(files)
		
		fileCnt = fileArr.length
		
		fileArr.forEach(function(f){
			var reader = new FileReader()
			var fileExt = f.type.substring(f.type.lastIndexOf("/")).replace("/","")
		
			if(fileCnt>totalCnt){
				return false;
			}if(fileExt!='jpeg' &&fileExt!='jpg' &&fileExt!='png' && fileExt!='gif'){
				return false;
			}if(fileSize>totalSize){
				return false;
			}else{
				cntError = true;
				extError = true;
				sizeError = true;
				
				reader.onload=function(e){
					fileNum ++;
					fileSize +=f.size;
				
					fileContent.push(f)
					
					$("#fileContent").append("<div  id='file"+fileNum+"' class='fw-bold col-2' ><br><br>"
												+"&nbsp;<img src='"+e.target.result+"' class='form-control' style='width:200px; height:150px';></img><br><br>"
												+"&nbsp;<button id='btn"+fileNum+"' type='button' class='btn btn-danger form-control' >X </button>"
												+"<br><br>"
												+"</div>"
												)
					$("#btn"+fileNum).on("click",function(){
							//증가값 다시 감소
							fileNum--
							fileSize-=f.size
							
							fileContent.pop(f) // 콘텐츠 삭제
							$(this).parent('div').remove(); //화면에서 삭제
							
						
						});
					}
					reader.readAsDataURL(f)
			
				}
		
			});
			
			if(!cntError){
				alert("파일은 최대 5개까지 올릴 수 있습니다.")
			}if(!extError){
				alert("jepg/jpg/png/gif파일만 올려주세요")
			}if(!sizeError){
				alert("최대 용량은 3M까지 입니다.")
			}
		}

	
	function uploadFileFunc(){
		var formData = new FormData()
		
		for(var i=0; i<fileContent.length; i++){
			formData.append("fileContent",fileContent[i])
		}
		
		$.ajax({
			url:"/owner/job/regist/file",
			type:"post",
			data:formData,
			enctype: "multipart/form-data",
			processData: false,
			contentType : false,
			async:false,
			success:function(result){
				console.log(result)
			
			}
		})
	
	}
	
	//정보 등록
	$("#jobRegistBtn").on("click",function(){
		if(!confirm("등록 하시겠습니까?")){
			return false;
		}else{
			params ={
						"jobCompany" : $("#jobCompany").val(),
						"jobTitle" : $("#jobTitle").val(),
						"jobType" : $("#jobType").val(),
						"jobMoney" : $("#jobMoney").val(),
						"jobLoc" : $("#jobLoc").val(),
						"jobLocDetail" : $("#jobLocDetail").val(),
						"jobWorkDate" : $("#jobWorkDate").val(),
						"jobWorkTime" : $("#jobWorkStartTime").val()+"~"+$("#jobWorkEndTime").val(),
						"jobLocContent" :$("#jobLocContent").val(),
						"jobContent" :$("#jobContent").val()
					}
				
			$.ajax({
				url : "/owner/job/regist",
				type: "post",
				data:params,
				async:false,
				success:function(result){
					alert(result)
					location.href="/owner/main"
				}
			});	
			//파일 업로드 함수 실행
			uploadFileFunc()	
			
		
		}
	
	});

	

		

});

</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사장님 알바 구하기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body class="container">
	<br><br>
	<h5 class="text-center fw-bold">알바 구인 정보</h5>
	<br><br>
	<div class="row">
		<div class="col-4 offset-md-4" >
			<button type="button" class="btn btn-outline-success form-control" onclick="javascript: location.href='/owner/job/list?jobNo=${jobVO.jobNo}'">구인정보 현황</button>
		</div>
	</div>
	<br><br>
	<div class="row">
		<div class="col-3 " style="border: 1px solid black;">
			<br>
			<label class="form-label fw-bold ">업체이름</label><br><br>
			<input type="text" class="form-control" id="jobCompany" value="${jobVO.jobCompany }">
			<br><br>
		</div>
		<div class="col-3 " style="border: 1px solid black;"> 
			<br>
			<label class="form-label fw-bold ">구인글 제목</label><br><br>
			<input type="text" class="form-control" id="jobTitle" value="${jobVO.jobTitle }">
			<br><br>
		</div>
		<div class="col-3 " style="border: 1px solid black;">
			<br>
			<label class="form-label fw-bold ">지급 형태</label><br><br>
			<select id="jobType" class="form-control text-center fw-bold" >
				<option value="">선택</option>
				<option value="건당" <c:if test="${jobVO.jobType eq '건당' }">selected</c:if>>건당</option>
				<option value="시급" <c:if test="${jobVO.jobType eq '시급' }">selected</c:if>>시급</option>
				<option value="일급" <c:if test="${jobVO.jobType eq '일급' }">selected</c:if>>일급</option>
				<option value="월급" <c:if test="${jobVO.jobType eq '월급' }">selected</c:if>>월급</option>
				<option value="연봉" <c:if test="${jobVO.jobType eq '연봉' }">selected</c:if>>연봉</option>
			</select>
			<br><br>
		</div>
		<div class="col-3 " style="border: 1px solid black;">
			<br>
			<label class="form-label fw-bold ">급여</label><br><br>
			<input type="text" class="form-control" id="jobMoney" value="${jobVO.jobMoney }" onkeyup="javascript: $(this).val($(this).val().replace(/\,/g, '').replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));">
			<br><br>
		</div>	
	</div>
	<br><br>
	<div class="row">
		<div class="col-4 "style="border: 1px solid black;">
			<br>
			<label class="form-label fw-bold ">위치</label><br><br>
			<input type="text" class="form-control" id="jobLoc" value="${jobVO.jobLoc }" readonly="readonly" onclick="javascript: jobLocFunc()">
			<br><br>
		</div>
		<div class="col-4" style="border: 1px solid black;">
			<br>
			<label class="form-label fw-bold ">상세 위치</label><br><br>
			<input type="text" class="form-control" id="jobLocDetail" value="${jobVO.jobLocDetail }">
			<br><br>
		</div>
		<div class="col-4 " style="border: 1px solid black;">
			<br>
			<label class="form-label fw-bold ">근무 일</label><br><br>
			&nbsp;&nbsp;
			<span class="fw-bold">월</span><input type="checkbox" name="jobWorkDate"  value="월" <c:if test="${fn:contains(jobVO.jobWorkDate,'월') }">checked</c:if> >
			<span class="fw-bold">화</span><input type="checkbox" name="jobWorkDate" value="화" <c:if test="${fn:contains(jobVO.jobWorkDate,'화') }">checked</c:if> >
			<span class="fw-bold">수</span><input type="checkbox" name="jobWorkDate" value="수" <c:if test="${fn:contains(jobVO.jobWorkDate,'수') }">checked</c:if> >
			<span class="fw-bold">목</span><input type="checkbox" name="jobWorkDate" value="목" <c:if test="${fn:contains(jobVO.jobWorkDate,'목') }">checked</c:if> >
			<span class="fw-bold">금</span><input type="checkbox" name="jobWorkDate" value="금" <c:if test="${fn:contains(jobVO.jobWorkDate,'금') }">checked</c:if> >
			<span class="fw-bold">토</span><input type="checkbox" name="jobWorkDate" value="토" <c:if test="${fn:contains(jobVO.jobWorkDate,'토') }">checked</c:if> >
			<span class="fw-bold">일</span><input type="checkbox" name="jobWorkDate" value="일" <c:if test="${fn:contains(jobVO.jobWorkDate,'일') }">checked</c:if> >
			&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="fw-bold">평일</span><input type="checkbox" name="jobWorkDate" value="평일" <c:if test="${jobVO.jobWorkDate eq '평일' }">checked</c:if>>
			<span class="fw-bold">주말</span><input type="checkbox" name="jobWorkDate" value="주말" <c:if test="${jobVO.jobWorkDate eq '주말' }">checked</c:if>>
			<br><br>
		</div>
		<div style="border: 1px solid black;">
			<br>
			<label class="form-label fw-bold ">근무 시간</label><br><br>
			<div class="row">
				<div class="col-2 "></div>
				<div class="col-4">
				
				<c:set var="startWorkTime" value="${fn:substring(jobVO.jobWorkTime,0,5) }"/>
				<c:set var="endWorkTime" value="${fn:substring(jobVO.jobWorkTime,6,11) }"/>
				<!-- 
				<c:set value="0:00" var="startWorkTime1" />
				<c:if test="${startWorkDate eq  startWorkTime1}">selected</c:if>
				-->
					<select id="jobWorkStartTime"  class="form-control text-center w-50">
						<option value="">선택</option>
						<%for(int i=0; i<24; i++) {
							if(i==0){%>
							<option value="<%=i %>0:00"><%=i %>0:00</option>
						<%	}else if(i<10) {%>
							<option value="0<%=i %>:00">0<%=i %>:00</option>	
						<%}else{ %>
							<option value="<%=i %>:00"><%=i %>:00</option>	
							<% 
							}
						}
						%>
					</select>
				</div>
				<div class="col-2 fw-bold">
					~
				</div>
				<div class="col-4">
					<select id="jobWorkEndTime"  class="form-control text-center w-50">
						<option value="">선택</option>
						<%for(int i=0; i<24; i++) {
							if(i==0){%>
							<option value="<%=i %>0:00"><%=i %>0:00</option>
						<%	}else if(i<10) {%>
							<option value="0<%=i %>:00">0<%=i %>:00</option>	
						<%}else{ %>
							<option value="<%=i %>:00"><%=i %>:00</option>	
							<% 
							}
						}
						%>
					</select>
				</div>
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
			<textarea  class="form-control" id="jobLocContent" >${jobVO.jobLocContent }</textarea>
			<br><br>
		</div>
		<div class="col-6 "style="border: 1px solid black;">
			<br>
			<label class="form-label fw-bold ">상세 설명</label><br><br>
			<textarea  class="form-control" id="jobContent">${jobVO.jobContent }</textarea>
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
				<c:set var="length" value="${fn:length(file)}"/>
				<c:forEach var="file" items="${file }">
				 	<input class="storeFileSize" type="text" value="${file.fileSize }" style="display: none;">
					<div  class='fw-bold col-2' ><br><br>
						&nbsp;<img src="/resources/upload/owner/company/job/${file.storedFileName } " class='form-control' style='width:200px; height:150px;'></img><br><br>
						&nbsp;<button  value="${file.fileNo }" type='button' class='storedFileDelBtn btn btn-danger form-control' >X </button>
					<br><br>
					</div>
				
				</c:forEach>
			</div>
			<br><br>
		</div>
	</div>
	<br><br>
	<div class="row">
		<div class="col-4">
		</div>
		<div class="col-2">
			<button type="button" id="jobModBtn" class="btn btn-outline-primary form-control">수정</button>
		</div>
		<div class="col-2">
			<button type="button" id="jobDelBtn" class="btn btn-outline-danger form-control">삭제</button>
		</div>
	</div>
	<br><br>
	<input type="text" id="jobWorkDate" style="display: none;">
	<input type="text" id="jobWorkTime"  style="display: none;">
	
	<input type="text" id="jobNo" value="${jobVO.jobNo }" style="display: none;">
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- daum 우편번호 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
		var startTime =$("#jobWorkStartTime").val()
		var endTime =$("#jobWorkEndTime").val()
		$("#jobWorkTime").val(startTime+"~"+endTime)
	});
		$("#addFileBtn").on("click",function(){
		$("#inputFile").click()
	});
	
	
	//파일업로드 
	$("#inputFile").on("change",fileAddFunc)
	
	var storedFileLength =${length}
	var storedFileSize = $(".storedFileSize")
	
	var fileNum =0;
	var fileContent = new Array()
	
	var fileCnt =0;
	var totalCnt =5;
	
	var fileSize =0;
	var totalSize = 1024**2*3
	
	
	function fileAddFunc(e){
	
		var files = e.target.files
		var fileArr = Array.prototype.slice.call(files)
		
		fileCnt = fileArr.length+fileNum+storedFileLength
		
		fileArr.forEach(function(f){
			var reader = new FileReader()
			var fileExt = f.type.substring(f.type.lastIndexOf("/")).replace("/","")
		
			if(fileCnt>totalCnt){
				alert("사진은 최대 5개까지 가능합니다.")
				f.preventDefault()
			}if(fileExt!='jpeg' &&fileExt!='jpg' &&fileExt!='png' && fileExt!='gif'){
				alert("jpeg/jpg/png/jif 파일 형식만 지원합니다.")
				f.preventDefault()
			}if(fileSize>totalSize){
				alert("파일은 최대 3M 까지 지원 합니다.")
				f.preventDefault()
			}else{
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
		
		}
	
	
	//기존 파일 삭제 함수
	$(".storedFileDelBtn").on("click",function(){
		if(!confirm("기존 파일 입니다. 삭제하시겠습니까?")){
			return false;
		}else{
			$.ajax({
				url:"/owner/job/storedFileDelete",
				type:"post",
				data : {"fileNo":Number($(this).val()) },
				async:false,
				success:function(result){
					alert(result)
					location.reload(true);
				}
			});
		
		}
	
	});
	
	
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
						"jobWorkTime" : $("#jobWorkTime").val(),
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

	
	//정보 업데이트
	$("#jobModBtn").on("click",function(){
		if(!confirm("정보를 수정하시겠습니까?")){
			return false;
		
		}else{
			params ={	"jobNo" : $("#jobNo").val(),
			
						"jobCompany" : $("#jobCompany").val(),
						"jobTitle" : $("#jobTitle").val(),
						"jobType" : $("#jobType").val(),
						"jobMoney" : $("#jobMoney").val(),
						"jobLoc" : $("#jobLoc").val(),
						"jobLocDetail" : $("#jobLocDetail").val(),
						"jobWorkDate" : $("#jobWorkDate").val(),
						"jobWorkTime" : $("#jobWorkTime").val(),
						"jobLocContent" :$("#jobLocContent").val(),
						"jobContent" :$("#jobContent").val()
					}
			$.ajax({
				url:"/owner/job/update",
				type:"post",
				async:false,
				data:params,
				success:function(result){
					alert(result)
					location.reload(true)
				}
			});
			
			//파일업로드 함수 실행
			uploadFileFunc()
			
		}
	
	});
	
	// 알바 구인 정보 삭제하기.
	
	$("#jobDelBtn").on("click",function(){
		if(!confirm("삭제하시면 해당 구인정보가 모두 삭제됩니다. 그래도 진행하시겠습니까?")){
			return false;
		
		}else{
			$.ajax({
				url:"/owner/job/delete",
				type:"post",
				data : {"jobNo" : $("#jobNo").val()},
				success:function(result){
					alert(result)
					location.href="/owner/main"
				}		
			
			});
		
		}
	
	
	});
		
		
		

});

</script>
</html>
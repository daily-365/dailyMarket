<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<%@ include file="/resources/common/datepicker.jsp" %>
</head>
<body class="container-fluid">
<main class="container">
<br><br>
	<h5 class="fw-bold text-center">회원정보 수정</h5>
<br><br>
<form class="form" >
	<div class="row justify-content-center">
		<div class="col-4">
			<label class="form-label h6 fw-bold">아이디</label>
			<input type="text" value="${userVO.userId }" id="userId" name="userId" readonly="readonly" class="form-control fw-bold">
		</div>
	</div><br>
	<div class="row justify-content-center">
		<div class="col-4">
			<label class="form-label h6 fw-bold">프로필 사진</label>
			<span >
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span id="fileContent"></span>
				<c:if test="${empty profileFile }">
					<svg id="fileDefaultIcon" style="width: 100px; height: 100px;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
			  			<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
			  			<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"/>
					</svg>
					<span>
						<input type="file" id="fileInput" style="display: none;">
						<button type="button" id="fileAddBtn" class="btn btn-dark">프로필 사진 추가</button>
					</span>
				</c:if>
				<c:if test="${not empty profileFile }">
					<img  id="fileDefaultIcon"  style="width: 100px; height: 100px;" src="/resources/upload/user/profile/${profileFile.storedFileName}"  class="rounded-circle">
					<span>
					<input type="text" value="${profileFile.fileNo }" id="fileNo" style="display: none;">
					<input type="file" id="fileInput" style="display: none;">
						<button type="button" id="fileAddBtn" class="btn btn-dark">프로필 사진 변경</button>
					</span>
				</c:if>
			</span>
			
			
		</div>
		
	</div><br>
	<div class="row justify-content-center">
		<div class="col-4">
			<label class="form-label h6 fw-bold">비밀번호</label>
			<input type="password" id="userPass" class="form-control fw-bold">
			<div id="userPassYn" class="fw-bold"></div>
		</div>
	</div><br>
	<div class="row justify-content-center">
		<div class="col-4">
			<label class="form-label h6 fw-bold">비밀번호 확인</label>
			<input type="password"id="userPassChk" class="form-control fw-bold">
			<div id="userPassChkYn" class="fw-bold"></div>
		</div>
	</div><br>
	<div class="row justify-content-center">
		<div class="col-2">
			<button type="button" id="passChkBtn" class="btn btn-outline-warning form-control">비밀번호확인</button>
			<div id="userPassChkBtnYn" class="fw-bold"></div>
		</div>
		<div class="col-2">
			<button type="button" id="passChkBtn" class="btn btn-outline-success form-control" onclick="javascript: location.href='/user/mypage/profile/modpass'">비밀번호 변경</button>
		</div>
	</div><br>
	<div class="row justify-content-center">
		<div class="col-4">
			<label class="form-label h6 fw-bold">이름</label>
			<input type="text" value="${userVO.userName }"id="userName" name="userName"class="form-control fw-bold">
		</div>
	</div><br>
	<div class="row justify-content-center">
		<div class="col-4">
			<label class="form-label h6 fw-bold">닉네임</label>
			<input type="text"value="${userVO.userNick }"id="userNick"name="userNick" class="form-control fw-bold">
		</div>
	</div><br>
	<div class="row justify-content-center">
		<div class="col-4">
			<label class="form-label h6 fw-bold">이메일</label>
			<input type="text"value="${userVO.userMail }"id="userMail"name="userMail" class="form-control fw-bold">
		</div>
	</div><br>
	<div class="row justify-content-center">
		<div class="col-4">
			<label class="form-label h6 fw-bold">연락처</label>
			<input type="text" value="${userVO.userTel }" id="userTel" name="userTel" class="form-control fw-bold">
			<div id="userTelYn" class="fw-bold"></div>
		</div>
	</div><br>
	<div class="row justify-content-center">
		<div class="col-4">
			<label class="form-label h6 fw-bold">생년월일</label>
			<input type="text" value="${userVO.userBirth }" id="userBirth" name="userBirth" class="form-control fw-bold">
			<div id="userBirthYn" class="fw-bold"></div>
		</div>
	</div><br>
	<div class="row justify-content-center">
		<div class="col-4">
			<label class="form-label h6 fw-bold">성별</label>
			<input type="text" value="<c:if test="${userVO.userGender eq 'M'}">남</c:if>	<c:if test="${userVO.userGender eq 'F'}">여</c:if>"readonly="readonly" class="form-control fw-bold">
		</div>
	</div><br>
	<div class="row justify-content-center">
		<div class="col-4">
			<button type="button" onclick="javascript: searchLocFunc()" class="btn btn-outline-info">주소 찾기</button>
		</div>
	</div><br>
	<div class="row justify-content-center">
		<div class="col-4">
			<label class="form-label h6 fw-bold">주소</label>
			<input  type="text" value="${userVO.userAddr1 }" id="userAddr1" name="userAddr1" class="form-control fw-bold" >
		</div>
	</div><br>
	<div class="row justify-content-center">
		<div class="col-4">
			<label class="form-label h6 fw-bold">상세주소</label>
			<input type="text" value="${userVO.userAddr2 }" id="userAddr2" name="userAddr2" class="form-control fw-bold">
		</div>
	</div><br><br>
		<div class="row justify-content-center">
		<div class="col-2">
			<button type="button" class="btn btn-warning form-control" id="userModBtn">수정</button>
		</div>
		<div class="col-2">
			<button type="button" class="btn btn-danger form-control" id="userDelBtn">회원 탈퇴</button>
		</div>
	</div><br><br>
</form>
</main>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- daum 우편번호 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
//다음 주소 api

function searchLocFunc() {
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
	                document.getElementById("userAddr1").value = extraAddr;
	            
	            } else {
	                document.getElementById("userAddr1").value = '';
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            //document.getElementById('sample6_postcode').value = data.zonecode;
	            document.getElementById("userAddr1").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("userAddr2").focus();
	        }
	    }).open();
	}

$(document).ready(function(){


 //모든 datepicker에 대한 공통 옵션 설정
      	$.datepicker.setDefaults({
          dateFormat: 'yy-mm-dd' //Input Display Format 변경
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
		  ,yearRange: 'c-100:c+10'// 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.  
		  ,showButtonPanel: true // 캘린더 하단에 버튼 패널을 표시한다. 
		  ,showAnim: "slide"
		  ,prevText: 'prev' // prev 아이콘의 툴팁.
		  ,nextText: 'next' // next 아이콘의 툴팁. 
		  ,stepMonths: 1 // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 
     	 });
	   
	$('#userBirth').datepicker();
	
	

	$("#fileAddBtn").on("click",function(){
		$("#fileInput").click();	
	})
	
	$("#fileInput").on("change",fileAddFunc)
	
	var fileContent = new Array()
	
	var extError = false;
	
	function fileAddFunc(e){
	
		var files = e.target.files
		var fileArr= Array.prototype.slice.call(files)
		
		fileArr.forEach(function(f){
			var reader = new FileReader()
			var fileExt = f.type.substring(f.type.lastIndexOf("/")).replace("/","")
			
			if(fileExt!='jpeg' && fileExt!='jpg' &&fileExt!='png' &&fileExt!='gif'){
				extError =true;
				return false;
			}else{
				reader.onload=function(e){
				
					fileContent.push(f)
					
					$("#fileContent").html('<img src="'+e.target.result+'"  style="width:120px; height:120px;" class="rounded-circle" >')
					$("#fileDefaultIcon").hide()
				}
				reader.readAsDataURL(f)
			}	
		});
		if(extError){
			alert("jepg/jpg/png/gif파일만 올려주세요")
		}
	
	}
	
	function uploadFileFunc(){
	
		var formData = new FormData()
		
		for(var i=0; i<fileContent.length; i++){
			formData.append("fileContent",fileContent[i])
			formData.append("fileNo",$("#fileNo").val())
		}
		
		$.ajax({
			url:"/user/mypage/profile/file",
			type:"post",
			data:formData,
			enctype: "multipart/form-data",
			processData: false,
			contentType : false,
			async : false,
			success:function(result){
				console.log(result)
			}
		});
	}

	var passChkBtnFlag = false;
	
	$("#passChkBtn").on("click",function(){
		
		if(!$("#userPass").val()){
			$("#userPassYn").text("비밀번호를 입력해 주세요")
			$("#userPassYn").css("color","red")
			$("#userPass").focus()
		}else if(!$("#userPassChk").val()){
			$("#userPassYn").text("")
			$("#userPassChkYn").text("비밀번호를 확인해 주세요")
			$("#userPassChkYn").css("color","red")
			$("#userPassChk").focus()
		}else if($("#userPass").val()!=$("#userPassChk").val()){
			$("#userPassChkYn").text("비밀번호가 일치하지 않습니다.")
			$("#userPassChkYn").css("color","green")
			$("#userPassChk").focus()
		}else{
			$("#userPassYn").text("")
			$("#userPassChkYn").text("")
			$("#userPassChkBtnYn").text("")
			
			$.ajax({
				url :"/user/mypage/profile/passchk",
				type:"post",
				async:false,
				data: {"userPass" :$("#userPass").val() 
						,"userPassChk" : $("#userPassChk").val()
						},
				success: function(data){
				console.log(data)
					if(data){
						alert("비밀번호가 확인되었습니다.")
						passChkBtnFlag=true;
					
					}else{
						alert("비밀번호가 맞지 않습니다.")
						passChkBtnFlag=false;
					}
				}
			});
			
		}
	
	});
	
	
	$("#userModBtn").on("click",function(){
		if(!$("#userPass").val()){
			$("#userPassYn").text("비밀번호를 입력해 주세요")
			$("#userPassYn").css("color","red")
			$("#userPass").focus()
		}else if(!$("#userPassChk").val()){
			$("#userPassYn").text("")
			$("#userPassChkYn").text("비밀번호를 확인해 주세요")
			$("#userPassChkYn").css("color","red")
			$("#userPassChk").focus()
		}else if($("#userPass").val()!=$("#userPassChk").val()){
			$("#userPassChkYn").text("비밀번호가 일치하지 않습니다.")
			$("#userPassChkYn").css("color","green")
			$("#userPassChk").focus()
		}else{
			$("#userPassYn").text("")
			$("#userPassChkYn").text("")
			if(!passChkBtnFlag){
				$("#userPassChkBtnYn").text("비밀번호 확인버튼을 눌러주세요.")
				$("#userPassChkBtnYn").css("color","red")
			}else{
				$("#userPassChkBtnYn").text("")
				
				if(!confirm("수정하시겠습니까?")){
					return false;
				}else{
					var params = {
								"userId" : $("#userId").val(),
								"userName" : $("#userName").val(),
								"userNick" : $("#userNick").val(),
								"userMail" : $("#userMail").val(),
								"userTel" : $("#userTel").val(),
								"userBirth" : $("#userBirth").val(),
								"userAddr1" : $("#userAddr1").val(),
								"userAddr2" : $("#userAddr2").val()
								}
					
					$.ajax({
						url:"/user/mypage/profile/modifno",
						type:"post",
						data :params,
						async:false,
						success:function(result){
						
							alert(result)
							location.reload(true)
						}
					});
					
					uploadFileFunc()
				}
			}
		}
	});
	
	
	

});
</script>
</html>
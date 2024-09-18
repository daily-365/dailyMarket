<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부동산 매물 올리기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style type="text/css">
input[type="text"]{
border-radius: 10px;

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
		<form id="esRegistOneForm" class="form ">
			<br>
			<div class="row text-center fw-bold">
				<p>구분</p>
				<br><br>
				<div class="col-6">
					<label  class="form-label">세입자</label>
					<input   type="radio" name="esHumType" value="세입자" >
				</div>	
				<div class="col-6">
					<label class="form-label">집주인</label>
					<input   type="radio" name="esHumType" value="집주인">
				</div>	
			</div>
			<hr>
			<div class="row text-center fw-bold">
				<p>주소 입력</p>
				<br><br>
				<div class="col-2">
				</div>
				<div class="col-4">
					<label class="form-label">주소</label>
					<input type="text"  class="form-control" id="esLoc" name="esLoc" readonly="readonly" onclick="javascript: sample6_execDaumPostcode()" value="${userVO.userAddr1 }">
				</div>
				<div class="col-4">
					<label class="form-label">상세 주소</label>
					<input type="text" class="form-control"  id="esLocDetail" name="esLocDetail" value="${userVO.userAddr2 }" >
				</div>
			</div>
			<hr>
			<div id="mapWrap" class="row text-center fw-bold">
				<p>주소 확인</p>
				<br><br>
				<div class="col-4">
				</div>
				<div class="col-4" >
					<div id="map" style="width:100%;height:350px;"></div>
				</div>
			</div>
			<br>
			<div class="row text-center fw-bold">
				<p>위치 설명</p>
				<br><br>
				<div class="col-3">
				</div>
				<div class="col-6">
					<textarea id="esLocContent" name="esLocContent" class="form-control"></textarea>
				</div>
			</div>
			<br>
			<hr>
			<div class="row text-center fw-bold">
				<p>형태</p>
				<br><br>
				<div class="col-1">
				</div>
				<div class="col-2">
					<label  class="form-label">원룸</label>
					<input   type="radio" name="esRoomType" value="원룸">
				</div>	
				<div class="col-2">
					<label class="form-label">빌라 (투룸이상)</label>
					<input   type="radio" name="esRoomType"  value="빌라">
				</div>	
				<div class="col-2">
					<label  class="form-label">아파트</label>
					<input   type="radio" name="esRoomType" value="아파트" >
				</div>	
				<div class="col-2">
					<label class="form-label">오피스텔</label>
					<input   type="radio" name="esRoomType"  value="오피스텔">
				</div>	
				<div class="col-2">
					<label class="form-label">상가</label>
					<input   type="radio" name="esRoomType" value="상가" >
				</div>
			</div>
			<hr>
			<div class="row text-center fw-bold">
				<p>매물 사진</p>
				<br><br>
				<div class="col-12">
					<input id="esImgInput" name="esImgInput" type="file" style="display: none;" multiple="multiple">
					<svg style=" width:30px; height: 30px;" id="esImgPlusBtn" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square-fill" viewBox="0 0 16 16">
					  <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm6.5 4.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3a.5.5 0 0 1 1 0"/>
					</svg>
					
				</div>
			</div>
			<br>
			<div id="fileContent" class="row">
				<div class="col-1"></div>
			</div>
		</form>
		<br><br>
		<div class="row text-center fw-bold" >
			<div class="col-5">
			</div>
			<div class="col-2">
				<svg  id="writeTwobtn" style="color:blue; width: 30px; height: 30px;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-circle-fill" viewBox="0 0 16 16">
				  <path d="M8 0a8 8 0 1 1 0 16A8 8 0 0 1 8 0M4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5z"/>
				</svg>
			</div>
		</div>
		<br><br>
	</div>
</main>

<%@ include file="/resources/common/user/footer.jsp" %>
</body>
<!-- 카카오지도 API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7e7eda9c8086805cb16eb9832f3a8b1e&libraries=services,clusterer,drawing"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- daum 우편번호 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">

//다음 주소 api

function sample6_execDaumPostcode() {
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
	                document.getElementById("esLoc").value = extraAddr;
	            
	            } else {
	                document.getElementById("esLocDetail").value = '';
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            //document.getElementById('sample6_postcode').value = data.zonecode;
	            document.getElementById("esLoc").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("esLocDetail").focus();
	        }
	    }).open();
	}
	
// 지도 api 함수화	
function viewEsLocMapFunc(){
	var address = document.getElementById('esLoc')
	var addrVal = address.value
	
	var addrDetail = document.getElementById('esLocDetail').value
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(''+addrVal+'', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+addrVal+"  "+addrDetail +'</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});   

}

$(document).ready(function(){
	
	// 주소 API 입력 후 카카오 지도 API 호출
	$("#mapWrap").on("click",function(){
		if($("#esLoc").val() && $("#esLocDetail").val()){
			//빈값 검증 후  mapWrap(맵을 포함한  전체 해당 div) click 이벤트를 통해 아래 함수 호출
			viewEsLocMapFunc()
		}
	});
	
	
	//저장 후  다음 페이지로 이동
	$("#writeTwobtn").on("click",function(){
		if(!$("input[name=esLoc]").val()||!$("input[name=esLocDetail]").val()||!$("#esLocContent").val()||!$("input[name=esRoomType]").val()||!$("input[name=esImgInput]").val() ){
			alert("해당 사항을 모두 작성해 주세요.")
			return false;
		}else{
		
			var param = {   
						"esHumType" : $("input[name=esHumType]:checked").val() ,
						"esLoc" : $("#esLoc").val() ,
						"esLocDetail" : $("input[name=esLocDetail]").val(),
						"esLocContent" : $("#esLocContent").val(),
						"esRoomType" : $("input[name=esRoomType]:checked").val()
						}
		
			if(!confirm("다음페이지로 이동합니다. 저장하시겠습니까?")){
				return false;
			}else{
				uploadFileFunc()
				$.ajax({
					url:"/user/estate/writeOne",
					type:"post",
					async :false,
					data : param,
					success:function(result){
						alert(result)
						location.href="/user/estate/writeTwo";
					
					}
				});
			}
		}
	});

	
	//파일 업로드
	
	$("#esImgPlusBtn").on("click",function(){
		$("#esImgInput").click()
	});
	
	$("#esImgInput").on("change",fileAddFunc)
	
	var fileNum=0;
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
		
		fileCnt=fileArr.length +fileNum
		
		fileArr.forEach(function(f){
			var reader = new FileReader()
			var fileExt = f.type.substring(f.type.lastIndexOf("/")).replace("/","")
		
			if(fileCnt>totalCnt){
				cntError=true;
				return false;
			}if(fileExt!='jpeg' && fileExt!='jpg' && fileExt!='png' && fileExt!='gif'){
				extError=true;
				return false;
			}if(fileSize>totalSize){
				sizeError=true;
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
											+"<img src='"+e.target.result+"' class='form-control fileImgs' ></img>"
											+"<br>"
											+"<button id='btn"+fileNum+"' type='button' class='btn btn-danger form-control' >X </button>"
											+"</div>"
											+"<br>"
											)
				
						$("#btn"+fileNum).on("click",function(){
							fileNum--
							fileCnt--
							fileSize-=f.size
							
							fileContent.pop(f)
							$(this).parent('div').remove();
						});
					}
					reader.readAsDataURL(f)
				}
		
			});
			
			if(cntError){
				alert("파일은 최대 5개까지 올릴 수 있습니다.")
			}if(extError){
				alert("jepg/jpg/png/gif파일만 올려주세요")
			}if(sizeError){
				alert("최대 용량은 3M까지 입니다.")
			}
		}
	
	//파일업로드 AJAX
	
	function uploadFileFunc(){
		var formData = new FormData()
		
		for(var i=0; i<fileContent.length; i++){
			formData.append("fileContent",fileContent[i])
		
		}
		
		$.ajax({
			url: "/user/estate/writeOne/uploadFile",
			type: "post",
			data: formData,
			async:false,
			processData: false,
			contentType : false,
			encType : "multipart/form-data",
			success:function(result){
				console.log(result)
			
			}
		
		})
	
	}
	


});

</script>
</html>
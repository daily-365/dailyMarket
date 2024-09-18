<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고거래 글쓰기</title>
<style type="text/css">
.svg {
	width: 30px;
	height: 30px;
}
.fileImgs{
	width: 300px;
	height: 100px;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body class="container-fluid">
<%@ include file="/resources/common/user/header.jsp" %>
<div class="container">
	<br><br>
	<h5 class="fw-bold text-dark text-center">내 물건 팔기</h5><br><br>
	<form id="registForm" class="from" method="post" enctype="multipart/form-data">
		<div class="offset-md-4">
			<input type="hidden" value="${userId }" name="writer">
			<div class="col">
				<input id="fileInput" type="file" multiple="multiple" style="display:none;">
				<div id="fileAddBtn" class="text-center col-1 d-flex justify-content-center" style="border: 1px solid black; border-radius: 10px;">
					<span class="svg fw-bold text-dark">&nbsp;+</span>
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="svg bi bi-camera-fill" viewBox="0 0 16 16">
			  			<path d="M10.5 8.5a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0"/>
			  			<path d="M2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4zm.5 2a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1m9 2.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0"/>
					</svg>
					<span class="svg fw-bold text-dark">10&nbsp;</span>
				</div>
			</div>
			<br>
			<br>
			<div class="row" id="fileContent"></div>
			<br>
			<div class="col-6">
				<label for="title" class="form-label fw-bold" >제목</label>
				<input type="text" id="title" name="title" class="form-control" maxlength="15">
			</div><br>
			<div class="col-6">
				<label for="type" class="form-label fw-bold">거래방식</label><br>
				<input type="radio"  name="type" id="saleBtn"  value="sale" checked="checked">판매하기
				<input  type="radio" name="type" id="shareBtn" value="share">나눔하기<br><br>
				<input type="text" id="price"  placeholder="￦ 가격을 입력해 주세요." class="form-control" onkeyup='this.value = this.value.replace(/[^0-9]/g,""); this.value = this.value.replace(/\B(?=(\d{3})+(?!\d))/g,",");'>
				<input type="hidden" id="priceNum" name="price" >
				
			</div><Br>
			<div class="col-6">
				<label for="content" class="form-label fw-bold">자세한 설명</label><br>
				<textarea id="content" name="content" class="form-control" maxlength="500"></textarea><br>
			</div>
			<div class="col-6">
				<label for="location" class="form-label fw-bold">거래 희망 장소</label><br>
				<input type="text" id="location" name="location" class="form-control" placeholder="위치추가 " data-bs-toggle="modal" data-bs-target="#locApiModal">
			</div>
			<br>
			<div class="col-6">
				<button id="registBtn" class="btn btn-secondary form-control" type="button">물품 올리기</button>
			</div>
		</div>
	</form>

<!-- Modal -->
<div class="modal fade" id="locApiModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="locApiModal">위치 추가</h5>
        <button type="button"  class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <br>
      <div class="h6 fw-bold text-center"><span class="text-danger">※ </span>마커를 클릭해 주세요 -!</div>
      <br>
      <div class="modal-body">
        <div class="map_wrap">
	    <div id="map" ></div>
	    <div id="menu_wrap" class="bg_white">
	        <div class="option">
	            <div>
	                <form class="form" onsubmit="searchPlaces(); return false;">
	                	<div class="row">
	                		<div class="col-6">
			                	<span class="form-label fw-bold text-center">위치 검색</span><br><br>
			                   	 <input type="text" id="keyword" size="15" class="form-control"> 
			                </div>
			                <div class="col-6"><br><br>
			                   	 <button id="seaerchLocBtn" class="btn btn-success"  type="submit">검색하기</button>
		                    </div>
	                	</div> 
	                </form>
	            </div>
	        </div>
	        <hr>
	        <ul id="placesList"></ul><br>
	        <div id="pagination" class="text-center"></div>
	    </div>
	</div>
      </div>
      <div class="modal-footer">
      	<button type="button" id="selectLocBtn" class="btn btn-primary"  data-bs-dismiss="modal">선택</button>
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>


</div>
<%@ include file="/resources/common/user/footer.jsp" %>
</body>
<!-- 카카오지도 API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7e7eda9c8086805cb16eb9832f3a8b1e&libraries=services"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
// 카카오 지도 API

// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

function resizeMap() {
        var mapContainer = document.getElementById('map');
        mapContainer.style.width = '100%';
        mapContainer.style.height = '500px'; 
    }
    
    function relayout() {    
        map.relayout();
    }
    
// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

	var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

var selectLocBtn = document.getElementById("selectLocBtn");
	
// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    var keyword = document.getElementById("keyword");
    var location = document.getElementById("location");
  	
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            
            // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
			kakao.maps.event.addListener(marker, 'click', function() {
			 	keyword.value=title;
			 	alert(title)
			});
            
            //선택 버튼 클릭시 input(location) 에 해당 title 삽입
            selectLocBtn.addEventListener('click',function(){
				location.value=keyword.value;
			})
          
			 
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('table'),
    itemStr = (index+1)+'.<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';
	
    return el;
}


// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('span');
        el.innerHTML ="<button type='button' class='btn btn-outline-primary'>"+i+"</button>";
		
        if (i===pagination.current) {
            el.className = 'on';
            
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

	var location = document.getElementById
		location.value = title; 
	
    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}


$(document).ready(function(){
	
	//검색시 지도 API 호출 
	$("#seaerchLocBtn").on("click",function(){
   		resizeMap()
    	relayout();
	});
	
	
	//파일업로드
	var fileNum =0;
	var fileContent =new Array()

	var fileCnt =0;
	var totalCnt =10;
	
	var fileSize = 0;
	var totalSize =1024**2*3;
	
	$("#fileAddBtn").on("click",function(){
		$("#fileInput").click();
	});


	$("#fileInput").on("change",fileAddFunc)
	
	//에러 문구 flag : (변수를 반복문 밖에 두어 alert창 한번만 띄우게.)
	var cntError = false;
	var extError = false;
	var sizeError = false;
	
	function fileAddFunc(e){
		var files = e.target.files;
	 	var fileArr = Array.prototype.slice.call(files);
		// 파일 개수 제한
		fileCnt=fileArr.length+fileNum
				
		//파일 체크 및 미리보기		
		fileArr.forEach(function(f){ 		
			var reader = new FileReader();
			var fileExt =  f.name.substring(f.name.lastIndexOf(".")).replace(".","")
			
				
			if(fileCnt>totalCnt){
				cntError=true;
				return false;
			}if(fileExt!='jpeg' && fileExt!='jpg'&&fileExt!='png'&&fileExt!='gif'){
				extError =true;
				return false;
			}if(fileSize>totalSize){
				sizeError =true;
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
							//증가값 다시 감소
							fileNum--
							fileCnt--
							fileSize-=f.size
							
							fileContent.pop(f) // 콘텐츠 삭제
							$(this).parent('div').remove(); //화면에서 삭제
							
							console.log(fileCnt,fileSize)
						
						});
					}
					reader.readAsDataURL(f)
				}
			});
			
		if(cntError){
			alert("파일은 최대 10개까지 올릴 수 있습니다.")
		}if(extError){
			alert("jepg/jpg/png/gif파일만 올려주세요")
		}if(sizeError){
			alert("최대 용량은 10M까지 입니다.")
		}
	}
	
	
	
	//파일업로드 
	function uploadFileFunc(){
		var formData = new FormData()
		
		for(var i=0; i<fileContent.length; i++){
			formData.append("uploadFiles",fileContent[i])
		}
	
		console.log(formData,fileContent)
			
		$.ajax({
			url:"/user/product/fileUpload",
			type:"post",
			data:formData,
			enctype: "multipart/form-data",
			processData: false,
			contentType : false,
			success:function(result){
				console.log(result)
			}
		});
	}
	
	$("#registBtn").on("click",function(){
		if(!$("#fileContent").html()){
			alert("파일을 선택해 주세요")
			return false;
		}else if(!$("#title").val()){
			alert("제목을 입력해 주세요")
			$("#title").focus()
			return false;
		}else if(!$("#price").val()){
			alert("가격을 입력해 주세요")
			$("#price").focus()
			return false;
		}else if(!$("#content").val()){
			alert("내용을 입력해 주세요")
			$("#content").focus()
			return false;
		}else if(!$("#location").val()){
			alert("위치를 선택해 주세요")
			$("#locaiton").focus()
			return false;
		}else{
			$("#priceNum").val($("#price").val().replaceAll(",","")) //Data 전송시 다시 천단위 컴마 제거
			uploadFileFunc() //파일업로드 함수 실행
			
			$("#registForm").attr("action", "/user/product/write")
			$("#registForm").submit()
			alert("내 물품이 등록되었습니다-!")
		}	
	
	});
	
	// 판매하기 / 공유하기 이벤트
	$("#shareBtn").on("click",function(){
		$("#saleBtn").attr("class","btn btn-light")
		$("#shareBtn").attr("class","btn btn-dark")
		
		$("#price").val(0)
		$("#price").attr("readonly",true)
	});
	
	$("#saleBtn").on("click",function(){
		$("#saleBtn").attr("class","btn btn-dark")
		$("#shareBtn").attr("class","btn btn-light")
		$("#price").val("")
		$("#price").attr("readonly",false)
		
	});
	
});

</script>
</html>
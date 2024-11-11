<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고 제작 신청</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body class="container-fluid">
	<main class="container">
	<br><br>
	<h4 class="fw-bold text-center">광고 등록</h4>
	<br>
		<div class="row justify-content-center">
			<p class="fw-bold text-center">1.광고에 쓰일 사진을 선택해 주세요-!</p>
				<input type="file" id="fileInput"  style="display:none;">
			<div class="col-6">
				<c:if test="${empty advertVO.storedFileName }">
				<button type="button" id="fileAddBtn" class="btn btn-outline-primary form-control">사진추가</button>
				</c:if>
				<c:if test="${not empty advertVO.storedFileName }">
				<button type="button" id="fileAddBtn" class="btn btn-outline-danger form-control">사진변경</button>
				</c:if>
				<hr>
			</div>
		</div>
		<div class="row justify-content-center">
			<div id="fileContent" class="row justify-content-center">
				<c:if test="${not empty advertVO.storedFileName }">
				<img style='width:200px; height:150px' src="/resources/upload/owner/company/advert/${advertVO.storedFileName }">
				</c:if>
			</div>
		</div>
		<br>
		<div class="row justify-content-center">
			<p class="fw-bold text-center">2.간략하게 소개글 부탁드려요.</p>
			<div class="col-6">
				<textarea id="advertContent" class="form-control" maxlength="100">${advertVO.content }</textarea>
			<hr>
			</div>
		</div>
		
		<div class="row justify-content-center">
			<p class="fw-bold text-center">3.원하는 대상을 선택해 주세요-</p>
		</div>
		<div class="row justify-content-center">
			<div class="col-6">
				<p class="fw-bold text-center">( 지역 )</p>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-2">
				<select class="form-control text-center fw-bold" id="locType1">
					<option value="">선택</option>
					<option value="서울특별시" <c:if test="${fn:contains(advertVO.location,'서울특별시') eq true}">selected</c:if>>서울특별시</option>
					<option value="부산광역시" <c:if test="${fn:contains(advertVO.location,'부산광역시') eq true}">selected</c:if>>부산광역시</option>
					<option value="대구광역시" <c:if test="${fn:contains(advertVO.location,'대구광역시') eq true}">selected</c:if>>대구광역시</option>
					<option value="인천광역시" <c:if test="${fn:contains(advertVO.location,'인천광역시') eq true}">selected</c:if>>인천광역시</option>
					<option value="광주광역시" <c:if test="${fn:contains(advertVO.location,'광주광역시') eq true}">selected</c:if>>광주광역시</option>
					<option value="대전광역시" <c:if test="${fn:contains(advertVO.location,'대전광역시') eq true}">selected</c:if>>대전광역시</option>
					<option value="울산광역시" <c:if test="${fn:contains(advertVO.location,'울산광역시') eq true}">selected</c:if>>울산광역시</option>
					<option value="세종특별자치시" <c:if test="${fn:contains(advertVO.location,'세종특별자치시') eq true}">selected</c:if>>세종특별자치시</option>
					<option value="경기도" <c:if test="${fn:contains(advertVO.location,'경기도') eq true}">selected</c:if>>경기도</option>
					<option value="강원특별자치도" <c:if test="${fn:contains(advertVO.location,'강원특별자치도') eq true}">selected</c:if>>강원특별자치도</option>
					<option value="충청북도" <c:if test="${fn:contains(advertVO.location,'충청북도') eq true}">selected</c:if>>충청북도</option>
					<option value="충청남도" <c:if test="${fn:contains(advertVO.location,'충청남도') eq true}">selected</c:if>>충청남도</option>
					<option value="전북특별자치도" <c:if test="${fn:contains(advertVO.location,'전북특별자치도') eq true}">selected</c:if>>전북특별자치도</option>
					<option value="전라남도" <c:if test="${fn:contains(advertVO.location,'전라남도') eq true}">selected</c:if>>전라남도</option>
					<option value="경상북도" <c:if test="${fn:contains(advertVO.location,'경상북도') eq true}">selected</c:if>>경상북도</option>
					<option value="경상남도" <c:if test="${fn:contains(advertVO.location,'경상남도') eq true}">selected</c:if>>경상남도</option>
					<option value="제주특별자치도" <c:if test="${fn:contains(advertVO.location,'제주특별자치도') eq true}">selected</c:if>>제주특별자치도</option>
				</select>
			</div>
			<div class="col-2">
				<select id="locType2" class="form-control text-center fw-bold">
					<option>${fn:split(advertVO.location,' ')[1]}</option>
				</select>
			</div>
			<div class="col-2">
				<select id="locType3" class="form-control text-center fw-bold">
					<option>${fn:split(advertVO.location,' ')[2]}</option>
				</select>
			</div>
		</div>
		<br>
		<div class="row justify-content-center">
			<div class="col-6">
				<p class="fw-bold text-center">( 성별 및 연령 )</p>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-6">
				<select class="form-control text-center fw-bold" name="age" id="age">
					<option value="">선택</option>
					<option value="15-25세" <c:if test="${advertVO.age eq '15-25세' }">selected="selected"</c:if> >15-25세</option>
					<option value="26-35세" <c:if test="${advertVO.age eq '26-35세' }">selected="selected"</c:if> >26-35세</option>
					<option value="36-45세" <c:if test="${advertVO.age eq '36-45세' }">selected="selected"</c:if> >36-45세</option>
					<option value="46-55세" <c:if test="${advertVO.age eq '46-55세' }">selected="selected"d</c:if> >46-55세</option>
					<option  value="50세 이상" <c:if test="${advertVO.age eq '50세 이상' }">selected="selected"</c:if> >50세 이상</option>
				</select>
			</div>
		</div>
		<br>
		<div class="row justify-content-center">
			<div class="col-6 fw-bold text-center">
			
				<input type="radio" name="gender" value="M" checked="checked" <c:if test="${advertVO.gender eq 'M' }">checked="checked"</c:if>>남
				<input type="radio" name="gender" value="F" <c:if test="${advertVO.gender eq 'F' }">checked="checked"</c:if>>여
				<hr>
			</div>
		</div>
		
		<c:if test="${empty advertVO }">
		<div class="row justify-content-center">
			<p class="fw-bold text-center">4.기간 및 예산만 설정하면 끝!</p>
		</div>
		<div class="row justify-content-center">
			<p class="fw-bold text-center">예산</p>
			<div class="col-3">
				<button type="button" class="form-control btn btn-primary" id="dayPriceBtn">하루 예산</button>
			</div>
			<div class="col-3">
				<button type="button" class="form-control btn btn-light" id="totalPriceBtn">총 예산</button>
			</div>
		</div>
		<br>
		<div class="row justify-content-center">
			<div class="col-1">
				<button type="button" class="btn btn-light form-control" id="plusPriceBtn">+</button>
			</div>
			<div class="col-4">
				<input type="text" class="form-control" value="8000" id="priceInput" >
			</div>
			&nbsp;
			<div class="col-1">
				<button type="button" class="btn btn-light form-control" id="minusPriceBtn">-</button>
			</div>
		</div>
		<br><br>
		<div class="row justify-content-center">
			<p class="fw-bold text-center">기간</p>
			<div class="col-3">
				<button type="button" class="form-control btn btn-primary"id="nowStartBtn">지금 시작</button>
			</div>
			<div class="col-3">
				<button type="button" class="form-control btn btn-light" id="laterStartBtn">나중에 시작</button>
			</div>
		</div>
		<br>
		<div class="row justify-content-center">
			<div class="col-4">
				<input type="text" class="form-control" value="14" id="daysInput"  >
			</div>
			<div class="col-1">
				<button type="button" class="btn btn-light form-control" id="plusDaysBtn">+</button>
			</div>
			<div class="col-1">
				<button type="button" class="btn btn-light form-control" id="minusDaysBtn">-</button>
			</div>
		</div>
		<br>
		</c:if>
		
		<c:if test="${not empty advertVO }">
		<div class="row justify-content-center">
			<p class="fw-bold text-center">4.기간 및 예산만 설정하면 끝!</p>
			<p class="text-center text-danger fw-bold">※ 광고 등록 후 예산 및 기간 설정을 수정하시려면 취소 후 재등록이 필요합니다.</p>
		</div>
		<div class="row justify-content-center">
			<p class="fw-bold text-center">예산</p>
			<div class="col-3">
				<c:if test="${ advertVO.priceType eq 'day' }">
				<button type="button" class="form-control btn btn-primary">하루 예산</button>
				</c:if>
				<c:if test="${advertVO.priceType eq 'total' }">
				<button type="button" class="form-control btn btn-light" >하루 예산</button>
				</c:if>
			</div>
			<div class="col-3">
				<c:if test="${advertVO.priceType eq 'total' }">
				<button type="button" class="form-control btn btn-primary" >총 예산</button>
				</c:if>
				<c:if test="${ advertVO.priceType eq 'day' }">
				<button type="button" class="form-control btn btn-light" >총 예산</button>
				</c:if>
			</div>
		</div>
		<br>
				
		<div class="row justify-content-center">
			<div class="col-1">
				<button type="button" class="btn btn-light form-control" >+</button>
			</div>
			<div class="col-4">
				<input type="text" class="form-control" value="${advertVO.price }" readonly="readonly" >
			</div>
			&nbsp;
			<div class="col-1">
				<button type="button" class="btn btn-light form-control" >-</button>
			</div>
		</div>
		<br><br>
		<div class="row justify-content-center">
			<p class="fw-bold text-center">기간</p>
			<div class="col-3">
				<c:if test="${advertVO.startType eq 'now' }">
				<button type="button" class="form-control btn btn-primary">지금 시작</button>
				</c:if>
				<c:if test="${advertVO.startType eq 'later' }">
				<button type="button" class="form-control btn btn-light">지금 시작</button>
				</c:if>
			</div>
			<div class="col-3">
				<c:if test="${advertVO.startType eq 'later' }">
				<button type="button" class="form-control btn btn-primary" >나중에 시작</button>
				</c:if>
				<c:if test="${advertVO.startType eq 'now' }">
				<button type="button" class="form-control btn btn-light" >나중에 시작</button>
				</c:if>
			</div>
		</div>
		<br>
		<div class="row justify-content-center">
			<div class="col-4">
				<input type="text" class="form-control" value="14"  readonly="readonly" >
			</div>
			<div class="col-1">
				<button type="button" class="btn btn-light form-control" >+</button>
			</div>
			<div class="col-1">
				<button type="button" class="btn btn-light form-control" >-</button>
			</div>
		</div>
		<br>
		
		
		</c:if>
		
		<div class="row justify-content-center fw-bold">
			<div class="col-6">
				<input type="checkbox" name="endDateYn" value="Y" <c:if test="${advertVO.endDateYn eq 'Y' }">checked="checked"</c:if>> &nbsp; 종료일 없이 계속 광고하기
				<input type="checkbox" name="endDateYn" value="N" checked="checked" style="display: none;" <c:if test="${advertVO.endDateYn eq 'N' }">checked="checked"</c:if>>
			</div>
		</div>
		<br>
		<div class="row justify-content-center fw-bold">
			<div class="col-6">
				<input type="checkbox" name="detailYn" value="Y" <c:if test="${advertVO.detailYn eq 'Y' }">checked="checked"</c:if>>&nbsp; 상세 일정 설정하기
				<input type="checkbox" name="detailYn" value="N" checked="checked" style="display: none;"<c:if test="${advertVO.detailYn eq 'N' }">checked="checked"</c:if>>
			<hr>
			</div>
		</div>
		<c:if test="${empty advertVO.accountNum}">
		<div class="row justify-content-center">
			<p class="fw-bold text-center">예산 결제</p>
				<div class="col-4">
					<label class="form-label fw-bold">예금주</label>	
					<input type="text" class="form-control" id="userName">
					<label class="form-label fw-bold">출금 은행</label>		
					<select class="form-control" id="tradeBank">
						<option value="">선택</option>
						<option value="신한">신한</option>
						<option value="농협">농협</option>
						<option value="하나">하나</option>
						<option value="국민">국민</option>
						<option value="우리">우리</option>
						<option value="기업">기업</option>
						<option value="새마을금고">세마을금고</option>
						<option value="SC제일">SC제일</option>
					</select>
					<label class="form-label fw-bold">출금 계좌번호</label>		
					<input type="text" class="form-control" id="accountNum">
					<label class="form-label fw-bold">결제할 금액</label>	
					<input type="text" class="form-control" readonly="readonly" id="payment" >
				</div>
				<br>
			</div>
			<br>
		</c:if>
		<c:if test="${not empty advertVO.accountNum}">
		<div class="row justify-content-center col-4 offset-md-4" style="border: 1px solid black;">
			<br>
			<p class="fw-bold text-center">결제 내역</p>
			<br><br>
				<div class="col-4">
					<p class="fw-bold text-center">은행</p>
					<p class=" text-center">${advertVO.tradeBank}</p>
					<p class="fw-bold text-center">출금 계좌번호</p>
					<p class=" text-center">${advertVO.accountNum }</p>
					<p class="fw-bold text-center">입금액</p>
					<p class=" text-center"> <fmt:formatNumber value="${advertVO.prevPrice }" pattern="#,###" /> </p>
					<p class="fw-bold text-center">현재 잔액</p>
					<p class=" text-center text-danger"> <fmt:formatNumber value="${advertVO.price }" pattern="#,###" /> </p>
					<p class="fw-bold text-center">입금확인</p>
					<c:if test="${advertVO.payStatus eq 'Y' }">
						<p class=" text-center text-primary fw-bold">확인 완료</p>
					</c:if>
					<c:if test="${advertVO.payStatus eq 'S' }">
						<p class=" text-center text-warning fw-bold">확인중</p>
					</c:if>
					<c:if test="${advertVO.payStatus eq 'N' }">
						<p class=" text-center text-danger fw-bold">미확인</p>
					</c:if>
					<p class="fw-bold text-center">승인상태</p>
					<c:if test="${advertVO.approveStatus eq 'Y' }">
						<p class=" text-center text-primary fw-bold">승인 완료</p>
					</c:if>
					<c:if test="${advertVO.approveStatus eq 'S' }">
						<p class=" text-center text-warning fw-bold">승인 대기</p>
					</c:if>
					<c:if test="${advertVO.approveStatus eq 'N' }">
						<p class=" text-center text-danger fw-bold">승인 불가</p>
					</c:if>
					
				</div>
			</div>
			<br>
		</c:if>
		<c:if test="${empty advertVO }">
		<div class="row justify-content-center">
			<div class="col-6">
				<button class="btn btn-primary form-control" type="button" id="advertRegBtn">등록하기</button>
			</div>
		</div>
		<br>
		</c:if>
		<c:if test="${not empty advertVO }">
		<div class="row justify-content-center">
			<c:if test="${advertVO.payStatus eq'S' }">
			<div class="col-3">
				<button class="btn btn-warning form-control" type="button" id="advertModBtn">수정하기</button>
			</div>
			<div class="col-3">
				<button class="btn btn-danger form-control" type="button" id="advertDelBtn">취소하기</button>
			</div>
			</c:if>
			<c:if test="${advertVO.payStatus ne 'S' }">
				<div class="col-6">
				<button class="btn btn-danger form-control" type="button" id="advertDelBtn">취소하기</button>
			</div>
			</c:if>
		</div>
		<br>
		</c:if>
		<br>
	</main>
<input type="hidden" value="${advertVO.fileNo }" id="fileNo">
<input type="hidden" id="busiNo" value="${param.busiNo }">
<input type="hidden" id="priceType" value="day">
<input type="hidden" id="startType" value="now">

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#fileAddBtn").on("click",function(){
		$("#fileInput").click()
	})
	
	$("#fileInput").on("change",fileAddFunc)
		
		var fileNum=0;
		var fileContent= new Array()
		
		var fileSize=0;
		var totalSize =1024**2*1
		
		var extError = false;
		var sizeError = false;
		
		
		function fileAddFunc(e){
			
			var files = e.target.files
			var fileArr= Array.prototype.slice.call(files)
			
			fileArr.forEach(function(f){
				var reader = new FileReader();
				var fileExt = f.type.substring(f.type.lastIndexOf("/")).replace("/","")
				
				if(fileExt!='jpeg'&&fileExt!='jpg'&&fileExt!='png'&&fileExt!='gif'){
					extError=true;
					return false;
				}if(fileSize>totalSize){
					sizeError=true;
					return false;
				}else{
					extError=false;
					sizeError=false;
				
					reader.onload=function(e){
						
						fileSize+=f.size
						
						fileContent.push(f)
						
						$("#fileContent").html("<div  id='file"+fileNum+"' class='fw-bold col-2' >"
									+"&nbsp;<img src='"+e.target.result+"' class='form-control' style='width:200px; height:150px';></img>"
									+"&nbsp;<button id='btn"+fileNum+"' type='button' class='btn btn-danger form-control' >X </button>"
									+"<br><br>"
									+"</div>"
									)
			
						
						$("#btn"+fileNum).on("click",function(){
							fileSize-=f.size
							
							fileContent.pop(f)
							$(this).parent('div').remove()
							
						})
					}
					reader.readAsDataURL(f)
				}
				
			})
			if(extError){
				alert("jepg/jpg/png/gif파일만 올려주세요")
			}if(sizeError){
				alert("최대 용량은 1M 이하여야합니다.")
			}
		}
		

	$("#locType1").on("change",function(){
		$("#locType2").empty()
		$("#locType3").empty()
		
		var locType2a =["선택","종로구","중구","용산구","성동구","광진구","동대문구","중랑구","성북구","강북구","도봉구"
						,"노원구","은평구","서대문구","마포구","양천구","강서구","구로구","금천구","영등포구","동작구","관악구","서초구","강남구","송파구","강동구"]
		var locType2b =["선택","중구","서구","동구","영도구","부산진구","동래구","남구","북구","해운대구","사하구","금정구","강서구","연제구","수영구","사상구","기장군"]
		var locType2c =["선택","중구","동구","서구","남구","북구","수성구","달서구","달성군","군위군"]
		var locType2d =["선택","중구","동구","미추홀구","연수구","남동구","부평구","계양구","서구","강화군","옹진군"]
		var locType2e =["선택","동구","서구","남구","북구","광산구"]
		var locType2f =["선택","동구","중구","서구","유성구","대덕구"]
		var locType2g =["선택","중구","남구","동구","북구","울주군"]
		var locType2h =["세종특별자치시"] 
		var locType2i =["선택","수원시","용인시","고양시","화성시","성남시","부천시","남양주시","안산시","평택시","안양시","시흥시","파주시","김포시","의정부시"
						,"광주시","하남시","광명시","군포시","양주시","오산시","이천시","안성시","구리시","의왕시","포천시","양평군","여주시","동두천시","과천시","가평군","연천군"]
		var locType2j =["선택","춘천시","원주시","강릉시","동해시","태백시","속초시","삼척시","홍천군","횡성군","영월군","평창군","정선군","철원군","화천군","양구군","인제군","고성군","양양군"]
		var locType2k =["선택","청주시","충주시","제천시","보은군","옥천군","영동군","증평군","진천군","괴산군","음성군","단양군"]
		var locType2l =["선택","천안시","공주시","보령시","아산시","서산시","논산시","계룡시","당진시","금산군","부여군","서천군","청양군","홍성군","예산군","태안군"]
		var locType2m =["선택","전주시","군산시","익산시","남원시","김제시","완주군","진안군","무주군","장수군","임실군","순창군","고창군","부안군"]
		var locType2n =["선택","목포시","여주시","순천시","나주시","광양시","담양군","곡성군","구례군","고흥군","보성군","화순군","장흥군","강진군","해남군","영암군","무안군","함평군","영광군","장성군","완도군","진도군","신안군"]
		var locType2o =["선택","포항시","경주시","김천시","안동시","구미시","영주시","영천시","상주시","문경시","경산시","의성군","청송군","영양군","영덕군"
						,"청도군","고령군","성주군","칠곡군","예천군","봉화군","울진군","울릉군"]
		var locType2p =["선택","창원시","진주시","통영시","사천시","김해시","밀양시","거제시","양산시","의령군","함안군","창녕군","고성군","남해군","하동군","산청군","함양군","거창군","합천군"]
		var locType2q =["선택","제주시","서귀포시"]
		
		var locType2b3a =["선택","청운효자동","사직동","삼청동","부암동","평창동","무악동","교남동","가희동","종로","이화동","혜화동","창신동","승인동"]
		var locType2b3b =["선택","소곡동","회현동","명동","필동","장충동","광희동","을지로동","신당동","다산동","약수동","청구동","신당동","동화동","황학동","중림동"]
		var locType2b3c =["선택","후함동","용산동","남영동","원효동","효창동","용문동","한강로동","이촌동","이태원동","한남동","서빙고동","보광동"]
		var locType2b3d =["선택","왕십리동","마장동","사근동","행당동","응봉동","금호동","옥수동","성수동","송정동","용답동"]
		var locType2b3e =["선택","중곡동","능동","구의동","광장동","자양동","화양동","군자동"]
		var locType2b3f =["선택","용신동","제기동","전농동","답십리동","장안동","청량리동","회기동","휘경동","이문동"]
		var locType2b3g =["선택","면목동","상봉동","중화동","목제동","망우본동","망우동","신내동"]
		var locType2b3h =["선택","성북동","삼선동","동선동","돈암동","안암동","보문동","정릉동","길음동","종암동","월곡동","장위동","석관동"]
		var locType2b3i =["선택","삼양동","미아동","송중동","송천동","삼각산동","번동","수유동","우이동","인수동"]
		var locType2b3j =["선택","쌍문동","방학동","창동","도봉동"]
		var locType2b3k =["선택","월계동","공릉동","하계동","중계본동","중계동","상계동"]
		var locType2b3l =["선택","녹번동","불광동","갈현동","구산동","대조동","응암동","역촌동","신사동","중산동","수색동","전관동"]
		var locType2b3m =["선택","충현동","천연동","북아현동","신촌동","연희동","홍제동","홍은동","남가좌동","북가좌동"]
		var locType2b3n =["선택","공덕동","아현동","도화동","용강동","대흥동","염리동","신수동","서강동","서교동","합정동","망원동","연남동","성산동","상암동"]
		var locType2b3o =["선택","목동","신월동","신정동"]
		var locType2b3p =["선택","염창동","등촌동","화곡본동","화곡동","우장산동","가양동","발산동","공항동","방화동"]
		var locType2b3q =["선택","신림동","구로동","가리봉동","고척동","개봉동","오류동","수궁동","항동"]
		var locType2b3r =["선택","가산동","독산동","시흥동"]
		var locType2b3s =["선택","영등포본동","영등포동","여의도동","당산동","도림동","문래동","양평동","신길동","대림동"]
		var locType2b3t =["선택","노량진동","상도동","흑석동","사당동","대방동","신대방동"]
		var locType2b3u =["선택","보라매둥","은천동","성현동","중앙동","청림동","행운동","청룡동","낙성대동","인헌동","남현동","신림동","신사동","조원동","미성동","난곡동","난향동","서원동","신원동","서림동","삼성동","대학동"]
		var locType2b3v =["선택","서처동","잠원동","반포동","방배동","양재동","내곡동"]
		var locType2b3w =["선택","신사동","논현동","압구정동","청담동","상담동","대치동","역삼동","도곡동","개포동","일원본동","일원동","수서동","세곡동"]
		var locType2b3x =["선택","풍납동","거여동","마천동","방이동","오륜동","오금동","송파동","석촌동","삼전동","가락본동","가락동","문정동","장지동","위례동","잠실본동","잠실동"]
		var locType2b3y =["선택","강일동","상일동","명일동","고덕동","암사동","천호동","성내동","길동","둔춘동"]
		
		if($(this).val()=="서울특별시"){
			for(var i=0; i<locType2a.length; i++){
				$("#locType2").append("<option value='"+locType2a[i]+"'>"+locType2a[i]+"</option>")
			}
			
			$("#locType2").on("change",function(){
				$("#locType3").empty()
				
				if($(this).val()=="종로구"){
					for(var i=0; i<locType2b3a.length; i++){
						$("#locType3").append("<option value='"+locType2b3a[i]+"'>"+locType2b3a[i]+"</option>")
					}
				}if($(this).val()=="중구"){
					for(var i=0; i<locType2b3b.length; i++){
						$("#locType3").append("<option value='"+locType2b3b[i]+"'>"+locType2b3b[i]+"</option>")
					}
				}if($(this).val()=="용산구"){
					for(var i=0; i<locType2b3c.length; i++){
						$("#locType3").append("<option value='"+locType2b3c[i]+"'>"+locType2b3c[i]+"</option>")
					}
				}if($(this).val()=="성동구"){
					for(var i=0; i<locType2b3d.length; i++){
						$("#locType3").append("<option value='"+locType2b3d[i]+"'>"+locType2b3d[i]+"</option>")
					}
				}
				if($(this).val()=="광진구"){
					for(var i=0; i<locType2b3e.length; i++){
						$("#locType3").append("<option value='"+locType2b3e[i]+"'>"+locType2b3e[i]+"</option>")
					}
				}if($(this).val()=="동대문구"){
					for(var i=0; i<locType2b3f.length; i++){
						$("#locType3").append("<option value='"+locType2b3f[i]+"'>"+locType2b3f[i]+"</option>")
					}
				}
				if($(this).val()=="중랑구"){
					for(var i=0; i<locType2b3g.length; i++){
						$("#locType3").append("<option value='"+locType2b3g[i]+"'>"+locType2b3g[i]+"</option>")
					}
				}if($(this).val()=="성북구"){
					for(var i=0; i<locType2b3h.length; i++){
						$("#locType3").append("<option value='"+locType2b3h[i]+"'>"+locType2b3h[i]+"</option>")
					}
				}if($(this).val()=="강북구"){
					for(var i=0; i<locType2b3i.length; i++){
						$("#locType3").append("<option value='"+locType2b3i[i]+"'>"+locType2b3i[i]+"</option>")
					}
				}
				if($(this).val()=="도봉구"){
					for(var i=0; i<locType2b3j.length; i++){
						$("#locType3").append("<option value='"+locType2b3j[i]+"'>"+locType2b3j[i]+"</option>")
					}
				}if($(this).val()=="노원구"){
					for(var i=0; i<locType2b3k.length; i++){
						$("#locType3").append("<option value='"+locType2b3k[i]+"'>"+locType2b3k[i]+"</option>")
					}
				}if($(this).val()=="은평구"){
					for(var i=0; i<locType2b3l.length; i++){
						$("#locType3").append("<option value='"+locType2b3l[i]+"'>"+locType2b3l[i]+"</option>")
					}
				}
				if($(this).val()=="서대문구"){
					for(var i=0; i<locType2b3m.length; i++){
						$("#locType3").append("<option value='"+locType2b3m[i]+"'>"+locType2b3m[i]+"</option>")
					}
				}if($(this).val()=="마포구"){
					for(var i=0; i<locType2b3n.length; i++){
						$("#locType3").append("<option value='"+locType2b3n[i]+"'>"+locType2b3n[i]+"</option>")
					}
				}
				if($(this).val()=="양천구"){
					for(var i=0; i<locType2b3o.length; i++){
						$("#locType3").append("<option value='"+locType2b3o[i]+"'>"+locType2b3o[i]+"</option>")
					}
				}if($(this).val()=="강서구"){
					for(var i=0; i<locType2b3p.length; i++){
						$("#locType3").append("<option value='"+locType2b3p[i]+"'>"+locType2b3p[i]+"</option>")
					}
				}if($(this).val()=="구로구"){
					for(var i=0; i<locType2b3q.length; i++){
						$("#locType3").append("<option value='"+locType2b3q[i]+"'>"+locType2b3q[i]+"</option>")
					}
				}if($(this).val()=="금천구"){
					for(var i=0; i<locType2b3r.length; i++){
						$("#locType3").append("<option value='"+locType2b3r[i]+"'>"+locType2b3r[i]+"</option>")
					}
				}if($(this).val()=="영등포구"){
					for(var i=0; i<locType2b3s.length; i++){
						$("#locType3").append("<option value='"+locType2b3s[i]+"'>"+locType2b3s[i]+"</option>")
					}
				}if($(this).val()=="동작구"){
					for(var i=0; i<locType2b3t.length; i++){
						$("#locType3").append("<option value='"+locType2b3t[i]+"'>"+locType2b3t[i]+"</option>")
					}
				}if($(this).val()=="관악구"){
					for(var i=0; i<locType2b3u.length; i++){
						$("#locType3").append("<option value='"+locType2b3u[i]+"'>"+locType2b3u[i]+"</option>")
					}
				}if($(this).val()=="서초구"){
					for(var i=0; i<locType2b3v.length; i++){
						$("#locType3").append("<option value='"+locType2b3v[i]+"'>"+locType2b3v[i]+"</option>")
					}
				}if($(this).val()=="강남구"){
					for(var i=0; i<locType2b3w.length; i++){
						$("#locType3").append("<option value='"+locType2b3w[i]+"'>"+locType2b3w[i]+"</option>")
					}
				}if($(this).val()=="송파구"){
					for(var i=0; i<locType2b3x.length; i++){
						$("#locType3").append("<option value='"+locType2b3x[i]+"'>"+locType2b3x[i]+"</option>")
					}
				}if($(this).val()=="강동구"){
					for(var i=0; i<locType2b3y.length; i++){
						$("#locType3").append("<option value='"+locType2b3y[i]+"'>"+locType2b3y[i]+"</option>")
					}
				}
			});
		}
			
		if($(this).val()=="부산광역시"){
			for(var i=0; i<locType2b.length; i++){
				$("#locType2").append("<option value='"+locType2b[i]+"'>"+locType2b[i]+"</option>")
			}
		}
		if($(this).val()=="대구광역시"){
			for(var i=0; i<locType2c.length; i++){
				$("#locType2").append("<option value='"+locType2c[i]+"'>"+locType2c[i]+"</option>")
			}
		}
		if($(this).val()=="인천광역시"){
			for(var i=0; i<locType2d.length; i++){
				$("#locType2").append("<option value='"+locType2d[i]+"'>"+locType2d[i]+"</option>")
			}
		}
		if($(this).val()=="광주광역시"){
			for(var i=0; i<locType2e.length; i++){
				$("#locType2").append("<option value='"+locType2e[i]+"'>"+locType2e[i]+"</option>")
			}
		}
		if($(this).val()=="대전광역시"){
			for(var i=0; i<locType2f.length; i++){
				$("#locType2").append("<option value='"+locType2f[i]+"'>"+locType2f[i]+"</option>")
			}
		}
		if($(this).val()=="울산광역시"){
			for(var i=0; i<locType2g.length; i++){
				$("#locType2").append("<option value='"+locType2g[i]+"'>"+locType2g[i]+"</option>")
			}
		}
		if($(this).val()=="세종특별자치시"){
			$("#locType2").append("<option value='세종특별자치시'>"+"세종특별자치시"+"</option>")
			$("#locType3").append("<option value='세종특별자치시'>"+"세종특별자치시"+"</option>")
		}
		if($(this).val()=="경기도"){
			for(var i=0; i<locType2i.length; i++){
				$("#locType2").append("<option value='"+locType2i[i]+"'>"+locType2i[i]+"</option>")
			}
		}if($(this).val()=="강원특별자치도"){
			for(var i=0; i<locType2j.length; i++){
				$("#locType2").append("<option value='"+locType2j[i]+"'>"+locType2j[i]+"</option>")
			}
		}
		if($(this).val()=="충청북도"){
			for(var i=0; i<locType2k.length; i++){
				$("#locType2").append("<option value='"+locType2k[i]+"'>"+locType2k[i]+"</option>")
			}
		}
		if($(this).val()=="충청남도"){
			for(var i=0; i<locType2l.length; i++){
				$("#locType2").append("<option value='"+locType2l[i]+"'>"+locType2l[i]+"</option>")
			}
		}
		if($(this).val()=="전북특별자치도"){
			for(var i=0; i<locType2m.length; i++){
				$("#locType2").append("<option value='"+locType2m[i]+"'>"+locType2m[i]+"</option>")
			}
		}
		if($(this).val()=="전라남도"){
			for(var i=0; i<locType2n.length; i++){
				$("#locType2").append("<option value='"+locType2n[i]+"'>"+locType2n[i]+"</option>")
			}
		}
		if($(this).val()=="경상북도"){
			for(var i=0; i<locType2o.length; i++){
				$("#locType2").append("<option value='"+locType2o[i]+"'>"+locType2o[i]+"</option>")
			}
		}
		if($(this).val()=="경상남도"){
			for(var i=0; i<locType2p.length; i++){
				$("#locType2").append("<option value='"+locType2p[i]+"'>"+locType2p[i]+"</option>")
			}
		}
		if($(this).val()=="제주특별자치도"){
			for(var i=0; i<locType2q.length; i++){
				$("#locType2").append("<option value='"+locType2q[i]+"'>"+locType2q[i]+"</option>")
			}
		}
		
	}); //select box func end
	
	// 하루예산 / 총예산 클릭 이벤트
	$("#dayPriceBtn").on("click",function(){
		$(this).attr("class","form-control btn btn-primary")
		$("#totalPriceBtn").attr("class","form-control btn btn-light")
		$("#priceType").val("day")
	});
	$("#totalPriceBtn").on("click",function(){
		$(this).attr("class","form-control btn btn-primary")
		$("#dayPriceBtn").attr("class","form-control btn btn-light")
		$("#priceType").val("total")
	});
	
	
	//증감 함수
	var price = Number($("#priceInput").val())
	
	//예산 결제 금액
	$("#payment").val(price)
	
	$("#plusPriceBtn").on("click",function(){
		price+=1000
		$("#priceInput").val(price)
		//예산 결제 금액
		$("#payment").val(price)
	});
	$("#minusPriceBtn").on("click",function(){
		if(price<=1000){
			alert("최소가격 입니다.")
			return false;
		}else{
			price-=1000
			$("#priceInput").val(price)
			//예산 결제 금액
			$("#payment").val(price)
		}
	});
	
	// 지금시작 / 나중에 시작
	$("#nowStartBtn").on("click",function(){
		$(this).attr("class","form-control btn btn-primary")
		$("#laterStartBtn").attr("class","form-control btn btn-light")
		$("#startType").val("now")
	});
	$("#laterStartBtn").on("click",function(){
		$(this).attr("class","form-control btn btn-primary")
		$("#nowStartBtn").attr("class","form-control btn btn-light")
		$("#startType").val("later")
	});
	
	//증감 함수
	var days = Number($("#daysInput").val())
	
	$("#plusDaysBtn").on("click",function(){
		days+=1
		$("#daysInput").val(days)
	});
	$("#minusDaysBtn").on("click",function(){
		if(days<=1){
			alert("최소일 입니다.")
			return false;
		}else{
			days-=1
			$("#daysInput").val(days)
		}
	});
	
	
	//파일업로드 
	function uploadFileFunc(){
		var formData = new FormData()
		
		for(var i=0; i<fileContent.length; i++){
			formData.append("fileContent",fileContent[i])
			formData.append("fileNo",Number($("#fileNo").val()))
		}
			
		$.ajax({
			url:"/owner/advert/insertFile",
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
	
	$("#advertRegBtn").on("click",function(){
		if(!$("#advertContent").val()){
			alert("소개글을 입력해 주세요")
			return false;
		}else if(!$("#locType1").val()||!$("#locType2").val()||!$("#locType3").val()){
			alert("지역을 선택해 주세요.")
			return false;
		}else if(!$("#age").val()){
			alert("연령을 선택해 주세요.")
			return false;
		}else if(!$("#userName").val()){
			alert("입금자 명을 입력해 주세요.")
			return false;
		}else if(!$("#tradeBank").val()){
			alert("은행을 선택해 주세요.")
			return false;
		}else if(!$("#accountNum").val()){
			alert("계좌번호를 입력해 주세요.")
			return false;
		}else if(!$("#payment").val()){
			alert("결제할 금액을 입력해 주세요.")
			return fasle;
		}else{
			if(!confirm("광고를 등록하시겠습니까?")){
				return false;
			}else{
				//사용자의 결제 계좌 일치 여부
				$.ajax({
					url:"/owner/advert/account",
					type:"post",
					data: {
							"tradeBank" : $("#tradeBank").val(),
							"accountNum": $("#accountNum").val()
							},
					async:false,
					success:function(result){
						
						//광고 함수 호출
						advertFunc('/owner/advert/regist')
						
						//파일 업로드 함수 실행
						uploadFileFunc()
					
					},error:function(error){
						alert("계좌정보를 확인해 주세요")
						return false;
						
					}
				})
			}
		}
	});
	
	
	//광고 등록 , 수정 
	
	function advertFunc(url){
		
		var params = {
				"busiNo" : $("#busiNo").val(),
				"content" : $("#advertContent").val(),
				"location" : $("#locType1").val()+" "+$("#locType2").val()+" "+$("#locType3").val()+" ",
				"age" : $("#age").val(),
				"gender" : $("input[name='gender']:checked").val(),
				"priceType" : $("#priceType").val(),
				"price" : $("#priceInput").val(),
				"startType" : $("#startType").val(),
				"days" : $("#daysInput").val(),
				"endDateYn" : $("input[name='endDateYn']:checked").val(),
				"detailYn" : $("input[name='detailYn']:checked").val(),
				
				"tradeBank" : $("#tradeBank").val(),
				"accountNum": $("#accountNum").val(),
				
				"userName" : $("#userName").val()
				}
	
		$.ajax({
			url: url,
			type:"post",
			async:false,
			data : params,
			success:function(result){
				alert(result)		
				location.reload(true)
			}
		})
	}
	
	//광고 수정
	$("#advertModBtn").on("click",function(){
		if(!confirm("광고를 수정하시겠습니까?")){
			return false;
		}else{
			advertFunc("/owner/advert/modify")
			//파일 업로드 함수 실행
			uploadFileFunc()
		}
	});
	
	//광고 취소
	$("#advertDelBtn").on("click",function(){
		if(!confirm("광고를 취소하시겠습니까?")){
			return false;
		}else{
			$.ajax({
				url:"/owner/advert/delete",
				type:"post",
				async:false,
				success:function(result){
					alert(result);
				}
			});
			
			//파일 업로드 함수 실행
			uploadFileFunc()
		}
		
	});
	
});


</script>
</html>
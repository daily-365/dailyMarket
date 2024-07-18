<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부동산 매물 올리기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
				<p>매물 방향</p>
				<br><br>
				<div class="col-3">
					<label class="form-label">남향</label>
					<input   type="radio" name=esPosiType value="south" >
				</div>
				<div class="col-3">
					<label class="form-label">동향</label>
					<input   type="radio" name="esPosiType" value="east" >
				</div>
				<div class="col-3">
					<label class="form-label">서향</label>
					<input   type="radio" name="esPosiType" value="west" >
				</div>
				<div class="col-3">
					<label class="form-label">북향</label>
					<input   type="radio" name="esPosiType" value="north" >
				</div>
			</div>
			<div class="row text-center fw-bold">
				<div class="col-3">
					<label class="form-label">남동향</label>
					<input   type="radio" name="esPosiType" value="sEast" >
				</div>
				<div class="col-3">
					<label class="form-label">남서향</label>
					<input   type="radio" name="esPosiType" value="sWest" >
				</div>
				<div class="col-3">
					<label class="form-label">북서향</label>
					<input   type="radio" name="esPosiType" value="nWest" >
				</div>
				<div class="col-3">
					<label class="form-label">북동향</label>
					<input   type="radio" name="esPosiType" value="nEast" >
				</div>
			</div>
			<hr>
			<div class="row text-center fw-bold">
				<p>면적</p>
				<br><br>
				<div class="col-2">
				</div>
				<div class="col-4">
					<label class="form-label">전용면적</label>
					<span ><input  type="text" name="esSize1"> 평</span>
				</div>
				<div class="col-4">
					<label class="form-label">공급면적</label>
					<span><input  type="text"  name="esSize2" > m2</span>
				</div>
			</div>
			<hr>	
			<div class="row text-center fw-bold">
				<p>구조</p>
				<br><br>
				<div class="col-4">
					<label class="form-label">방갯수</label>
					<span ><input  type="text" name="esOption1"> 개</span>
				</div>
				<div class="col-4">
					<label class="form-label">욕실갯수</label>
					<span ><input  type="text" name="esOption2"> 개</span>
				</div>
				<div class="col-4">
					<label class="form-label">해당층</label>
					<span ><input  type="text" name="esOption3" > 층</span>
				</div>
			</div>
			<hr>
			<div class="row text-center fw-bold">
				<p>관리비</p>
				<br><br>
				<div class="col-2">
				</div>
				<div class="col-4 esCostTag" >
					<label class="form-label">관리비</label>
					<span ><input  type="text" name="esCost"  onkeyup="javascript: this.value = this.value.replace(/[^0-9.]/g, '')"> 원</span>
				</div>
				<div class="col-4">
					<label class="form-label">관리비 없음</label>
					<input id="esCostYnChk"  type="checkbox" name="esCostYn"  value="N" > 
				</div>
			</div>
			<hr>
			<div class="row text-center fw-bold esCostTag" >
				<p>관리비에 포함된 항목</p>
				<br><br>
				<div class="col-1" >
				</div>
				<div class="col-1" >
					<label class="form-label">수도료</label>
					<input  type="checkbox" name="esCostChk">
				</div>
				<div class="col-1">
					<label class="form-label">전기료</label>
					<input  type="checkbox" name="esCostChk">
				</div>
				<div class="col-1" >
					<label class="form-label">인터넷비</label>
					<input  type="checkbox" name="esCostChk">
				</div>
				<div class="col-1" >
					<label class="form-label">가스비</label>
					<input  type="checkbox" name="esCostChk">
				</div>
				<div class="col-1" >
					<label class="form-label">청소비</label>
					<input  type="checkbox" name="esCostChk">
				</div>
				<div class="col-1" >
					<label class="form-label">유선 TV</label>
					<input  type="checkbox" name="esCostChk">
				</div>
				<div class="col-1" >
					<label class="form-label">주차비</label>
					<input  type="checkbox" name="esCostChk">
				</div>
				<div class="col-1" >
					<label class="form-label">난방비</label>
					<input  type="checkbox" name="esCostChk">
				</div>
				<div class="col-2" >
					<label class="form-label">승강기 유지비</label>
					<input  type="checkbox" name="esCostChk">
				</div>
			</div>
			<hr>
			<div class="row text-center fw-bold" >
			<p>관리비와 별도인 항목</p>
				<br><br>
				<div class="col-3" >
				</div>
				<div class="col-1" >
					<label class="form-label">수도료</label>
					<input  type="checkbox" name="esSeperCostChk">
				</div>
				<div class="col-1">
					<label class="form-label">전기료</label>
					<input  type="checkbox" name="esSeperCostChk">
				</div>
				<div class="col-1" >
					<label class="form-label">인터넷비</label>
					<input  type="checkbox" name="esSeperCostChk">
				</div>
				<div class="col-1" >
					<label class="form-label">가스비</label>
					<input  type="checkbox" name="esSeperCostChk">
				</div>
				<div class="col-1" >
					<label class="form-label">청소비</label>
					<input  type="checkbox" name="esSeperCostChk">
				</div>
				<div class="col-1" >
					<label class="form-label">유선 TV</label>
					<input  type="checkbox" name="esSeperCostChk">
				</div>
				<div class="col-1" >
					<label class="form-label">주차비</label>
					<input  type="checkbox" name="esSeperCostChk">
				</div>
			</div>
			<hr>
			<div class="row text-center fw-bold esCostTag" >
			<p>관리비 설명</p>
				<br><br>
				<div class="col-3">
				</div>
				<div class="col-6">
					<textarea class="form-control" name="esCostContent"></textarea>
				</div>
			</div>
			
			<br>
		</form>
		<br><br>
		<div class="row text-center fw-bold" >
			<div class="col-5">
			</div>
			<div class="col-1">
				<button class="form-control btn btn-outline-primary " onclick="javascript:location.href='/user/estate/writeOne'">1</button>
			</div>
			<div class="col-1">
				<button class="form-control btn btn-outline-primary active" >2</button>
			</div>
			<div class="col-1">
				<button class="form-control btn btn-outline-primary " onclick="javascript:location.href='/user/estate/writeThree'">3</button>
			</div>
		</div>
		<br><br>
	</div>
</main>

<%@ include file="/resources/common/user/footer.jsp" %>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	$("#esCostYnChk").on("click",function(){
		$(".esCostTag").hide()
		
		if(!$("#esCostYnChk").is(":checked")){
			$(".esCostTag").show()
		}
	});

});

</script>
</html>
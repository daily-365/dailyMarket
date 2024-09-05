<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
				<p>거래 형태</p>
				<br><br>
				<div class="col-3">
					<label class="form-label">월세</label>
					<input   type="radio" class="type1" name="esTradeType" value="월세" >
					<input type="text" class="type1" name="esPrice" placeholder="보증금  / 월세" onkeyup=" this.value = this.value.replace(/\B(?=(\d{3})+(?!\d))/g,",");' >
				</div>
				<div class="col-3">
					<label class="form-label">전세</label>
					<input   type="radio" class="type2" name="esTradeType" value="전세" >
					<input type="text" class="type2" name="esPrice" placeholder="보증금"  onkeyup='this.value = this.value.replace(/[^0-9]/g,""); this.value = this.value.replace(/\B(?=(\d{3})+(?!\d))/g,",");' >
				</div>
				<div class="col-3">
					<label class="form-label">매매</label>
					<input   type="radio" class="type3" name="esTradeType" value="매매" >
					<input type="text" class="type3" name="esPrice" placeholder="매매가"  onkeyup='this.value = this.value.replace(/[^0-9]/g,""); this.value = this.value.replace(/\B(?=(\d{3})+(?!\d))/g,",");' >
				</div>
				<div class="col-3">
					<label class="form-label">단기</label>
					<input   type="radio" class="type4" name="esTradeType" value="단기" >
					<input type="text" class="type4" name="esPrice" placeholder="임대료"  onkeyup='this.value = this.value.replace(/[^0-9]/g,""); this.value = this.value.replace(/\B(?=(\d{3})+(?!\d))/g,",");'>
				</div>
			</div>
			<br>
			<hr>
			<div class="row text-center fw-bold">
				<p>매물 방향</p>
				<br><br>
				<div class="col-3">
					<label class="form-label">남향</label>
					<input   type="radio" name="esPosiType" value="남향" >
				</div>
				<div class="col-3">
					<label class="form-label">동향</label>
					<input   type="radio" name="esPosiType" value="동향" >
				</div>
				<div class="col-3">
					<label class="form-label">서향</label>
					<input   type="radio" name="esPosiType" value="서향" >
				</div>
				<div class="col-3">
					<label class="form-label">북향</label>
					<input   type="radio" name="esPosiType" value="북향" >
				</div>
			</div>
			<div class="row text-center fw-bold">
				<div class="col-3">
					<label class="form-label">남동향</label>
					<input   type="radio" name="esPosiType" value="남동향" >
				</div>
				<div class="col-3">
					<label class="form-label">남서향</label>
					<input   type="radio" name="esPosiType" value="남서향" >
				</div>
				<div class="col-3">
					<label class="form-label">북서향</label>
					<input   type="radio" name="esPosiType" value="북서향" >
				</div>
				<div class="col-3">
					<label class="form-label">북동향</label>
					<input   type="radio" name="esPosiType" value="북동향" >
				</div>
			</div>
			<hr>
			<div class="row text-center fw-bold">
				<p>면적</p>
				<br><br>
				<div class="col-2">
				</div>
				<div class="col-4">
					<label class="form-label">공급면적</label>
					<span><input  type="text"  name="esSize1" > m2</span>
				</div>
				<div class="col-4">
					<label class="form-label">전용면적</label>
					<span ><input  type="text" name="esSize2"> m2</span>
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
					<span ><input  type="text" name="esCost"  onkeyup='this.value = this.value.replace(/[^0-9]/g,""); this.value = this.value.replace(/\B(?=(\d{3})+(?!\d))/g,",");'> 원</span>
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
					<input  type="checkbox" name="esCostChk" value="수도료">
				</div>
				<div class="col-1">
					<label class="form-label">전기료</label>
					<input  type="checkbox" name="esCostChk" value="전기료">
				</div>
				<div class="col-1" >
					<label class="form-label">인터넷비</label>
					<input  type="checkbox" name="esCostChk" value="인터넷비">
				</div>
				<div class="col-1" >
					<label class="form-label">가스비</label>
					<input  type="checkbox" name="esCostChk" value="가스비">
				</div>
				<div class="col-1" >
					<label class="form-label">청소비</label>
					<input  type="checkbox" name="esCostChk" value="청소비">
				</div>
				<div class="col-1" >
					<label class="form-label">유선 TV</label>
					<input  type="checkbox" name="esCostChk" value="유선 TV">
				</div>
				<div class="col-1" >
					<label class="form-label">주차비</label>
					<input  type="checkbox" name="esCostChk" value="주차비">
				</div>
				<div class="col-1" >
					<label class="form-label">난방비</label>
					<input  type="checkbox" name="esCostChk" value="난방비">
				</div>
				<div class="col-2" >
					<label class="form-label">승강기 유지비</label>
					<input  type="checkbox" name="esCostChk" value="승강기 유지비">
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
					<input  type="checkbox" name="esSeperCostChk" value="수도료">
				</div>
				<div class="col-1">
					<label class="form-label">전기료</label>
					<input  type="checkbox" name="esSeperCostChk" value="전기료">
				</div>
				<div class="col-1" >
					<label class="form-label">인터넷비</label>
					<input  type="checkbox" name="esSeperCostChk" value="인터넷비">
				</div>
				<div class="col-1" >
					<label class="form-label">가스비</label>
					<input  type="checkbox" name="esSeperCostChk" value="가스비">
				</div>
				<div class="col-1" >
					<label class="form-label">청소비</label>
					<input  type="checkbox" name="esSeperCostChk" value="청소비">
				</div>
				<div class="col-1" >
					<label class="form-label">유선 TV</label>
					<input  type="checkbox" name="esSeperCostChk" value="유선 TV">
				</div>
				<div class="col-1" >
					<label class="form-label">주차비</label>
					<input  type="checkbox" name="esSeperCostChk" value="주차비">
				</div>
			</div>
			<hr>
			<div class="row text-center fw-bold esCostTag" >
			<p>관리비 설명</p>
				<br><br>
				<div class="col-3">
				</div>
				<div class="col-6">
					<textarea class="form-control" id="esCostContent" name="esCostContent"></textarea>
				</div>
			</div>
			
			<br>
		</form>
		<br><br>
		<div class="row text-center fw-bold" >
			<div class="col-5">
			</div>
			<div class="col-2">
				<svg  id="writeThreebtn" style="color:blue; width: 30px; height: 30px;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-circle-fill" viewBox="0 0 16 16">
				  <path d="M8 0a8 8 0 1 1 0 16A8 8 0 0 1 8 0M4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5z"/>
				</svg>
			</div>
		</div>
		<br><br>
	</div>
</main>
<!-- 체크값 인풋에 저장 하기 .. -->
<input type="text" id="esCostYn" value='Y' style="display: none;">
<input type="text" id="esPrice" style="display: none;" >
<input type="text" id="esCost" style="display: none;" >
<input type="text" id="esCostChk" style="display: none;">
<input type="text" id="esSeperCostChk" style="display: none;">
<% Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String now = sdf.format(date);
%>
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
		$("#esCostYn").val('N')
		
		if(!$("#esCostYnChk").is(":checked")){
			$(".esCostTag").show()
			$("#esCostYn").val('Y')
			
		}
	});
	
	//해당 esCost blur시 천단위 컴마 없애기.  
	$("input[name=esCost]").on("blur",function(){
		$("#esCost").val( $(this).val().replace(",","") )
		
	});

	//해당 금액 keyup시  해당 계약 형태 (월세 칸은 월세 / 전세 칸은 전세 ) 자동 체크.
	$("input[name=esPrice]").on("keyup",function(){
		$('.'+$(this).attr("class")+'').prop("checked",true)
		$("#esPrice").val( $(this).val() )
		
	});
	
	// checkbox값 여러개 가져오기 1 
	$("input[name=esCostChk]").on("change",function(){
		var esCostChkList ='';
		$("input[name=esCostChk]:checked").each(function(){
			esCostChkList+=$(this).val()+" , "
		})
		$("#esCostChk").val(esCostChkList)
	});
	
	// checkbox값 여러개 가져오기 2
	 $("input[name=esSeperCostChk]").on("change",function(){
	 	var esSeperCostChkList ='';
		$("input[name=esSeperCostChk]:checked").each(function(){
			esSeperCostChkList+=$(this).val()+" , "
		})
		$("#esSeperCostChk").val(esSeperCostChkList)
	});
		
	//다음 페이지로 이동
	$("#writeThreebtn").on("click",function(){
		if(!$("input[name=esTradeType]:checked").val()||!$("#esPrice").val()||!$("input[name=esPosiType]:checked").val()||!$("input[name=esSize1]").val()||!$("input[name=esSize2]").val()||!$("input[name=esOption1]").val()||!$("input[name=esOption2]").val()||!$("input[name=esOption3]").val())
		{	console.log($("#esPrice").val())
			alert("해당 사항을 모두 작성해 주세요.")
			return false;
		}else{
			if(!confirm("다음페이지로 이동합니다. 저장하시겠습니까?")){
				return false;
			}else{
				
				var param= {
							"esTradeType" : $("input[name=esTradeType]:checked").val(),
							"esPrice" :  $("#esPrice").val(),
							"esPosiType" :  $("input[name=esPosiType]:checked").val(),
							"esSize1" :  $("input[name=esSize1]").val(),
							"esSize2" :  $("input[name=esSize2]").val(),
							"esOption1" :  $("input[name=esOption1]").val(),
							"esOption2" :  $("input[name=esOption2]").val(),
							"esOption3" : $("input[name=esOption3]").val(),
							"esCostYn" : $("#esCostYn").val(),
							"esCost" : $("#esCost").val(),
							"esCostChk" : $("#esCostChk").val(),
							"esSeperCostChk" : $("#esSeperCostChk").val(),
							"esCostContent" : $("#esCostContent").val()
							 }
				$.ajax({
						url:"/user/estate/writeTwo",
						type:"post",
						async :false,
						data : param,
						success:function(result){
							alert(result)
							location.href="/user/estate/writeThree";

						}
					});
			
			}
		}
	});
	
});

</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<footer class="container py-5 fw-bold">
  <div class="row">
   <div class="col-12 col-md">
      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="d-block mb-2" role="img" viewBox="0 0 24 24"><title>Product</title><circle cx="12" cy="12" r="10"/><path d="M14.31 8l5.74 9.94M9.69 8h11.48M7.38 12l5.74-9.94M9.69 16L3.95 6.06M14.31 16H2.83m13.79-4l-5.74 9.94"/></svg>
      <small class="d-block mb-3 text-muted">&copy; 2019-2024</small>
    </div>
    <div class="col-6 col-md">
      <h5>Category</h5>
      <ul class="list-unstyled text-small">
        <li><a class="link-secondary" href="/user/product/main">중고거래</a></li>
        <li><a class="link-secondary" href="/user/company/main">동네업체</a></li>
        <li><a class="link-secondary" href="/user/job/main">데일리알바</a></li>
        <li><a class="link-secondary" href="/user/estate/main">부동산</a></li>
        <li><a class="link-secondary" href="/user/car/main">중고차 직거래</a></li>
      </ul>
    </div>
    <div class="col-6 col-md">
      <h5>Contact With</h5>
      <ul class="list-unstyled text-small">
        <li><a class="link-secondary" href="/owner/main">데일리 비즈니스</a></li>
        <li><a class="link-secondary" href="/chat/roomList">채팅하기</a></li>
      </ul>
    </div>
    <div class="col-6 col-md">
      <h5>About Us</h5>
      <ul class="list-unstyled text-small">
      	<li><a class="link-secondary" href="#">회사 소개</a></li>
        <li><a class="link-secondary" href="#" data-bs-toggle="modal" data-bs-target="#chatModal">1:1 채팅문의</a></li>
      </ul>
    </div>
    <div class="col-6 col-md">
      <h5>Notice</h5>
      <ul class="list-unstyled text-small">
        <li><a class="link-secondary" href="/user/mypage/notice/main">공지사항</a></li>
        <li><a class="link-secondary" href="/user/inquiry/main">자주묻는질문</a></li>
      </ul>
    </div>
  </div>
  <br><br>
  <div class="bg-dark text-white text-center">
  	<br>
  	<pre>
		대표 : 황태하
		주소 : 서울시 목동중앙본로7가길 18~58 초원파크빌 202호
		전화 : 010-3367-0523 
		고객문의 : ktxfts@naver.com
	</pre>
  </div>
</footer>
<!-- 채팅 모달 -->
<div class="modal fade chatModal" id="chatModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">1:1 채팅 문의</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
		  <div class="container-fluid">
	 		<div class="row">
	 			<div id="messageList"></div>
	 		</div>
		 	<br>
		   	<textarea  id="message" class="form-control" rows="5" maxlength="150">
		   	</textarea>
		  </div>
		</div>
      <div class="modal-footer">
      	<button type="button" id="writeChatMessageBtn" class="btn btn-dark text-light fw-bold" >메세지 입력</button>
        <button type="button" class="btn btn-secondary text-light fw-bold" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
</body>

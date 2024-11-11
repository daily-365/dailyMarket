<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container-fluid nav justify-content-center bg-dark border-bottom border-body" data-bs-theme="dark">
	<nav class="navbar navbar-expand-lg bg-body-tertiary"  >
  <div class="container-fluid">
    <a class="navbar-brand" href="/admin/main">Home</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse fw-bold text-light" id="navbarScroll" >
      <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
        <li class="nav-item  ">
          <a class="nav-link active " href="/admin/product/main" role="button" >
            	물품관리
          </a>
        </li>
        <li class="nav-item ">
          <a class="nav-link active " href="/admin/store/main" role="button"  >
            	상점관리
          </a>
        </li>
        <li class="nav-item ">
          <a class="nav-link active " href="/admin/job/main" role="button"  >
            	구인/구직
          </a>
        </li>
        <li class="nav-item ">
          <a class="nav-link active " href="/admin/estate/main" role="button"  >
            	부동산
          </a>
        </li>
        <li class="nav-item ">
          <a class="nav-link active " href="/admin/car/main" role="button"  >
            	자동차
          </a>
        </li>
        <li class="nav-item ">
          <a class="nav-link active " href="/admin/user/main" role="button"  >
            	사용자
          </a>
        </li>
        <li class="nav-item dropdown">
            <div class="dropdown text-light">
			  <span class="dropdown-toggle nav-link fw-bold align-text-bottom" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			   	이벤트
			  </span>
			  <ul class="dropdown-menu fw-bold text-light">
			    <li><a class="dropdown-item " href="/admin/event/main">메인페이지</a></li>
			    <li><a class="dropdown-item" href="/admin/event/write">작성페이지</a></li>
			  </ul>
			</div>
          </li>
        <li class="nav-item dropdown">
            <div class="dropdown text-light">
			  <span class="dropdown-toggle nav-link fw-bold align-text-bottom" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			   	공지사항
			  </span>
			  <ul class="dropdown-menu fw-bold  text-light">
			    <li><a class="dropdown-item" href="/admin/notice/main">메인페이지</a></li>
			    <li><a class="dropdown-item" href="/admin/notice/write">작성페이지</a></li>
			  </ul>
			</div>
          </li>
           <li class="nav-item">
            <a class="nav-link fw-bold" href="/admin/question/main">
              <span data-feather="layers" class="align-text-bottom"></span>
              	문의사항
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link fw-bold text-light" href="#">
              <span data-feather="layers" class="align-text-bottom"></span>
              	비즈프로필
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link fw-bold text-light" href="/admin/advert/main">
              <span data-feather="layers" class="align-text-bottom"></span>
              	광고
            </a>
          </li>
           <li class="nav-item">
            <a class="nav-link fw-bold text-light" href="/admin/chat/main">
              <span data-feather="layers" class="align-text-bottom"></span>
              	채팅
            </a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link fw-bold" href="/admin/logout">
              <span data-feather="file-text" class="align-text-bottom"></span>
              	로그아웃
            </a>
          </li>
      </ul>
    </div>
  </div>
</nav>

</div>
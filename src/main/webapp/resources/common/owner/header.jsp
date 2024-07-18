<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header class="site-header sticky-top py-1 d-flex justify-content-center bg-light">
<nav class="navbar navbar-expand-lg bg-body-tertiary text-dark fw-bold">
  <div class="container-fluid">
 	 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart3" viewBox="0 0 16 16">
		<path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l.84 4.479 9.144-.459L13.89 4zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
	</svg>  
    <a class="navbar-brand" href="/owner/main">Daily Business</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse col-md-2" id="navbarSupportedContent">
      <ul class="navbar-nav  ">
      	<li class="nav-item me-4">
          <a class="nav-link" href="#">${userId }</a>
        </li>
        <li class="nav-item me-4">
          <a class="nav-link" href="#">업체등록</a>
        </li>
        <li class="nav-item me-4">
          <a class="nav-link" href="#">알바구인</a>
        </li>
        <li class="nav-item me-4">
          <a class="nav-link" href="#">마이페이지</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
</header>
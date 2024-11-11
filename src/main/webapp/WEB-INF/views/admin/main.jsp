<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
body {
  font-size: .875rem;
}

.feather {
  width: 16px;
  height: 16px;
}

/*
 * Sidebar
 */

.sidebar {
  position: fixed;
  top: 0;
  /* rtl:raw:
  right: 0;
  */
  bottom: 0;
  /* rtl:remove */
  left: 0;
  z-index: 100; /* Behind the navbar */
  padding: 48px 0 0; /* Height of navbar */
  box-shadow: inset -1px 0 0 rgba(0, 0, 0, .1);
}

@media (max-width: 767.98px) {
  .sidebar {
    top: 5rem;
  }
}

.sidebar-sticky {
  height: calc(100vh - 48px);
  overflow-x: hidden;
  overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
}

.sidebar .nav-link {
  font-weight: 500;
  color: #333;
}

.sidebar .nav-link .feather {
  margin-right: 4px;
  color: #727272;
}

.sidebar .nav-link.active {
  color: #2470dc;
}

.sidebar .nav-link:hover .feather,
.sidebar .nav-link.active .feather {

  color: inherit;
}

.sidebar-heading {
  font-size: .75rem;
}

/*
 * Navbar
 */

.navbar-brand {
  padding-top: .75rem;
  padding-bottom: .75rem;
  background-color: rgba(0, 0, 0, .25);
  box-shadow: inset -1px 0 0 rgba(0, 0, 0, .25);
}

.navbar .navbar-toggler {
  top: .25rem;
  right: 1rem;
}

.navbar .form-control {
  padding: .75rem 1rem;
}

.form-control-dark {
  color: #fff;
  background-color: rgba(255, 255, 255, .1);
  border-color: rgba(255, 255, 255, .1);
}

.form-control-dark:focus {
  border-color: transparent;
  box-shadow: 0 0 0 3px rgba(255, 255, 255, .25);
}

    .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
</style>
<!-- BootStrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>Admin Main</title>
</head>
<body class="container-fluid">
<header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
  <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3 fs-6 fw-bold" href="#">Daily Market</a>
  <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <input class="form-control form-control-dark w-100 rounded-0 border-0" type="text" placeholder="Search For..." aria-label="Search">
  <div class="navbar-nav">
    <div class="nav-item text-nowrap">
      <a class="nav-link px-3" href="#">Search</a>
    </div>
  </div>
</header>

<div class="container-fluid">
  <div class="row">
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="position-sticky pt-3 sidebar-sticky">
        <ul class="nav flex-column ">
          <li class="nav-item">
            <a class="nav-link active fw-bold" aria-current="page" href="#">
              <span data-feather="home" class="align-text-bottom"></span>
              Admin Main Page
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link fw-bold" href="/admin/product/main">
              <span data-feather="file" class="align-text-bottom"></span>
              	물품관리
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link fw-bold" href="/admin/store/main">
              <span data-feather="shopping-cart" class="align-text-bottom"></span>
              	상점관리
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link fw-bold" href="/admin/job/main">
              <span data-feather="users" class="align-text-bottom"></span>
              	구인/구직
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link fw-bold" href="/admin/estate/main">
              <span data-feather="bar-chart-2" class="align-text-bottom"></span>
              	부동산
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link fw-bold" href="/admin/car/main">
              <span data-feather="layers" class="align-text-bottom"></span>
              	자동차
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link fw-bold" href="/admin/user/main">
              <span data-feather="layers" class="align-text-bottom"></span>
              	사용자
            </a>
          </li>
        </ul>

        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted text-uppercase">
          <span class="fw-bold">Admin Info</span>
          <a class="link-secondary" href="#" aria-label="Add a new report">
            <span data-feather="plus-circle" class="align-text-bottom"></span>
          </a>
        </h6>
        <ul class="nav flex-column mb-2">
          <li class="nav-item dropdown">
            <div class="dropdown text-dark">
			  <span class="dropdown-toggle nav-link fw-bold align-text-bottom" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			   	이벤트
			  </span>
			  <ul class="dropdown-menu fw-bold text-dark">
			    <li><a class="dropdown-item" href="/admin/event/main">메인페이지</a></li>
			    <li><a class="dropdown-item" href="/admin/event/write">작성페이지</a></li>
			  </ul>
			</div>
          </li>
          <li class="nav-item dropdown">
            <div class="dropdown text-dark">
			  <span class="dropdown-toggle nav-link fw-bold align-text-bottom" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			   	공지사항
			  </span>
			  <ul class="dropdown-menu fw-bold text-dark">
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
        </ul>
        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted text-uppercase">
          <span class="fw-bold">Owner Info</span>
          <a class="link-secondary" href="#" aria-label="Add a new report">
            <span data-feather="plus-circle" class="align-text-bottom"></span>
          </a>
        </h6>
        <ul class="nav flex-column mb-2">
       	  <li class="nav-item">
            <a class="nav-link fw-bold" href="#">
              <span data-feather="file-text" class="align-text-bottom"></span>
              	비즈프로필
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link fw-bold" href="/admin/advert/main">
              <span data-feather="file-text" class="align-text-bottom"></span>
              	광고
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link fw-bold" href="/admin/chat/main">
              <span data-feather="file-text" class="align-text-bottom"></span>
              	채팅 문의
            </a>
          </li>
         </ul>
         <h6 class="text-dark h5">
          &nbsp;
          <span class="fw-bold" id="admLogoutBtn">LogOut</span>
        </h6>
      </div>
    </nav>

    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Dashboard</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group me-2">
            <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
            <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
          </div>
          <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle">
            <span data-feather="calendar" class="align-text-bottom"></span>
            This week
          </button>
        </div>
      </div>

      <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>
      
      
     <div class="row">
      
      <div class="col-4">
       <h2>Event</h2>
	      <div class="table-responsive">
	        <table class="table text-dark  table-sm">
	          <thead class="fw-bold">
	            <tr>
	              <th scope="col">#</th>
	              <th scope="col">제목</th>
	              <th scope="col">작성일</th>
	            </tr>
	          </thead>
	          <tbody>
	            <c:forEach var="event" items="${event }" varStatus="status">
	            	<tr>
	            		<td>${status.count }</td>
	            		<td><a class="text-dark fw-bold" href="/admin/event/detail?eventNo=${event.eventNo }">${fn:substring(event.title,0,10)}...</a></td>
	            		<td><fmt:formatDate value="${event.regDate }" pattern="yyyy-MM-dd"/> </td>
	            	</tr>
	            </c:forEach>
	          </tbody>
	        </table>
	      </div>
      </div>
      <div class="col-4">
       <h2>Notice</h2>
	      <div class="table-responsive">
	        <table class="table  text-dark  table-sm">
	          <thead class="fw-bold">
	            <tr>
	              <th scope="col">#</th>
	              <th scope="col">제목</th>
	              <th scope="col">작성일</th>
	            </tr>
	          </thead>
	          <tbody>
	            <c:forEach var="notice" items="${notice }" varStatus="status">
	            	<tr>
	            		<td>${status.count }</td>
	            		<td><a class="text-dark fw-bold" href="/admin/notice/detail?noticeNo=${notice.noticeNo }">${fn:substring(notice.title,0,10)}...</a></td>
	            		<td><fmt:formatDate value="${notice.regDate }" pattern="yyyy-MM-dd"/> </td>
	            	</tr>
	            </c:forEach>
	          </tbody>
	        </table>
	      </div>
      </div>
      <div class="col-4">
       <h2>Q&A</h2>
	      <div class="table-responsive">
	        <table class="table  text-dark  table-sm">
	          <thead class="fw-bold">
	            <tr>
	              <th scope="col">#</th>
	              <th scope="col">제목</th>
	              <th scope="col">작성일</th>
	            </tr>
	          </thead>
	          <tbody>
	            <c:forEach var="inquiry" items="${inquiry }" varStatus="status">
	            	<tr>
	            		<td>${status.count }</td>
	            		<td><a class="text-dark fw-bold" href="/admin/question/detail?inquiryNo=${inquiry.inquiryNo }">${fn:substring(inquiry.title,0,10)}...</a></td>
	            		<td><fmt:formatDate value="${inquiry.regDate }" pattern="yyyy-MM-dd"/> </td>
	            	</tr>
	            </c:forEach>
	          </tbody>
	        </table>
	      </div>
      </div>
     </div>
    </main>
  </div>
</div>
</body>
<!-- Jquery  -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- BootStrap  -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<!-- chart js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript">
var ctx = document.getElementById('myChart').getContext('2d');;

  new Chart(ctx, {
  	  
	  type: 'line',
	  data: {	
	  	labels : ['Jan','Feb','Mar','Apr','May','Jul','Aug','Sep','Oct','Nov','Dec'],
	    datasets: [{
	      label : 'data1',
	      borderColor: "red",
	      data: [40,50,60,70,20,30,100,110,120,80,90,10],
	      fill: false,
	      borderColor: 'rgb(255, 99, 132)'
	    },
	    {
	      label : 'data2',
	      borderColor: "blue",
	      data: [70,60,50,90,80,40,30,20,10,100,110,120],
	      fill: false,
	      borderColor: 'rgb(54, 162, 235)'
	    }]
	  }
 	})
  
  $(document).ready(function(){
	 $("#admLogoutBtn").on("click",function(){
		if(!confirm("로그아웃 하시겠습니까?")){
			return false;
		}else{
			alert("로그아웃 되었습니다.")
			location.href='/admin/logout'
		}
	 }); 
  });


</script>
</html>
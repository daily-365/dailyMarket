<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Main Page</title>
<style type="text/css">
.container {
  max-width: 960px;
}

/*
 * Custom translucent site header
 */

.site-header {
  background-color: rgba(0, 0, 0, .85);
  -webkit-backdrop-filter: saturate(180%) blur(20px);
  backdrop-filter: saturate(180%) blur(20px);
}
.site-header a {
  color: #8e8e8e;
  transition: color .15s ease-in-out;
}
.site-header a:hover {
  color: #fff;
  text-decoration: none;
}

/*
 * Dummy devices (replace them with your own or something else entirely!)
 */

.product-device {
  position: absolute;
  right: 10%;
  bottom: -30%;
  width: 300px;
  height: 540px;
  background-color: #333;
  border-radius: 21px;
  transform: rotate(30deg);
}

.product-device::before {
  position: absolute;
  top: 10%;
  right: 10px;
  bottom: 10%;
  left: 10px;
  content: "";
  background-color: rgba(255, 255, 255, .1);
  border-radius: 5px;
}

.product-device-2 {
  top: -25%;
  right: auto;
  bottom: 0;
  left: 5%;
  background-color: #e5e5e5;
}


/*
 * Extra utilities
 */

.flex-equal > * {
  flex: 1;
}
@media (min-width: 768px) {
  .flex-md-equal > * {
    flex: 1;
  }
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
      
      svg {
      	width:50px;
      	height: 50px;
      }
      #mainCarousel{
      	height: 400px;
      }
      
</style>
<!-- BootStrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<%@ include file="/resources/common/user/header.jsp" %>

<main>
   <div id="mainCarousel" class="carousel slide d-md-flex flex-md-equal w-100 my-md-3 ps-md-3">
	  <div class="carousel-indicators">
	    <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	    <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
	    <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
	  </div>
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="/resources/img/mainImg1.jpg" class="d-block w-100" alt="mainImg1">
	    </div>
	    <div class="carousel-item">
	      <img src="/resources/img/mainImg2.jpg" class="d-block w-100" alt="mainImg2">
	    </div>
	    <div class="carousel-item">
	      <img src="/resources/img/mainImg3.jpg" class="d-block w-100" alt="mainImg3">
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#mainCarousel" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#mainCarousel" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
  <div class="d-md-flex flex-md-equal w-100 my-md-3 ps-md-3">
    <div class="text-bg-dark me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
      <div class="my-3 py-3">
        <h2 class="display-5">중고거래</h2>
        <p class="lead">믿을만한 이웃 간 중고거래</p>
      </div>
      <img src="/resources/img/market1.png" class="bg-light shadow-sm mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"></img>
    </div>
    <div class="bg-light me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
      <div class="my-3 p-3">
        <h2 class="display-5">
        	<pre>동네 주민들과</pre> 
        	<pre>가깝고 따뜻한 거래를 </pre> 
        	<pre>지금 경험해보세요.</pre> 
        	</h2>
        <p class="lead">
        	<button type="button" class="btn btn-secondary" onclick="javascript: location.href='/user/estate/main'">인기매물 보기</button>
        	<button type="button" class="btn btn-secondary" onclick="javascript: location.href='/user/product/main'">믿을 수 있는 중고거래</button>
        </p>
      </div>
      <img src="/resources/img/market2.png" class="bg-dark shadow-sm mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"></img>
    </div>
  </div>

  <div class="d-md-flex flex-md-equal w-100 my-md-3 ps-md-3">
    <div class="bg-light me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
      <div class="my-3 p-3">
        <h2 class="display-5">동네생활</h2>
        <p class="lead">이웃만 아는 동네 정보와 이야기</p>
      </div>
      <img src="/resources/img/market3.jpg" class="bg-dark shadow-sm mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"></img>
    </div>
    <div class="text-bg-primary me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
      <div class="my-3 py-3">
        <h2 class="display-5">
        	<pre>우리동네의 다양한 </pre>
        	<pre>정보와 이야기를</pre>
        	<pre>공감과 댓글로 나누어요.</pre>
        </h2>
        <p class="lead">
        	<p>
        		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-hearts" viewBox="0 0 16 16">
 					<path fill-rule="evenodd" d="M11.5 1.246c.832-.855 2.913.642 0 2.566-2.913-1.924-.832-3.421 0-2.566M9 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0m-9 8c0 1 1 1 1 1h10s1 0 1-1-1-4-6-4-6 3-6 4m13.5-8.09c1.387-1.425 4.855 1.07 0 4.277-4.854-3.207-1.387-5.702 0-4.276ZM15 2.165c.555-.57 1.942.428 0 1.711-1.942-1.283-.555-2.281 0-1.71Z"/>
				</svg>
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-quora" viewBox="0 0 16 16">
  					<path d="M8.73 12.476c-.554-1.091-1.204-2.193-2.473-2.193-.242 0-.484.04-.707.142l-.43-.863c.525-.45 1.373-.808 2.464-.808 1.697 0 2.568.818 3.26 1.86.41-.89.605-2.093.605-3.584 0-3.724-1.165-5.636-3.885-5.636-2.68 0-3.839 1.912-3.839 5.636 0 3.704 1.159 5.596 3.84 5.596.425 0 .811-.046 1.166-.15Zm.665 1.3a7 7 0 0 1-1.83.244C3.994 14.02.5 11.172.5 7.03.5 2.849 3.995 0 7.564 0c3.63 0 7.09 2.828 7.09 7.03 0 2.337-1.09 4.236-2.675 5.464.512.767 1.04 1.277 1.773 1.277.802 0 1.125-.62 1.179-1.105h1.043c.061.647-.262 3.334-3.178 3.334-1.767 0-2.7-1.024-3.4-2.224Z"/>
				</svg>
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search-heart" viewBox="0 0 16 16">
  					<path d="M6.5 4.482c1.664-1.673 5.825 1.254 0 5.018-5.825-3.764-1.664-6.69 0-5.018"/>
  					<path d="M13 6.5a6.47 6.47 0 0 1-1.258 3.844q.06.044.115.098l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1-.1-.115h.002A6.5 6.5 0 1 1 13 6.5M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11"/>
				</svg>
			</p>
				<br>
        	<p><span class="fw-bold">동네모임</span>
        		근처 이웃들과 동네 이야기를 해보세요.
        	</p>
        	<p><span class="fw-bold">동네질문</span>
        		궁금한 게 있을 땐 이웃에 물어보세요.
        	</p>
        	<p><span class="fw-bold">동네분실</span>
        		무언가를 잃어 버렸다면 글을 올려 보세요.
        	</p>
      </div>
      <img src="/resources/img/market4.jpg" class="bg-light shadow-sm mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"></img>
    </div>
  </div>

  <div class="d-md-flex flex-md-equal w-100 my-md-3 ps-md-3">
    <div class="bg-light me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
      <div class="my-3 p-3">
        <h2 class="display-5">알바</h2>
        <p class="lead">걸어서 10분! 동네 알바 구하기</p>
      </div>
        <img src="/resources/img/market5.png" class="bg-light shadow-sm mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"></img>
    </div>
    <div class="bg-light me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
      <div class="my-3 py-3">
        <h2 class="display-5">
       		<pre>매일 쉽고,편하게</pre>
       		<pre>데일리 알바로</pre>
       		<pre>동네 알바를 구할 수 있어요</pre>
       	</h2>
        <p class="lead"><button type="button" class="btn btn-secondary" onclick="javascript: location.href='/user/job/main'">내 근처 알바 보기</button></p>
      </div>
        <img src="/resources/img/market6.jpg" class="bg-light shadow-sm mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"></img>
    </div>
  </div>
  
  <div class="d-md-flex flex-md-equal w-100 my-md-3 ps-md-3">
    <div class="bg-light me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
      <div class="my-3 p-3">
        <h2 class="display-5">동네업체</h2>
        <p class="lead">내 근처에서 찾는 동네업체</p>
      </div>
        <img src="/resources/img/market7.jpg" class="bg-light shadow-sm mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"></img>
    </div>
    <div class="bg-light me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
      <div class="my-3 py-3">
        <h2 class="display-5">
        	<pre>이웃들의 추천 후기를</pre>
        	<pre>확인하고 동네 곳곳의</pre>
        	<pre>업체들을 찾을 수 있어요.</pre>
        </h2>
        <p class="lead"><button type="button" class="btn btn-secondary" onclick="javascript: location.href='/user/company/main'">데일리 동네업체 보기</button></p>
      </div>
        <img src="/resources/img/market8.jpg" class="bg-light shadow-sm mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"></img>
    </div>
  </div>
</main>
<%@ include file="/resources/common/user/footer.jsp" %>
</body>
<!-- Jquery  -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- BootStrap  -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<!-- chart js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	 // 이미지 슬라이드 컨트롤를 사용하기 위해서는 carousel를 실행해야한다.      
	 $('#mainCarousel').carousel({        
	  	interval: 3000         
	   });
	   

});

</script>
</html>
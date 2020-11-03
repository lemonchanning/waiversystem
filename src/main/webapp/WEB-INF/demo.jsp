<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
<%@ page isELIgnored="false" %>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="./resources/image/logo.png">
<title>Home</title>
<!-- Slick Slider -->
<link rel="stylesheet"  href="./resources/vendor/slick/slick.min.css"/>
<script src="./resources/js/jquery-3.5.1.js"></script>
<link rel="stylesheet"  href="./resources/vendor/slick/slick-theme.min.css"/>
<!-- Feather Icon-->
<link href="./resources/vendor/icons/feather.css" rel="stylesheet">
<!-- Bootstrap core CSS -->
<link href="./resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles -->
<link href="./resources/css/style.css" rel="stylesheet">
</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-expand navbar-dark bg-dark osahan-nav-top p-0">
  <div class="container"> <a class="navbar-brand mr-2" href="index.html"><img src="./resources/image/logo.png" alt="" width="50"> </a>
    <!-- <form class="d-none d-sm-inline-block form-inline mr-auto my-2 my-md-0 mw-100 navbar-search">
      <div class="input-group">
        <input type="text" class="form-control shadow-none border-0" placeholder="Search donations & more..." aria-label="Search" aria-describedby="basic-addon2">
        <div class="input-group-append">
          <button class="btn" type="button"> <i class="feather-search"></i> </button>
        </div>
      </div>
    </form> -->
    <ul class="navbar-nav ml-auto d-flex align-items-center">
    
      <!-- Nav Item - Search Dropdown (Visible Only XS) -->
<!--       <li class="nav-item dropdown no-arrow d-sm-none"> <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="feather-search mr-2"></i> </a> 
 -->        <!-- Dropdown - Messages -->
        <div class="dropdown-menu dropdown-menu-right p-3 shadow-sm animated--grow-in" aria-labelledby="searchDropdown">
          <form class="form-inline mr-auto w-100 navbar-search">
            <div class="input-group">
              <input type="text" class="form-control border-0 shadow-none" placeholder="Search donations & more..." aria-label="Search" aria-describedby="basic-addon2">
              <div class="input-group-append">
                <button class="btn" type="button"> <i class="feather-search"></i> </button>
              </div>
            </div>
          </form>
        </div>
\      <li class="nav-item"> <a class="nav-link" href="index.html"><i class="feather-briefcase mr-2"></i><span class="d-none d-lg-inline">Donations</span></a> </li>
      <li class="nav-item dropdown mr-2"> <a class="nav-link dropdown-toggle pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="feather-file-text mr-2"></i><span class="d-none d-lg-inline">Pages</span> </a> 
        <!-- Dropdown - User Information -->
        <div class="dropdown-menu dropdown-menu-right shadow-sm">
        <a class="dropdown-item" href="#"><i class="feather-briefcase mr-1"></i> My Donation</a> 
        <a class="dropdown-item" href="${pageContext.request.contextPath}/apply1"><i class="feather-users mr-1"></i> Apply for Donation</a> 
        <a class="dropdown-item" href="${pageContext.request.contextPath}/user/setting"><i class="feather-user mr-1"></i> Profile</a> 
        <a class="dropdown-item" href="${pageContext.request.contextPath}/getlogin"><i class="feather-log-in mr-1"></i> Sign In</a> 
        <a class="dropdown-item" href="${pageContext.request.contextPath}/getregister"><i class="feather-lock mr-1"></i> Sign Up</a> </div>
      </li>
      <!-- Nav Item - User Information -->
      <li class="nav-item dropdown no-arrow ml-1 osahan-profile-dropdown"> 
      <a class="nav-link dropdown-toggle pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onClick="window.location.href ='${pageContext.request.contextPath}/user/setting'"> 
      <img class="img-profile rounded-circle" src="./resources/image/p6.png" alt="avatar"> </a> </li>
    </ul>
  </div>
</nav>
<div class="py-4">
  <div class="container">
    <div class="row"> 
      <!-- Main Content -->
      <main class="col col-xl-6 order-xl-2 col-lg-12 order-lg-1 col-md-12 col-sm-12 col-12">
      <c:forEach items="${discussList}" var="list">
      	<c:forEach items="${list}" var="map">
        <div class="box shadow-sm border rounded bg-white mb-3 osahan-post">
          <div class="p-3 d-flex align-items-center border-bottom osahan-post-header" href="donate-info.html">
            <div class="font-weight-bold">
              <div class="text-truncate"><a href="./detail/${map.value.id}">${map.value.title}</a></div>
              <div class="small text-gray-500"> ${map.value.username}</div>
            </div>
            <span class="ml-auto small">${map.value.createTime}</span> 
            </div>
          <div class="p-3 border-bottom osahan-post-body">
            <p class="mb-0">${map.value.content}</p>
          </div>
          <div class="p-3 border-bottom osahan-post-footer">
            <p>Target amount  5320/${map.value.targetAmount}</p>
            <a href="#" class="mr-3 text-secondary"><em class="feather-heart text-danger"></em> 16</a> 
            <a href="#" class="mr-3 text-secondary"><em class="feather-message-square"></em> 8</a> 
            <a href="#" class="mr-3 text-secondary"><em class="feather-share-2"></em> 2</a> 
            </div>
          <div class="p-3">
            <button type="button" class="btn btn-outline-primary btn-sm mr-1">Donate!!</button>
          </div>
        </div>
        	</c:forEach>
       </c:forEach>
        <!-- pagination -->
        
        <c:if test="${page.rows>1}">
        <nav class="mt-5">
        		
					<ul class="pagination justify-content-center">
						<li class="page-item">
							<a class="page-link"href=".${page.path}?current=1" >first</a>
						</li>
							<c:if test="${page.current>1}">
						<li class="page-item">
							<a class="page-link" href=".${page.path}?current=${page.current-1}">previous</a>
						</li>
							</c:if>
							<c:if test="${page.current==1}">
						<li class="page-item disabled">
							<a class="page-link" href=".${page.path}/current=${page.current-1}">previous</a>
						</li>
							</c:if>
						
						<c:forEach var="currentPage" begin="${page.from}" end="${page.to}">
						<c:choose>
						<c:when test="${page.current==currentPage}">
						<li class="page-item active">
							<a class="page-link" href=".${page.path}?current=${currentPage}"><c:out value="${currentPage}"/></a>
						</li>
						</c:when>
						<c:otherwise>
						<li class="page-item">
							<a class="page-link" href=".${page.path}?current=${currentPage}"><c:out value="${currentPage}"/></a>
						</li>
						</c:otherwise>
						</c:choose>
						</c:forEach>
						
						<c:choose>
						<c:when test="${page.current!=page.total}">
						<li class="page-item">
							<a class="page-link" href=".${page.path}?current=${page.current+1}">next</a>
						</li>
						</c:when>
						<c:otherwise>
						<li class="page-item disabled">
							<a class="page-link" href=".${page.path}?current=${page.current+1}">next</a>
						</li>
						</c:otherwise>
						</c:choose>
						
						<li class="page-item">
							<a class="page-link" href=".${page.path}?current=${page.total}">end</a>
						</li>
					</ul>
				</nav>
		</c:if>
      </main>
      <aside class="col col-xl-3 order-xl-1 col-lg-6 order-lg-2 col-md-6 col-sm-6 col-12">
        <div class="box mb-3 shadow-sm border rounded bg-white profile-box text-center">
          <div class="py-4 px-3 border-bottom"> <img src="./resources/image/p6.png" class="img-fluid mt-2 rounded-circle" alt="Responsive image">
            <h5 class="font-weight-bold text-dark mb-1 mt-4">Username</h5>
            <p class="mb-0 text-muted">Poster</p>
          </div>
          <div class="d-flex">
            <div class="col-6 border-right p-3">
              <h6 class="font-weight-bold text-dark mb-1">25</h6>
              <p class="mb-0 text-black-50 small">Donations</p>
            </div>
            <div class="col-6 p-3">
              <h6 class="font-weight-bold text-dark mb-1">$4,500</h6>
              <p class="mb-0 text-black-50 small">Amount</p>
            </div>
          </div>
          <div class="overflow-hidden border-top"> <a class="font-weight-bold p-3 d-block" href="profile.html"> View my profile </a> </div>
        </div>
        <div class="box mb-3 shadow-sm rounded bg-white view-box overflow-hidden">
          <div class="box-title border-bottom p-3">
            <h6 class="m-0">Donation Views</h6>
          </div>
          <div class="d-flex text-center">
            <div class="col-6 border-right py-4 px-2">
              <h5 class="font-weight-bold text-info mb-1">08 <i class="feather-bar-chart-2"></i></h5>
              <p class="mb-0 text-black-50 small">last 5 days</p>
            </div>
            <div class="col-6 py-4 px-2">
              <h5 class="font-weight-bold text-success mb-1">+ 43% <i class="feather-bar-chart"></i></h5>
              <p class="mb-0 text-black-50 small">Since last week</p>
            </div>
          </div>
          <div class="overflow-hidden border-top text-center"> <img src="./resources/image/chart.png" class="img-fluid" alt="Responsive image"> </div>
        </div>
        <div class="box shadow-sm mb-3 rounded bg-white ads-box text-center"> <img src="./resources/image/job1.png" class="img-fluid" alt="Responsive image">
          <div class="p-3 border-bottom">
            <h6 class="font-weight-bold text-dark">Wave</h6>
            <p class="mb-0 text-muted">Looking for Help?</p>
          </div>
          <div class="p-3">
            <button type="button" class="btn btn-outline-primary pl-4 pr-4" onClick="window.location.href ='./apply1'"> POST A Donation </button>
          </div>
        </div>
      </aside>
      <aside class="col col-xl-3 order-xl-3 col-lg-6 order-lg-3 col-md-6 col-sm-6 col-12">
        <div class="box shadow-sm border rounded bg-white mb-3">
          <div class="box-title border-bottom p-3">
            <h6 class="m-0">More Donation Projects</h6>
          </div>
          <div class="box-body p-3"> <a class="dropdown-item d-flex align-items-center" href="#">
            <div class="dropdown-list-image mr-3"> <img class="rounded-circle" src="./resources/image/p1.png" alt=""> </div>
            <div class="font-weight-bold overflow-hidden">
              <div class="text-truncate">Cancer treatment donation</div>
              <div class="small text-gray-500">Posted · 58m</div>
            </div>
            </a> <a class="dropdown-item d-flex align-items-center" href="#">
            <div class="dropdown-list-image mr-3"> <img class="rounded-circle" src="./resources/image/p2.png" alt=""> </div>
            <div class="font-weight-bold overflow-hidden">
              <div class="text-truncate">Leukemia Treatment Donation</div>
              <div class="small text-gray-500">Posted · 1d</div>
            </div>
            </a> <a class="dropdown-item d-flex align-items-center" href="#">
            <div class="dropdown-list-image mr-3"> <img class="rounded-circle" src="./resources/image/p3.png" alt=""> </div>
            <div class="font-weight-bold overflow-hidden">
              <div class="text-truncate">AIDS treatment donation</div>
              <div class="small text-gray-500">Posted · 2d</div>
            </div>
            </a> </div>
        </div>
        <div class="box shadow-sm mb-3 rounded bg-white ads-box text-center overflow-hidden"> <img src="./resources/image/ads1.png" class="img-fluid" alt="Responsive image">
          <div class="p-3 border-bottom">
            <h6 class="font-weight-bold text-gold">Wave</h6>
            <p class="mb-0 text-muted">Make our world better</p>
          </div>
          <div class="p-3">
            <button type="button" class="btn btn-outline-gold pl-4 pr-4"> Donate </button>
          </div>
        </div>
        <div class="box shadow-sm border rounded bg-white mb-3">
          <div class="box-title border-bottom p-3">
            <h6 class="m-0">Donations</h6>
          </div>
          <div class="box-body">
            <div class="d-flex align-items-center osahan-post-header p-3 border-bottom people-list">
              <div class="dropdown-list-image mr-3"> <img class="rounded-circle" src="./resources/image/p1.png" alt=""> </div>
              <div class="font-weight-bold">
                <div class="text-truncate">Covid-19 </div>
                <div class="small text-muted"><span class="text-primary">Donated 3 hours ago</span> $2,000 </div>
              </div>
            </div>
            <div class="d-flex align-items-center osahan-post-header p-3 border-bottom people-list">
              <div class="dropdown-list-image mr-3"> <img class="rounded-circle" src="./resources/image/p2.png" alt=""> </div>
              <div class="font-weight-bold">
                <div class="text-truncate">Cancer</div>
                <div class="small text-muted"><span class="text-primary">Donated 5 days ago</span> $1,500 </div>
              </div>
            </div>
            <div class="d-flex align-items-center osahan-post-header p-3 people-list">
              <div class="dropdown-list-image mr-3"> <img class="rounded-circle" src="./resources/image/p3.png" alt=""> </div>
              <div class="font-weight-bold">
                <div class="text-truncate">AIDS</div>
                <div class="small text-muted"><span class="text-primary">Donated 1 month ago</span> $1,000 </div>
              </div>
            </div>
          </div>
        </div>
      </aside>
    </div>
  </div>
</div>
<!-- Bootstrap core JavaScript --> 
<script src="./resources/vendor/jquery/jquery.min.js"></script> 
<script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> 
<!-- slick Slider JS--> 
<script src="./resources/vendor/slick/slick.min.js"></script> 
<!-- Custom scripts for all pages--> 
<script src="./resources/js/osahan.js"></script>
</body>
</html>
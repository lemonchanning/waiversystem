<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/image/logo.png">
<title></title>
<!-- Slick Slider -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/slick/slick.min.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/slick/slick-theme.min.css"/>
<!-- Feather Icon-->
<link href="${pageContext.request.contextPath}/resources/vendor/icons/feather.css" rel="stylesheet" type="text/css">
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles -->
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-expand navbar-dark bg-dark osahan-nav-top p-0">
  <div class="container"> <a class="navbar-brand mr-2" href="./"><img src="${pageContext.request.contextPath}/resources/image/logo.png" alt="" width="50"> </a>
    <ul class="navbar-nav ml-auto d-flex align-items-center">
        <!-- Dropdown - Messages -->
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
      <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/"><i class="feather-briefcase mr-2"></i><span class="d-none d-lg-inline">Donations</span></a> </li>
      <li class="nav-item dropdown mr-2"> <a class="nav-link dropdown-toggle pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="feather-file-text mr-2"></i><span class="d-none d-lg-inline">Pages</span> </a> 
        <!-- Dropdown - User Information -->
       <c:choose>
        <c:when test="${user1==null}">
        <div class="dropdown-menu dropdown-menu-right shadow-sm">
        <a class="dropdown-item" href="#"><i class="feather-briefcase mr-1"></i> My Donation</a> 
        <a class="dropdown-item" href="${pageContext.request.contextPath}/apply1"><i class="feather-users mr-1"></i> Apply for Donation</a> 
        <a class="dropdown-item" href="${pageContext.request.contextPath}/user/setting"><i class="feather-user mr-1"></i> Profile</a> 
        <a class="dropdown-item" href="${pageContext.request.contextPath}/getlogin"><i class="feather-log-in mr-1"></i> Sign In</a> 
        <a class="dropdown-item" href="${pageContext.request.contextPath}/getregister"><i class="feather-lock mr-1"></i> Sign Up</a> 
        </div>
        </c:when>
        <c:otherwise>
         <div class="dropdown-menu dropdown-menu-right shadow-sm">
        <a class="dropdown-item" href="#"><i class="feather-briefcase mr-1"></i> My Donation</a> 
        <a class="dropdown-item" href="${pageContext.request.contextPath}/apply1"><i class="feather-users mr-1"></i> Apply for Donation</a> 
        <a class="dropdown-item" href="${pageContext.request.contextPath}/user/setting"><i class="feather-user mr-1"></i> Profile</a> 
        <a class="dropdown-item" href="${pageContext.request.contextPath}/logout"><i class="feather-log-in mr-1"></i> Log out</a> 
        </div>
        </c:otherwise>
        </c:choose>
      </li>
      
      <!-- Nav Item - User Information -->
      <c:choose>
      <c:when test="${user1==null||header1==null}">
      <li class="nav-item dropdown no-arrow ml-1 osahan-profile-dropdown"> 
      <a class="nav-link dropdown-toggle pr-0" href="${pageContext.request.contextPath}/user/setting" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onClick="window.location.href ='${pageContext.request.contextPath}/user/setting'"> 
      <img class="img-profile rounded-circle" src="${pageContext.request.contextPath}/resources/image/p6.png" alt="avatar"> 
      </a> 
      </li>      
      </c:when>
      
      <c:otherwise>
      <li class="nav-item dropdown no-arrow ml-1 osahan-profile-dropdown">
     <a class="nav-link dropdown-toggle pr-0" href="${pageContext.request.contextPath}/user/setting" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onClick="window.location.href ='${pageContext.request.contextPath}/user/setting'"> 
      <img class="img-profile rounded-circle" src="${pageContext.request.contextPath}/user/header/${filename}/" alt="avatar"> 
      </a> 
      </li>
      </c:otherwise>
      </c:choose>
      
    </ul>
  </div>
</nav>
<div class="py-4">
  <div class="container">
    <div class="row"> 
      <!-- Main Content -->
      <aside class="col col-xl-3 order-xl-1 col-lg-12 order-lg-1 col-12">
        <div class="box mb-3 shadow-sm border rounded bg-white profile-box text-center">

        <c:choose>
        <c:when test="${header1==null&&user1!=null}">
          <div class="py-4 px-3 border-bottom"> 
          <img src="${pageContext.request.contextPath}/resources/image/p6.png" class="img-fluid mt-2 rounded-circle" alt="Responsive image">
            <h5 class="font-weight-bold text-dark mb-1 mt-4">${user1.username }</h5>
            <p class="mb-0 text-muted">Common User</p>
          </div>
          </c:when>
          <c:otherwise>
          <div class="py-4 px-3 border-bottom"> 
          <img src="${pageContext.request.contextPath}/user/header/${filename}/" class="img-fluid mt-2 rounded-circle" alt="Responsive image">
            <h5 class="font-weight-bold text-dark mb-1 mt-4">${user1.username}</h5>
            <p class="mb-0 text-muted">Common User</p>
          </div>
          </c:otherwise>
        </c:choose>
          
          <form class="job-search p-3 border-bottom" action="${pageContext.request.contextPath}/user/upload" method="POST" enctype="multipart/form-data" >
          <c:choose>
          <c:when test="${fileMsg!=null}">
            <input type="file" name="multipartFile"/>
             <div class="invalid-feedback">${fileMsg}</div>
          </c:when>
          <c:otherwise>
          <input type="file" name="multipartFile"/>
          </c:otherwise>
          </c:choose>
          <button type="submit" class="btn btn-primary btn-sm btn-block">Change Avatar</button>
        </form>
        
          <div class="d-flex">
            <div class="col-6 border-right p-3">
              <h6 class="font-weight-bold text-dark mb-1">25</h6>
              <p class="mb-0 text-black-50 small">Donations</p>
            </div>
            <div class="col-6 p-3">
              <h6 class="font-weight-bold text-dark mb-1">$4, 500</h6>
              <p class="mb-0 text-black-50 small">Amount</p>
            </div>
          </div>
          <div class="overflow-hidden border-top"> <a class="font-weight-bold p-3 d-block" href="${pageContext.request.contextPath}/logout"> Log Out </a> </div>
        </div>
        <div class="box shadow-sm mb-3 rounded bg-white ads-box text-center"> <img src="${pageContext.request.contextPath}/resources/image/job1.png" class="img-fluid" alt="Responsive image">
          <div class="p-3 border-bottom">
            <h6 class="font-weight-bold text-dark">Wave</h6>
            <p class="mb-0 text-muted">Ask for help?</p>
          </div>
          <div class="p-3">
            <button type="button" class="btn btn-outline-primary pl-4 pr-4" onclick="window.location.href='${pageContext.request.contextPath}/apply1'"> POST A Donation </button>
          </div>
        </div>
      </aside>
      <main class="col col-xl-6 order-xl-2 col-lg-12 order-lg-2 col-md-12 col-sm-12 col-12">
        <div class="box shadow-sm border rounded bg-white mb-3">
          <div class="box-title border-bottom p-3">
            <h6 class="m-0">About You</h6>
          </div>
          <div class="box-body p-3">
            <p>Everyone will encounter some unexpected situations in their life, such as suddenly getting serious illness or being hit by a high-speed car. For various reasons, they may not be able to pay for their basic living expenses or various medical expenses in a short time, but if we can gather more people and lend them a helping hand at this critical time, we only need everyone to donate a little money to them, which can help them tide over the difficulties and soon return to the normal life of society. </p>
            <p class="mb-0">Our project, "Wave", is a website to help those in need receive donations. On the one hand, people who need donations can post the real situation of the recipients on this website and launch fundraising for themselves or those in need; On the other hand, people who want to donate can also find ways to donate simply and quickly, and lend a helping hand to those in need in time. </p>
          </div>
        </div>
        <div class="box shadow-sm border rounded bg-white mb-3">
          <div class="box-title border-bottom p-3">
            <h6 class="m-0">Donations</h6>
          </div>
          <div class="box-body p-3 border-bottom">
            <div class="d-flex align-items-top job-item-header pb-2">
              <div class="mr-2">
                <h6 class="font-weight-bold text-dark mb-0">Covid-19</h6>
                <div class="text-truncate text-primary">Wave</div>
                <div class="small text-gray-500">Donated 3 hours ago </div>
              </div>
              <img class="img-fluid ml-auto mb-auto" src="${pageContext.request.contextPath}/resources/image/p1.png" alt=""> </div>
            <p class="mb-0">This is a donation project for covid-19 patients. </p>
          </div>
          <div class="box-body p-3 border-bottom">
            <div class="d-flex align-items-top job-item-header pb-2">
              <div class="mr-2">
                <h6 class="font-weight-bold text-dark mb-0">Cancer</h6>
                <div class="text-truncate text-primary">Wave</div>
                <div class="small text-gray-500">Donated 5 days ago </div>
              </div>
              <img class="img-fluid ml-auto mb-auto" src="${pageContext.request.contextPath}/resources/image/p2.png" alt=""> </div>
            <p class="mb-0">This is a donation project for cancer patients. </p>
          </div>
          <div class="box-body p-3">
            <div class="d-flex align-items-top job-item-header pb-2">
              <div class="mr-2">
                <h6 class="font-weight-bold text-dark mb-0">AIDS</h6>
                <div class="text-truncate text-primary">Wave</div>
                <div class="small text-gray-500">Donated in 1 month ago</div>
              </div>
              <img class="img-fluid ml-auto mb-auto" src="${pageContext.request.contextPath}/resources/image/p3.png" alt=""> </div>
            <p class="mb-0">This is a donation project for AIDS patients. </p>
          </div>
        </div>
      </main>
      <aside class="col col-xl-3 order-xl-3 col-lg-12 order-lg-3 col-12">
        <div class="box shadow-sm border rounded bg-white mb-3">
          <div class="box-title border-bottom p-3">
            <h6 class="m-0">Who viewed your profile</h6>
          </div>
          <div class="box-body p-3">
            <div class="d-flex align-items-center osahan-post-header mb-3 people-list">
              <div class="dropdown-list-image mr-3"> <img class="rounded-circle" src="${pageContext.request.contextPath}/resources/image/p7.png" alt="">
                <div class="status-indicator bg-success"></div>
              </div>
              <div class="font-weight-bold mr-2">
                <div class="text-truncate">Sophia Lee</div>
                <div class="small text-gray-500">@Harvard </div>
              </div>
              <span class="ml-auto">
              <button type="button" class="btn btn-light btn-sm">Connent</button>
              </span> </div>
            <div class="d-flex align-items-center osahan-post-header mb-3 people-list">
              <div class="dropdown-list-image mr-3"> <img class="rounded-circle" src="${pageContext.request.contextPath}/resources/image/p8.png" alt="">
                <div class="status-indicator bg-success"></div>
              </div>
              <div class="font-weight-bold mr-2">
                <div class="text-truncate">John Doe</div>
                <div class="small text-gray-500">Traveler </div>
              </div>
              <span class="ml-auto">
              <button type="button" class="btn btn-light btn-sm">Connent</button>
              </span> </div>
            <div class="d-flex align-items-center osahan-post-header mb-3 people-list">
              <div class="dropdown-list-image mr-3"> <img class="rounded-circle" src="${pageContext.request.contextPath}/resources/image/p9.png" alt="">
                <div class="status-indicator bg-success"></div>
              </div>
              <div class="font-weight-bold mr-2">
                <div class="text-truncate">Julia Cox</div>
                <div class="small text-gray-500">Art Designer </div>
              </div>
              <span class="ml-auto">
              <button type="button" class="btn btn-light btn-sm">Connent</button>
              </span> </div>
            <div class="d-flex align-items-center osahan-post-header mb-3 people-list">
              <div class="dropdown-list-image mr-3"> <img class="rounded-circle" src="${pageContext.request.contextPath}/resources/image/p10.png" alt="">
                <div class="status-indicator bg-success"></div>
              </div>
              <div class="font-weight-bold mr-2">
                <div class="text-truncate">Robert Cook</div>
                <div class="small text-gray-500">@Photography </div>
              </div>
              <span class="ml-auto">
              <button type="button" class="btn btn-light btn-sm">Connent</button>
              </span> </div>
          </div>
        </div>
        <div class="box shadow-sm mb-3 rounded bg-white ads-box text-center overflow-hidden"> <img src="${pageContext.request.contextPath}/resources/image/ads1.png" class="img-fluid" alt="Responsive image">
          <div class="p-3 border-bottom">
            <h6 class="font-weight-bold text-gold">Wave</h6>
            <p class="mb-0 text-muted">Make our world better</p>
          </div>
          <div class="p-3">
            <button type="button" class="btn btn-outline-gold pl-4 pr-4"> Donate </button>
          </div>
        </div>
      </aside>
    </div>
  </div>
</div>
<!-- Bootstrap core JavaScript --> 
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> 
<!-- slick Slider JS--> 
<script src="${pageContext.request.contextPath}/resources/vendor/slick/slick.min.js"></script> 
<!-- Custom scripts for all pages--> 
<script src="${pageContext.request.contextPath}/resources/js/osahan.js"></script>
</body>
</html>
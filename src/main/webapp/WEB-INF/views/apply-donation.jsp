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
<meta charset="utf-8">
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
      <!-- Nav Item - Search Dropdown (Visible Only XS) -->
      <li class="nav-item dropdown no-arrow d-sm-none"> <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="feather-search mr-2"></i> </a> 
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
      </li>
      <li class="nav-item"> <a class="nav-link" href="./"><i class="feather-briefcase mr-2"></i><span class="d-none d-lg-inline">Donations</span></a> </li>
      <li class="nav-item dropdown mr-2"> <a class="nav-link dropdown-toggle pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="feather-file-text mr-2"></i><span class="d-none d-lg-inline">Pages</span> </a> 
        <!-- Dropdown - User Information -->
        <div class="dropdown-menu dropdown-menu-right shadow-sm"> <a class="dropdown-item" href="#"><i class="feather-briefcase mr-1"></i> My Donation</a> <a class="dropdown-item"><i class="feather-users mr-1"></i> Apply for Donation</a> <a class="dropdown-item"><i class="feather-user mr-1"></i> Profile</a> <a class="dropdown-item" href="./sign_in"><i class="feather-log-in mr-1"></i> Sign In</a> <a class="dropdown-item" href="sign-up.html"><i class="feather-lock mr-1"></i> Sign Up</a> </div>
      </li>
    
      <!-- Nav Item - User Information -->
      <li class="nav-item dropdown no-arrow ml-1 osahan-profile-dropdown"> <a class="nav-link dropdown-toggle pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onClick="window.location.href ='./profile'"> <img class="img-profile rounded-circle" src="${pageContext.request.contextPath}/resources/image/p6.png" alt="avatar"> </a> </li>
    </ul>
  </div>
</nav>

<!-- Main -->
<div class="py-4">
  <div class="container">
    <div class="row"> 
    
      <!-- Apply -->
      <main class="col col-xl-6 order-xl-2 col-lg-12 order-lg-1 col-md-12 col-sm-12 col-12">
        <h3 class="font-weight-bold text-dark mb-0 text-truncate">Apply for a new donation</h3>
        <form class="job-search p-3 border-bottom" method="post" action="./apply2">
          <div class="form-group">
            <h6 class="font-weight-bold text-dark mb-0 text-truncate">Title</h6>
            <c:choose>
            <c:when test="${titleMsg==null}">
            <input type="text" class="form-control" name="title" placeholder="Please input the title">
            </c:when>
            <c:otherwise>
             <input type="text" class="form-control is-invalid" name="title" placeholder="${titleMsg}">
            </c:otherwise>
            </c:choose>
          </div>
          
          <div class="form-group">
            <h6 class="font-weight-bold text-dark mb-0 text-truncate">Target amount</h6>
            <c:choose>
            <c:when test="${amountMsg==null}">
            <input type="text" class="form-control" name="targetAmount" placeholder="$0.00">
            </c:when>
            <c:otherwise>
             <input type="text" class="form-control is-invalid" name="targetAmount" placeholder="${amountMsg }">
            </c:otherwise>
            </c:choose>
          </div>
          
          <div class="form-group">
            <h6 class="font-weight-bold text-dark mb-0 text-truncate">Contact Details</h6>
            <c:choose>
            <c:when test="${contactMsg==null }">
            <input type="text" class="form-control" name="contact_info" placeholder="Please input your phone number">
            </c:when>
            <c:otherwise>
            <input type="text" class="form-control is-invalid" name="contact_info" placeholder="${contactMsg}">
            </c:otherwise>
            </c:choose>
          </div>
<!--           <h6 class="font-weight-bold text-dark mb-0 text-truncate">Type</h6>
 -->          
          <h6 class="font-weight-bold text-dark mb-0 text-truncate">Description</h6>
          <div class="form-group">
          	<c:choose>
          	<c:when test="${contentMsg==null }">
            <textarea class="form-control" name="content" rows="3"></textarea>
            </c:when>
            <c:otherwise>
            <textarea class="form-control is-invalid" name="content" placeholder="${contentMsg}" rows="3"></textarea>
            </c:otherwise>
            </c:choose>
          </div>
          <button type="submit" class="btn btn-primary btn-sm btn-block">Apply</button>
        </form>
        
        <form class="job-search p-3 border-bottom" action="testFileUpload" method="POST" enctype="multipart/form-data">
        <img src="${pageContext.request.contextPath}/resources/image/file_icon.png" class="img-fluid" alt="Responsive image" width="80"> 
          <p>File:
            <input type="file" name="file"/>
          </p>
          <p>
          Description:
            <input type="text" name="desc"/>
          </p>
          <button type="submit" class="btn btn-primary btn-sm btn-block">Upload Support Material</button>
        </form>
      </main>
      
      <!-- Profile -->
      <aside class="col col-xl-3 order-xl-1 col-lg-6 order-lg-2 col-md-6 col-sm-6 col-12">
        <div class="box mb-3 shadow-sm border rounded bg-white profile-box text-center">
          <div class="p-5"> <img src="${pageContext.request.contextPath}/resources/image/p6.png" class="img-fluid" alt="Responsive image"> </div>
          <div class="p-3 border-top border-bottom">
            <h5 class="font-weight-bold text-dark mb-1 mt-0">Tom Han</h5>
            <p class="mb-0 text-muted">Sydney, AU </p>
          </div>
          <div class="p-3">
            <div class="d-flex align-items-top mb-2">
              <p class="mb-0 text-muted">Posted</p>
              <p class="font-weight-bold text-dark mb-0 mt-0 ml-auto">1 day ago</p>
            </div>
            <div class="d-flex align-items-top">
              <p class="mb-0 text-muted">Donation Times</p>
              <p class="font-weight-bold text-dark mb-0 mt-0 ml-auto">25</p>
            </div>
          </div>
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
          <div class="overflow-hidden border-top text-center"> <img src="${pageContext.request.contextPath}/resources/image/chart.png" class="img-fluid" alt="Responsive image"> </div>
        </div>
        <div class="box shadow-sm mb-3 rounded bg-white ads-box text-center"> </div>
      </aside>
      
      <!-- Other -->
      <aside class="col col-xl-3 order-xl-3 col-lg-6 order-lg-3 col-md-6 col-sm-6 col-12">
        <div class="box shadow-sm border rounded bg-white mb-3">
          <div class="box-title border-bottom p-3">
            <h6 class="m-0">Similar Donation Projects </h6>
          </div>
          <div class="box-body p-3"> <a href="donate-info.html">
            <div class="shadow-sm border rounded bg-white job-item">
              <div class="d-flex align-items-center p-3 job-item-header">
                <div class="overflow-hidden mr-2">
                  <h6 class="font-weight-bold text-dark mb-0 text-truncate">Latest Donation</h6>
                  <div class="text-truncate text-primary">Wave</div>
                  <div class="small text-gray-500"><i class="feather-map-pin"></i> Sydney, AU </div>
                </div>
                <img class="img-fluid ml-auto" src="${pageContext.request.contextPath}/resources/image/logo.png" alt=""> </div>
              <div class="d-flex align-items-center p-3 border-top border-bottom job-item-body">
                <div class="overlap-rounded-circle"> <img class="rounded-circle shadow-sm" data-toggle="tooltip" data-placement="top" title="" src="${pageContext.request.contextPath}/resources/image/p3.png" alt="" data-original-title="Sophia Lee"> <img class="rounded-circle shadow-sm" data-toggle="tooltip" data-placement="top" title="" src="${pageContext.request.contextPath}/resources/image/p1.png" alt="" data-original-title="John Doe"> <img class="rounded-circle shadow-sm" data-toggle="tooltip" data-placement="top" title="" src="${pageContext.request.contextPath}/resources/image/p2.png" alt="" data-original-title="Robert Cook"> </div>
                <span class="font-weight-bold text-muted">18 projects</span> </div>
              <div class="p-3 job-item-footer"> <small class="text-gray-500"><i class="feather-clock"></i> Posted 3 Days ago</small> </div>
            </div>
            </a> </div>
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
        <div class="box shadow-sm mb-3 rounded bg-white ads-box text-center"> </div>
      </aside>
    </div>
  </div>
</div>
<!-- Bootstrap core JavaScript --> 
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> 
<!-- slick Slider JS--> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/slick/slick.min.js"></script> 
<!-- Custom scripts for all pages--> 
<script src="${pageContext.request.contextPath}/resources/js/osahan.js"></script>
</body>
</html>
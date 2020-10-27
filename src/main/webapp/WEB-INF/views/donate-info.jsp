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
<link rel="icon" type="image/png" href="./resources/image/logo.png">
<title></title>
<!-- Slick Slider -->
<link rel="stylesheet" type="text/css" href="./resources/vendor/slick/slick.min.css"/>
<link rel="stylesheet" type="text/css" href="./resources/vendor/slick/slick-theme.min.css"/>
<!-- Feather Icon-->
<link href="./resources/vendor/icons/feather.css" rel="stylesheet" type="text/css">
<!-- Bootstrap core CSS -->
<link href="./resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles -->
<link href="./resources/css/style.css" rel="stylesheet">
</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-expand navbar-dark bg-dark osahan-nav-top p-0">
  <div class="container"> <a class="navbar-brand mr-2" href="index.html"><img src="./resources/image/logo.png" alt="" width="50"> </a>
    <form class="d-none d-sm-inline-block form-inline mr-auto my-2 my-md-0 mw-100 navbar-search">
      <div class="input-group">
        <input type="text" class="form-control shadow-none border-0" placeholder="Search donations & more..." aria-label="Search" aria-describedby="basic-addon2">
        <div class="input-group-append">
          <button class="btn" type="button"> <i class="feather-search"></i> </button>
        </div>
      </div>
    </form>
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
      <li class="nav-item"> <a class="nav-link" href="index.html"><i class="feather-briefcase mr-2"></i><span class="d-none d-lg-inline">Donations</span></a> </li>
      <li class="nav-item dropdown mr-2"> <a class="nav-link dropdown-toggle pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="feather-file-text mr-2"></i><span class="d-none d-lg-inline">Pages</span> </a> 
        <!-- Dropdown - User Information -->
        <div class="dropdown-menu dropdown-menu-right shadow-sm"> <a class="dropdown-item" href="#"><i class="feather-briefcase mr-1"></i> My Donation</a> <a class="dropdown-item"><i class="feather-users mr-1"></i> Apply for Donation</a> <a class="dropdown-item"><i class="feather-user mr-1"></i> Profile</a> <a class="dropdown-item" href="sign-in.html"><i class="feather-log-in mr-1"></i> Sign In</a> <a class="dropdown-item" href="sign-up.html"><i class="feather-lock mr-1"></i> Sign Up</a> </div>
      </li>
      <li class="nav-item dropdown no-arrow mx-1 osahan-list-dropdown"> <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="feather-message-square"></i> 
        <!-- Counter - Alerts --> 
        <span class="badge badge-danger badge-counter">5</span> </a> 
        <!-- Dropdown - Alerts -->
        <div class="dropdown-list dropdown-menu dropdown-menu-right shadow-sm">
          <h6 class="dropdown-header"> Message Center </h6>
          <a class="dropdown-item d-flex align-items-center" href="#">
          <div class="dropdown-list-image mr-3"> <img class="rounded-circle" src="./resources/image/p1.png" alt=""> </div>
          <div class="font-weight-bold overflow-hidden">
            <div class="text-truncate">Cancer treatment donation</div>
            <div class="small text-gray-500">Emily Fowler · 58m</div>
          </div>
          </a> <a class="dropdown-item d-flex align-items-center" href="#">
          <div class="dropdown-list-image mr-3"> <img class="rounded-circle" src="./resources/image/p2.png" alt=""> </div>
          <div class="overflow-hidden">
            <div class="text-truncate">Leukemia Treatment Donation</div>
            <div class="small text-gray-500">Jae Chun · 1d</div>
          </div>
          </a> <a class="dropdown-item d-flex align-items-center" href="#">
          <div class="dropdown-list-image mr-3"> <img class="rounded-circle" src="./resources/image/p3.png" alt=""> </div>
          <div class="overflow-hidden">
            <div class="text-truncate">AIDS treatment donation</div>
            <div class="small text-gray-500">Morgan Alvarez · 2d</div>
          </div>
          </a> <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a> </div>
      </li>
      <li class="nav-item dropdown no-arrow mx-1 osahan-list-dropdown"> <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="feather-bell"></i> 
        <!-- Counter - Alerts --> 
        <span class="badge badge-info badge-counter">6</span> </a> 
        <!-- Dropdown - Alerts -->
        <div class="dropdown-list dropdown-menu dropdown-menu-right shadow-sm">
          <h6 class="dropdown-header"> Alerts Center </h6>
          <a class="dropdown-item d-flex align-items-center" href="#">
          <div class="mr-3">
            <div class="icon-circle bg-primary"> <i class="feather-download-cloud text-white"></i> </div>
          </div>
          <div>
            <div class="small text-gray-500">December 12, 2019</div>
            <span class="font-weight-bold">A new Donation has begin!</span> </div>
          </a> <a class="dropdown-item d-flex align-items-center" href="#">
          <div class="mr-3">
            <div class="icon-circle bg-success"> <i class="feather-edit text-white"></i> </div>
          </div>
          <div>
            <div class="small text-gray-500">December 7, 2019</div>
            $290.29 has been deposited into your account! </div>
          </a> <a class="dropdown-item d-flex align-items-center" href="#">
          <div class="mr-3">
            <div class="icon-circle bg-warning"> <i class="feather-folder text-white"></i> </div>
          </div>
          <div>
            <div class="small text-gray-500">December 2, 2019</div>
            You have donate $120 for now! Thanks for your kindness! </div>
          </a> <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a> </div>
      </li>
      <!-- Nav Item - User Information -->
      <li class="nav-item dropdown no-arrow ml-1 osahan-profile-dropdown"> <a class="nav-link dropdown-toggle pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onClick="window.location.href ='profile.html'"> <img class="img-profile rounded-circle" src="./resources/image/p6.png" alt="avatar"> </a> </li>
    </ul>
  </div>
</nav>
<div class="bg-white shadow-sm border-bottom">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="d-flex align-items-center py-3">
          <div class="profile-left">
            <h5 class="font-weight-bold text-dark mb-1 mt-0">Covid-19 Donation</h5>
            <p class="mb-0 text-muted"><a class="mr-2 font-weight-bold" href="#">Tom Han</a> <i class="feather-map-pin"></i> Sydney, AU -- DatePosted 2 weeks ago</p>
          </div>
          <div class="profile-right ml-auto">
            <button type="button" class="btn btn-light mr-1"> &nbsp; Save &nbsp; </button>
            <button type="button" class="btn btn-primary"> &nbsp; Donate &nbsp; </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="py-4">
  <div class="container">
    <div class="row"> 
      <!-- Main Content -->
      <main class="col col-xl-6 order-xl-2 col-lg-12 order-lg-1 col-md-12 col-sm-12 col-12">
        <div class="box shadow-sm border rounded bg-white mb-3">
          <div class="box-title border-bottom p-3">
            <h6 class="m-0">Overview</h6>
          </div>
          <div class="box-body p-3">
            <p>Coronavirus disease (COVID-19) is an infectious disease caused by a newly discovered coronavirus. </p>
            <p>Most people infected with the COVID-19 virus will experience mild to moderate respiratory illness and recover without requiring special treatment.  Older people and those with underlying medical problems like cardiovascular disease, diabetes, chronic respiratory disease, and cancer are more likely to develop serious illness. </p>
            <p class="mb-0">The best way to prevent and slow down transmission is to be well informed about the COVID-19 virus, the disease it causes and how it spreads. Protect yourself and others from infection by washing your hands or using an alcohol-based rub frequently and not touching your face. ...<a class="mr-2 font-weight-bold" href="#">Read More</a> </p>
          </div>
          <div class="p-3" style="text-align:right;">
            <button type="button" class="btn btn-outline-primary btn-sm mr-1">Donate Now!!!</button>
          </div>
        </div>
        <div class="box shadow-sm border rounded bg-white mb-3">
          <div class="box-title border-bottom p-3">
            <h6 class="m-0">Donation Details</h6>
          </div>
          <div class="box-body">
            <table class="table table-borderless mb-0">
              <tbody>
                <tr class="border-bottom">
                  <th class="p-3">Need donation amount</th>
                  <td class="p-3">$200,000 </td>
                </tr>
                <tr class="border-bottom">
                  <th class="p-3">Donation amount received</th>
                  <td class="p-3">$12,000</td>
                </tr>
                <tr class="border-bottom">
                  <th class="p-3">Number of donations</th>
                  <td class="p-3">3450 </td>
                </tr>
                <tr class="border-bottom">
                  <th class="p-3">Description</th>
                  <td class="p-3">Covid-19 Patient Treatment Fund</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        <div class="box mb-3 shadow-sm border rounded bg-white osahan-post"> <img src="./resources/image/p14.png" class="img-fluid" alt="Responsive image"> <img src="./resources/image/p15.png" class="img-fluid" alt="Responsive image">
          <div class="p-3 osahan-post-body">
            <h5 class="mb-3">About</h5>
            <p>Welcome to Wave! We’re so happy you found us. Since you’ve come this far, we’d love to take the opportunity to introduce ourselves.</p>
            <p class="mb-0">Our story begins in 2020. We are a nonprofit organization. We hope that we can use everyone’s strength to improve the world’s hunger, poverty, and the inability to afford medical expenses. We hope world peace. We hope the world to be better. </p>
          </div>
          <div class="overflow-hidden border-top text-center"> <a class="font-weight-bold p-3 d-block" href="#"> READ MORE </a> </div>
        </div>
        <div class="box shadow-sm border rounded bg-white mb-3 osahan-post">
          <div class="p-3 d-flex align-items-center border-bottom osahan-post-header">
            <div class="font-weight-bold">
              <div class="text-truncate">Comments</div>
            </div>
            <span class="ml-auto"></span> </div>
          <div class="p-3 d-flex align-items-center border-bottom osahan-post-header" href="donate-info.html">
            <div class="dropdown-list-image mr-3"> <img class="rounded-circle" src="./resources/image/p6.png" alt="">
              <div class="status-indicator bg-success"></div>
            </div>
            <div class="font-weight-bold">
              <div class="text-truncate">John</div>
              <div class="small text-gray-500">wave user</div>
            </div>
            <span class="ml-auto small">3 hours ago</span> </div>
          <div class="p-3 border-bottom osahan-post-body">
            <p class="mb-0">Coronavirus disease (COVID-19) is an infectious disease caused by a newly discovered coronavirus.</p>
          </div>
          <div class="p-3 d-flex align-items-center border-bottom osahan-post-header" href="donate-info.html">
            <div class="dropdown-list-image mr-3"> <img class="rounded-circle" src="./resources/image/p6.png" alt="">
              <div class="status-indicator bg-success"></div>
            </div>
            <div class="font-weight-bold">
              <div class="text-truncate">Mike</div>
              <div class="small text-gray-500">wave user</div>
            </div>
            <span class="ml-auto small">4 hours ago</span> </div>
          <div class="p-3 border-bottom osahan-post-body">
            <p class="mb-0">Please help those people!</p>
          </div>
          <div class="p-3" style="text-align:right;">
            <div class="form-group">
              <textarea class="form-control" rows="3"></textarea>
            </div>
            <button type="button" class="btn btn-outline-primary btn-sm mr-1">Post</button>
          </div>
        </div>
      </main>
      <aside class="col col-xl-3 order-xl-1 col-lg-6 order-lg-2 col-md-6 col-sm-6 col-12">
        <div class="box mb-3 shadow-sm border rounded bg-white profile-box text-center">
          <div class="p-5"> <img src="./resources/image/p6.png" class="img-fluid" alt="Responsive image"> </div>
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
          <div class="overflow-hidden border-top text-center"> <img src="./resources/image/chart.png" class="img-fluid" alt="Responsive image"> </div>
        </div>
        <div class="box shadow-sm mb-3 rounded bg-white ads-box text-center"> </div>
      </aside>
      <aside class="col col-xl-3 order-xl-3 col-lg-6 order-lg-3 col-md-6 col-sm-6 col-12">
        <div class="box mb-3 shadow-sm border rounded bg-white osahan-post">
          <div class="p-3 d-flex align-items-center border-bottom osahan-post-header">
            <div class="font-weight-bold">
              <div class="text-truncate">Supporting Materials</div>
            </div>
            <span class="ml-auto"></span> </div>
          <a class="font-weight-bold p-3 d-block" href="#"><img src="./resources/image/file_icon.png" class="img-fluid" alt="Responsive image" width="20"> Donation Details File Download </a> <a class="font-weight-bold p-3 d-block" href="#"><img src="./resources/image/file_icon.png" class="img-fluid" alt="Responsive image" width="20"> Licensed Materials Download</a>
          <div class="p-3 osahan-post-body">
            <h5 class="mb-3">About Donation Material Audit</h5>
            <p>All materials provided by the project have been approved by the site administrator.</p>
            <p class="mb-0">All materials provided by the donation project need to be reviewed by the administrator. The project needs to comply with Wave's policies and terms. Any project that violates Wave regulations will be disqualified and forced offline. </p>
          </div>
          <div class="overflow-hidden border-top text-center"> <a class="font-weight-bold p-3 d-block" href="#"> READ MORE </a> </div>
        </div>
        <button type="button" class="btn btn-lg btn-block btn-danger mb-3"> <i class="feather-bell"></i> Set alert for Donation </button>
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
                <img class="img-fluid ml-auto" src="./resources/image/logo.png" alt=""> </div>
              <div class="d-flex align-items-center p-3 border-top border-bottom job-item-body">
                <div class="overlap-rounded-circle"> 
                <img class="rounded-circle shadow-sm" data-toggle="tooltip" data-placement="top" title="" src="./resources/image/p3.png" alt="" data-original-title="Sophia Lee"> 
                <img class="rounded-circle shadow-sm" data-toggle="tooltip" data-placement="top" title="" src="./resources/image/p1.png" alt="" data-original-title="John Doe"> 
                <img class="rounded-circle shadow-sm" data-toggle="tooltip" data-placement="top" title="" src="./resources/image/p2.png" alt="" data-original-title="Robert Cook"> </div>
                <span class="font-weight-bold text-muted">18 projects</span> </div>
              <div class="p-3 job-item-footer"> <small class="text-gray-500"><i class="feather-clock"></i> Posted 3 Days ago</small> </div>
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
        <div class="box shadow-sm mb-3 rounded bg-white ads-box text-center"> </div>
      </aside>
    </div>
  </div>
</div>
<!-- Bootstrap core JavaScript --> 
<script src="./resources/vendor/jquery/jquery.min.js"></script> 
<script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> 
<!-- slick Slider JS--> 
<script type="text/javascript" src="./resources/vendor/slick/slick.min.js"></script> 
<!-- Custom scripts for all pages--> 
<script src="./resources/js/osahan.js"></script>
</body>
</html>
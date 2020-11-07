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
  <div class="container"> <a class="navbar-brand mr-2" href="index.html"><img src="${pageContext.request.contextPath}/resources/image/logo.png" alt="" width="50"> </a>
  
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
        <c:choose>
        <c:when test="${loginUser==null}">
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
      <c:when test="${loginUserHeader==null}">
      <li class="nav-item dropdown no-arrow ml-1 osahan-profile-dropdown"> 
      <a class="nav-link dropdown-toggle pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onClick="window.location.href ='${pageContext.request.contextPath}/user/setting'"> 
      <img class="img-profile rounded-circle" src="${pageContext.request.contextPath}/resources/image/p6.png" alt="avatar"> 
      </a> 
      </li>      
      </c:when>
      
      <c:otherwise>
      <li class="nav-item dropdown no-arrow ml-1 osahan-profile-dropdown">
     <a class="nav-link dropdown-toggle pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onClick="window.location.href ='${pageContext.request.contextPath}/user/setting'"> 
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
      <main class="col col-xl-6 order-xl-2 col-lg-12 order-lg-1 col-md-12 col-sm-12 col-12">
        <div class="box shadow-sm border rounded bg-white mb-3">
          <div class="box-title border-bottom p-3">
            <h6 class="m-0">${post.title}</h6>
          </div>
          <div class="box-body p-3">
            <p>${post.content} </p>
        
          </div>
          <div class="p-3" style="text-align:right;">
            <button type="button" class="btn btn-outline-primary btn-sm mr-1" onClick="window.location.href ='${pageContext.request.contextPath}/donate/${post.id}'">Donate Now!!!</button>
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
                  <td class="p-3">$ ${post.targetAmount}</td>
                </tr>
                <tr class="border-bottom">
                  <th class="p-3">Donation amount received</th>
                  <td class="p-3">$ ${post.actualAmount}</td>
                </tr>
                <tr class="border-bottom">
                  <th class="p-3">Description</th>
                  <td class="p-3">${post.title}</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        
         <c:if test="${links!=null}">
        <div class="box mb-3 shadow-sm border rounded bg-white osahan-post"> 
       
         <c:forEach items="${links}"  var="link">
        <img src="${pageContext.request.contextPath}/file/${link.imageName}/" class="img-fluid" alt="Responsive image"> 
        </c:forEach>
        </div>
        </c:if>
        
        <div class="box shadow-sm border rounded bg-white mb-3 osahan-post">
          <div class="p-3 d-flex align-items-center border-bottom osahan-post-header">
            <div class="font-weight-bold">
              <div class="text-truncate">Comments</div>
            </div>
            <span class="ml-auto"></span> </div>
            
         <c:forEach items="${list}" var="comments">
         	<c:forEach items="${comments}" var="map">
          <div class="p-3 d-flex align-items-center border-bottom osahan-post-header" href="#">
            <div class="dropdown-list-image mr-3"> 
            <c:choose>
            <c:when test="${map.value.headerImage==null}">
            <img class="rounded-circle" src="${pageContext.request.contextPath}/resources/image/p6.png" alt="">
            </c:when>
            <c:otherwise>
            <img class="rounded-circle" src="${pageContext.request.contextPath}/user/header/${map.value.headerImage}/" alt="">
            </c:otherwise>
            </c:choose>
              <div class="status-indicator bg-success"></div>
            </div>
            <div class="font-weight-bold">
              <div class="text-truncate">${map.value.username}</div>
              <div class="small text-gray-500">wave user</div>
            </div>
            <span class="ml-auto small">${map.value.createTime}</span> 
            </div>
          <div class="p-3 border-bottom osahan-post-body">
            <p class="mb-0">${map.value.content}</p>
          </div>
          </c:forEach>
          </c:forEach>
          
          <c:if test="${page.rows>1}">
          <nav class="mt-5">
          	<ul class="pagination justify-content-center">
          	
          		<li class="page-item">
					<a class="page-link"href=".${page.path}?current=1">first</a>
				</li>
				
				<c:choose>
				<c:when test="${page.current!=1}">
				<li class="page-item">
					<a class="page-link" href=".${page.path}?current=${page.current-1}">previous</a>
				</li>
				</c:when>
				
				<c:otherwise>
				<li class="page-item disabled">
					<a class="page-link" href="#">previous</a>
				</li>
				</c:otherwise>
				
				</c:choose>
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
				<c:when test="${page.current!=page.total }">
				<li class="page-item">
					<a class="page-link" href=".${page.path}?current=${page.current+1}">next</a>
				</li>
				</c:when>
				<c:otherwise>
				<li class="page-item disable">
					<a class="page-link" href="#">next</a>
				</li>
				</c:otherwise>
				</c:choose>
				
				<li class="page-item">
					<a class="page-link" href=".${page.path}?current=${page.total}">end</a>
				</li>
          	</ul>
          </nav>
          </c:if>
          <div class="p-3" style="text-align:right;">
            <form  class="job-search p-3 border-bottom" method="post" action="/waiver5619/add/${post.id}">
            <div class="form-group">
            <c:choose>
            <c:when test="${loginUser!=null }">
             <textarea class="form-control" rows="3" name="content"></textarea>
             </c:when>
             <c:otherwise>
              <textarea class="form-control is-invalid" rows="3" name="content" placeholder="You should log in first!!"></textarea>
             </c:otherwise>
             </c:choose>
            <button type="submit" class="btn btn-outline-primary btn-sm mr-1">Post</button>
            </div>
            </form>
          </div>
        </div>
      </main>
      <aside class="col col-xl-3 order-xl-1 col-lg-6 order-lg-2 col-md-6 col-sm-6 col-12">
        <div class="box mb-3 shadow-sm border rounded bg-white profile-box text-center">
        <c:choose>
        	<c:when test="${filename1==null}">
          <div class="p-5"> 
          <img src="${pageContext.request.contextPath}/resources/image/p6.png" class="img-fluid" alt="Responsive image"> 
          </div>
          </c:when>
          <c:otherwise>
           <img src="${pageContext.request.contextPath}/user/header/${filename1}/" class="img-fluid" alt="Responsive image"> 
          </c:otherwise>
        </c:choose>
          <div class="p-3 border-top border-bottom">
            <h5 class="font-weight-bold text-dark mb-1 mt-0">${post.username}</h5>
            <p class="mb-0 text-muted">Wave User </p>
          </div>
          <div class="p-3">
            <div class="d-flex align-items-top mb-2">
              <p class="mb-0 text-muted">Posted</p>
              <p class="font-weight-bold text-dark mb-0 mt-0 ml-auto">${post.createTime}</p>
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
      <aside class="col col-xl-3 order-xl-3 col-lg-6 order-lg-3 col-md-6 col-sm-6 col-12">
      
        <div class="box mb-3 shadow-sm border rounded bg-white osahan-post">
          <div class="p-3 d-flex align-items-center border-bottom osahan-post-header">
            <div class="font-weight-bold">
              <div class="text-truncate">About us</div>
            </div>
            <span class="ml-auto"></span> </div>
          <div class="p-5"> <img src="${pageContext.request.contextPath}/resources/image/wave.png" class="img-fluid" alt="Responsive image"> </div>
          <div class="p-3 osahan-post-body">
            <h5 class="mb-3">What is WAVE?</h5>
            <p>We are a nonprofit organization. We hope that we can use everyone’s strength to improve the world’s hunger, poverty, and the inability to afford medical expenses. We hope world peace. We hope the world to be better.</p >
          </div>
          <div class="overflow-hidden border-top text-center"> <a class="font-weight-bold p-3 d-block" href="${pageContext.request.contextPath}/getregister"> JOIN US </a > </div>
        </div>
        
       <!--  <button type="button" class="btn btn-lg btn-block btn-danger mb-3"> <i class="feather-bell"></i> Set alert for Donation </button>
        <div class="box shadow-sm border rounded bg-white mb-3">
          <div class="box-title border-bottom p-3">
            <h6 class="m-0">Similar Donation Projects </h6>
          </div> -->
         <%--  <div class="box-body p-3"> <a href="donate-info.html">
            <div class="shadow-sm border rounded bg-white job-item">
              <div class="d-flex align-items-center p-3 job-item-header">
                <div class="overflow-hidden mr-2">
                  <h6 class="font-weight-bold text-dark mb-0 text-truncate">Latest Donation</h6>
                  <div class="text-truncate text-primary">Wave</div>
                  <div class="small text-gray-500"><i class="feather-map-pin"></i> Sydney, AU </div>
                </div>
                <img class="img-fluid ml-auto" src="${pageContext.request.contextPath}/resources/image/logo.png" alt=""> </div>
              <div class="d-flex align-items-center p-3 border-top border-bottom job-item-body">
                <div class="overlap-rounded-circle"> 
                <img class="rounded-circle shadow-sm" data-toggle="tooltip" data-placement="top" title="" src="${pageContext.request.contextPath}/resources/image/p3.png" alt="" data-original-title="Sophia Lee"> 
                <img class="rounded-circle shadow-sm" data-toggle="tooltip" data-placement="top" title="" src="${pageContext.request.contextPath}/resources/image/p1.png" alt="" data-original-title="John Doe"> 
                <img class="rounded-circle shadow-sm" data-toggle="tooltip" data-placement="top" title="" src="${pageContext.request.contextPath}/resources/image/p2.png" alt="" data-original-title="Robert Cook"> </div>
                <span class="font-weight-bold text-muted">18 projects</span>
                 </div>
              <div class="p-3 job-item-footer"> <small class="text-gray-500"><i class="feather-clock"></i> Posted 3 Days ago</small> </div>
            </div>
            </a> </div> --%>
        <!-- </div> -->
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
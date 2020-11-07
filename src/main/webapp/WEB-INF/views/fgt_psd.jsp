<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
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
<div class="bg-white">
  <div class="container">
    <div class="row justify-content-center align-items-center d-flex vh-100">
      <div class="col-md-4 mx-auto">
        <div class="osahan-login py-4">
          <div class="text-center mb-4"> <img src="${pageContext.request.contextPath}/resources/image/wave.png" alt="" width="70">
            <h5 class="font-weight-bold mt-3">Let's reset your password</h5>
            <p class="text-muted">Please enter your email</p>
          </div>
          <form action="${pageContext.request.contextPath}/user/reset" method="post">
          
            <div class="form-group">
              <label class="mb-1">Email</label>
              <div class="position-relative icon-form-control"> <i class="feather-user position-absolute"></i>
              <c:choose>
              <c:when test="${emailMsg==null}">
                <input type="email" class="form-control" name="email">
              </c:when>
              <c:otherwise>
             	 <input type="email" class="form-control is-invalid" placeholder="${emailMsg}">
              </c:otherwise>
               </c:choose>
              </div>
            </div>
            
            <div class="form-group">
              <label class="mb-1">Password</label>
              <div class="position-relative icon-form-control"> <i class="feather-unlock position-absolute"></i>
              <c:choose>
              	<c:when test="${passMsg==null}">
                <input type="password" class="form-control" name="password">
                </c:when>
                <c:otherwise>
                <input type="password" class="form-control is-invalid" name="password" placeholder="${passMsg}">
                </c:otherwise>
              </c:choose>
              </div>
            </div>
            
            
            <div class="form-group">
              <label class="mb-1">Confirmed Password</label>
              <div class="position-relative icon-form-control"> <i class="feather-unlock position-absolute"></i>
              <c:choose>
              <c:when test="${idenMsg==null }">
                <input type="password" class="form-control" name="confirmPass">
              </c:when>
              <c:otherwise>
              	<input type="password" class="form-control is-invalid" name="confirmPass" placeholder="${idenMsg}">
              </c:otherwise>
              </c:choose>
              </div>
            </div>
            
            
            <button class="btn btn-primary btn-block text-uppercase" type="submit"> Reset </button>
            <div class="py-3 d-flex align-item-center"> <a href="${pageContext.request.contextPath}/getlogin">Sign In</a> <span class="ml-auto"> New to Wave? <a class="font-weight-bold" href="${pageContext.request.contextPath}/getregister">Join now</a></span> </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
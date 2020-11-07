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
<div class="bg-white">
  <div class="container">
    <div class="row justify-content-center align-items-center d-flex vh-100">
      <div class="col-md-4 mx-auto">
        <div class="osahan-login py-4">
          <div class="text-center mb-4"> <img src="${pageContext.request.contextPath}/resources/image/wave.png" alt="" width="70">
            <h5 class="font-weight-bold mt-3">Welcome Back</h5>
            <p class="text-muted">The strength of people makes the community powerful</p>
          </div>
          <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="form-group">
              <label class="mb-1">Email</label>
              <div class="position-relative icon-form-control"> <i class="feather-user position-absolute"></i>
              <c:choose>
              <c:when test="${emailMsg==null&&nullMsg==null}">
                <input type="email" name="email" class="form-control">
               </c:when>
               <c:when test="${emailMsg!=null&&nullMsg==null}">
                <input type="email" name="email" class="form-control is-invalid" placeholder="${emailMsg}">
               </c:when>
               <c:otherwise>
                <input type="email" name="email" class="form-control is-invalid" placeholder="${nullMsg}">
               </c:otherwise>
           	  </c:choose>
              </div>
            </div>
            <div class="form-group">
              <label class="mb-1">Password</label>
              <div class="position-relative icon-form-control"> <i class="feather-unlock position-absolute"></i>
              <c:choose>
              <c:when test="${passwordMsg==null&&wrongMsg==null}">
                <input type="password" name="password" class="form-control">
              </c:when>
              <c:when test="${passwordMsg!=null&&wrongMsg==null}">
                <input type="password" name="password" class="form-control is-invalid" placeholder="${passwordMsg}">
              </c:when>
              <c:otherwise>
             	 <input type="password" name="password" class="form-control is-invalid" placeholder="${wrongMsg}">
              </c:otherwise>
               </c:choose>
              </div>
            </div>
            <div class="custom-control custom-checkbox mb-3">
              <input type="checkbox" class="custom-control-input" id="customCheck1" name="rememberme">
              <label class="custom-control-label" for="customCheck1">Remember password</label>
            </div>
            <button class="btn btn-primary btn-block text-uppercase" type="submit"> Sign in </button>
            <div class="text-center mt-3 border-bottom pb-3">
              <p class="small text-muted">Or login with</p>
              <div class="row">
                <div class="col-4">
                  <button type="button" class="btn btn-sm btn-outline-instagram btn-block"><i class="feather-instagram"></i> Instagram</button>
                </div>
                <div class="col-4">
                  <button type="button" class="btn btn-sm btn-outline-linkedin btn-block"><i class="feather-linkedin"></i> Linkedin</button>
                </div>
                <div class="col-4">
                  <button type="button" class="btn btn-sm btn-outline-facebook btn-block"><i class="feather-facebook"></i> Facebook</button>
                </div>
              </div>
            </div>
            <div class="py-3 d-flex align-item-center"> <a href="${pageContext.request.contextPath}/user/getreset">Forgot password?</a> <span class="ml-auto"> New to Wave? <a class="font-weight-bold" href="${pageContext.request.contextPath}/getregister">Join now</a></span> </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
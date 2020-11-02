<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
          <div class="text-center mb-4"> <img src="./resources/image/wave.png" alt="" width="70">
            <h5 class="font-weight-bold mt-3">First, let's find your account</h5>
            <p class="text-muted">Please enter your email or phone</p>
          </div>
          <form action="./">
            <div class="form-group">
              <label class="mb-1">Email or Phone</label>
              <div class="position-relative icon-form-control"> <i class="feather-user position-absolute"></i>
                <input type="email" class="form-control">
              </div>
            </div>
            <button class="btn btn-primary btn-block text-uppercase" type="submit"> Find account </button>
            <div class="py-3 d-flex align-item-center"> <a href="./sign_in">Sign In</a> <span class="ml-auto"> New to Wave? <a class="font-weight-bold" href="sign-up.html">Join now</a></span> </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
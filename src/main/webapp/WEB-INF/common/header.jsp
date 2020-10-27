<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!--	<meta name="_csrf" th:content="${_csrf.token}">-->
<!--	<meta name="_csrf_header" th:content="${_csrf.headerName}">-->

	<script src="./resources/js/jquery-3.5.1.js"></script>
	<script src="./resources/js/jquery-3.5.1.min.js"></script>
	<link rel="stylesheet" href="./resources/vendor/slick/slick.min.css"  />
		
<!-- 	<link rel="icon" href="https://static.nowcoder.com/images/logo_87_87.png"/>
 --><!--	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin="anonymous">-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" crossorigin="anonymous">
	<link rel="stylesheet" href="./resources/css/global.css"  />
	<title>charity system</title>
</head>
<body>
<div class="nk-container">
		<!-- 头部 -->
		<header class="bg-dark sticky-top">
			<div class="container">
				<!-- 导航 -->
				<nav class="navbar navbar-expand-lg navbar-dark">
					<!-- logo -->
					<a class="navbar-brand" href="#"></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<!-- 功能 -->
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ml-auto">
							<li class="nav-item ml-3 btn-group-vertical">
								<a class="nav-link" href="#">home</a>
							</li>
							<!-- <li class="nav-item ml-3 btn-group-vertical">
								<a class="nav-link position-relative" >message<span class="badge badge-danger" >12</span></a>
							</li> -->
							<li class="nav-item ml-3 btn-group-vertical">
								<a class="nav-link" href="#">register</a>
							</li>
							<li class="nav-item ml-3 btn-group-vertical">
								<a class="nav-link"  href="#">login</a>
							</li>
							<li class="nav-item ml-3 btn-group-vertical dropdown" >
								<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
									<img src="#" class="rounded-circle" style="width:30px;"/>
								</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item text-center" href="#">home page</a>
									<a class="dropdown-item text-center" href="#">account settings</a>
									<a class="dropdown-item text-center" href="#">logout</a>
									<div class="dropdown-divider"></div>
									<span class="dropdown-item text-center text-secondary" >channing</span>
								</div>
							</li>
						</ul>
						<!-- 搜索 -->
						<!-- <form class="form-inline my-2 my-lg-0" action="site/search.html">
							<input class="form-control mr-sm-2" type="search" aria-label="Search" />
							<button class="btn btn-outline-light my-2 my-sm-0" type="submit">搜索</button>
						</form>  -->
					</div>
				</nav>
			</div>
			
		</header>

		<!-- 内容 -->
		<div class="main">
			<div class="container">
				<div class="position-relative">
					<!-- 筛选条件 -->
					<ul class="nav nav-tabs mb-3">
						<li class="nav-item">
							<a class="nav-link active" href="#">latest</a>
						</li>
						<!-- <li class="nav-item">
							<a class="nav-link" href="#">popular</a>
						</li> -->
					</ul>
					<button type="button" class="btn btn-primary btn-sm position-absolute rt-0" data-toggle="modal" data-target="#publishModal" >publish</button>
				</div>
				<!-- 弹出框 -->
				<div class="modal fade" id="publishModal" tabindex="-1" role="dialog" aria-labelledby="publishModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="publishModalLabel">publish</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close" >
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form>
									<div class="form-group">
										<label for="recipient-name" class="col-form-label">title：</label>
										<input type="text" class="form-control" id="recipient-name">
									</div>
									<div class="form-group">
										<label for="target-amount" class="col-form-label">title：</label>
										<input type="text" class="form-control" id="target-amount">
									</div>
 									<div class="control-group">
						                 <label class="control-label" for="FileUpload1">upload file</label>
						                 <div class="controls">
						                 <input class="input-file uniform_on" id="FileUpload1" name="img" multiple="multiple" type="file">
					                </div>
             </div>
									<div class="form-group">
										<label for="message-text" class="col-form-label">content：</label>
										<textarea class="form-control" id="message-text" rows="15"></textarea>
									</div>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">cancel</button>
								<button type="button" class="btn btn-primary" id="publishBtn">publish</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 提示框 -->
				<div class="modal fade" id="hintModal" tabindex="-1" role="dialog" aria-labelledby="hintModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="hintModalLabel">Reminder</h5>
							</div>
							<div class="modal-body" id="hintBody">
								Publish Successfully!
							</div>
						</div>
					</div>
				</div>
				<!-- 帖子列表 -->
				<ul class="list-unstyled">
					<li class="media pb-3 pt-3 mb-3 border-bottom">
						<a href="#">
							<img src="#" class="mr-4 rounded-circle" alt="用户头像" style="width:50px;height:50px;">
						</a>
						<div class="media-body">
							<h6 class="mt-0 mb-3">
								<a href="#">Please Help My Children</a>
								<span class="badge badge-secondary bg-primary" >Top</span>
								<span class="badge badge-secondary bg-danger" >Good</span>
							</h6>
							<div class="text-muted font-size-12">
								<u class="mr-3">Sam</u> published by <b>2020-05-15 15:32:18</b>
								<ul class="d-inline float-right">
									<li class="d-inline ml-2" >like <span >11</span></li>
									<li class="d-inline ml-2">|</li>
									<li class="d-inline ml-2" >reply <span>7</span></li>
								</ul>
							</div>
						</div>						
					</li>
				</ul>
				<ul class="list-unstyled">
					<li class="media pb-3 pt-3 mb-3 border-bottom">
						<a href="#">
							<img src="#" class="mr-4 rounded-circle" alt="用户头像" style="width:50px;height:50px;">
						</a>
						<div class="media-body">
							<h6 class="mt-0 mb-3">
								<a href="#">Please Save MY Brother!</a>
								<span class="badge badge-secondary bg-primary" >Top</span>
								<span class="badge badge-secondary bg-danger" >Good</span>
							</h6>
							<div class="text-muted font-size-12">
								<u class="mr-3">Lin</u> published by <b>2020-05-15 15:32:18</b>
								<ul class="d-inline float-right">
									<li class="d-inline ml-2" >like <span >10</span></li>
									<li class="d-inline ml-2">|</li>
									<li class="d-inline ml-2" >reply <span>8</span></li>
								</ul>
							</div>
						</div>						
					</li>
				</ul>
				<ul class="list-unstyled">
					<li class="media pb-3 pt-3 mb-3 border-bottom">
						<a href="#">
							<img src="#" class="mr-4 rounded-circle" alt="用户头像" style="width:50px;height:50px;">
						</a>
						<div class="media-body">
							<h6 class="mt-0 mb-3">
								<a href="#">Please Help My Mother</a>
								<span class="badge badge-secondary bg-primary" >Top</span>
								<span class="badge badge-secondary bg-danger" >Good</span>
							</h6>
							<div class="text-muted font-size-12">
								<u class="mr-3">Amy</u> published by <b>2020-05-15 15:32:18</b>
								<ul class="d-inline float-right">
									<li class="d-inline ml-2" >like <span >51</span></li>
									<li class="d-inline ml-2">|</li>
									<li class="d-inline ml-2" >reply <span>4</span></li>
								</ul>
							</div>
						</div>						
					</li>
				</ul>
				<ul class="list-unstyled">
					<li class="media pb-3 pt-3 mb-3 border-bottom">
						<a href="#">
							<img src="#" class="mr-4 rounded-circle" alt="用户头像" style="width:50px;height:50px;">
						</a>
						<div class="media-body">
							<h6 class="mt-0 mb-3">
								<a href="#">Please Help My Children</a>
								<span class="badge badge-secondary bg-primary" >Top</span>
								<span class="badge badge-secondary bg-danger" >Good</span>
							</h6>
							<div class="text-muted font-size-12">
								<u class="mr-3">Yam</u> published by <b>2020-05-15 15:32:18</b>
								<ul class="d-inline float-right">
									<li class="d-inline ml-2" >like <span >29</span></li>
									<li class="d-inline ml-2">|</li>
									<li class="d-inline ml-2" >reply <span>0</span></li>
								</ul>
							</div>
						</div>						
					</li>
				</ul>
				<ul class="list-unstyled">
					<li class="media pb-3 pt-3 mb-3 border-bottom">
						<a href="#">
							<img src="#" class="mr-4 rounded-circle" alt="用户头像" style="width:50px;height:50px;">
						</a>
						<div class="media-body">
							<h6 class="mt-0 mb-3">
								<a href="#">Please Help My Children</a>
								<span class="badge badge-secondary bg-primary" >Top</span>
								<span class="badge badge-secondary bg-danger" >Good</span>
							</h6>
							<div class="text-muted font-size-12">
								<u class="mr-3">Bob</u> published by <b>2020-05-15 15:32:18</b>
								<ul class="d-inline float-right">
									<li class="d-inline ml-2" >like <span >1</span></li>
									<li class="d-inline ml-2">|</li>
									<li class="d-inline ml-2" >reply <span>71</span></li>
								</ul>
							</div>
						</div>						
					</li>
				</ul>
				<nav class="mt-5">
					<ul class="pagination justify-content-center">
						<li class="page-item">
							<a class="page-link"href="#" >first</a>
						</li>

						<li class="page-item">
							<a class="page-link" href="#">previous</a>
						</li>

						<li class="page-item">
							<a class="page-link" href="#">1</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#">2</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#">3</a>
						</li>

						<li class="page-item">
							<a class="page-link" href="#">next</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#">end</a>
						</li>
					</ul>
				</nav>
		</div>
				
	</div>
				<footer class="bg-dark">
			<div class="container">
				<div class="row">
					<!-- 二维码 -->
					<div class="col-4 qrcode">
						<img src="https://uploadfiles.nowcoder.com/app/app_download.png" class="img-thumbnail" style="width:136px;" />
					</div>
					<!-- 公司信息 -->
					<div class="col-8 detail-info">
						<div class="row">
							<div class="col">
								<ul class="nav">
									<li class="nav-item">
										<a class="nav-link text-light" href="#">关于我们</a>
									</li>
									<li class="nav-item">
										<a class="nav-link text-light" href="#">加入我们</a>
									</li>
									<li class="nav-item">
										<a class="nav-link text-light" href="#">意见反馈</a>
									</li>
									<li class="nav-item">
										<a class="nav-link text-light" href="#">企业服务</a>
									</li>
									<li class="nav-item">
										<a class="nav-link text-light" href="#">联系我们</a>
									</li>
									<li class="nav-item">
										<a class="nav-link text-light" href="#">免责声明</a>
									</li>
									<li class="nav-item">
										<a class="nav-link text-light" href="#">友情链接</a>
									</li>
								</ul>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<ul class="nav btn-group-vertical company-info">
									<li class="nav-item text-white-50">
										公司地址：北京市朝阳区大屯路东金泉时代3-2708北京牛客科技有限公司
									</li>
									<li class="nav-item text-white-50">
										联系方式：010-60728802(电话)&nbsp;&nbsp;&nbsp;&nbsp;admin@nowcoder.com
									</li>
									<li class="nav-item text-white-50">
										牛客科技©2018 All rights reserved
									</li>
									<li class="nav-item text-white-50">
										京ICP备14055008号-4 &nbsp;&nbsp;&nbsp;&nbsp;
										<img src="http://static.nowcoder.com/company/images/res/ghs.png" style="width:18px;" />
										京公网安备 11010502036488号
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</footer>
</div>
				
				
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" crossorigin="anonymous"></script>
<!--	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" crossorigin="anonymous"></script>-->

	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" crossorigin="anonymous"></script>

	<script src="./resources/js/global.js"></script>
	<script src="./resources/js/index.js"></script>
</body>
</html> --%>
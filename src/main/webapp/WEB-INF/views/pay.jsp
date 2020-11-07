<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 -->
<title>Wave</title>
<style>
* {
	margin: 0;
	padding: 0;
}

ul, ol {
	list-style: none;
}

body {
	font-family: "Helvetica Neue", Helvetica, Arial, "Lucida Grande",
		sans-serif;
}

.tab-head {
	margin-left: 120px;
	margin-bottom: 10px;
}

.tab-content {
	clear: left;
	display: none;
}

h2 {
	border-bottom: solid #02aaf1 2px;
	width: 200px;
	height: 25px;
	margin: 0;
	float: left;
	text-align: center;
	font-size: 16px;
}

.selected {
	color: #FFFFFF;
	background-color: #02aaf1;
}

.show {
	clear: left;
	display: block;
}

.hidden {
	display: none;
}

.new-btn-login-sp {
	padding: 1px;
	display: inline-block;
	width: 75%;
}

.new-btn-login {
	background-color: #02aaf1;
	color: #FFFFFF;
	font-weight: bold;
	border: none;
	width: 100%;
	height: 30px;
	border-radius: 5px;
	font-size: 16px;
}

#main {
	width: 100%;
	margin: 0 auto;
	font-size: 14px;
}

.red-star {
	color: #f00;
	width: 10px;
	display: inline-block;
}

.null-star {
	color: #fff;
}

.content {
	margin-top: 5px;
}

.content dt {
	width: 100px;
	display: inline-block;
	float: left;
	margin-left: 20px;
	color: #666;
	font-size: 13px;
	margin-top: 8px;
}

.content dd {
	margin-left: 120px;
	margin-bottom: 5px;
}

.content dd input {
	width: 85%;
	height: 28px;
	border: 0;
	-webkit-border-radius: 0;
	-webkit-appearance: none;
}

#foot {
	margin-top: 10px;
	position: absolute;
	bottom: 15px;
	width: 100%;
}

.foot-ul {
	width: 100%;
}

.foot-ul li {
	width: 100%;
	text-align: center;
	color: #666;
}

.note-help {
	color: #999999;
	font-size: 12px;
	line-height: 130%;
	margin-top: 5px;
	width: 100%;
	display: block;
}

#btn-dd {
	margin: 20px;
	text-align: center;
}

.foot-ul {
	width: 100%;
}

.one_line {
	display: block;
	height: 1px;
	border: 0;
	border-top: 1px solid #eeeeee;
	width: 100%;
	margin-left: 20px;
}

.am-header {
	display: -webkit-box;
	display: -ms-flexbox;
	display: box;
	width: 100%;
	position: relative;
	padding: 7px 0;
	-webkit-box-sizing: border-box;
	-ms-box-sizing: border-box;
	box-sizing: border-box;
	background: #1D222D;
	height: 50px;
	text-align: center;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	box-pack: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	box-align: center;
}

.am-header h1 {
	-webkit-box-flex: 1;
	-ms-flex: 1;
	box-flex: 1;
	line-height: 18px;
	text-align: center;
	font-size: 18px;
	font-weight: 300;
	color: #fff;
}
</style>
</head>
<body text=#000000 bgColor="#ffffff" leftMargin=0 topMargin=4>
	<header class="am-header">
	<h1>Welcome to pay with Alipay</h1>
	</header>
	<div id="main">
		<!--<div id="tabhead" class="tab-head">
			<h2 id="tab1" class="selected" name="tab">Payment</h2>
		</div>-->
		<form name=alipayment action="${pageContext.request.contextPath}/trade1" method=post
			target="_blank">
			<div id="body1" class="show" name="divcontent">
				<dl class="content">
					<dt>Merchant order number ：</dt>
					<dd>
						<input id="WIDout_trade_no" name="WIDout_trade_no" />
					</dd>
					<hr class="one_line">
					<dt>Order name ：</dt>
					<dd>
						<input id="WIDsubject" name="WIDsubject" />
					</dd>
					<hr class="one_line">
					<dt>Amount ：</dt>
					<dd>
						<input id="WIDtotal_amount" name="WIDtotal_amount" />
					</dd>
					<hr class="one_line">
					<dt>Post Id ：</dt>
					<dd>
						<input id="Post_Id" name="Post_Id" value="${postid }" />
					</dd>
					<hr class="one_line">
					<dt>instruction manual：</dt>
					<dd>
						<input id="WIDbody" name="WIDbody" />
					</dd>
					<hr class="one_line">
					<dt></dt>
					<dd id="btn-dd">
						<span class="new-btn-login-sp">
							<button class="new-btn-login" type="submit"
								style="text-align: center;">confirm</button>
						</span> <span class="note-help">If you click the "confirm" button, it means you agree to the execution of the operation.</span>
					</dd>
				</dl>
			</div>
		</form>
		
		<div id="foot">
			<ul class="foot-ul">
				<li>Wave copyright 2020-2021 WAVE.COM</li>
			</ul>
		</div>
	</div>
</body>
<script language="javascript">
	var tabs = document.getElementsByName('tab');
	var contents = document.getElementsByName('divcontent');
	
	(function changeTab(tab) {
	    for(var i = 0, len = tabs.length; i < len; i++) {
	        tabs[i].onmouseover = showTab;
	    }
	})();
	
	function showTab() {
	    for(var i = 0, len = tabs.length; i < len; i++) {
	        if(tabs[i] === this) {
	            tabs[i].className = 'selected';
	            contents[i].className = 'show';
	        } else {
	            tabs[i].className = '';
	            contents[i].className = 'tab-content';
	        }
	    }
	}
	
	function GetDateNow() {
		var vNow = new Date();
		var sNow = "";
		sNow += String(vNow.getFullYear());
		sNow += String(vNow.getMonth() + 1);
		sNow += String(vNow.getDate());
		sNow += String(vNow.getHours());
		sNow += String(vNow.getMinutes());
		sNow += String(vNow.getSeconds());
		sNow += String(vNow.getMilliseconds());
		document.getElementById("WIDout_trade_no").value =  sNow;
		document.getElementById("WIDsubject").value = "wave";
		document.getElementById("WIDtotal_amount").value = "0.01";
	}
	GetDateNow();
</script>
</html>
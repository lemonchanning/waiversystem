<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!--	<meta name="_csrf" th:content="${_csrf.token}">-->
<!--	<meta name="_csrf_header" th:content="${_csrf.headerName}">-->

	<script src="./resources/js/jquery-3.5.1.js"></script>
	<script src="./resources/js/jquery-3.5.1.min.js"></script>
<!-- 	<link rel="icon" href="https://static.nowcoder.com/images/logo_87_87.png"/>
 --><!--	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin="anonymous">-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" crossorigin="anonymous">
	<link rel="stylesheet" href="./resources/css/global.css"  />
	<title>charity system</title>
</head>
<body>
<h1>
	Hello world!  ${page.limit}
</h1>

<P>  The time on the server is ${serverTime} . </P>
</body>
</html>

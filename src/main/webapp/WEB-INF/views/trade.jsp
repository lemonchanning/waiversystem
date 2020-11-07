-- <%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>payment</title>
</head>

<%@ page import="au.usyd.waiver5619.alipay.config.*"%>
<%@ page import="com.alipay.api.*"%>
<%@ page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@ page import="au.usyd.waiver5619.service.PostService"%>
<%@ page import="org.springframework.transaction.annotation.Transactional"%>
<%@ page import="com.alipay.api.request.*"%>
<%@ page import="com.alipay.api.request.*"%>
<%@ page import="com.alipay.api.request.*"%>
<%@ page import="com.alipay.api.request.*"%>
<%

	
	

	AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
	

	
	

	String out_trade_no = new String(request.getParameter("WIDout_trade_no").getBytes("ISO-8859-1"),"UTF-8");

	String total_amount = new String(request.getParameter("WIDtotal_amount").getBytes("ISO-8859-1"),"UTF-8");

	String subject = new String(request.getParameter("WIDsubject").getBytes("ISO-8859-1"),"UTF-8");

	String body = new String(request.getParameter("WIDbody").getBytes("ISO-8859-1"),"UTF-8");
	
	String postId=new String(request.getParameter("Post_Id").getBytes("ISO-8859-1"),"UTF-8");
	
	AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
	alipayRequest.setReturnUrl("http://localhost:8080/waiver5619/"+postId);
	
	alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
	
	alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
			+ "\"total_amount\":\""+ total_amount +"\"," 
			+ "\"subject\":\""+ subject +"\"," 
			+ "\"body\":\""+ body +"\"," 
			+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

 	AlipayReturn ret = new AlipayReturn(out_trade_no,total_amount);

	String result = alipayClient.pageExecute(alipayRequest).getBody();
	out.println(result);
%>
<body>
</body>
</html>
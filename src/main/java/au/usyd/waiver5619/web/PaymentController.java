package au.usyd.waiver5619.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;

import au.usyd.waiver5619.alipay.config.AlipayConfig;
import au.usyd.waiver5619.alipay.config.AlipayReturn;
import au.usyd.waiver5619.domain.Post;
import au.usyd.waiver5619.service.PostService;

@Controller
@Transactional
public class PaymentController {
	
	@Autowired
	private PostService postService;
	
	/**
	 * @description: This method is used for returning logic after successful payment
	 * @param request
	 * @param response
	 * @throws AlipayApiException
	 * @throws UnsupportedEncodingException
	 * 
	 */
	@RequestMapping(value = "/{id}", method =RequestMethod.GET )
	public String returnPayment(HttpServletRequest request, @PathVariable("id") int id) throws UnsupportedEncodingException {
		System.out.println("id1: "+id);
		Map<String,String> params = new HashMap<String,String>();
		Map<String,String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}

			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}
		try {
			AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type);
			
		} catch (AlipayApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return "redirect:/";
	}
	
	@RequestMapping(value = "/notify", method =RequestMethod.GET)
	public String getNotify() {
		return "views/notify_pay";
	}

	/**
	 * @description: This method is used to scan QR and pay
	 * @param request
	 * @param response
	 * @throws AlipayApiException
	 * @throws UnsupportedEncodingException
	 * 
	 */
	@RequestMapping("/trade1")
	public void getTrade(HttpServletRequest request, HttpServletResponse response) throws AlipayApiException, UnsupportedEncodingException {
		AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);


		String out_trade_no = new String(request.getParameter("WIDout_trade_no").getBytes("ISO-8859-1"),"UTF-8");

		String total_amount = new String(request.getParameter("WIDtotal_amount").getBytes("ISO-8859-1"),"UTF-8");

		String subject = new String(request.getParameter("WIDsubject").getBytes("ISO-8859-1"),"UTF-8");

		String body = new String(request.getParameter("WIDbody").getBytes("ISO-8859-1"),"UTF-8");
		
		String postId=new String(request.getParameter("Post_Id").getBytes("ISO-8859-1"),"UTF-8");
		
		AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
		alipayRequest.setReturnUrl("http://localhost:8080/waiver5619/"+postId);
		
		
		//add the amount money
		int id=Integer.parseInt(postId);
		Post post=postService.selectPostById(id);
		double actualAmount=(Double.parseDouble(total_amount)+post.getActualAmount());
		System.out.println("actuament"+actualAmount);
		post.setActualAmount(actualAmount);
		postService.update(id, actualAmount);
		alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
		
		alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
				+ "\"total_amount\":\""+ total_amount +"\"," 
				+ "\"subject\":\""+ subject +"\"," 
				+ "\"body\":\""+ body +"\"," 
				+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

	 	
		String result = alipayClient.pageExecute(alipayRequest).getBody();
		
		response.setContentType("text/html");
		try {
			PrintWriter out=response.getWriter();
			out.println(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
}

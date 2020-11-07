package au.usyd.waiver5619.alipay.config;

public class AlipayReturn {

	public String trade_no;
	public String amount;

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public AlipayReturn(String trade_no, String amount) {
		super();
		this.trade_no = trade_no;
		this.amount = amount;
	}
	
	
	

}

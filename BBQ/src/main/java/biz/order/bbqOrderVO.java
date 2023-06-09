package biz.order;

import java.util.Date;

public class bbqOrderVO {
	// 멤버변수
	private int ordernum;
	private String ordername;
	private String ordercontact;
	private String orderstore;
	private Date orderdate;
	private String ordermenu;
	private int orderprice;
	private int qty;
	private String delivery;
	private String orderaddress;
	private String orderid;
	
	
	// 디폴트 생성자
	public bbqOrderVO() {}
	
	// getter, setter
	public int getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}
	public String getOrdername() {
		return ordername;
	}
	public void setOrdername(String ordername) {
		this.ordername = ordername;
	}
	public String getOrdercontact() {
		return ordercontact;
	}
	public void setOrdercontact(String ordercontact) {
		this.ordercontact = ordercontact;
	}
	public String getOrderstore() {
		return orderstore;
	}
	public void setOrderstore(String orderstore) {
		this.orderstore = orderstore;
	}
	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	public String getOrdermenu() {
		return ordermenu;
	}
	public void setOrdermenu(String ordermenu) {
		this.ordermenu = ordermenu;
	}
	public int getOrderprice() {
		return orderprice;
	}
	public void setOrderprice(int orderprice) {
		this.orderprice = orderprice;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	public String getOrderaddress() {
		return orderaddress;
	}
	public void setOrderaddress(String orderaddress) {
		this.orderaddress = orderaddress;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
}

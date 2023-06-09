package biz.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import biz.common.JDBCConnection;

public class bbqOrderDAO {
	// DB 연결 준비
    Connection conn=null;
    PreparedStatement stmt=null;
    ResultSet rs=null;
	
	// 주문 메서드
	public void addOrder(bbqOrderVO order, String id) {
		try {
			conn =JDBCConnection.getConnection();
            String sql="insert into bbq_order values((select nvl(max(ordernum),0)+1 from bbq_order),?,?,?,sysdate,?,?,?,?,?,?)";
            stmt=conn.prepareStatement(sql);
            stmt.setString(1, order.getOrdername());
            stmt.setString(2, order.getOrdercontact());
            stmt.setString(3, order.getOrderstore());
            stmt.setString(4, order.getOrdermenu());
            stmt.setInt(5, order.getOrderprice());
            stmt.setInt(6, order.getQty());
            stmt.setString(7, order.getDelivery());
            stmt.setString(8, order.getOrderaddress());
            stmt.setString(9, id);
            stmt.executeUpdate();
		} catch (Exception e) {
           e.printStackTrace();
        }finally {
           JDBCConnection.close(stmt, conn);
        }
	}
	
	// 개인 주문내역 조회 메서드
	public ArrayList<bbqOrderVO> getMyOrderList(String id) {
		ArrayList<bbqOrderVO> myOrderList=new ArrayList<bbqOrderVO>();
		try {
			conn =JDBCConnection.getConnection();
            String sql="select * from bbq_member mem, bbq_order ord where mem.id=ord.orderid and ord.orderid=?";
            stmt=conn.prepareStatement(sql);
            stmt.setString(1, id);
            rs=stmt.executeQuery();
            while(rs.next()) {
            	bbqOrderVO myOrder=new bbqOrderVO();
            	myOrder.setOrdernum(rs.getInt("ordernum"));
            	myOrder.setOrdername(rs.getString("ordername"));
            	myOrder.setOrdercontact(rs.getString("ordercontact"));
            	myOrder.setOrderstore(rs.getString("orderstore"));
            	myOrder.setOrderdate(rs.getDate("orderdate"));
            	myOrder.setOrdermenu(rs.getString("ordermenu"));
            	myOrder.setOrderprice(rs.getInt("orderprice"));
            	myOrder.setQty(rs.getInt("qty"));
            	myOrder.setDelivery(rs.getString("delivery"));
            	myOrder.setOrderaddress(rs.getString("orderaddress"));
            	myOrder.setOrderid(rs.getString("orderid"));
            	
            	myOrderList.add(myOrder);
            }
		} catch (Exception e) {
           e.printStackTrace();
        }finally {
           JDBCConnection.close(stmt, conn);
        }
		return myOrderList;
	}
	
	// 모든 주문내역 조회 메서드
	public ArrayList<bbqOrderVO> getAllOrderList() {
		ArrayList<bbqOrderVO> allOrderList=new ArrayList<bbqOrderVO>();
		try {
			conn =JDBCConnection.getConnection();
            String sql="select * from bbq_order order by ordernum desc";
            stmt=conn.prepareStatement(sql);
            rs=stmt.executeQuery();
            while(rs.next()) {
            	bbqOrderVO allOrder=new bbqOrderVO();
            	allOrder.setOrdernum(rs.getInt("ordernum"));
            	allOrder.setOrdername(rs.getString("ordername"));
            	allOrder.setOrdercontact(rs.getString("ordercontact"));
            	allOrder.setOrderstore(rs.getString("orderstore"));
            	allOrder.setOrderdate(rs.getDate("orderdate"));
            	allOrder.setOrdermenu(rs.getString("ordermenu"));
            	allOrder.setOrderprice(rs.getInt("orderprice"));
            	allOrder.setQty(rs.getInt("qty"));
            	allOrder.setDelivery(rs.getString("delivery"));
            	allOrder.setOrderaddress(rs.getString("orderaddress"));
            	allOrder.setOrderid(rs.getString("orderid"));
            	
            	allOrderList.add(allOrder);
            }
		} catch (Exception e) {
           e.printStackTrace();
        }finally {
           JDBCConnection.close(stmt, conn);
        }
		return allOrderList;
	}
}

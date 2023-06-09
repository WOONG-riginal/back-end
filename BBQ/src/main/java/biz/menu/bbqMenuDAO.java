package biz.menu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import biz.common.JDBCConnection;


public class bbqMenuDAO {
	// DB 연결 준비
	Connection conn=null;
	PreparedStatement stmt=null;
	ResultSet rs=null;
	
	// 서브 페이지 메서드
	public ArrayList<bbqMenuVO> getCategoryMenu(String category) {
		ArrayList<bbqMenuVO> menuList=new ArrayList<bbqMenuVO>();
		try {
			// 0. DB 연결
			conn=JDBCConnection.getConnection();
			// 1. 쿼리문 준비
			String sql="select * from bbq_menu where category=? order by menuno";
			// 2. prepareStatement
			stmt=conn.prepareStatement(sql);
			// 3. ? 매핑
			stmt.setString(1, category);
			// 4. 실행
			rs=stmt.executeQuery();
			// 5. 사용
			while(rs.next()) {
				bbqMenuVO menu=new bbqMenuVO();
				menu.setMenuno(rs.getInt("menuno"));
				menu.setMenu(rs.getString("menu"));
				menu.setImg(rs.getString("img"));
				menu.setPrice(rs.getString("price"));
				menu.setCategory(rs.getString("category"));
				menu.setInfo(rs.getString("info"));
				menu.setAllergy(rs.getString("allergy"));
				menu.setNutri1(rs.getDouble("nutri1"));
				menu.setNutri2(rs.getDouble("nutri2"));
				menu.setNutri3(rs.getDouble("nutri3"));
				menu.setNutri4(rs.getDouble("nutri4"));
				menu.setNutri5(rs.getDouble("nutri5"));
				menu.setOrigin(rs.getString("origin"));
				
				menuList.add(menu);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs, stmt, conn);
		}
		return menuList;
	}
	
	// 콘텐츠 페이지 메서드
	public bbqMenuVO getMenuInfo(int no) {
		bbqMenuVO menu = new bbqMenuVO();
		try {
			conn = JDBCConnection.getConnection();
			String sql = "select * from bbq_menu where menuno=?";			
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, no);
			rs = stmt.executeQuery();
			if(rs.next()) {
				menu.setMenuno(rs.getInt("menuno"));
				menu.setMenu(rs.getString("menu"));
				menu.setImg(rs.getString("img"));
				menu.setPrice(rs.getString("price"));
				menu.setCategory(rs.getString("category"));
				menu.setInfo(rs.getString("info"));
				menu.setAllergy(rs.getString("allergy"));
				menu.setNutri1(rs.getDouble("nutri1"));
				menu.setNutri2(rs.getDouble("nutri2"));
				menu.setNutri3(rs.getDouble("nutri3"));
				menu.setNutri4(rs.getDouble("nutri4"));
				menu.setNutri5(rs.getDouble("nutri5"));
				menu.setOrigin(rs.getString("origin"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs, stmt, conn);
		}
		return menu;
	}
}

package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import my.model.Order;
import my.model.OrderListView;
import my.util.JdbcUtil;

public class OrderDao {
	
	public void insert(Connection conn, Order order) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement("insert into orderTable (mid, pid, odate, amount, address, totalprice) "
					+ "values(?,?,?,?,?,?)");
			pstmt.setString(1, order.getMid());
			pstmt.setInt(2, order.getPid());
			pstmt.setTimestamp(3, new Timestamp(order.getOdate().getTime()));
			pstmt.setInt(4, order.getAmount());
			pstmt.setString(5, order.getAddress());
			pstmt.setInt(6, order.getTotalprice());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			////JdbcUtil.close(conn);                                                                                                                                                                                                                                                                        
			JdbcUtil.close(pstmt);
		}
	}
	
	public Order selectById(Connection conn, int oid) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Order order = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from orderTable where oid = ?");
			pstmt.setInt(1, oid);
			rs = pstmt.executeQuery();
			if (rs.next()){
				order = new Order(); 
				order.setOid(rs.getInt(1));
				order.setMid(rs.getString(2));
				order.setPid(rs.getInt(3));
				order.setOdate(rs.getTimestamp(4));
				order.setAmount(rs.getInt(5));
				order.setAddress(rs.getString(6));
				order.setTotalprice(rs.getInt(7));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			////JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return order;
	}
	public Order selectByMId(Connection conn, String mid) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Order order = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from orderTable where mid = ?");
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if (rs.next()){
				order = new Order(); 
				order.setOid(rs.getInt(1));
				order.setMid(rs.getString(2));
				order.setPid(rs.getInt(3));
				order.setOdate(rs.getTimestamp(4));
				order.setAmount(rs.getInt(5));
				order.setAddress(rs.getString(6));
				order.setTotalprice(rs.getInt(7));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			////JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return order;
	}
	
	public List<Order> selectLike(Connection conn, String target, String keyword) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Order order = null; 
		List<Order> orders = new ArrayList<Order>();
		try {
			pstmt = conn.prepareStatement
			("select * from orderTable where " +target +" like ?");
			pstmt.setString(1, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				order = new Order(); 
				order.setOid(rs.getInt(1));
				order.setMid(rs.getString(2));
				order.setPid(rs.getInt(3));
				order.setOdate(rs.getTimestamp(4));
				order.setAmount(rs.getInt(5));
				order.setAddress(rs.getString(6));
				order.setTotalprice(rs.getInt(7));
				orders.add(order);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			////JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return orders;
	}
	
	public void update(Connection conn, Order order) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update orderTable set mid=?,  pid=?,"
					+ " amount=?, address=?, total_price=?  where oid=?");
			pstmt.setString(1, order.getMid());
			pstmt.setInt(2, order.getPid());
			//pstmt.setTimestamp(3, new Timestamp(order.getOdate().getTime()));
			pstmt.setInt(3, order.getAmount());
			pstmt.setString(4, order.getAddress());
			pstmt.setInt(5, order.getTotalprice());
			pstmt.setInt(6, order.getOid());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			////JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void deleteById(Connection conn, int oid) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from orderTable where oid = ?");
			pstmt.setInt(1, oid);
			pstmt.executeUpdate();			
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			////JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null; 
		ResultSet rs = null; 
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from orderTable");
			rs.next();
			return rs.getInt(1);
		} finally {
			////JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}
	
	public List<Order> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Order> orderList = null;
		try {
			pstmt = conn.prepareStatement
					("select ot.oid, ot.MID, ot.pid, ot.odate, ot.amount, ot.address, ot.pcolor, ot.totalPrice from ordertable ot join product p WHERE ot.pid = p.pid ");			
			rs  = pstmt.executeQuery(); 
			orderList = new ArrayList<Order>();
			while (rs.next()){
				Order order = new Order();
				order.setOid(rs.getInt(1));
				order.setMid(rs.getString(2));
				order.setPid(rs.getInt(3));
				order.setOdate(rs.getTimestamp(4));
				order.setAmount(rs.getInt(5));
				order.setAddress(rs.getString(6));
				order.setTotalprice(rs.getInt(7));
				orderList.add(order);
	
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return orderList;
	}

	
	public List<Order> selectListByLimit(Connection conn, int startRow, int endRow) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Order> orderList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from orderTable limit ?,?");
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs  = pstmt.executeQuery(); 
			orderList = new ArrayList<Order>();
			while (rs.next()){
				Order order = new Order();
				order.setOid(rs.getInt(1));
				order.setMid(rs.getString(2));
				order.setPid(rs.getInt(3));
				order.setOdate(rs.getTimestamp(4));
				order.setAmount(rs.getInt(5));
				order.setAddress(rs.getString(6));
				order.setTotalprice(rs.getInt(7));
				orderList.add(order);
			}
		} finally {
			////JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return orderList;
	}
	private static final int orderCountPerPage = 8;
	
	public OrderListView getOrderList(Connection conn, int pageNumber)
			throws SQLException {
		
		int currentPageNumber = pageNumber;
		OrderListView plv = null;
		try {
			
			int productTotalCount = selectCount(conn);
			List<Order> ordertList = null;
			int firstRow = 0;
			int endRow = 0;
			if (productTotalCount > 0) {
				firstRow = (pageNumber - 1) * orderCountPerPage; // 1page >> Firstrow:0
				endRow = orderCountPerPage;		// 1page >> endRow:5
				ordertList =selectListByLimit(conn, firstRow, endRow);
			} else {
				currentPageNumber = 0;
				ordertList = Collections.emptyList();
			}
			plv = new OrderListView(productTotalCount, currentPageNumber, ordertList,
					orderCountPerPage);
		} catch (SQLException e) {
		} finally {
			////JdbcUtil.close(conn);
		}
		return plv;
	}
	
	public List<Integer> selectPrice(Connection conn,String mid) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Integer> prices = null;
		try {
			pstmt = conn.prepareStatement
					("select total_Price from orderTable where mid=?");
			pstmt.setString(1, mid);
			rs  = pstmt.executeQuery(); 
			prices = new ArrayList<Integer>();
			while (rs.next()){
				int price= rs.getInt(1);
				prices.add(price);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return prices;
	}
}
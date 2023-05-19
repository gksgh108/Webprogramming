package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import my.model.User;
import my.model.UserListView;
import my.util.JdbcUtil;

public class UserDao {
	
	public void insert(Connection conn, User user) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into user values(?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getPhone1());
			pstmt.setString(5, user.getPhone2());
			pstmt.setString(6, user.getPhone3());
			pstmt.setString(7, user.getEmail());
			pstmt.setString(8, user.getAddress());
			pstmt.setTimestamp(9, new Timestamp(user.getRegisterTime().getTime()));
			pstmt.setInt(10, user.getPoint());
			pstmt.executeUpdate();
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			////JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public User selectById(Connection conn, String userId) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		User user = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from user where userId = ?");
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				user = new User(); 
				user.setUserId(rs.getString(1));
				user.setPassword(rs.getString(2));
				user.setName(rs.getString(3));
				user.setPhone1(rs.getString(4));
				user.setPhone2(rs.getString(5));
				user.setPhone3(rs.getString(6));
				user.setEmail(rs.getString(7));
				user.setAddress(rs.getString(8));
				user.setRegisterTime(rs.getDate(9));
				user.setPoint(rs.getInt(10));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
	//		//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return user;
	}
	

	public List<User> selectLike(Connection conn, String target, String keyword) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		User user = null; 
		List<User> users = new ArrayList<User>();
		try {
			pstmt = conn.prepareStatement
			("select * from user where " +target +" like ?");
			pstmt.setString(1, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				user = new User(); 
				user.setUserId(rs.getString(1));
				user.setPassword(rs.getString(2));
				user.setName(rs.getString(3));
				user.setPhone1(rs.getString(4));
				user.setPhone2(rs.getString(5));
				user.setPhone3(rs.getString(6));
				user.setEmail(rs.getString(7));
				user.setAddress(rs.getString(8));
				user.setRegisterTime(rs.getDate(9));
				user.setPoint(rs.getInt(10));
				users.add(user);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			////JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return users;
	}
	
	public void updateAdmin(Connection conn, User user) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update user set userId='?', name='?', phone1='?', phone2='?', phone3='?', email='?', address='?', point=? where userId='?'");
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getName());
			pstmt.setString(3, user.getPhone1());
			pstmt.setString(4, user.getPhone2());
			pstmt.setString(5, user.getPhone3());
			pstmt.setString(6, user.getEmail());
			pstmt.setString(7, user.getAddress());
			pstmt.setInt(8, user.getPoint());
			pstmt.setString(9, user.getUserId());
			pstmt.executeUpdate();
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			////JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void update(Connection conn, User user) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update user set password=?, name=?, phone1=?, phone2=?, phone3=?, address=? where userId=?");
			pstmt.setString(1, user.getPassword());
			pstmt.setString(2, user.getName());
			pstmt.setString(3, user.getPhone1());
			pstmt.setString(4, user.getPhone2());
			pstmt.setString(5, user.getPhone3());
			pstmt.setString(6, user.getAddress());
			pstmt.setString(7, user.getUserId());
			pstmt.executeUpdate();
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void deleteById(Connection conn, String userId) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from user where userId = ?");
			pstmt.setString(1, userId);
			pstmt.executeUpdate();			
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			////JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}

	public List<User> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<User> userList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from user ");			
			rs  = pstmt.executeQuery(); 
			userList = new ArrayList<User>();
			while (rs.next()){
				User user = new User();
				user.setUserId(rs.getString(1));
				user.setPassword(rs.getString(2));
				user.setName(rs.getString(3));
				user.setPhone1(rs.getString(4));
				user.setPhone2(rs.getString(5));
				user.setPhone3(rs.getString(6));
				user.setEmail(rs.getString(7));
				user.setAddress(rs.getString(8));
				user.setRegisterTime(rs.getDate(9));
				user.setPoint(rs.getInt(10));
				userList.add(user);
			}
		} finally {
			////JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return userList;
	}
	
	public int idCheck(Connection conn, String uid)
		  throws SQLException {
		  int rst = 0;
		  PreparedStatement ps = null;
		  ResultSet rs = null;
		  try{
			  String sql = "select * from user where userId=?";
			  ps = conn.prepareStatement(sql);
			  ps.setString(1, uid);
			  rs = ps.executeQuery();
			  if(rs.next()){
				 rst = 1;
		   }
		  }catch(Exception e){
			  e.printStackTrace();
		  }finally{
			  	////JdbcUtil.close(conn);
				JdbcUtil.close(rs);
				JdbcUtil.close(ps);
		  }
		  return rst;
		 }
	
	public int emailCheck(Connection conn, String email)
			  throws SQLException {
			  int rst = 0;
			  PreparedStatement ps = null;
			  ResultSet rs = null;
			  try{
				  String sql = "select * from user where email=?";
				  ps = conn.prepareStatement(sql);
				  ps.setString(1, email);
				  rs = ps.executeQuery();
				  if(rs.next()){
					 rst = 1;
			   }
			  }catch(Exception e){
				  e.printStackTrace();
			  }finally{
				  //	//JdbcUtil.close(conn);
					JdbcUtil.close(rs);
					JdbcUtil.close(ps);
			  }
			  return rst;
			 }
	
	public boolean pwCheck(Connection conn, String userId, String password) 
	throws SQLException{
		User user = selectById(conn, userId); 
		if (user.getPassword().equals(password)==true)
			return true;
		else
			return false;
	}
	
	public User selectByEmail(Connection conn, String email) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		User user = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from user where email = ?");
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()){
				user = new User(); 
				user.setUserId(rs.getString(1));
				user.setPassword(rs.getString(2));
				user.setName(rs.getString(3));
				user.setPhone1(rs.getString(4));
				user.setPhone2(rs.getString(5));
				user.setPhone3(rs.getString(6));
				user.setEmail(rs.getString(7));
				user.setAddress(rs.getString(8));
				user.setRegisterTime(rs.getDate(9));
				user.setPoint(rs.getInt(10));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			////JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return user;
		}
	

	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null; 
		ResultSet rs = null; 
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from user");
			rs.next();
			return rs.getInt(1);
		} finally {
			////JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}
	
	public List<User> selectListByLimit(Connection conn, int startRow, int endRow) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<User> userList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from user limit ?,?");
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs  = pstmt.executeQuery(); 
			userList = new ArrayList<User>();
			while (rs.next()){
				User user = new User(); 
				user.setUserId(rs.getString(1));
				user.setPassword(rs.getString(2));
				user.setName(rs.getString(3));
				user.setPhone1(rs.getString(4));
				user.setPhone2(rs.getString(5));
				user.setPhone3(rs.getString(6));
				user.setEmail(rs.getString(7));
				user.setAddress(rs.getString(8));
				user.setRegisterTime(rs.getDate(9));
				user.setPoint(rs.getInt(10));
				userList.add(user);
			}
		} finally {
			////JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return userList;
	}
	private static final int userCountPerPage = 8;

	public UserListView getUserList(Connection conn, int pageNumber)
			throws SQLException {
		
		int currentPageNumber = pageNumber;
		UserListView plv = null;
		try {
			
			int productTotalCount = selectCount(conn);
			List<User> userList = null;
			int firstRow = 0;
			int endRow = 0;
			if (productTotalCount > 0) {
				firstRow = (pageNumber - 1) * userCountPerPage; // 1page >> Firstrow:0
				endRow = userCountPerPage;		// 1page >> endRow:5
				userList =selectListByLimit(conn, firstRow, endRow);
			} else {
				currentPageNumber = 0;
				userList = Collections.emptyList();
			}
			plv = new UserListView(productTotalCount, currentPageNumber, userList,
					userCountPerPage);
		} catch (SQLException e) {
		} finally {
			////JdbcUtil.close(conn);
		}
		return plv;
	}
}
















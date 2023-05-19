package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.model.Inquiry;
import my.util.JdbcUtil;

public class InquiryDao {
	
	public void insert(Connection conn, Inquiry inquiry) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into inquiry (buyerId,pid,amount,price,pdate)"
					+ " values(?,?,?,?,?)");
			pstmt.setInt(1, inquiry.getInquiryId());
			pstmt.setString(2, inquiry.getTitle());
			pstmt.setString(3, inquiry.getUserId());
			pstmt.setString(4, inquiry.getContent());
			pstmt.setTimestamp(5, new Timestamp(inquiry.getDate().getTime()));
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public Inquiry selectById(Connection conn, String inquiryId) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Inquiry inquiry = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from inquiry where inquiryId = ?");
			pstmt.setString(1, inquiryId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				inquiry = new Inquiry(); 
				inquiry.setInquiryId(rs.getInt(1));
				inquiry.setTitle(rs.getString(2));
				inquiry.setUserId(rs.getString(3));
				inquiry.setContent(rs.getString(4));
				inquiry.setDate(rs.getDate(5));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return inquiry;
	}
	
	public List<Inquiry> selectLike(Connection conn, String target, String keyword) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Inquiry inquiry = null; 
		List<Inquiry> inquirys = new ArrayList<Inquiry>();
		try {
			pstmt = conn.prepareStatement
			("select * from inquiry where " +target +" like ?");
			pstmt.setString(1, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				inquiry = new Inquiry(); 
				inquiry.setInquiryId(rs.getInt(1));
				inquiry.setTitle(rs.getString(2));
				inquiry.setUserId(rs.getString(3));
				inquiry.setContent(rs.getString(4));
				inquiry.setDate(rs.getDate(5));
				inquirys.add(inquiry);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return inquirys;
	}

	public List<Inquiry> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Inquiry> inquiryList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from inquiry ");			
			rs  = pstmt.executeQuery(); 
			inquiryList = new ArrayList<Inquiry>();
			while (rs.next()){
				Inquiry inquiry = new Inquiry();
				inquiry.setInquiryId(rs.getInt(1));
				inquiry.setTitle(rs.getString(2));
				inquiry.setUserId(rs.getString(3));
				inquiry.setContent(rs.getString(4));
				inquiry.setDate(rs.getDate(5));
				inquiryList.add(inquiry);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return inquiryList;
	}
	public void update(Connection conn, Inquiry inquiry) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update inquiry set title=?, userId=?, content=?, date=? where inquiryId=?");
			pstmt.setInt(1, inquiry.getInquiryId());
			pstmt.setString(2, inquiry.getTitle());
			pstmt.setString(3, inquiry.getUserId());
			pstmt.setString(4, inquiry.getContent());
			pstmt.setTimestamp(5, new Timestamp(inquiry.getDate().getTime()));
			pstmt.executeUpdate();
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	public void deleteById(Connection conn, String inquiryId) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from inquiry where inquiryId = ?");
			pstmt.setString(1, inquiryId);
			pstmt.executeUpdate();			
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null; 
		ResultSet rs = null; 
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from inquiry");
			rs.next();
			return rs.getInt(1);
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}
}





















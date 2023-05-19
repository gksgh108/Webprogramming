package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.model.Notice;
import my.util.JdbcUtil;

public class NoticeDao {
	
	public void insert(Connection conn, Notice notice) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into notice (buyerId,pid,amount,price,pdate)"
					+ " values(?,?,?,?,?)");
			pstmt.setInt(1, notice.getNoticeId());
			pstmt.setString(2, notice.getTitle());
			pstmt.setString(3, notice.getUserId());
			pstmt.setString(4, notice.getContent());
			pstmt.setTimestamp(5, new Timestamp(notice.getDate().getTime()));
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public Notice selectById(Connection conn, String noticeId) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Notice notice = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from notice where noticeId = ?");
			pstmt.setString(1, noticeId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				notice = new Notice(); 
				notice.setNoticeId(rs.getInt(1));
				notice.setTitle(rs.getString(2));
				notice.setUserId(rs.getString(3));
				notice.setContent(rs.getString(4));
				notice.setDate(rs.getDate(5));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return notice;
	}
	
	public List<Notice> selectLike(Connection conn, String target, String keyword) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Notice notice = null; 
		List<Notice> notices = new ArrayList<Notice>();
		try {
			pstmt = conn.prepareStatement
			("select * from notice where " +target +" like ?");
			pstmt.setString(1, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				notice = new Notice(); 
				notice.setNoticeId(rs.getInt(1));
				notice.setTitle(rs.getString(2));
				notice.setUserId(rs.getString(3));
				notice.setContent(rs.getString(4));
				notice.setDate(rs.getDate(5));
				notices.add(notice);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return notices;
	}

	public List<Notice> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Notice> noticeList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from notice ");			
			rs  = pstmt.executeQuery(); 
			noticeList = new ArrayList<Notice>();
			while (rs.next()){
				Notice notice = new Notice();
				notice.setNoticeId(rs.getInt(1));
				notice.setTitle(rs.getString(2));
				notice.setUserId(rs.getString(3));
				notice.setContent(rs.getString(4));
				notice.setDate(rs.getDate(5));
				noticeList.add(notice);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return noticeList;
	}
	public void update(Connection conn, Notice notice) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update notice set title=?, userId=?, content=?, date=? where noticeId=?");
			pstmt.setInt(1, notice.getNoticeId());
			pstmt.setString(2, notice.getTitle());
			pstmt.setString(3, notice.getUserId());
			pstmt.setString(4, notice.getContent());
			pstmt.setTimestamp(5, new Timestamp(notice.getDate().getTime()));
			pstmt.executeUpdate();
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	public void deleteById(Connection conn, String noticeId) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from notice where noticeId = ?");
			pstmt.setString(1, noticeId);
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
			rs = stmt.executeQuery("select count(*) from notice");
			rs.next();
			return rs.getInt(1);
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}
}





















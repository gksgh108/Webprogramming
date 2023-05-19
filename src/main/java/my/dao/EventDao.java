package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.model.Event;
import my.util.JdbcUtil;

public class EventDao {
	
	public void insert(Connection conn, Event event) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into event (buyerId,pid,amount,price,pdate)"
					+ " values(?,?,?,?,?)");
			pstmt.setInt(1, event.getEventId());
			pstmt.setString(2, event.getTitle());
			pstmt.setString(3, event.getUserId());
			pstmt.setString(4, event.getContent());
			pstmt.setTimestamp(5, new Timestamp(event.getDate().getTime()));
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public Event selectById(Connection conn, String eventId) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Event event = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from event where eventId = ?");
			pstmt.setString(1, eventId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				event = new Event(); 
				event.setEventId(rs.getInt(1));
				event.setTitle(rs.getString(2));
				event.setUserId(rs.getString(3));
				event.setContent(rs.getString(4));
				event.setDate(rs.getDate(5));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return event;
	}
	
	public List<Event> selectLike(Connection conn, String target, String keyword) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Event event = null; 
		List<Event> events = new ArrayList<Event>();
		try {
			pstmt = conn.prepareStatement
			("select * from event where " +target +" like ?");
			pstmt.setString(1, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				event = new Event(); 
				event.setEventId(rs.getInt(1));
				event.setTitle(rs.getString(2));
				event.setUserId(rs.getString(3));
				event.setContent(rs.getString(4));
				event.setDate(rs.getDate(5));
				events.add(event);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return events;
	}

	public List<Event> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Event> eventList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from event ");			
			rs  = pstmt.executeQuery(); 
			eventList = new ArrayList<Event>();
			while (rs.next()){
				Event event = new Event();
				event.setEventId(rs.getInt(1));
				event.setTitle(rs.getString(2));
				event.setUserId(rs.getString(3));
				event.setContent(rs.getString(4));
				event.setDate(rs.getDate(5));
				eventList.add(event);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return eventList;
	}
	public void update(Connection conn, Event event) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update event set title=?, userId=?, content=?, date=? where eventId=?");
			pstmt.setInt(1, event.getEventId());
			pstmt.setString(2, event.getTitle());
			pstmt.setString(3, event.getUserId());
			pstmt.setString(4, event.getContent());
			pstmt.setTimestamp(5, new Timestamp(event.getDate().getTime()));
			pstmt.executeUpdate();
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	public void deleteById(Connection conn, String eventId) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from event where eventId = ?");
			pstmt.setString(1, eventId);
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
			rs = stmt.executeQuery("select count(*) from event");
			rs.next();
			return rs.getInt(1);
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}
}





















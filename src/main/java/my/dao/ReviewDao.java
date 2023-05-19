package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import my.model.Product;
import my.model.ProductListView;
import my.model.Review;
import my.model.ReviewListView;
import my.util.JdbcUtil;

public class ReviewDao {
	
	public void insert(Connection conn, Review review) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into review (title,content,userId,bdate,pid)"
					+ " values(?,?,?,?,?)");
			pstmt.setString(1, review.getTitle());
			pstmt.setString(2, review.getContent());
			pstmt.setString(3, review.getUserId());
			pstmt.setTimestamp(4, new Timestamp(review.getBdate().getTime()));
			pstmt.setInt(5, review.getPid());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
//			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public Review selectById(Connection conn, int reviewId) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Review review = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from review where reviewId = ?");
			pstmt.setInt(1, reviewId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				review = new Review(); 
				review.setReviewId(rs.getInt(1));
				review.setTitle(rs.getString(2));
				review.setContent(rs.getString(3));
				review.setUserId(rs.getString(4));
				review.setBdate(rs.getTimestamp(5));
				review.setPid(rs.getInt(6));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			////JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return review;
	}
	
	public List<Review> selectLike(Connection conn, String target, String keyword) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Review review = null; 
		List<Review> reviews = new ArrayList<Review>();
		try {
			pstmt = conn.prepareStatement
			("select * from review where " +target +" like ?");
			pstmt.setString(1, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				review = new Review(); 
				review.setReviewId(rs.getInt(1));
				review.setTitle(rs.getString(2));
				review.setContent(rs.getString(3));
				review.setUserId(rs.getString(4));
				review.setBdate(rs.getTimestamp(5));
				review.setPid(rs.getInt(6));
				reviews.add(review);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
//			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return reviews;
	}
	
	public List<Review> selectLikePid(Connection conn, int keyword) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Review review = null; 
		List<Review> reviews = new ArrayList<Review>();
		try {
			pstmt = conn.prepareStatement
			("select * from review where pid = ?");
			pstmt.setInt(1, keyword);
			rs = pstmt.executeQuery();
			while (rs.next()){
				review = new Review(); 
				review.setReviewId(rs.getInt(1));
				review.setTitle(rs.getString(2));
				review.setContent(rs.getString(3));
				review.setUserId(rs.getString(4));
				review.setBdate(rs.getTimestamp(5));
				review.setStar(rs.getInt(6));
				review.setPid(rs.getInt(7));
				reviews.add(review);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
//			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return reviews;
	}
	
	public void update(Connection conn, Review review) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update review set title=?,content=?,userId=?, "
					+ "   bdate=?, pid=? where reviewId=?");
			pstmt.setString(1, review.getTitle());
			pstmt.setString(2, review.getContent());
			pstmt.setString(3, review.getUserId());
			pstmt.setTimestamp(4, new Timestamp(review.getBdate().getTime()));
			pstmt.setInt(5, review.getPid());
			pstmt.setInt(6, review.getReviewId());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
//			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void deleteById(Connection conn, int reviewId) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from review where reviewId = ?");
			pstmt.setInt(1, reviewId);
			pstmt.executeUpdate();			
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
//			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null; 
		ResultSet rs = null; 
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from review");
			rs.next();
			return rs.getInt(1);
		} finally {
//			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}
	
	public int selectRevCount(Connection conn, int rev) throws SQLException {
		Statement stmt = null; 
		ResultSet rs = null; 
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from review where pid="+rev);
			rs.next();
			return rs.getInt(1);
		} finally {
//			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}
	
	public List<Review> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Review> reviewList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from review ");			
			rs  = pstmt.executeQuery(); 
			reviewList = new ArrayList<Review>();
			while (rs.next()){
				Review review = new Review();
				review.setReviewId(rs.getInt(1));
				review.setTitle(rs.getString(2));
				review.setContent(rs.getString(3));
				review.setUserId(rs.getString(4));
				review.setBdate(rs.getTimestamp(5));
				review.setStar(rs.getInt(6));
				review.setPid(rs.getInt(7));
				reviewList.add(review);
			}
		} finally {
//			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return reviewList;
	}

	
	public List<Review> selectListPid(Connection conn, int pid) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Review> reviewList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from review where pid="+pid);
			rs  = pstmt.executeQuery(); 
			reviewList = new ArrayList<Review>();
			while (rs.next()){
				Review review = new Review();
				review.setReviewId(rs.getInt(1));
				review.setTitle(rs.getString(2));
				review.setContent(rs.getString(3));
				review.setUserId(rs.getString(4));
				review.setBdate(rs.getTimestamp(5));
				review.setStar(rs.getInt(6));
				review.setPid(rs.getInt(7));
				reviewList.add(review);
			}
		} finally {
	//		//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return reviewList;
	}


@SuppressWarnings("null")
public List<Review> selectCategory(Connection conn, String category) 
		throws SQLException {
	PreparedStatement pstmt=null; 
	ResultSet rs = null;
	Review review = null; 
	String sql = "select * from review where pid in (select pid from product where category="+category+")";
	List<Review> reviewList = new ArrayList<Review>();
	
	try {
		pstmt = conn.prepareStatement(sql);
//		("select * from picture where " +target +" like ?");
//		pstmt.setString(1, "%"+keyword+"%");
		rs = pstmt.executeQuery();
		while (rs.next()){
			review.setReviewId(rs.getInt(1));
			review.setTitle(rs.getString(2));
			review.setContent(rs.getString(3));
			review.setUserId(rs.getString(4));
			review.setBdate(rs.getTimestamp(5));
			review.setStar(rs.getInt(6));
			review.setPid(rs.getInt(7));
			reviewList.add(review);
		}
	} catch (SQLException e){
		e.printStackTrace();
	} finally {
//		//JdbcUtil.close(conn);
		JdbcUtil.close(pstmt);
		JdbcUtil.close(rs);
	}
	return reviewList;
}



public int selectRevCount(Connection conn, String category) throws SQLException {
	Statement stmt = null; 
	ResultSet rs = null; 
	try {
		stmt = conn.createStatement();
		rs = stmt.executeQuery("select count(*) from review where category='"+category+"'");
		rs.next();
		return rs.getInt(1);
	} finally {
//		//JdbcUtil.close(conn);
		JdbcUtil.close(rs);
	}
}

public List<Review> selectListByLimit(Connection conn, int startRow, int endRow) 
		throws SQLException {
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List<Review> reviewList = null;
	try {
		pstmt = conn.prepareStatement
				("select * from review limit ?,?");
		pstmt.setInt(1, startRow);
		pstmt.setInt(2, endRow);
		
		rs  = pstmt.executeQuery(); 
		reviewList = new ArrayList<Review>();
		while (rs.next()){
			Review review = new Review();
			review.setReviewId(rs.getInt(1));
			review.setTitle(rs.getString(2));
			review.setContent(rs.getString(3));
			review.setUserId(rs.getString(4));
			review.setBdate(rs.getTimestamp(5));
			review.setStar(rs.getInt(6));
			review.setPid(rs.getInt(7));
			reviewList.add(review);
		}
	} finally {
		////JdbcUtil.close(conn);
		JdbcUtil.close(rs);
		JdbcUtil.close(pstmt);
	}
	return reviewList;
}

public List<Review> selectListByLimitKind(Connection conn, int startRow, int endRow, String kind) 
		throws SQLException {
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List<Review> reviewList = null;
	try {
		pstmt = conn.prepareStatement
				("select * from review where category='"+kind+"' limit ?,?");
		pstmt.setInt(1, startRow);
		pstmt.setInt(2, endRow);
		
		rs  = pstmt.executeQuery(); 
		reviewList = new ArrayList<Review>();
		while (rs.next()){
			Review review = new Review();
			review.setReviewId(rs.getInt(1));
			review.setTitle(rs.getString(2));
			review.setContent(rs.getString(3));
			review.setUserId(rs.getString(4));
			review.setBdate(rs.getTimestamp(5));
			review.setStar(rs.getInt(6));
			review.setPid(rs.getInt(7));
			reviewList.add(review);
		}
	} finally {
		////JdbcUtil.close(conn);
		JdbcUtil.close(rs);
		JdbcUtil.close(pstmt);
	}
	return reviewList;
}

private static final int reviewCountPerPage = 8;

public ReviewListView getReviewList(Connection conn, int pageNumber, String sort)
		throws SQLException {
	
	int currentPageNumber = pageNumber;
	ReviewListView rlv = null;
	try {
		
		int reviewTotalCount = selectCount(conn);

		List<Review> reviewList = null;
		int firstRow = 0;
		int endRow = 0;
		if (reviewTotalCount > 0) {
			firstRow = (pageNumber - 1) * reviewCountPerPage; // 1page >> Firstrow:0
			endRow = reviewCountPerPage;		// 1page >> endRow:5
			reviewList =selectListByLimit(conn, firstRow, endRow);
		} else {
			currentPageNumber = 0;
			reviewList = Collections.emptyList();
		}
		rlv = new ReviewListView(reviewTotalCount, currentPageNumber, reviewList,
				reviewCountPerPage);
	} catch (SQLException e) {
	} finally {
		////JdbcUtil.close(conn);
	}
	return rlv;
}

public ReviewListView getProductListKind(Connection conn, int pageNumber, String kind)
		throws SQLException {
	
	int currentPageNumber = pageNumber;
	ReviewListView rlv = null;
	try {
		
		int reviewTotalCount = selectRevCount(conn,kind);
		List<Review> reviewList = null;
		int firstRow = 0;
		int endRow = 0;
		if (reviewTotalCount > 0) {
			firstRow = (pageNumber - 1) * reviewCountPerPage; // 1page >> Firstrow:0
			endRow = reviewCountPerPage;		// 1page >> endRow:5
			reviewList =selectListByLimitKind(conn, firstRow, endRow,kind);
			//productList =selectListByLimit(conn, firstRow, endRow, sort);
		} else {
			currentPageNumber = 0;
			reviewList = Collections.emptyList();
		}
		rlv = new ReviewListView(reviewTotalCount, currentPageNumber, reviewList,
				reviewCountPerPage);

	} catch (SQLException e) {
	} finally {
		////JdbcUtil.close(conn);
	}
	
	return rlv;
}

}




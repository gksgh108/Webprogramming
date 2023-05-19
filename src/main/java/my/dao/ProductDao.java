package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import my.model.Product;
import my.model.ProductListView;
//import my.model.ProductListView;
import my.util.JdbcUtil;
public class ProductDao {
	
	public void insert(Connection conn, Product product) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into product (pname,price,pcolor,pdate,pimage,category,amount,psize,pview)"
					+ " values(?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, product.getPname());
			pstmt.setInt(2, product.getPrice());
			pstmt.setString(3, product.getPcolor());
			pstmt.setTimestamp(4, new Timestamp(product.getPdate().getTime()));
			pstmt.setString(5, product.getPimage());
			pstmt.setString(6, product.getCategory());
			pstmt.setInt(7, product.getAmount());
			pstmt.setString(8, product.getPsize());
			pstmt.setInt(9, product.getPview());
			
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
//			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public Product selectById(Connection conn, int pid) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Product product = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from product where pid = ?");
			pstmt.setInt(1, pid);
			rs = pstmt.executeQuery();
			if (rs.next()){
				product = new Product(); 
				product.setPid(rs.getInt(1));
				product.setPname(rs.getString(2));
				product.setPrice(rs.getInt(3));
				product.setPcolor(rs.getString(4));
				product.setPdate(rs.getTimestamp(5));
				product.setPimage(rs.getString(6));
				product.setCategory(rs.getString(7));
				product.setAmount(rs.getInt(8));
				product.setPsize(rs.getString(9));
				product.setPview(rs.getInt(10));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
//			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return product;
	}

	public List<Product> selectLike(Connection conn, String target, String keyword) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Product product = null; 
		String sql = "select * from product ";
		if (keyword != null && !keyword.equals("")) {
			//sql += " where "+target + " like %"+keyword+"%";
			sql = "select * from product where "+target + " like '%"+keyword+"'%";
		}
		List<Product> products = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement(sql);
//			("select * from product where " +target +" like ?");
//			pstmt.setString(1, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				product = new Product(); 
				product.setPid(rs.getInt(1));
				product.setPname(rs.getString(2));
				product.setPrice(rs.getInt(3));
				product.setPcolor(rs.getString(4));
				product.setPdate(rs.getTimestamp(5));
				product.setPimage(rs.getString(6));
				product.setCategory(rs.getString(7));
				product.setAmount(rs.getInt(8));
				product.setPsize(rs.getString(9));
				product.setPview(rs.getInt(10));
				products.add(product);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
//			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return products;
	}
	
	
	
	public List<Product> selectSort(Connection conn, String sort)
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Product product = null; 
		String sql = "select * from product "+sort;	//theme은 order by
		List<Product> products = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement(sql);
//			("select * from product where " +target +" like ?");
//			pstmt.setString(1, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				product = new Product(); 
				product.setPid(rs.getInt(1));
				product.setPname(rs.getString(2));
				product.setPrice(rs.getInt(3));
				product.setPcolor(rs.getString(4));
				product.setPdate(rs.getTimestamp(5));
				product.setPimage(rs.getString(6));
				product.setCategory(rs.getString(7));
				product.setAmount(rs.getInt(8));
				product.setPsize(rs.getString(9));
				product.setPview(rs.getInt(10));
				products.add(product);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
//			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return products;
	}
	
	public List<Product> selectKindSort(Connection conn, String category, String sort)
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Product product = null; 
		List<Product> products = null;
		try {
			pstmt = conn.prepareStatement
					("select * from product where category=?"+sort);
			pstmt.setString(1, category);
			
			rs = pstmt.executeQuery();
			products = new ArrayList<Product>();
			while (rs.next()){
				product = new Product(); 
				product.setPid(rs.getInt(1));
				product.setPname(rs.getString(2));
				product.setPrice(rs.getInt(3));
				product.setPcolor(rs.getString(4));
				product.setPdate(rs.getTimestamp(5));
				product.setPimage(rs.getString(6));
				product.setCategory(rs.getString(7));
				product.setAmount(rs.getInt(8));
				product.setPsize(rs.getString(9));
				product.setPview(rs.getInt(10));
				products.add(product);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
//			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return products;
	}
	
	public void update(Connection conn, Product product) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update product set pname=?,price=?,pcolor=?, "
					+ "amount=? where pid=?");
			pstmt.setString(1, product.getPname());
			pstmt.setInt(2, product.getPrice());
			pstmt.setString(3, product.getPcolor());
			pstmt.setInt(4, product.getAmount());
			pstmt.setInt(5, product.getPid());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
//			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}

	public void updateFav(Connection conn, int pid) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update product set pview = pview +1 where pid=?");
			pstmt.setInt(1, pid);
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}

	public void deleteById(Connection conn, int pid) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from product where pid = ?");
			pstmt.setInt(1, pid);
			pstmt.executeUpdate();			
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public int selectCount(Connection conn, String key) throws SQLException {
		Statement stmt = null; 
		ResultSet rs = null; 
		String sql = "";
		if(key!=null && !key.equals("")) {
			sql = " where pname like '%"+key+"%'";
		}
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from product"+sql);
			rs.next();
			return rs.getInt(1);
		} finally {
//			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}

	public int selectProdCount(Connection conn, String category, String key) throws SQLException {
		Statement stmt = null; 
		ResultSet rs = null; 
		String sql = "";
		if(key != null && !key.equals("")) {
			sql = " and pname like '%"+key+"%'";
		}
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from product where category='"+category+"'"+sql);
			rs.next();
			return rs.getInt(1);
		} finally {
//			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}

	public List<Product> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Product> productList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from product ");			
			rs  = pstmt.executeQuery(); 
			productList = new ArrayList<Product>();
			while (rs.next()){
				Product product = new Product();
				product.setPid(rs.getInt(1));
				product.setPname(rs.getString(2));
				product.setPrice(rs.getInt(3));
				product.setPcolor(rs.getString(4));
				product.setPdate(rs.getTimestamp(5));
				product.setPimage(rs.getString(6));
				product.setCategory(rs.getString(7));
				product.setAmount(rs.getInt(8));
				product.setPsize(rs.getString(9));
				product.setPview(rs.getInt(10));
				productList.add(product);
			}
		} finally {
			////JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return productList;
	}
	
	public List<Product> selectHotList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Product> productList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from product order by pview desc limit 0,4");			
			rs  = pstmt.executeQuery(); 
			productList = new ArrayList<Product>();
			while (rs.next()){
				Product product = new Product();
				product.setPid(rs.getInt(1));
				product.setPname(rs.getString(2));
				product.setPrice(rs.getInt(3));
				product.setPcolor(rs.getString(4));
				product.setPdate(rs.getTimestamp(5));
				product.setPimage(rs.getString(6));
				product.setCategory(rs.getString(7));
				product.setAmount(rs.getInt(8));
				product.setPsize(rs.getString(9));
				product.setPview(rs.getInt(10));
				productList.add(product);
			}
		} finally {
			////JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return productList;
	}
	
	public List<Product> selectNewList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Product> productList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from product order by pdate desc limit 0,4");			
			rs  = pstmt.executeQuery(); 
			productList = new ArrayList<Product>();
			while (rs.next()){
				Product product = new Product();
				product.setPid(rs.getInt(1));
				product.setPname(rs.getString(2));
				product.setPrice(rs.getInt(3));
				product.setPcolor(rs.getString(4));
				product.setPdate(rs.getTimestamp(5));
				product.setPimage(rs.getString(6));
				product.setCategory(rs.getString(7));
				product.setAmount(rs.getInt(8));
				product.setPsize(rs.getString(9));
				product.setPview(rs.getInt(10));
				productList.add(product);
			}
		} finally {
			////JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return productList;
	}
	
	public List<Product> selectListByLimit(Connection conn, int startRow, int endRow, String sort, String key) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Product> productList = null;
		String sql = "where pname like '%%'";
		if(key != null && !key.equals("")) {
			sql = "where pname like '%"+key+"%' ";
		}
		try {
			pstmt = conn.prepareStatement
					("select * from product "+sql+sort+" limit ?,?");
			//pstmt.setString(1, sort);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs  = pstmt.executeQuery(); 
			productList = new ArrayList<Product>();
			while (rs.next()){
				Product product = new Product();
				product.setPid(rs.getInt(1));
				product.setPname(rs.getString(2));
				product.setPrice(rs.getInt(3));
				product.setPcolor(rs.getString(4));
				product.setPdate(rs.getTimestamp(5));
				product.setPimage(rs.getString(6));
				product.setCategory(rs.getString(7));
				product.setAmount(rs.getInt(8));
				product.setPsize(rs.getString(9));
				product.setPview(rs.getInt(10));
				productList.add(product);
			}
		} finally {
			////JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return productList;
	}
	
	public List<Product> selectListByLimitKind(Connection conn, int startRow, int endRow, String kind, String sort, String key) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Product> productList = null;
		String sql = "and pname like '%%'";
		if(key != null && !key.equals("")) {
			sql = "and pname like '%"+key+"%' ";
		}
		try {
			pstmt = conn.prepareStatement
					("select * from product where category='"+kind+"' "+sql+sort+" limit ?,?");
			//pstmt.setString(1, "top");
			//pstmt.setString(1, sort);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs  = pstmt.executeQuery(); 
			productList = new ArrayList<Product>();
			while (rs.next()){
				Product product = new Product();
				product.setPid(rs.getInt(1));
				product.setPname(rs.getString(2));
				product.setPrice(rs.getInt(3));
				product.setPcolor(rs.getString(4));
				product.setPdate(rs.getTimestamp(5));
				product.setPimage(rs.getString(6));
				product.setCategory(rs.getString(7));
				product.setAmount(rs.getInt(8));
				product.setPsize(rs.getString(9));
				product.setPview(rs.getInt(10));
				productList.add(product);
			}
		} finally {
			////JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return productList;
	}

	private static final int productCountPerPage = 8;

	public ProductListView getProductList(Connection conn, int pageNumber, String sort, String key)
			throws SQLException {
		
		int currentPageNumber = pageNumber;
		ProductListView plv = null;
		try {
			
			int productTotalCount = selectCount(conn, key);
			List<Product> productList = null;
			int firstRow = 0;
			int endRow = 0;
			String sorting = sort;
			String keyword = key;
			if (productTotalCount > 0) {
				firstRow = (pageNumber - 1) * productCountPerPage; // 1page >> Firstrow:0
				endRow = productCountPerPage;		// 1page >> endRow:5
				productList =selectListByLimit(conn, firstRow, endRow, sorting, keyword);
			} else {
				currentPageNumber = 0;
				productList = Collections.emptyList();
			}
			plv = new ProductListView(productTotalCount, currentPageNumber, productList,
					productCountPerPage);
		} catch (SQLException e) {
		} finally {
			////JdbcUtil.close(conn);
		}
		return plv;
	}
	
	public ProductListView getProductListKind(Connection conn, int pageNumber, String kind, String sort, String key)
			throws SQLException {
		
		int currentPageNumber = pageNumber;
		ProductListView plv = null;
		try {
			
			int productTotalCount = selectProdCount(conn,kind, key);
			//int productTotalCount = selectCount(conn);
			List<Product> productList = null;
			int firstRow = 0;
			int endRow = 0;
			String keyword = key;
			if (productTotalCount > 0) {
				firstRow = (pageNumber - 1) * productCountPerPage; // 1page >> Firstrow:0
				endRow = productCountPerPage;		// 1page >> endRow:5
				productList =selectListByLimitKind(conn, firstRow, endRow,kind,sort, keyword);
				//productList =selectListByLimit(conn, firstRow, endRow, sort);
			} else {
				currentPageNumber = 0;
				productList = Collections.emptyList();
			}
			plv = new ProductListView(productTotalCount, currentPageNumber, productList,
					productCountPerPage);

		} catch (SQLException e) {
		} finally {
			////JdbcUtil.close(conn);
		}
		
		return plv;
	}

}



















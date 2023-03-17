package com.beans.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.beans.dbcp.DBConnectionMgr;

public class BoardDAO {
	private DBConnectionMgr pool;
	private static final String  SAVEFOLDER = "D:/{ workspace-java }/SpaceTravel/src/main/webapp/uploadFile";	
	private static final String ENCTYPE = "utf-8";
	private static int MAXSIZE = 5*1024*1024;
	
	public BoardDAO( ) {
		try { pool = DBConnectionMgr.getInstance( ); }
		catch(Exception e) { e.printStackTrace( ); }
	}

	/*===== appList =====*/
	public int getTotalCount(String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		
		try {
			con = pool.getConnection( );
			if (keyWord.equals("null") || keyWord.equals("")) {
				sql = "select count(num) from tblBoard";
				pstmt = con.prepareStatement(sql);
			} else {
				sql = "select count(num) from  tblBoard where " + keyField + " like ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
			}
			rs = pstmt.executeQuery( );
			if (rs.next( )) { 	totalCount = rs.getInt(1); }
		}catch(Exception e) {e.printStackTrace();}
		finally {pool.freeConnection(con,pstmt,rs);}
		
		return totalCount;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}










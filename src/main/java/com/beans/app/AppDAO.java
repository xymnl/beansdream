package com.beans.app;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Vector;

import com.beans.dbcp.DBConnectionMgr;
import com.beans.member.ZipcodeVO;

public class AppDAO {
	private DBConnectionMgr pool;
	
	public AppDAO() {
		try {pool = DBConnectionMgr.getInstance();}
		catch(Exception e) {e.printStackTrace();}
	}
	
	public Vector<AppVO> getList(String id){			//  AppList.jsp   ※ 가져 오고 있음 확인 필요 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<AppVO> vlist = new Vector<AppVO>();
		
		try {
			con = pool.getConnection();
			sql = "select * from apptbl where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				AppVO vo = new AppVO();
				vo.setNum(rs.getString(1));
				vo.setProductType(rs.getString(2));
				vo.setProcess(rs.getString(3));
				vo.setVisitDate(rs.getString(4));
				vo.setVisitTime(rs.getString(5));
				vo.setName(rs.getString(6));
				vo.setNumber(rs.getString(7));

				vlist.add(vo);
			}
		}
		catch (Exception e) {e.printStackTrace();}
		finally {pool.freeConnection(con, pstmt, rs);}
		
		return vlist;
	}
	
	public boolean loginCheck(String id) {	// 수강신청 선택 시 로그인 확인 여부
		System.out.print("현재 로그인되어있는 id" + id);
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "select id from apptbl where id =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			flag = pstmt.executeQuery().next();
		}
		catch (Exception e) {e.printStackTrace();}
		finally {pool.freeConnection(con,pstmt);}
		
		return flag;
	}
	
	public boolean insertAppOff(AppVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "insert into apptbl (num, productType, process, visitDate, visitTime, name, number)" + "values (?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getNum());
			pstmt.setString(2, vo.getProductType());
			pstmt.setString(3, vo.getProcess());
			pstmt.setString(4, vo.getVisitDate());
			pstmt.setString(5, vo.getVisitTime());
			pstmt.setString(6, vo.getName());
			pstmt.setString(7, vo.getNumber());
			
			if(pstmt.executeUpdate() == 1) flag = true;
		}
		catch (Exception e) {e.printStackTrace();}
		finally {pool.freeConnection(con,pstmt);}
		System.out.println("App List 보내기 결과 flag : " + flag);
		
		return flag;
		
	}
	
	public boolean insertAppOn(AppVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "insert into apptbl (productType, process, name, number)" + "values (?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getProductType());
			pstmt.setString(2, vo.getProcess());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getNumber());
			
			if(pstmt.executeUpdate() == 1) flag = true;
		}
		catch (Exception e) {e.printStackTrace();}
		finally {pool.freeConnection(con,pstmt);}
		
		return flag;
		
	}
	
	public Vector<AppVO> getMemberList() {  		// admin 계정에서 과정신청목록 불러오기
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<AppVO> mlist = new Vector<AppVO>();
		
		try {
			con = pool.getConnection();
			sql = "select * from apptbl";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AppVO mvo = new AppVO();
				mvo.setNum(rs.getString(1));
				mvo.setProductType(rs.getString(2));
				mvo.setProcess(rs.getString(3));
				mvo.setVisitDate(rs.getString(4));
				mvo.setVisitTime(rs.getString(5));
				mvo.setName(rs.getString(6));
				mvo.setNumber(rs.getString(7));
				
				mlist.add(mvo);
			}
		}
		catch(Exception e) { e.printStackTrace(); }
		finally { pool.freeConnection(con, pstmt, rs); }
		
		return mlist;
	}
	
	
	
	public AppVO getmemberList(String num) {  		// admin 계정에서 과정신청목록 불러오기
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AppVO vo = new AppVO();;
		String sql = null;
		
		try {
			con = pool.getConnection();
			sql = "select * from apptbl where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo.setNum(rs.getString("num"));
				vo.setProductType(rs.getString("productType"));
				vo.setProcess(rs.getString("process"));
				vo.setVisitDate(rs.getString("visitDate"));
				vo.setVisitTime(rs.getString("visitTime"));
				vo.setName(rs.getString("name"));
				vo.setNumber(rs.getString("number"));
			}
		}
		catch(Exception e) { e.printStackTrace(); }
		finally { pool.freeConnection(con, pstmt, rs); }
		
		return vo;
	}
	
	public boolean deleteClass(String num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "delete from apptbl where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, num);
			
			if(pstmt.executeUpdate() == 1) flag = true;
		}
		catch(Exception e) { e.printStackTrace(); }
		finally { pool.freeConnection(con, pstmt); }
		
		return flag;
	}
	
	
}







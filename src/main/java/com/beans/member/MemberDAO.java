package com.beans.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import com.beans.dbcp.DBConnectionMgr;

public class MemberDAO {
	private DBConnectionMgr pool;
	
	public MemberDAO() {
		try {pool = DBConnectionMgr.getInstance();}
		catch(Exception e) {e.printStackTrace();}
	}
	
	public boolean  insertMember(MemberVO vo) {
		System.out.println(vo.getId());
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "insert into usertbl (id, pwd,name,gender, birth,zipcode,addr,mobile,email)" + "values (?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getGender());
			pstmt.setString(5, vo.getBirth());
			pstmt.setString(6, vo.getZipcode());
			pstmt.setString(7, vo.getAddr());
			pstmt.setString(8, vo.getMobile()); 
			pstmt.setString(9, vo.getEmail());
			
			if(pstmt.executeUpdate() == 1) flag = true;
		}
		catch (Exception e) {e.printStackTrace();}
		finally {pool.freeConnection(con,pstmt);}
		System.out.println("회원가입 flag 값" + flag);
		
		
		return flag;
	}
	
	public boolean checkId(String id) {
		Connection con = null;
		String sql = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "select id from usertbl where id =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			flag = pstmt.executeQuery().next();
		}
		catch(Exception e) {e.printStackTrace();}
		finally {pool.freeConnection(con,pstmt);}
		System.out.println("로그인 flag 값 : " + flag);
		
		return flag;
		
	}
	
	public Vector<ZipcodeVO> zipcodeRead(String area3){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ZipcodeVO> vlist = new Vector<ZipcodeVO>();
		
		try {
			con = pool.getConnection();
			sql = "select * from ziptbl where area3 like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + area3 + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ZipcodeVO zvo = new ZipcodeVO();
				zvo.setZipcode(rs.getString(1));
				zvo.setArea1(rs.getString(2));
				zvo.setArea2(rs.getString(3));
				zvo.setArea3(rs.getString(4));
				zvo.setArea4(rs.getString(5));
				
				vlist.add(zvo);
			}
		}
		catch (Exception e) {e.printStackTrace();}
		finally {pool.freeConnection(con, pstmt, rs);}
		
		return vlist;
	}
	
	
	public boolean loginCheck(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "select id from usertbl where id=? and pwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			flag = rs.next();
		}catch (Exception e) {e.printStackTrace();}
		
		finally {pool.freeConnection(con,pstmt,rs);}
		
		// System.out.println("flag" + flag);
		// ↑ 콘솔창에 값이 맞게 뜨는지 띄워보기
		
		return flag;
	}
	
	public MemberVO getMyInfo(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		String sql = null;
		MemberVO vo = null;
		
		try {
			con = pool.getConnection();
			sql = "select * from usertbl where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,  id);
			rs = pstmt.executeQuery();
			
			System.out.println(id);
			
			if(rs.next()) {
				vo = new MemberVO();
				vo.setId(rs.getString("id"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirth(rs.getString("birth"));
				vo.setZipcode(rs.getString("zipcode"));
				vo.setAddr(rs.getString("addr"));
				vo.setMobile(rs.getString("mobile"));
				vo.setEmail(rs.getString("email"));
			}
		} 
		catch(Exception e) {e.printStackTrace(); }
		finally {pool.freeConnection(con,pstmt,rs);}
		
		return vo;
	}
	
	
	public boolean updateMember(MemberVO vo) {
		System.out.println("회원 정보 우편 번호 " + vo.getZipcode());
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "update usertbl set pwd=?,name=?,gender=?,birth=?,zipcode=?,addr=?,mobile=?,email=?"
						+"where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getPwd());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getGender());
			pstmt.setString(4, vo.getBirth());
			pstmt.setString(5, vo.getZipcode());
			pstmt.setString(6, vo.getAddr());
			pstmt.setString(7, vo.getMobile());
			pstmt.setString(8, vo.getEmail());

			
			pstmt.setString(9, vo.getId());
			
			if(pstmt.executeUpdate() == 1) flag = true;
		}
		catch(Exception e) { e.printStackTrace(); }
		finally { pool.freeConnection(con, pstmt); }
		
		System.out.println("회원수정 업데이트 완료 : "+ flag);
		
		return flag;
	}
	
	public boolean deleteMember(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "delete from usertbl where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			if(pstmt.executeUpdate() == 1) flag = true;
		}
		catch(Exception e) { e.printStackTrace(); }
		finally { pool.freeConnection(con, pstmt); }
		
		return flag;
	}
	
	public Vector<MemberVO> getMemberList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<MemberVO> mlist = new Vector<MemberVO>();
		
		try {
			con = pool.getConnection();
			sql = "select * from usertbl";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberVO mvo = new MemberVO();
				mvo.setId(rs.getString(1));
				mvo.setPwd(rs.getString(2));
				mvo.setName(rs.getString(3));
				mvo.setGender(rs.getString(4));
				mvo.setBirth(rs.getString(5));
				mvo.setZipcode(rs.getString(6));
				mvo.setAddr(rs.getString(7));
				mvo.setMobile(rs.getString(8));
				mvo.setEmail(rs.getString(9));
				
				mlist.add(mvo);
			}
		}
		catch(Exception e) { e.printStackTrace(); }
		finally { pool.freeConnection(con, pstmt, rs); }
		
		return mlist;
	}
	
	



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

package com.authority.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.admin_info.model.AdmiVO;
import com.function_info.model.FuniService;
import com.function_info.model.FuniVO;

public class AutDAO implements AutDAO_interface{
	
	public static final String INSERT =
			"INSERT INTO authority( ADM_ID, FUN_ID) VALUES(?,?)";
	public static final String DELETE =
			"DELETE FROM authority where ADM_ID=?";
	public static final String CHECK =
			"SELECT * FROM authority where ADM_ID=? and FUN_ID=? ";
	public static final String GETFUN=
			"SELECT * FROM authority where ADM_ID=?";
	
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/myproject");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insert(AutVO autVO,Connection con) {
	
		PreparedStatement pstmt = null;
		
		try {
			
			pstmt = con.prepareStatement(INSERT);
			
			pstmt.setInt(1, autVO.getAdmID());
			pstmt.setInt(2, autVO.getFunID());
			pstmt.executeUpdate();
		}catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		}
		
	}

	@Override
	public void delete(Integer admID) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			pstmt.setInt(1, admID);
			pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}


	

	@Override
	public boolean check(Integer admiID,Integer funID) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con =ds.getConnection();
			pstmt = con.prepareStatement(CHECK);
			
			pstmt.setInt(1, admiID);
			pstmt.setInt(2, funID);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				return true;
	
			}else {
				return false;
			}
			
		}catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
		
	}

	@Override
	public List<String> getFun(Integer admID) {
		List<String> list = new ArrayList<String>();
		FuniVO funiVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con =ds.getConnection();
			
			pstmt = con.prepareStatement(GETFUN);
			pstmt.setInt(1, admID);
			
			
			rs = pstmt.executeQuery();
			
			FuniService funSvc = new FuniService();
			while(rs.next()) {
				Integer funID = rs.getInt("FUN_ID");
				funiVO = funSvc.getOneByID(funID);
				
				list.add(funiVO.getFunName());
			}
			
		}catch (SQLException se) {
			throw new RuntimeException("A database error occured."+se.getMessage());
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					// TODO Auto-generated catch block
					se.printStackTrace(System.err);
				}
			}
			if(con!=null) {
				try {
					con.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace(System.err);
				}
			}			
		}
		return list;
	}
	

}

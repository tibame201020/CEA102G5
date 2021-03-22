package com.function_info.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class FuniDAO implements FuniDAO_interface {
	
	private static final String GET_ONE_ByID=
			"SELECT * FROM FUNCTION_INFO WHERE FUN_ID =?";
	private static final String GET_ALL=
			"SELECT * FROM FUNCTION_INFO order by FUN_ID";
	
	
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
	public FuniVO findByPrimaryKey(Integer funID) {
		FuniVO funiVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_ByID);
			
			pstmt.setInt(1, funID);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				funiVO = new FuniVO();
				funiVO.setFunID(rs.getInt("FUN_ID"));
				funiVO.setFunName(rs.getString("FUN_name"));
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
		
		return funiVO;
	}

	@Override
	public List<FuniVO> getAll() {
		List<FuniVO> list = new ArrayList<FuniVO>();
		FuniVO funiVO = null;
		Connection con= null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con =ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				funiVO = new FuniVO();
				funiVO.setFunID(rs.getInt("FUN_ID"));
				funiVO.setFunName(rs.getString("FUN_name"));
				
				list.add(funiVO);
			}
			
		} catch (SQLException se) {
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
		return list;
	}
		
		

}

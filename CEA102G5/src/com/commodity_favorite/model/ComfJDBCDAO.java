package com.commodity_favorite.model;

import java.sql.*;
import java.util.*;

import redis.clients.jedis.Jedis;


public class ComfJDBCDAO implements ComfDAO_Interface {
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/myproject?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "123456";
	
	private static final String INSERT_STMT =
			"INSERT INTO COMMODITY_FAVORITE(MEM_ID,COM_ID) VALUES(?,?)";
	private static final String DELETE_STMT=
			"DELETE FROM COMMODITY_FAVORITE WHERE MEM_ID = ? AND COM_ID = ?";
	
	@Override
	public void insert(ComfVO comfVO) {
		// TODO Auto-generated method stub
		Connection con =null;
		PreparedStatement pstmt =null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setInt(1,comfVO.getMemID());
			pstmt.setInt(2,comfVO.getComID());
			
			pstmt.executeUpdate();
			
		}catch(SQLException se) {
			se.printStackTrace();
		}catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
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
	public void delete(ComfVO comfVO) {
		// TODO Auto-generated method stub
		Connection con =null;
		PreparedStatement pstmt =null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(DELETE_STMT);
			pstmt.setInt(1,comfVO.getMemID());
			pstmt.setInt(2,comfVO.getComID());
			
			pstmt.executeUpdate();
			
		}catch(SQLException se) {
			se.printStackTrace();
		}catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
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
	public static void main(String[] args) {
		Jedis jedis = null;
		try {
			jedis = new Jedis("localhost", 6379);
			jedis.auth("123456");
			System.out.println(jedis.ping());
		} finally {
			if(jedis != null)
			jedis.close();
		}
	}

	@Override
	public ComfVO findByMemID(int memID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Set favCom(String memID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertByRedis(String memID, String comID) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteByRedis(String memID, String comID) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Boolean check(String memID, String comID) {
		// TODO Auto-generated method stub
		return null;
	}
	
}

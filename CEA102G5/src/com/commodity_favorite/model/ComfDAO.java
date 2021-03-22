package com.commodity_favorite.model;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.commodity_category.model.ComcVO;

import redis.clients.jedis.Jedis;

import java.sql.*;
import java.util.*;



public class ComfDAO implements ComfDAO_Interface{
	
	private static DataSource ds =null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/myproject");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String INSERT_STMT =
			"INSERT INTO COMMODITY_FAVORITE(MEM_ID,COM_ID) VALUES(?,?)";
	private static final String DELETE_STMT=
			"DELETE FROM COMMODITY_FAVORITE WHERE MEM_ID = ? AND COM_ID = ?";
	private static final String FINDBYMEMID=
			"SELECT * FROM myproject.commodity_favorite where MEM_ID = ?;";
	
	@Override
	public void insert(ComfVO comfVO) {
		// TODO Auto-generated method stub
		Connection con =null;
		PreparedStatement pstmt =null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setInt(1,comfVO.getMemID());
			pstmt.setInt(2,comfVO.getComID());
			
			pstmt.executeUpdate();
			
		}catch(SQLException se) {
			se.printStackTrace();
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
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE_STMT);
			pstmt.setInt(1,comfVO.getMemID());
			pstmt.setInt(2,comfVO.getComID());
			
			pstmt.executeUpdate();
			
		}catch(SQLException se) {
			se.printStackTrace();
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
	public ComfVO findByMemID(int memID) {
		// TODO Auto-generated method stub
		ComfVO comfVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FINDBYMEMID);
			pstmt.setInt(1,memID);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				comfVO = new ComfVO();
				comfVO.setMemID(rs.getInt("MEM_ID"));
				comfVO.setComID(rs.getInt("COM_ID"));
				
			}
			
		}catch(SQLException se) {
			se.printStackTrace();
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
		return comfVO;
	}

	@Override
	public Set favCom(String memID) {
		// TODO Auto-generated method stub
		Set set=new HashSet();
		Jedis jedis = new Jedis("localhost", 6379);
		jedis.auth("123456");		
		try {
			set =jedis.smembers(memID);
		}finally {
			jedis.close();
		}
		return set;
	}

	@Override
	public void insertByRedis(String memID, String comID) {
		// TODO Auto-generated method stub
		Jedis jedis = new Jedis("localhost", 6379);
		jedis.auth("123456");
		try {
			jedis.sadd(memID, comID);
		}finally {
			jedis.close();
		}
		
	}

	@Override
	public void deleteByRedis(String memID, String comID) {
		// TODO Auto-generated method stub
		Jedis jedis = new Jedis("localhost", 6379);
		jedis.auth("123456");
		try {
			jedis.srem(memID, comID);
		}finally {
			jedis.close();
		}
	}

	@Override
	public Boolean check(String memID, String comID) {
		// TODO Auto-generated method stub
		Jedis jedis = new Jedis("localhost", 6379);
		jedis.auth("123456");
		Boolean check =true;
		try {
			check =jedis.sismember(memID, comID);
		}finally {
			jedis.close();
		}
		return check;
	}

}

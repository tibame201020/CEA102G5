package com.recipe.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.recipe_ingredients.model.ReciDAO;
import com.recipe_ingredients.model.ReciVO;
import com.recipe_step.model.RecsDAO;
import com.recipe_step.model.RecsVO;

public class RecDAO implements RecDAO_interface {
	private static DataSource ds = null;
	
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/myproject");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
	//SQL指令
	private static final String INSERT_STMT = "INSERT INTO RECIPE (MEM_ID,REC_NAME,REC_PICTURE_1\r\n" + 
			",REC_CAL,REC_CARB,REC_PROT,REC_FAT,REC_STATUS,\r\n" + 
			"REC_BONUS,REC_CONTENT,REC_SIZE,REC_COOKTIME)VALUES(?,?,?,?,?,?,?,?,?,?,?,?);";
	private static final String GET_ALL_STMT ="SELECT * FROM RECIPE ORDER BY REC_TIME DESC";
	private static final String GET_ONE_STMT ="SELECT * FROM RECIPE WHERE REC_ID = ?";
	private static final String UPDATE_STATUS_STMT = "UPDATE RECIPE SET REC_STATUS=? ,REC_BONUS=? WHERE REC_ID=?";
	private static final String UPDATE_BONUS_STMT = "UPDATE RECIPE SET REC_BONUS=? WHERE MEM_ID=?";
	private static final String GET_ALL_BY_MEMID_STMT = "SELECT * FROM RECIPE WHERE MEM_ID=?";
	private static final String UPDATE_RECIPE_STMT ="UPDATE RECIPE SET REC_NAME=? ,"
			+ "REC_PICTURE_1=?,REC_CAL=?,REC_CARB=?,REC_PROT=?,REC_FAT=?,REC_STATUS=?,REC_CONTENT=?,"
			+ "REC_SIZE=?,REC_COOKTIME=? WHERE REC_ID=?";
	private static final String GET_ALL_BY_STATUS = "SELECT * FROM RECIPE WHERE REC_STATUS=? ORDER BY REC_TIME DESC";
	
	@Override
	public void insertWithReciRecs(RecVO recVO,List<ReciVO> reciList,List<RecsVO> recsList) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			con.setAutoCommit(false);
			
			//1.新增食譜主檔
			int cols[]= {1};
			pstmt = con.prepareStatement(INSERT_STMT,cols);
			
			pstmt.setInt(1, recVO.getMemID());
			pstmt.setString(2, recVO.getRecName());
			pstmt.setBytes(3, recVO.getRecPicture1());
			pstmt.setFloat(4, recVO.getRecCal());
			pstmt.setFloat(5, recVO.getRecCarb());
			pstmt.setFloat(6, recVO.getRecProtein());
			pstmt.setFloat(7, recVO.getRecFat());
			pstmt.setInt(8, recVO.getRecStatus());
			pstmt.setInt(9, recVO.getRecBonus());
			pstmt.setString(10, recVO.getRecContent());
			pstmt.setInt(11, recVO.getRecSize());
			pstmt.setInt(12, recVO.getRecCooktime());
			
			pstmt.executeUpdate();
			
			Integer recID = null;
			ResultSet rs = pstmt.getGeneratedKeys();
			if(rs.next()) {
				recID = rs.getInt(1);
				System.out.println("Auto PKID is  " + recID +"(success!)");
			}else {
				System.out.println("fail to get AutoID");
			}
			rs.close();
			
			//再新增食譜食材表
			ReciDAO reciDAO = new ReciDAO();
			for(ReciVO reciVO : reciList) {
				reciVO.setRecID(recID);
				reciDAO.insertReci(reciVO, con);
			}
			
			//再新增步驟
			RecsDAO recsDAO = new RecsDAO();
			for(RecsVO recsVO : recsList) {
				recsVO.setRecID(recID);
				recsDAO.insertRecs(recsVO, con);
			}
			
			con.commit();
			con.setAutoCommit(true);
			System.out.println("新增食譜編號:" +recID+"時，共有"+reciList.size()+"筆食材&"+recsList.size()+"段步驟被新增進資料庫了");
			
			
			
			

		} catch (SQLException se) {
			if(con!=null) {
				try {
					System.err.print("Transaction is being ");
					System.err.println("rolled back by recDAO");
					con.rollback();
				} catch (SQLException excep) {
					throw new RuntimeException("rollback error occured. "
							+ excep.getMessage());
				}
			}
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
		
	}

	@Override
	public void update(RecVO recVO,List<ReciVO> reciList,List<RecsVO> recsList) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			con.setAutoCommit(false);
			Integer recID = recVO.getRecID();
			
			//先更新食譜主檔
			pstmt = con.prepareStatement(UPDATE_RECIPE_STMT);
			
			pstmt.setString(1, recVO.getRecName());
			pstmt.setBytes(2, recVO.getRecPicture1());
			pstmt.setFloat(3, recVO.getRecCal());
			pstmt.setFloat(4, recVO.getRecCarb());
			pstmt.setFloat(5, recVO.getRecProtein());
			pstmt.setFloat(6, recVO.getRecFat());
			pstmt.setInt(7, 1);
			pstmt.setString(8, recVO.getRecContent());
			pstmt.setInt(9, recVO.getRecSize());
			pstmt.setInt(10, recVO.getRecCooktime());
			pstmt.setInt(11, recID);
			
			pstmt.executeUpdate();
			
			//先刪除舊食材再更新食材
			ReciDAO reciDAO = new ReciDAO();
			reciDAO.deleteByRecID(recID, con);
			for(ReciVO reciVO : reciList) {
				reciVO.setRecID(recID);
				reciDAO.insertReci(reciVO, con);
			}
			
			//先刪除舊步驟再更新步驟
			RecsDAO recsDAO = new RecsDAO();
			recsDAO.deleteByRecID(recID, con);
			for(RecsVO recsVO : recsList) {
				recsVO.setRecID(recID);
				recsDAO.insertRecs(recsVO, con);
			}
			
			
			con.commit();
			con.setAutoCommit(true);
			System.out.println("修改食譜編號:" + recID +"時，共有"+reciList.size()+"筆食材&"+recsList.size()+"段步驟同時在資料庫被修改了");
		} catch (SQLException se) {
			if(con!=null) {
				try {
					System.err.print("Transaction is being ");
					System.err.println("rolled back by recDAO");
					con.rollback();
				} catch (SQLException excep) {
					throw new RuntimeException("rollback error occured. "
							+ excep.getMessage());
				}
			}
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
		
		
	}
	
	@Override
	public void delete(Integer recID) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public RecVO findByPrimaryKey(Integer recID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		RecVO recVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, recID);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				recVO = new RecVO();
				recVO.setRecID(rs.getInt("REC_ID"));
				recVO.setMemID(rs.getInt("MEM_ID"));
				recVO.setRecName(rs.getString("REC_NAME"));
				recVO.setRecPicture1(rs.getBytes("REC_PICTURE_1"));
				recVO.setRecCal(rs.getFloat("REC_CAL"));
				recVO.setRecCarb(rs.getFloat("REC_CARB"));
				recVO.setRecProtein(rs.getFloat("REC_PROT"));
				recVO.setRecFat(rs.getFloat("REC_FAT"));
				recVO.setRecStatus(rs.getInt("REC_STATUS"));
				recVO.setRecBonus(rs.getInt("REC_BONUS"));
				recVO.setRecContent(rs.getString("REC_CONTENT"));
				recVO.setRecSize(rs.getInt("REC_SIZE"));
				recVO.setRecCooktime(rs.getInt("REC_COOKTIME"));
				recVO.setRecTime(rs.getDate("REC_TIME"));
				recVO.setRecADate(rs.getDate("REC_ADATE"));
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
		return recVO;
	}

	@Override
	public List<RecVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<RecVO> list = new ArrayList<RecVO>();
		RecVO recVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				recVO = new RecVO();
				recVO.setRecID(rs.getInt("REC_ID"));
				recVO.setMemID(rs.getInt("MEM_ID"));
				recVO.setRecName(rs.getString("REC_NAME"));
				recVO.setRecCal(rs.getFloat("REC_CAL"));
				recVO.setRecCarb(rs.getFloat("REC_CARB"));
				recVO.setRecProtein(rs.getFloat("REC_PROT"));
				recVO.setRecFat(rs.getFloat("REC_FAT"));
				recVO.setRecStatus(rs.getInt("REC_STATUS"));
				recVO.setRecBonus(rs.getInt("REC_BONUS"));
				recVO.setRecContent(rs.getString("REC_CONTENT"));
				recVO.setRecSize(rs.getInt("REC_SIZE"));
				recVO.setRecCooktime(rs.getInt("REC_COOKTIME"));
				recVO.setRecTime(rs.getDate("REC_TIME"));
				recVO.setRecADate(rs.getDate("REC_ADATE"));
				
				list.add(recVO);
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

	@Override
	public List<RecVO> getAllByMemID(Integer memID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<RecVO> list = new ArrayList<RecVO>();
		RecVO recVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_BY_MEMID_STMT);
			
			pstmt.setInt(1, memID);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				recVO = new RecVO();
				recVO.setRecID(rs.getInt("REC_ID"));
				recVO.setMemID(rs.getInt("MEM_ID"));
				recVO.setRecName(rs.getString("REC_NAME"));
				recVO.setRecCal(rs.getFloat("REC_CAL"));
				recVO.setRecCarb(rs.getFloat("REC_CARB"));
				recVO.setRecProtein(rs.getFloat("REC_PROT"));
				recVO.setRecFat(rs.getFloat("REC_FAT"));
				recVO.setRecStatus(rs.getInt("REC_STATUS"));
				recVO.setRecBonus(rs.getInt("REC_BONUS"));
				recVO.setRecContent(rs.getString("REC_CONTENT"));
				recVO.setRecSize(rs.getInt("REC_SIZE"));
				recVO.setRecCooktime(rs.getInt("REC_COOKTIME"));
				recVO.setRecTime(rs.getDate("REC_TIME"));
				recVO.setRecADate(rs.getDate("REC_ADATE"));
				
				list.add(recVO);
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

	@Override
	public List<RecVO> getAllByCondition(String column,String value) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<RecVO> list = new ArrayList<RecVO>();
		RecVO recVO = null;

		try {
			con = ds.getConnection();
			String sql = getSqlStmt(column, value);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				recVO = new RecVO();
				recVO.setRecID(rs.getInt("REC_ID"));
				recVO.setMemID(rs.getInt("MEM_ID"));
				recVO.setMemName(rs.getString("MEM_NAME"));
				recVO.setRecName(rs.getString("REC_NAME"));
				recVO.setRecCal(rs.getFloat("REC_CAL"));
				recVO.setRecContent(rs.getString("REC_CONTENT"));
				
				list.add(recVO);
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

	@Override
	public void updateStatus(Integer recStatus,Integer recID, Integer recBonus) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STATUS_STMT);
			
				pstmt.setInt(1, recStatus);
				pstmt.setInt(2, recBonus);
				pstmt.setInt(3, recID);
				
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
	
	public String getSqlStmt(String column ,String value) {
		String sql = "SELECT REC_ID,R.MEM_ID,MEM_NAME,REC_NAME,REC_CAL,REC_CONTENT \r\n" + 
				"FROM RECIPE R LEFT JOIN MEMBER_INFO M ON R.MEM_ID = M.MEM_ID\r\n" + 
				"WHERE "+ column +" LIKE '%" + value + "%'"; 
		
		return sql;
	}

	@Override
	public List<RecVO> getAllByStatus(Integer recStatus) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<RecVO> list = new ArrayList<RecVO>();
		RecVO recVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_BY_STATUS);
			pstmt.setInt(1, recStatus);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				recVO = new RecVO();
				recVO.setRecID(rs.getInt("REC_ID"));
				recVO.setMemID(rs.getInt("MEM_ID"));
				recVO.setRecName(rs.getString("REC_NAME"));
				recVO.setRecCal(rs.getFloat("REC_CAL"));
				recVO.setRecCarb(rs.getFloat("REC_CARB"));
				recVO.setRecProtein(rs.getFloat("REC_PROT"));
				recVO.setRecFat(rs.getFloat("REC_FAT"));
				recVO.setRecStatus(rs.getInt("REC_STATUS"));
				recVO.setRecBonus(rs.getInt("REC_BONUS"));
				recVO.setRecContent(rs.getString("REC_CONTENT"));
				recVO.setRecSize(rs.getInt("REC_SIZE"));
				recVO.setRecCooktime(rs.getInt("REC_COOKTIME"));
				recVO.setRecTime(rs.getDate("REC_TIME"));
				recVO.setRecADate(rs.getDate("REC_ADATE"));
				
				list.add(recVO);
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

	@Override
	public void updateBonus(Integer memID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_BONUS_STMT);
			
				pstmt.setInt(1, 0);
				pstmt.setInt(2, memID);

				
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

}

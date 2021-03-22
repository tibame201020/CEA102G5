package com.commodity.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.commodity_favorite.model.ComfService;
import com.mysql.cj.protocol.Resultset;
import com.util.model.ComCommentVO;

public class ComDAO implements ComDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/myproject");
		} catch (NamingException e) {			
			e.printStackTrace();
		}
	}
	//SQL指令
	private static final String INSERT_STMT = 
	"INSERT INTO COMMODITY(COMC_ID,COM_NAME,COM_PRICE,COM_PICTURE,COM_CONTENT,COM_STATUS,"
	+ "COM_WEIGHT,COM_UNIT,COM_CAL,COM_CARB,COM_PRO,COM_FAT,COM_PROP,COM_PICTURE2) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	
	private static final String GET_ALL_STMT =
	"SELECT * FROM COMMODITY ORDER BY COM_ID";
	
	private static final String GET_ALL_FOR_COMINDEX_STMT = 
	"SELECT C.COM_ID,COM_NAME,COM_PRICE,SUM(ORDD_COUNT) AS COM_SALES \r\n" + 
	"FROM COMMODITY C LEFT JOIN ORDER_DETAIL D ON C.COM_ID = D.COM_ID\r\n" + 
	"GROUP BY C.COM_ID\r\n" + 
	"ORDER BY COM_SALES DESC";
	
	private static final String GET_ONE_STMT = 
	"SELECT * FROM COMMODITY WHERE COM_ID=?";
	
	private static final String UPDATE =
	"UPDATE COMMODITY SET COM_NAME=?,COM_PRICE=?,COM_PICTURE=?,COM_CONTENT=?,COM_STATUS=?,COM_WEIGHT=? ,"
	+ "COM_UNIT=?,COM_CAL=?,COM_CARB=?,COM_PRO=?,COM_FAT=?,COM_PROP=? WHERE COM_ID=?";
	
	private static final String UPDATE2 =
			"UPDATE COMMODITY SET COM_NAME=?,COM_PRICE=?,COM_CONTENT=?,COM_STATUS=?,COM_WEIGHT=? ,"
			+ "COM_UNIT=?,COM_CAL=?,COM_CARB=?,COM_PRO=?,COM_FAT=?,COM_PROP=? WHERE COM_ID=?";
	
	private static final String DELETE =
	"DELETE FROM COMMODITY WHERE COM_ID=?";
	
	private static final String GET_ALL_COM_COMMENT = 
			"SELECT M.MEM_ID,MEM_NAME,COM_ID,ORDD_MESSAGE,ORDD_POINT,ORDD_RESPONSE \r\n" + 
			"FROM ORDER_DETAIL D LEFT JOIN order_master M ON D.ORDM_ID = M.ORDM_ID\r\n" + 
			"LEFT JOIN MEMBER_INFO I ON M.MEM_ID = I.MEM_ID\r\n" + 
			"WHERE COM_ID=? AND ORDD_MESSAGE IS NOT NULL";
	private static final String GET_ALL_COMBYCOMID = 
			"SELECT * FROM myproject.commodity where COM_ID=?";
	
	@Override
	public void insert(ComVO comVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setInt(1,comVO.getComcID());
			pstmt.setString(2, comVO.getComName());
			pstmt.setInt(3,comVO.getComPrice());
			
			
			pstmt.setBytes(4, comVO.getComPicture());
			pstmt.setString(5, comVO.getComContent());
			pstmt.setInt(6, comVO.getComStatus());
			pstmt.setInt(7, comVO.getComWeight());
			pstmt.setString(8, comVO.getComUnit());
			pstmt.setFloat(9, comVO.getComCal());
			pstmt.setFloat(10, comVO.getComCarb());
			pstmt.setFloat(11, comVO.getComPro());
			pstmt.setFloat(12, comVO.getComFat());
			pstmt.setString(13,comVO.getComProp());
			pstmt.setBytes(14, comVO.getComPicture2());
			
			pstmt.executeUpdate();
			
		} catch (SQLException se) {
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
	public void update(ComVO comVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			
			if(comVO.getComPicture().length != 0) {
			pstmt = con.prepareStatement(UPDATE);
			
		
			pstmt.setString(1, comVO.getComName());
			pstmt.setInt(2,comVO.getComPrice());
			pstmt.setBytes(3, comVO.getComPicture());
			pstmt.setString(4, comVO.getComContent());
			pstmt.setInt(5, comVO.getComStatus());
			pstmt.setInt(6, comVO.getComWeight());
			pstmt.setString(7, comVO.getComUnit());
			pstmt.setFloat(8, comVO.getComCal());
			pstmt.setFloat(9, comVO.getComCarb());
			pstmt.setFloat(10, comVO.getComPro());
			pstmt.setFloat(11, comVO.getComFat());
			pstmt.setString(12,comVO.getComProp());
			pstmt.setInt(13, comVO.getComID());
			
			
			
			pstmt.executeUpdate();
			
			
			}else {
				pstmt = con.prepareStatement(UPDATE2);
				pstmt.setString(1, comVO.getComName());
				pstmt.setInt(2,comVO.getComPrice());
				pstmt.setString(3, comVO.getComContent());
				pstmt.setInt(4, comVO.getComStatus());
				pstmt.setInt(5, comVO.getComWeight());
				pstmt.setString(6, comVO.getComUnit());
				pstmt.setFloat(7, comVO.getComCal());
				pstmt.setFloat(8, comVO.getComCarb());
				pstmt.setFloat(9, comVO.getComPro());
				pstmt.setFloat(10, comVO.getComFat());
				pstmt.setString(11,comVO.getComProp());
				pstmt.setInt(12, comVO.getComID());
				
				pstmt.executeUpdate();
				
			}
			
			
		} catch (SQLException se) {	
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
	public void delete(int comID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setInt(1, comID);
			pstmt.executeUpdate();
			
		} catch (SQLException se) {
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
	public ComVO findByPrimaryKey(int comID) {
		ComVO comVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con=ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setInt(1, comID);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				comVO = new ComVO();
				comVO.setComID(rs.getInt("COM_ID"));
				comVO.setComcID(rs.getInt("COMC_ID"));
				comVO.setComName(rs.getString("COM_NAME"));
				comVO.setComPrice(rs.getInt("COM_PRICE"));
				
				comVO.setComContent(rs.getString("COM_CONTENT"));
				comVO.setComStatus(rs.getInt("COM_STATUS"));
				comVO.setComWeight(rs.getInt("COM_WEIGHT"));
				comVO.setComUnit(rs.getString("COM_UNIT"));
				comVO.setComCal(rs.getFloat("COM_CAL"));
				comVO.setComCarb(rs.getFloat("COM_CARB"));
				comVO.setComPro(rs.getFloat("COM_PRO"));
				comVO.setComFat(rs.getFloat("COM_FAT"));
				comVO.setComProp(rs.getString("COM_PROP"));
			
				comVO.setComTime(rs.getDate("COM_TIME"));
			}

		} catch (SQLException se) {
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
		
		return comVO;
	}

	@Override
	public List<ComVO> getAll() {
		List<ComVO> list = new ArrayList<ComVO>();
		ComVO comVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				comVO = new ComVO();
				comVO.setComID(rs.getInt("COM_ID"));
				comVO.setComcID(rs.getInt("COMC_ID"));
				comVO.setComName(rs.getString("COM_NAME"));
				comVO.setComPrice(rs.getInt("COM_PRICE"));
				comVO.setComPicture(rs.getBytes("COM_PICTURE"));
				comVO.setComContent(rs.getString("COM_CONTENT"));
				comVO.setComStatus(rs.getInt("COM_STATUS"));
				comVO.setComWeight(rs.getInt("COM_WEIGHT"));
				comVO.setComUnit(rs.getString("COM_UNIT"));
				comVO.setComCal(rs.getFloat("COM_CAL"));
				comVO.setComCarb(rs.getFloat("COM_CARB"));
				comVO.setComPro(rs.getFloat("COM_PRO"));
				comVO.setComFat(rs.getFloat("COM_FAT"));
				comVO.setComProp(rs.getString("COM_PROP"));
				comVO.setComTime(rs.getDate("COM_TIME"));
				
				list.add(comVO);
				
			}
			
			
		} catch (SQLException se) {
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

	//萬用複合查詢
	@Override
	public List<ComVO> getAll(Map<String, String[]> map) {
		List<ComVO> list = new ArrayList<ComVO>();
		ComVO comVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			String finalSQL = "SELECT * FROM COMMODITY "+
			jdbc.util.compositequery.CompositQuery.get_WhereCondition(map)+"ORDER BY COM_ID DESC";
			
			pstmt = con.prepareStatement(finalSQL);
			System.out.println("finalSQL(byDAO) = " + finalSQL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				comVO = new ComVO();
				comVO.setComID(rs.getInt("COM_ID"));
				comVO.setComcID(rs.getInt("COMC_ID"));
				comVO.setComName(rs.getString("COM_NAME"));
				comVO.setComPrice(rs.getInt("COM_PRICE"));

				comVO.setComContent(rs.getString("COM_CONTENT"));
				comVO.setComStatus(rs.getInt("COM_STATUS"));
				comVO.setComWeight(rs.getInt("COM_WEIGHT"));
				comVO.setComUnit(rs.getString("COM_UNIT"));
				comVO.setComCal(rs.getFloat("COM_CAL"));
				comVO.setComCarb(rs.getFloat("COM_CARB"));
				comVO.setComPro(rs.getFloat("COM_PRO"));
				comVO.setComFat(rs.getFloat("COM_FAT"));
				comVO.setComProp(rs.getString("COM_PROP"));
				comVO.setComTime(rs.getDate("COM_TIME"));
				
				list.add(comVO);
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured."+se.getMessage());
		} finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
			}
			
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
			}
		}
		
		return list;
	}

	@Override
	public List<ComVO> getAllForComindex() {
		List<ComVO> list = new ArrayList<ComVO>();
		ComVO comVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_FOR_COMINDEX_STMT);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				comVO = new ComVO();
				comVO.setComID(rs.getInt("COM_ID"));
				comVO.setComName(rs.getString("COM_NAME"));
				comVO.setComPrice(rs.getInt("COM_PRICE"));
				comVO.setComSales(rs.getInt("COM_SALES"));
				
				list.add(comVO);
			}
			
			
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured."+se.getMessage());
		} finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
			}
			
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
			}
		}
		return list;
	}

	@Override
	public List<ComCommentVO> getAllComComment(Integer comID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ComCommentVO comComtVO = null;
		List<ComCommentVO> list = new ArrayList<ComCommentVO>();
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_COM_COMMENT);
			pstmt.setInt(1, comID);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				comComtVO = new ComCommentVO();
				comComtVO.setMemID(rs.getInt("MEM_ID"));
				comComtVO.setMemName(rs.getString("MEM_NAME"));
				comComtVO.setOdMessage(rs.getString("ORDD_MESSAGE"));
				comComtVO.setOdPoint(rs.getInt("ORDD_POINT"));
				comComtVO.setOdResponse(rs.getString("ORDD_RESPONSE"));
				
				list.add(comComtVO);
			}
			
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured."+se.getMessage());
		} finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
			}
			
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
			}
		}
		
		return list;
	}

	@Override
	public List<ComVO> getFavorite(int memID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ComVO comVO = null;
		List<ComVO> list = new ArrayList<ComVO>();
		String memIDS =Integer.toString(memID);
		try {
			ComfService comfSvc =new ComfService();
			Set<String> set = comfSvc.favCom(memIDS);
			System.out.println(set);
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_COMBYCOMID);
			for(String comIDS:set) {
				Integer comID = Integer.parseInt(comIDS);
				pstmt.setInt(1, comID);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					comVO = new ComVO();
					comVO.setComID(rs.getInt("COM_ID"));
					comVO.setComcID(rs.getInt("COMC_ID"));
					comVO.setComName(rs.getString("COM_NAME"));
					comVO.setComPrice(rs.getInt("COM_PRICE"));

					comVO.setComContent(rs.getString("COM_CONTENT"));
					comVO.setComStatus(rs.getInt("COM_STATUS"));
					comVO.setComWeight(rs.getInt("COM_WEIGHT"));
					comVO.setComUnit(rs.getString("COM_UNIT"));
					comVO.setComCal(rs.getFloat("COM_CAL"));
					comVO.setComCarb(rs.getFloat("COM_CARB"));
					comVO.setComPro(rs.getFloat("COM_PRO"));
					comVO.setComFat(rs.getFloat("COM_FAT"));
					comVO.setComProp(rs.getString("COM_PROP"));
					comVO.setComTime(rs.getDate("COM_TIME"));
					
					list.add(comVO);
				}
			}
			
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured."+se.getMessage());
		} finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
			}
			
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
			}
		}
		
		return list;
	}
	public static void main(String[] args) {
		ComDAO com =new ComDAO();
		List list=com.getFavorite(1);
		ComVO comvo =(ComVO) list.get(1);
		System.out.println(comvo.getComID());
	}

}

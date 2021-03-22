package com.lesson_reservation.model;

import java.util.*;
import java.sql.*;
import java.sql.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lesson.model.LesVO;

public class LesrDAO implements LesrDAO_interface {

	// 一個應用程式中,針對一個資料庫 ,共用一個DataSource即可
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/myproject");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = 
		"INSERT INTO lesson_reservation (les_ID,mem_ID,lesr_comments,lesr_answer,lesr_Status,lesr_Reason) VALUES (?,?,?,?,?,?)";
	private static final String GET_ALL_STMT = 
		"SELECT les_ID,mem_ID,lesr_comments,lesr_answer,lesr_Status,lesr_Reason,lesr_Time FROM lesson_reservation order by les_ID";
	private static final String GET_ONE = 
		"SELECT * FROM lesson_reservation where les_ID=? and mem_ID=? ";
	private static final String GET_BY_MEM = 
		 "select a.les_id, a.mem_id ,a.lesr_status,a.lesr_reason,a.lesr_comments,a.lesr_answer,b.les_date from lesson_reservation a join lesson b on a.LES_ID=b.LES_ID where a.mem_ID=? order by b.les_date";
		
	private static final String GET_BY_LESSON = 
		"SELECT * FROM lesson_reservation where les_ID=? order by mem_ID";
	private static final String DELETE = 
		"DELETE FROM lesson_reservation where les_ID =? and mem_ID = ?";
	private static final String UPDATE = 
		"UPDATE lesson_reservation set lesr_comments=?,lesr_answer=?,lesr_Status=?,lesr_Reason=?, lesr_time=? where les_ID = ? and mem_ID=?";
	private static final String UPDATELES = 
		"UPDATE lesson set les_already=? where les_ID = ?";
	private static final String SEARCH = 
		"SELECT * FROM lesson_reservation where mem_ID=? and les_ID =?";
	@Override
	public void insert(LesrVO lesrVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
		
			pstmt.setInt(1, lesrVO.getLesID());
			pstmt.setInt(2, lesrVO.getMemID());
			pstmt.setString(3, lesrVO.getLesrComments());
			pstmt.setString(4, lesrVO.getLesrAnswer());
			pstmt.setBoolean(5, lesrVO.getLesrStatus());
			pstmt.setString(6, lesrVO.getLesrReason());		
			pstmt.executeUpdate();

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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
	public void update(LesrVO lesrVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setString(1, lesrVO.getLesrComments());
			pstmt.setString(2, lesrVO.getLesrAnswer());
			pstmt.setBoolean(3, lesrVO.getLesrStatus());
			pstmt.setString(4, lesrVO.getLesrReason());
			pstmt.setDate(5,lesrVO.getLesrTime());
			pstmt.setInt(6, lesrVO.getLesID());
			pstmt.setInt(7, lesrVO.getMemID());
			
			

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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
    
	public void updateLes(LesVO lesVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATELES);
			
			pstmt.setInt(1, lesVO.getLesAlready());			
			pstmt.setInt(2, lesVO.getLesID());
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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
	public void delete(Integer lesID, Integer memID) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, lesID);
			pstmt.setInt(2, memID);
			

			pstmt.executeUpdate();
			
			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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
	public LesrVO findByPrimaryKey(Integer lesID ,Integer memID) {

		LesrVO lesrVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE);

			pstmt.setInt(1, lesID);
			pstmt.setInt(2, memID);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// TalVO 也稱為 Domain objects
				lesrVO = new LesrVO();
				lesrVO.setLesID(rs.getInt("les_ID"));		
				lesrVO.setMemID(rs.getInt("mem_ID"));
				lesrVO.setLesrComments(rs.getString("lesr_comments"));
				lesrVO.setLesrAnswer(rs.getString("lesr_answer"));
				lesrVO.setLesrStatus(rs.getBoolean("lesr_status"));
				lesrVO.setLesrReason(rs.getString("lesr_reason"));
				lesrVO.setLesrTime(rs.getDate("lesr_time"));
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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
		return lesrVO;
	}
	
	 public Set<LesrVO> getLesByMem(Integer memID) {
		Set<LesrVO> set = new LinkedHashSet<LesrVO>();
		LesrVO lesrVO = null;
	
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try {
	
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_BY_MEM);
			pstmt.setInt(1, memID);
			rs = pstmt.executeQuery();
	
			while (rs.next()) {
				lesrVO = new LesrVO();
				lesrVO.setLesID(rs.getInt("les_ID"));		
				lesrVO.setMemID(rs.getInt("mem_ID"));
				lesrVO.setLesrComments(rs.getString("lesr_comments"));
				lesrVO.setLesrAnswer(rs.getString("lesr_answer"));
				lesrVO.setLesrStatus(rs.getBoolean("lesr_status"));
				lesrVO.setLesrReason(rs.getString("lesr_reason"));
				lesrVO.setLesDate(rs.getDate("les_date"));
				lesrVO.setLesrTimeLong((lesrVO.getLesDate().getTime())/1000);
				set.add(lesrVO); // Store the row in the vector
			}
	
			// Handle any SQL errors
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
		return set;
	}
	 public Set<LesrVO> getMemByLes(Integer lesID) {
			Set<LesrVO> set = new LinkedHashSet<LesrVO>();
			LesrVO lesrVO = null;
		
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
		
			try {
		
				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_BY_LESSON);
				pstmt.setInt(1, lesID);
				rs = pstmt.executeQuery();
		
				while (rs.next()) {
					lesrVO = new LesrVO();
					lesrVO.setLesID(rs.getInt("les_ID"));		
					lesrVO.setMemID(rs.getInt("mem_ID"));
					lesrVO.setLesrComments(rs.getString("lesr_comments"));
					lesrVO.setLesrAnswer(rs.getString("lesr_answer"));
					lesrVO.setLesrStatus(rs.getBoolean("lesr_status"));
					lesrVO.setLesrReason(rs.getString("lesr_reason"));
					lesrVO.setLesrTime(rs.getDate("lesr_time"));
					set.add(lesrVO); // Store the row in the vector
				}
		
				// Handle any SQL errors
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
			return set;
		}
	@Override
	public List<LesrVO> getAll() {
		List<LesrVO> list = new ArrayList<LesrVO>();
		LesrVO lesrVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// TalVO 也稱為 Domain objects
				lesrVO = new LesrVO();
				lesrVO.setLesID(rs.getInt("les_ID"));		
				lesrVO.setMemID(rs.getInt("mem_ID"));
				lesrVO.setLesrComments(rs.getString("lesr_comments"));
				lesrVO.setLesrAnswer(rs.getString("lesr_answer"));
				lesrVO.setLesrStatus(rs.getBoolean("lesr_status"));
				lesrVO.setLesrReason(rs.getString("lesr_reason"));
				lesrVO.setLesrTime(rs.getDate("lesr_time"));
				list.add(lesrVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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
	public Boolean search(Integer memID, Integer lesID) {

		Boolean bo = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(SEARCH);

			pstmt.setInt(1, memID);
			pstmt.setInt(2, lesID);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				bo = true;
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
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
		return bo;
	}

}

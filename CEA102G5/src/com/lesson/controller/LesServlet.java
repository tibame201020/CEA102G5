package com.lesson.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import org.json.JSONArray;
import org.json.JSONObject;

import com.lesson.model.LesService;
import com.lesson.model.LesVO;

@MultipartConfig
public class LesServlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		String action = req.getParameter("action");
		if (action.equals("add")) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
			LesVO lesVO = new LesVO();
			try {
				// 接參數
				Integer coaID = new Integer(req.getParameter("coaID"));
				Integer talID = new Integer(req.getParameter("talID"));

				String lesName = req.getParameter("lesName").trim();
				String lesNameReg = "^[\\W_a-zA-Z]{2,30}$";
				if (lesName == null || lesName.length() == 0) {
					errorMsgs.put("lesName", "新增時請勿空白");
				} else if (!lesName.matches(lesNameReg)) {
					errorMsgs.put("lesName", "新增時，長度需在2到30間(只能中英文)");
				} else {
					lesVO.setLesName(lesName);
				}
				String dateReg = "^((((19|20)\\d{2})-(0?(1|[3-9])|1[012])-(0?[1-9]|[12]\\d|30))|(((19|20)\\d{2})-(0?[13578]|1[02])-31)|(((19|20)\\d{2})-0?2-(0?[1-9]|1\\d|2[0-8]))|((((19|20)([13579][26]|[2468][048]|0[48]))|(2000))-0?2-29))$";
				String lesDateStr = req.getParameter("lesDate").trim();
				java.sql.Date lesDate = null;
				if (!lesDateStr.matches(dateReg)) {
					errorMsgs.put("lesDate", "格式錯誤");
				} else {
					lesDate = strToDate(lesDateStr);
					lesVO.setLesDate(lesDate);
				}
				String lesTime = req.getParameter("lesTime").trim();
				String lesTimeReg = "^(0?[0-9]|1[0-9]|2[0-3]):[0-5][0-9]-(0?[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$";
				if (!lesTime.matches(lesTimeReg)) {
					errorMsgs.put("lesTime", "格式不正確");
				} else {
					int begin = lesTime.indexOf(":");
					int end = lesTime.lastIndexOf(":");
					Integer timeBegin = new Integer(lesTime.substring(begin - 2, begin));
					Integer timeEnd = new Integer(lesTime.substring(end - 2, end));
					if (timeEnd <= timeBegin) {
						errorMsgs.put("lesTime", "時間範圍最少為一小時");
					} else {
						lesVO.setLesTime(lesTime);
					}
				}
				// 起始日 截止日
				String lesBeginStr = req.getParameter("lesBegin").trim();
				java.sql.Date lesBegin = null;
				if (!lesBeginStr.matches(dateReg)) {
					errorMsgs.put("lesBegin", "格式錯誤");
				} else {
					lesBegin = strToDate(lesBeginStr);
					lesVO.setLesBegin(lesBegin);
				}
				String lesEndStr = req.getParameter("lesEnd").trim();
				java.sql.Date lesEnd = null;
				if (!lesEndStr.matches(dateReg)) {
					errorMsgs.put("lesEnd", "格式錯誤");
				} else {
					lesEnd = strToDate(lesEndStr);
					lesVO.setLesEnd(lesEnd);
				}
				// 人數上限 價格
				Integer lesAvailable = new Integer(req.getParameter("lesAvailable"));
				if (lesAvailable < 1) {
					errorMsgs.put("lesAvailable", "人數不可小於1");
				} else {
					lesVO.setLesAvailable(lesAvailable);
				}
				Integer lesPrice = new Integer(req.getParameter("lesPrice"));
				if (lesPrice < 1) {
					errorMsgs.put("lesPrice", "價格不可小於1");
				} else {
					lesVO.setLesPrice(lesPrice);
				}

				// 處理圖片影片
				Part pic = req.getPart("lesPicture");
				InputStream isp = pic.getInputStream();
				byte[] lesPicture = new byte[isp.available()];
				isp.read(lesPicture);
				isp.close();

				Part video = req.getPart("lesVideo");
				InputStream isv = video.getInputStream();
				byte[] lesVideo = new byte[isv.available()];
				isv.read(lesVideo);
				isv.close();

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("lesVO", lesVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/lesson/addLesson.jsp");
					failureView.forward(req, res);
					return;
				}

				LesService lesSvc = new LesService();
				lesSvc.addLesson(coaID, talID, lesName, lesDate, lesTime, lesBegin, lesEnd, lesPicture, lesVideo,
						lesAvailable, lesPrice);

				res.sendRedirect(req.getContextPath()+"/back_end/lesson/listAllLesson.jsp");
				return;
			} catch (Exception e) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/lesson/addLesson.jsp");
				failureView.forward(req, res);
				return;
			}
		}

		if (action.equals("update")) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
			LesVO lesVO = new LesVO();
			String reqUrl = req.getParameter("reqUrl");
			Integer nums = new Integer(req.getParameter("nums"));
			Integer page = new Integer(req.getParameter("page"));
			Integer total = new Integer(req.getParameter("total"));
			String orderBy = req.getParameter("orderBy");
			try {
				Integer lesID = new Integer(req.getParameter("lesID"));
				LesService lesSvc = new LesService();
				lesVO = lesSvc.searchOneByID(lesID);

				String lesName = req.getParameter("lesName").trim();
				String lesNameReg = "^[\\W_a-zA-Z]{2,30}$";
				if (lesName == null || lesName.length() == 0) {
					errorMsgs.put("lesName", "新增時請勿空白");
				} else if (!lesName.matches(lesNameReg)) {
					errorMsgs.put("lesName", "長度需在2到30間(只能中英文)");
				} else {
					lesVO.setLesName(lesName);
				}

				Integer lesPrice = new Integer(req.getParameter("lesPrice"));
				if (lesPrice < 1) {
					errorMsgs.put("lesPrice", "價格不可小於1");
				} else {
					lesVO.setLesPrice(lesPrice);
				}

				Part pic = req.getPart("lesPicture");
				InputStream isp = pic.getInputStream();
				byte[] lesPicture = new byte[isp.available()];
				isp.read(lesPicture);
				isp.close();

				Part video = req.getPart("lesVideo");
				InputStream isv = video.getInputStream();
				byte[] lesVideo = new byte[isv.available()];
				isv.read(lesVideo);
				isv.close();

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("reqUrl", reqUrl);
					req.setAttribute("lesVO", lesVO);
					req.setAttribute("page", page);
					req.setAttribute("nums", nums);
					req.setAttribute("total", total);
					req.setAttribute("orderBy", orderBy);
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/lesson/updateLesson.jsp");
					failureView.forward(req, res);
					return;
				}

				lesSvc.updateLesson(lesID, lesName, lesPrice, lesPicture, lesVideo);
				req.setAttribute("page", page);
				req.setAttribute("nums", nums);
				req.setAttribute("total", total);
				req.setAttribute("lesID", lesID);
				req.setAttribute("orderBy", orderBy);
				RequestDispatcher successView = req.getRequestDispatcher(reqUrl);
				successView.forward(req, res);
			} catch (Exception e) {
				req.setAttribute("reqUrl", reqUrl);
				req.setAttribute("lesVO", lesVO);
				req.setAttribute("page", page);
				req.setAttribute("nums", nums);
				req.setAttribute("orderBy", orderBy);
				req.setAttribute("total", total);
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/lesson/updateLesson.jsp");
				failureView.forward(req, res);
				return;
			}
		}
		
		if (action.equals("updateFromList")) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
			LesVO lesVO = new LesVO();
			try {
				Integer lesID = new Integer(req.getParameter("lesID"));
				LesService lesSvc = new LesService();
				lesVO = lesSvc.searchOneByID(lesID);

				String lesName = req.getParameter("lesName").trim();
				String lesNameReg = "^[\\W_a-zA-Z]{2,30}$";
				if (lesName == null || lesName.length() == 0) {
					errorMsgs.put("lesName", "新增時請勿空白");
				} else if (!lesName.matches(lesNameReg)) {
					errorMsgs.put("lesName", "長度需在2到30間(只能中英文)");
				} else {
					lesVO.setLesName(lesName);
				}

				Integer lesPrice = new Integer(req.getParameter("lesPrice"));
				if (lesPrice < 1) {
					errorMsgs.put("lesPrice", "價格不可小於1");
				} else {
					lesVO.setLesPrice(lesPrice);
				}

				Part pic = req.getPart("lesPicture");
				InputStream isp = pic.getInputStream();
				byte[] lesPicture = new byte[isp.available()];
				isp.read(lesPicture);
				isp.close();

				Part video = req.getPart("lesVideo");
				InputStream isv = video.getInputStream();
				byte[] lesVideo = new byte[isv.available()];
				isv.read(lesVideo);
				isv.close();

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("lesVO", lesVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/lesson/listAllLesson.jsp");
					failureView.forward(req, res);
					return;
				}

				lesSvc.updateLesson(lesID, lesName, lesPrice, lesPicture, lesVideo);
				res.sendRedirect(req.getContextPath()+"/back_end/lesson/listAllLesson.jsp");
			} catch (Exception e) {
				req.setAttribute("lesVO", lesVO);
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/lesson/listAllLesson.jsp");
				failureView.forward(req, res);
				return;
			}
		}


		if (action.equals("search")) {
			// 錯誤處理
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String successUrl = null;
			String failUrl = null;
			if (req.getParameter("reqUrl") != null) {
				successUrl = req.getParameter("reqUrl");
				failUrl = req.getParameter("reqUrl");
			} else {
				successUrl = "/back_end/lesson/listQueryLesson.jsp";
				failUrl = "/back_end/lesson/mainLesson.jsp";
			}
			try {
				// 判斷格式是否正確
				String dateReg = "^((((19|20)\\d{2})-(0?(1|[3-9])|1[012])-(0?[1-9]|[12]\\d|30))|(((19|20)\\d{2})-(0?[13578]|1[02])-31)|(((19|20)\\d{2})-0?2-(0?[1-9]|1\\d|2[0-8]))|((((19|20)([13579][26]|[2468][048]|0[48]))|(2000))-0?2-29))$";
				String[] lesDateArr = req.getParameterValues("LES_DATE");
				if (lesDateArr != null) {
					for (int i = 0; i < lesDateArr.length; i++) {
						if (lesDateArr[i].trim().length() != 0) {
							if (!lesDateArr[i].trim().matches(dateReg)) {
								errorMsgs.put("LES_DATE", "日期格式錯誤");
							}
						}
					}
				}

				HttpSession session = req.getSession();
				LinkedHashMap<String, String[]> query = new LinkedHashMap<String, String[]>(req.getParameterMap());
				// 轉交Svc
				LesService lesSvc = new LesService();
				Map<String, String> map = lesSvc.getAll(query);
				if (req.getParameter("reqUrl") != null) {
					session.setAttribute("sqlForFront", map.get("sql"));
				} else {
					session.setAttribute("sqlForBack", map.get("sql"));
				}

				req.setAttribute("total", map.get("total"));
				if (req.getParameter("init") != null) {
					res.setContentType("text/plain");
					res.setCharacterEncoding("UTF-8");
					PrintWriter out = res.getWriter();
					out.print(map.get("total"));
					out.flush();
					out.close();
					return;
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher(failUrl);
					failureView.forward(req, res);
					return;
				}
				RequestDispatcher successView = req.getRequestDispatcher(successUrl);
				successView.forward(req, res);
				return;
			} catch (Exception e) {
				RequestDispatcher failureView = req.getRequestDispatcher(failUrl);
				failureView.forward(req, res);
				return;
			}
		}
		if (action.equals("forUpdate")) {
			try {
				Integer lesID = new Integer(req.getParameter("lesID"));
				Integer page = new Integer(req.getParameter("page"));
				Integer nums = new Integer(req.getParameter("nums"));
				Integer total = new Integer(req.getParameter("total"));
				String orderBy = req.getParameter("orderBy");
				String reqUrl = req.getParameter("reqUrl");
				LesService lesSvc = new LesService();
				LesVO lesVO = lesSvc.searchOneByID(lesID);
				req.setAttribute("reqUrl", reqUrl);
				req.setAttribute("lesVO", lesVO);
				req.setAttribute("page", page);
				req.setAttribute("total", total);
				req.setAttribute("orderBy", orderBy);
				req.setAttribute("nums", nums);
				RequestDispatcher successView = req.getRequestDispatcher("/back_end/lesson/updateLesson.jsp");
				successView.forward(req, res);
				return;
			} catch (Exception e) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/lesson/listQueryLesson.jsp");
				failureView.forward(req, res);
				return;
			}
		}
		if (action.equals("forUpdateFromList")) {
			try {
				Integer lesID = new Integer(req.getParameter("lesID"));
				LesService lesSvc = new LesService();
				LesVO lesVO = lesSvc.searchOneByID(lesID);
				req.setAttribute("lesVO", lesVO);
				RequestDispatcher successView = req.getRequestDispatcher("/back_end/lesson/listAllLesson.jsp");
				successView.forward(req, res);
				return;
			} catch (Exception e) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/lesson/listAllLesson.jsp");
				failureView.forward(req, res);
				return;
			}
		}

		if (action.equals("findEvents")) {
			try {
				LesService lesSvc = new LesService();
				Set<LesVO> set = lesSvc.getAllTrue();
				String jsonStr = new JSONArray(set).toString();
				res.setContentType("text/plain");
				res.setCharacterEncoding("UTF-8");
				PrintWriter out = res.getWriter();
				out.print(jsonStr);
				out.flush();
				out.close();
				return;
			} catch (Exception e) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/lesson/listAllLesson.jsp");
				failureView.forward(req, res);
				return;
			}
		}

		if (action.equals("findEventsForCoach")) {
			try {
				Integer coaID = new Integer(req.getParameter("coaID"));
				LesService lesSvc = new LesService();
				Set<LesVO> set = lesSvc.getByCoach(coaID);
				String jsonStr = new JSONArray(set).toString();
				res.setContentType("text/plain");
				res.setCharacterEncoding("UTF-8");
				PrintWriter out = res.getWriter();
				out.print(jsonStr);
				out.flush();
				out.close();
				return;
			} catch (Exception e) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/lesson/listAllLesson.jsp");
				failureView.forward(req, res);
				return;
			}
		}
		if (action.equals("cancel")) {
			try {
				Integer lesID = new Integer(req.getParameter("lesID"));
				Integer page = new Integer(req.getParameter("page"));
				Integer nums = new Integer(req.getParameter("nums"));
				Integer total = new Integer(req.getParameter("total"));
				String orderBy = req.getParameter("orderBy");
				String reqUrl = req.getParameter("reqUrl");
				LesService lesSvc = new LesService();
				lesSvc.cancelLesson(lesID);
				total = total - 1;
				Integer maxPage = 0;
				if (total % nums == 0) {
					maxPage = total / nums;
				} else {
					maxPage = total / nums + 1;
				}
				if (page > maxPage) {
					page = maxPage;
				}
				req.setAttribute("page", page);
				req.setAttribute("total", total);
				req.setAttribute("nums", nums);
				req.setAttribute("orderBy", orderBy);
				RequestDispatcher successView = req.getRequestDispatcher(reqUrl);
				successView.forward(req, res);
			} catch (Exception e) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/lesson/listQueryLesson.jsp");
				failureView.forward(req, res);
				return;
			}
		}
		
		if (action.equals("cancelFromList")) {
			try {
				Integer lesID = new Integer(req.getParameter("lesID"));
				
				LesService lesSvc = new LesService();
				lesSvc.cancelLesson(lesID);
				
				res.sendRedirect(req.getContextPath()+"/back_end/lesson/listAllLesson.jsp");
			} catch (Exception e) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/lesson/listAllLesson.jsp");
				failureView.forward(req, res);
				return;
			}
		}

		if (action.equals("searchResult")) {
			try {
				HttpSession session = req.getSession();
				Integer page = new Integer(req.getParameter("page"));
				Integer nums = new Integer(req.getParameter("nums"));
				String from = req.getParameter("from");
				String orderBy = req.getParameter("orderBy");
				String sql = null;
				if (from.equals("back")) {
					sql = (String) session.getAttribute("sqlForBack");
				} else {
					sql = (String) session.getAttribute("sqlForFront");
				}
				if (sql != null) {
					// 轉交Svc
					LesService lesSvc = new LesService();
					Set<LesVO> set = lesSvc.getAll(sql, page, nums, orderBy);
					String jsonStr = new JSONArray(set).toString();
					res.setContentType("text/plain");
					res.setCharacterEncoding("UTF-8");
					PrintWriter out = res.getWriter();
					out.print(jsonStr);
					out.flush();
					out.close();
				}
				return;
			} catch (Exception e) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/lesson/mainLesson.jsp");
				failureView.forward(req, res);
				return;
			}
		}
		if (action.equals("searchOneByID")) {
			try {
				Integer lesID = new Integer(req.getParameter("lesID"));
				// 轉交Svc
				LesService lesSvc = new LesService();
				LesVO lesVO = lesSvc.searchOneByID(lesID);

				String jsonStr = new JSONObject(lesVO).toString();
				res.setContentType("text/plain");
				res.setCharacterEncoding("UTF-8");
				PrintWriter out = res.getWriter();
				out.print(jsonStr);
				out.flush();
				out.close();
				return;

			} catch (Exception e) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/lesson/mainLesson.jsp");
				failureView.forward(req, res);
				return;
			}
		}
		if (action.equals("searchOneLesson")) {
			try {
				Integer lesID = new Integer(req.getParameter("lesID"));
				// 轉交Svc
				LesService lesSvc = new LesService();
				LesVO lesVO = lesSvc.searchOneByID(lesID);
				req.setAttribute("lesVO", lesVO);
				RequestDispatcher successView = req.getRequestDispatcher("/front_end/lesson/oneLessonInfo.jsp");
				successView.forward(req, res);
				return;
			} catch (Exception e) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/lesson/mainLesson.jsp");
				failureView.forward(req, res);
				return;
			}
		}
	}
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}

	public static java.sql.Date strToDate(String strDate) {
		String str = strDate;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date d = null;
		try {
			d = format.parse(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
		java.sql.Date date = new java.sql.Date(d.getTime());
		return date;
	}

}

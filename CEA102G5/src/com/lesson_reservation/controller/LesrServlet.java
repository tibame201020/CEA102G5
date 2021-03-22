package com.lesson_reservation.controller;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

import com.lesson_reservation.model.*;
import com.lesson.model.*;

public class LesrServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getByMember".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("mem_ID");

				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入會員編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/reservation/searchReservation.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer memID = null;
				try {
					memID = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("會員編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/reservation/searchReservation.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/

				LesrService lesrSvc = new LesrService();
				Set<LesrVO> lesrVO = lesrSvc.getLesByMem(memID);
				if (lesrVO == null) {
					errorMsgs.add("無此會員");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/reservation/searchReservation.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/

				req.setAttribute("listByMember", lesrVO); // 資料庫取出的empVO物件,存入req
				String url = "/back_end/reservation/listByMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/reservation/searchReservation.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getByLesson".equals(action)) { // 來自select_page.jsp的請求

			String str = req.getParameter("les_ID");

			Integer lesID = new Integer(str);
			LesrService lesrSvc = new LesrService();
			Set<LesrVO> lesrVO = lesrSvc.getMemByLes(lesID);
			req.setAttribute("listByLesson", lesrVO); // 資料庫取出的empVO物件,存入req
			req.setAttribute("les_ID", lesID);
			String url = "/back_end/reservation/listByLesson.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
			successView.forward(req, res);

		}

		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求

			/*************************** 1.接收請求參數 ****************************************/
			Integer lesID = new Integer(req.getParameter("les_ID"));
			Integer memID = new Integer(req.getParameter("mem_ID"));

			/*************************** 2.開始查詢資料 ****************************************/
			LesrService lesrSvc = new LesrService();
			LesrVO lesrVO = lesrSvc.getOneLesr(lesID, memID);

			/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
			req.setAttribute("lesrVO", lesrVO); // 資料庫取出的empVO物件,存入req
			String url = "/back_end/reservation/updateReservation.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
			successView.forward(req, res);

			/*************************** 其他可能的錯誤處理 **********************************/

		}

		if ("getOne".equals(action)) { // 來自listAllEmp.jsp的請求

			/*************************** 1.接收請求參數 ****************************************/
			Integer lesID = new Integer(req.getParameter("les_ID"));
			Integer memID = new Integer(req.getParameter("mem_ID"));

			/*************************** 2.開始查詢資料 ****************************************/
			LesrService lesrSvc = new LesrService();
			LesrVO lesrVO = lesrSvc.getOneLesr(lesID, memID);

			/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
			req.setAttribute("lesrVO", lesrVO); // 資料庫取出的empVO物件,存入req
			String url = "/front_end/reservation/updateReservation.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
			successView.forward(req, res);

			/*************************** 其他可能的錯誤處理 **********************************/

		}

		if ("getOne1".equals(action)) { // 來自listAllEmp.jsp的請求

			/*************************** 1.接收請求參數 ****************************************/
			Integer memID = new Integer(req.getParameter("mem_ID"));
			LesrService lesrSvc = new LesrService();
			Set<LesrVO> lesrVO = lesrSvc.getLesByMem(memID);

			/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/

			req.setAttribute("listByMember", lesrVO); // 資料庫取出的empVO物件,存入req
			String url = "/front_end/reservation/listReservation.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
			successView.forward(req, res);

			/*************************** 其他可能的錯誤處理 *************************************/

		}

		if ("update".equals(action))

		{ // 來自update_emp_input.jsp的請求

			String requestURL = req.getParameter("requestURL");
			LesrVO lesrVO = new LesrVO();
			String lesID = req.getParameter("les_ID");
			String memID = req.getParameter("mem_ID");
			String lesrComments = req.getParameter("lesr_comments").trim();
			String lesrAnswer = req.getParameter("lesr_answer").trim();
			Boolean lesrStatus = new Boolean(req.getParameter("lesr_status").trim());
			String lesrReason = req.getParameter("lesr_reason").trim();
			java.sql.Date lesrTime = java.sql.Date.valueOf(req.getParameter("lesr_time").trim());

			lesrVO.setLesID(new Integer(lesID));
			lesrVO.setMemID(new Integer(memID));
			lesrVO.setLesrComments(lesrComments);
			lesrVO.setLesrAnswer(lesrAnswer);
			lesrVO.setLesrStatus(lesrStatus);
			lesrVO.setLesrTime(lesrTime);

			/*************************** 2.開始修改資料 *****************************************/
			LesrService lesrSvc = new LesrService();
			lesrVO = lesrSvc.updateLesr(new Integer(lesID), new Integer(memID), lesrComments, lesrAnswer, lesrStatus,
					lesrReason, lesrTime);
			if (!lesrStatus) {
				LesVO lesVO = new LesVO();
				LesService lesSvc = new LesService();
				lesID = req.getParameter("les_ID");
				lesVO = lesSvc.searchOneByID(new Integer(lesID));
				Integer lesAlready = (lesVO.getLesAlready()) - 1;
				lesVO.setLesAlready(new Integer(lesAlready));
				lesVO = lesrSvc.updateLes(new Integer(lesID), new Integer(lesAlready));
			}

			/*************************** 3.修改完成,準備轉交(Send the Success view) *************/

			Set<LesrVO> lesrlSet = lesrSvc.getMemByLes(new Integer(lesID));
			req.setAttribute("listByLesson", lesrlSet);
			Set<LesrVO> lesrmSet = lesrSvc.getLesByMem(new Integer(memID));
			req.setAttribute("listByMember", lesrmSet);

			req.setAttribute("lesrVO", lesrVO); // 資料庫update成功後,正確的的empVO物件,存入req
			req.setAttribute("les_ID", lesID);

			String url = requestURL;
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
			successView.forward(req, res);

			/*************************** 其他可能的錯誤處理 *************************************/
		}

		if ("updateOne".equals(action)) { // 來自update_emp_input.jsp的請求

			LesrVO lesrVO = new LesrVO();
			String lesID = req.getParameter("les_ID");
			String memID = req.getParameter("mem_ID");
			String lesrComments = req.getParameter("lesr_comments").trim();
			String lesrAnswer = req.getParameter("lesr_answer").trim();
			Boolean lesrStatus = new Boolean(req.getParameter("lesr_status").trim());
			String lesrReason = req.getParameter("lesr_reason").trim();
			java.sql.Date lesrTime = java.sql.Date.valueOf(req.getParameter("lesr_time").trim());

			lesrVO.setLesID(new Integer(lesID));
			lesrVO.setMemID(new Integer(memID));
			lesrVO.setLesrComments(lesrComments);
			lesrVO.setLesrAnswer(lesrAnswer);
			lesrVO.setLesrStatus(lesrStatus);
			lesrVO.setLesrTime(lesrTime);

			/*************************** 2.開始修改資料 *****************************************/
			LesrService lesrSvc = new LesrService();
			lesrVO = lesrSvc.updateLesr(new Integer(lesID), new Integer(memID), lesrComments, lesrAnswer, lesrStatus,
					lesrReason, lesrTime);
			if (!lesrStatus) {
				LesVO lesVO = new LesVO();
				LesService lesSvc = new LesService();
				lesID = req.getParameter("les_ID");
				lesVO = lesSvc.searchOneByID(new Integer(lesID));
				Integer lesAlready = (lesVO.getLesAlready()) - 1;
				lesVO.setLesAlready(new Integer(lesAlready));
				lesVO = lesrSvc.updateLes(new Integer(lesID), new Integer(lesAlready));
			}

			/*************************** 3.修改完成,準備轉交(Send the Success view) *************/

			Set<LesrVO> lesrlSet = lesrSvc.getMemByLes(new Integer(lesID));
			req.setAttribute("listByLesson", lesrlSet);
			Set<LesrVO> lesrmSet = lesrSvc.getLesByMem(new Integer(memID));
			req.setAttribute("listByMember", lesrmSet);

			req.setAttribute("lesrVO", lesrVO); // 資料庫update成功後,正確的的empVO物件,存入req
			req.setAttribute("les_ID", lesID);

			String url = "/front_end/reservation/listReservation.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
			successView.forward(req, res);

			/*************************** 其他可能的錯誤處理 *************************************/
		}

		if ("insert".equals(action)) { // 來自addEmp.jsp的請求

			Integer memID = new Integer(req.getParameter("mem_ID"));
			Integer lesID = new Integer(req.getParameter("les_ID"));
			String lesrComments = "";
			String lesrAnswer = "";
			Boolean lesrStatus = true;
			String lesrReason = "";

			LesrVO lesrVO = new LesrVO();

			lesrVO.setLesID(new Integer(lesID));
			lesrVO.setMemID(new Integer(memID));
			lesrVO.setLesrComments(lesrComments);
			lesrVO.setLesrAnswer(lesrAnswer);
			lesrVO.setLesrStatus(lesrStatus);
			lesrVO.setLesrReason(lesrReason);

			LesVO lesVO = new LesVO();
			LesService lesSvc = new LesService();
			LesrService lesrSvc = new LesrService();

			lesVO = lesSvc.searchOneByID(lesID);
			Integer lesAlready = (lesVO.getLesAlready()) + 1;
			lesVO.setLesAlready(new Integer(lesAlready));
			/*************************** 2.開始新增資料 ***************************************/

			lesrVO = lesrSvc.addLesr(new Integer(lesID), new Integer(memID), lesrComments, lesrAnswer, lesrStatus,
					lesrReason);
			lesVO = lesrSvc.updateLes(new Integer(lesID), new Integer(lesAlready));
			
			/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
			String url = req.getContextPath()+"/front_end/reservation/listReservation.jsp";
			res.sendRedirect(url);

			
		}

		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				Integer lesID = new Integer(req.getParameter("les_ID"));
				Integer memID = new Integer(req.getParameter("mem_ID"));

				/*************************** 2.開始刪除資料 ***************************************/
				LesrService lesrSvc = new LesrService();
				lesrSvc.deleteLesr(lesID, memID);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/back_end/reservation/listAllReservation.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back_end/reservation/listAllReservation.jsp");
				failureView.forward(req, res);
			}
		}
	}

}

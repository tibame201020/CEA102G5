package com.commodity.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.json.JSONArray;

import com.commodity.model.ComService;
import com.commodity.model.ComVO;

/**
 * Servlet implementation class ComServlet
 */
@WebServlet("/ComServlet")
@MultipartConfig
public class ComServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		
		if("listComByName".equals(action)) {
			String[] searchText = new String[1];
			searchText[0] = request.getParameter("searchText");
			String columnName = request.getParameter("columnName");
			
			LinkedHashMap<String, String[]> map = new LinkedHashMap<String, String[]>();
			map.put(columnName, searchText);
			ComService comSvc = new ComService();
			List<ComVO> list = comSvc.getAll(map);
			if(list.size()==0) {
				String jsonStr = "0";
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				out.print(jsonStr);
				out.flush();
				out.close();
			}else {
				String jsonStr = new JSONArray(list).toString();
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				out.print(jsonStr);
				out.flush();
				out.close();
			}
		}
		
		
		//來自comSelectPage.jsp的請求處理
		if("getOne_For_Display".equals(action)) { 
			
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			
			try {
				String str = request.getParameter("comID");
				if(str == null || (str.trim()).length()==0) {
					errorMsgs.add("請輸入商品編號");
				}
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = request.getRequestDispatcher("/back_end/commodity/comSelectPage.jsp");
					failureView.forward(request, response);
					return;
				}
				
				int comID = 0;
				try {
					comID = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("編號格式不正確");
				}
				
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = request.getRequestDispatcher("/back_end/commodity/comSelectPage.jsp");
					failureView.forward(request, response);
					return;
				}
				
				//*************開始查詢資料*********************
				ComService comSvc = new ComService();
				ComVO comVO = comSvc.getOneCom(comID);
				if(comVO == null) {
					errorMsgs.add("查無資料");
				}
				
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = request.getRequestDispatcher("/back_end/commodity/comSelectPage.jsp");
					failureView.forward(request, response);
					return;
				}
				
				//********查詢完成，準備轉交*********
				request.setAttribute("comVO", comVO);
				String url = "/back_end/commodity/listOneCom.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
				
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/back_end/commodity/comSelectPage.jsp");
				failureView.forward(request, response);
			}
		}
		
		if("getOne_For_Update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			
			try {
				//*********接收請求參數*********
				int comID = new Integer(request.getParameter("comID"));
				//*********開始查詢資料*********
				ComService comSvc = new ComService();
				ComVO comVO = comSvc.getOneCom(comID);
				//*********查詢完成準備轉交*********
				request.setAttribute("comVO", comVO);
				String url = "/back_end/commodity/updateCom.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
				//*********可能的錯誤處理*********
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/back_end/commodity/listAllCom.jsp");
				failureView.forward(request, response);
			}
			
		}
		
		//來自updateCom.jsp的請求
		if("update".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			//*********接收請求參數*********
			try {
				
				int comID = Integer.parseInt(request.getParameter("comID").trim());		
				String comName = request.getParameter("comName").trim();
				if(comName == null || comName.trim().length()==0) {
					errorMsgs.add("員工姓名，請勿空白");
				}
				
				int comPrice = 0;
				try {
					comPrice = Integer.parseInt(request.getParameter("comPrice").trim());
				} catch (NumberFormatException e) {
					comPrice = 0;
					errorMsgs.add("價格請填數字");
				}
				
				byte[] comPicture = null;
				Part part = request.getPart("upfile1");
				
				
					try {
						InputStream is = part.getInputStream();
						
						comPicture = new byte[is.available()];
						is.read(comPicture);
						is.close();
	
					} catch (Exception e) {
						errorMsgs.add("圖片上傳失敗");
					}
				
				String comContent = request.getParameter("comContent").trim();
				int comStatus = Integer.parseInt(request.getParameter("comStatus").trim());
				int comWeight = Integer.parseInt(request.getParameter("comWeight").trim());
				String comUnit = request.getParameter("comUnit").trim();
				float comCal = Float.parseFloat(request.getParameter("comCal").trim());
				float comCarb = Float.parseFloat(request.getParameter("comCarb").trim());
				float comPro = Float.parseFloat(request.getParameter("comPro").trim());
				float comFat = Float.parseFloat(request.getParameter("comFat").trim());
				String comProp = request.getParameter("comProp").trim();

				
				ComVO comVO = new ComVO();
				comVO.setComID(comID);
				comVO.setComName(comName);
				comVO.setComPrice(comPrice);
				comVO.setComPicture(comPicture);
				comVO.setComContent(comContent);
				comVO.setComStatus(comStatus);
				comVO.setComWeight(comWeight);
				comVO.setComUnit(comUnit);
				comVO.setComCal(comCal);
				comVO.setComCarb(comCarb);
				comVO.setComPro(comPro);
				comVO.setComFat(comFat);
				comVO.setComProp(comProp);
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = request.getRequestDispatcher("/back_end/commodity/updateCom.jsp");
					failureView.forward(request, response);
					return;
				}
				
				//*******開始修改資料*******
				ComService comSvc = new ComService();
				comVO = comSvc.updateCom(comName, comPrice, comPicture, comContent, 
						comStatus, comWeight, comUnit, comCal, comCarb, comPro, comFat, comProp, comID);
				//*******修改完成準備轉交********
				request.setAttribute("comVO", comVO);
				String url = "/back_end/commodity/listAllCom.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
				
			} catch (Exception e) {
				e.getStackTrace();
				RequestDispatcher failureView = request.getRequestDispatcher("/back_end/commodity/updateCom.jsp");
				failureView.forward(request, response);
			}
			
			
		}
		
		//來自addCom.jsp的請求
		if("insert".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			
			try {
				int comcID = Integer.parseInt(request.getParameter("comcID"));
				String comName = request.getParameter("comName");
				if(comName == null || comName.trim().length()==0) {
					errorMsgs.add("員工姓名，請勿空白");
				}
				
				int comPrice = 0;
				try {
					comPrice = Integer.parseInt(request.getParameter("comPrice"));
				} catch (NumberFormatException e) {
					comPrice = 0;
					errorMsgs.add("價格請填數字");
				}
				
				byte[] comPicture =null;
				
				try {
						Part part = request.getPart("upfile1");
						InputStream is = part.getInputStream();
						comPicture = new byte[is.available()];
						is.read(comPicture);
						is.close();

				} catch (Exception e) {
					errorMsgs.add("圖片1有問題");
				}
				
				byte[] comPicture2 =null;
				

				
				String comContent = request.getParameter("comContent");
				int comStatus = Integer.parseInt(request.getParameter("comStatus"));
				int comWeight = Integer.parseInt(request.getParameter("comWeight"));
				String comUnit = request.getParameter("comUnit");
				float comCal = Float.parseFloat(request.getParameter("comCal"));
				float comCarb = Float.parseFloat(request.getParameter("comCarb"));
				float comPro = Float.parseFloat(request.getParameter("comPro"));
				float comFat = Float.parseFloat(request.getParameter("comFat"));
				String comProp = request.getParameter("comProp");
				
				ComVO comVO = new ComVO();
				comVO.setComcID(comcID);
				comVO.setComName(comName);
				comVO.setComPrice(comPrice);
				comVO.setComPicture(comPicture);
				comVO.setComPicture2(comPicture2);
				comVO.setComContent(comContent);
				comVO.setComStatus(comStatus);
				comVO.setComWeight(comWeight);
				comVO.setComUnit(comUnit);
				comVO.setComCal(comCal);
				comVO.setComCarb(comCarb);
				comVO.setComPro(comPro);
				comVO.setComFat(comFat);
				comVO.setComProp(comProp);
				
				
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = request.getRequestDispatcher("/back_end/commodity/addCom.jsp");
					failureView.forward(request, response);
					return;
				}
				//*****開始新增資料*****
				ComService comSvc = new ComService();
				comVO = comSvc.addCom(comcID, comName, comPrice, comPicture, comContent, comStatus, 
						comWeight, comUnit, comCal, comCarb, comPro, comFat, comProp, comPicture2);
				//*****新增完成，準備轉交*****
				String url ="/back_end/commodity/listAllCom.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
				
				
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/back_end/commodity/addCom.jsp");
				failureView.forward(request, response);
			}
			
		}
		
		//來自listAllCom.jsp
		if("delete".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			
			try {
				int comID = Integer.parseInt(request.getParameter("comID"));
				ComService comSvc = new ComService();
				comSvc.deleteCom(comID);
				
				String url = "/back_end/commodity/listAllCom.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
				
				
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/back_end/commodity/listAllEmp.jsp");
				failureView.forward(request, response);
			}
			
			
		}
		
		//來自comSelectPage.jsp的複合查詢請求
		if("listCom_ByCompositeQuery".equals(action)) {
			try {
				HttpSession session = request.getSession();//???
				Map<String, String[]> map = (Map<String, String[]>) session.getAttribute("map");//???
				LinkedHashMap<String, String[]> map1 = new LinkedHashMap<String, String[]>(request.getParameterMap());
				session.setAttribute("map", map1);
				map = map1;
				ComService comSvc = new ComService();
				List<ComVO> list = comSvc.getAll(map);
				//查詢完成 準備轉交
				request.setAttribute("listCom_ByCompositeQuery", list);
				String url = "/back_end/commodity/listCom_ByCompositeQuery.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}
		//來自shopSlidebar.jsp的複合查詢請求 akuma0320
		if("listCom_ByCompositeQueryFS".equals(action)) {
			try {
				HttpSession session = request.getSession();//???
				Map<String, String[]> map = (Map<String, String[]>) session.getAttribute("map");//???
				LinkedHashMap<String, String[]> map1 = new LinkedHashMap<String, String[]>(request.getParameterMap());
				session.setAttribute("map", map1);
				map = map1;
				ComService comSvc = new ComService();
				List<ComVO> list = comSvc.getAll(map);
				//查詢完成 準備轉交
				session.setAttribute("category_list", list);
				String url = "/front_end/commodity/comindex_category.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}
		
		
		
		
		
		
		
		
	}

}

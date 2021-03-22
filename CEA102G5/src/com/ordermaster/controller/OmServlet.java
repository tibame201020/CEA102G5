package com.ordermaster.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cart.model.CartVO;
import com.member_recipient.model.MemrService;
import com.member_recipient.model.MemrVO;
import com.orderdetail.model.OdService;
import com.orderdetail.model.OdVO;
import com.ordermaster.model.OmService;
import com.ordermaster.model.OmVO;

/**
 * Servlet implementation class OmServlet
 */
@WebServlet("/OmServlet")
public class OmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		
		if("BUY".equals(action)) {

			try {
				Integer memID = new Integer(request.getParameter("memID"));
				Integer memrID = new Integer(request.getParameter("memrID"));
				Integer omPrice = new Integer(request.getParameter("totalAmount"));
				MemrService memrSvc = new MemrService();
				MemrVO memrVO = memrSvc.getByMemrID(memrID);
				List<CartVO> checkOutList = (List<CartVO>)session.getAttribute("checkOutList");
				session.removeAttribute("amount");
				session.removeAttribute("checkOutList");
				
				OdService odSvc = new OdService();
				OmVO omVO = odSvc.addOd(checkOutList,memID, memrID, omPrice, memrVO.getMemrName(),memrVO.getMemrPhone(),memrVO.getMemrAddress());
				
				request.setAttribute("omVO", omVO);//¨S¥Î¨ì
				String url = "/CEA102G5/front_end/credit/credit.jsp";
				response.sendRedirect(url);
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		if("ListOd_ByOmID".equals(action)) {
			try {
				Integer omID = new Integer(request.getParameter("omID"));
				
				OdService odSvc = new OdService();
				List<OdVO> list = odSvc.getAllByOmID(omID);
				
				request.setAttribute("list", list);
				String url = "/front_end/member/listOd_ByOmID_frontEnd.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		if("Update_omShip".equals(action)) {
			String requestURL = request.getParameter("requestURL");
				try {
					Integer omID = new Integer(request.getParameter("omID"));
					Integer omShip = new Integer(request.getParameter("check"));
					OmService omSvc = new OmService();
					omSvc.updateOmShip(omID,omShip);
					String url = requestURL;
					RequestDispatcher successView = request.getRequestDispatcher(url);
					successView.forward(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}

		}
		
		if("Cancel_om".equals(action)) {
			String requestURL = request.getParameter("requestURL");
			
			try {
				Integer omID = new Integer(request.getParameter("omID"));
				Integer omPay = new Integer(request.getParameter("check"));
				
				OmService omSvc = new OmService();
				omSvc.updateOmPay(omID, omPay);
				String url = requestURL;
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);		
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		if("addMsg".equals(action)) {
			Integer omID = new Integer(request.getParameter("omID"));
			Integer comID = new Integer(request.getParameter("comID"));
			String odMessage = request.getParameter("msgText");
			String column = request.getParameter("column");
			Integer odPoint = new Integer(request.getParameter("score"));
			OdService odSvc = new OdService();
			odSvc.addMessage(omID, comID, odMessage, column,odPoint);
			
			
			String str= "success";
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(str);
			out.flush();
			out.close();
		}
		
		if("ListOd_ByOmID_ForBack".equals(action)) {
			Integer omID = new Integer(request.getParameter("omID"));
			
			OdService odSvc = new OdService();
			List<OdVO> list = odSvc.getAllByOmID(omID);
			
			request.setAttribute("list", list);
			String url = "/back_end/commodity/listOd_ByOmID.jsp";
			RequestDispatcher successView = request.getRequestDispatcher(url);
			successView.forward(request, response);
		}
		
		if("credit".equals(action)) {
			response.sendRedirect("/CEA102G5/front_end/credit/success.jsp");
		}
		
	}

}

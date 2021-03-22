package com.commodity_favorite.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.commodity_favorite.model.ComfService;
import com.commodity_favorite.model.ComfVO;
import com.member.model.MemVO;

/**
 * Servlet implementation class ComfServlet
 */
@WebServlet("/ComfServlet")
public class ComfServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComfServlet() {
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
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		if("insert".equals(action)) {
			try {
				MemVO memVO = (MemVO) session.getAttribute("memVO");
				if(memVO==null) {
					String urll="/front_end/member/login.jsp";
					RequestDispatcher login =request.getRequestDispatcher(urll);
					login.forward(request, response);
				}
				Integer memID = memVO.getMemID();
				Integer comID = Integer.parseInt(request.getParameter("comID"));
				ComfVO comfVO = new ComfVO();
				comfVO.setMemID(memID);
				comfVO.setComID(comID);
				ComfService comfSvc =new ComfService();
				comfSvc.addComf(comfVO);
				String url ="/front_end/commodity/comindex.jsp";
				RequestDispatcher successView =request.getRequestDispatcher(url);
				successView.forward(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		if("insertByRedis".equals(action)) {
			try {
				String memID = request.getParameter("memID");
				String comID = request.getParameter("comID");
				ComfService comfSvc = new ComfService();
				if(comfSvc.check(memID, comID)) {
					comfSvc.deleteByRedis(memID, comID);
					PrintWriter out = response.getWriter();
					out.print(false);
					out.flush();
					out.close();
				}else {
					comfSvc.addByRedis(memID, comID);
					PrintWriter out = response.getWriter();
					out.print(true);
					out.flush();
					out.close();
				}
			
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		if("firstload".equals(action)) {
			try {
				String memID = request.getParameter("memID");
				String comID = request.getParameter("comID");
				ComfService comfSvc = new ComfService();
				Boolean check=comfSvc.check(memID, comID);
				PrintWriter out = response.getWriter();
				out.print(check);
				out.flush();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}

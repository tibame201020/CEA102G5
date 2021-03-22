package com.authority.controller;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.authority.model.AutService;

public class AutServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("del".equals(action)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			try {
				Integer admID = new Integer(req.getParameter("admID"));
				AutService autSvc = new AutService();
				autSvc.deleteAdm(admID);
				RequestDispatcher successView = req.getRequestDispatcher("/back_end/function_info/listAllFun.jsp");
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.put("Exception", e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/function_info/listAllFun.jsp");
				failureView.forward(req, res);
				return;
			}
		}
		
	}

}

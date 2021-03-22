package com.recipe.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
import org.json.JSONObject;

import com.commodity.model.ComService;
import com.commodity.model.ComVO;
import com.member.model.MemService;
import com.member.model.MemVO;
import com.recipe.model.RecService;
import com.recipe.model.RecVO;
import com.recipe_favorite.model.RecfService;
import com.recipe_favorite.model.RecfVO;
import com.recipe_ingredients.model.ReciService;
import com.recipe_ingredients.model.ReciVO;
import com.recipe_step.model.RecsService;
import com.recipe_step.model.RecsVO;

import jedis.util.favorite.JedisHandleFavorite;

/**
 * Servlet implementation class RecServlet
 */
@WebServlet("/RecServlet")
@MultipartConfig
public class RecServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		System.out.println(action);
		HttpSession session = request.getSession();
		
		if("getAllByAjax".equals(action)) {
			RecService recSvc = new RecService();
			List<RecVO> list = recSvc.getRecByStatus(2);
			String jsonStr = new JSONArray(list).toString();
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(jsonStr);
			out.flush();
			out.close();
		}
		
		if("getComifChecked".equals(action)) {
			//抓取剛勾選的值並強轉為Integer陣列
			String[] arr = request.getParameterValues("checkComID");
			System.out.println("剛勾選的"+Arrays.toString(arr));
			Integer[] checkComID =new Integer[arr.length];
			for(int i = 0 ;i<checkComID.length;i++) {
				checkComID[i] = Integer.parseInt(arr[i]);
			}
			//抓取已經勾選的值並強轉為Integer陣列
			String[] arr2 = request.getParameterValues("checkedComID");
			if(arr2!=null) {
				System.out.println("已選的"+Arrays.toString(arr2));
				Integer[] checkedComID = new Integer[arr2.length];
				for(int i = 0 ; i<checkedComID.length;i++) {
					checkedComID[i] = Integer.parseInt(arr2[i]);
				}
				
				//合併兩個Integer陣列
				Integer[] concat = new Integer[checkComID.length+checkedComID.length];
				System.arraycopy(checkComID, 0, concat, 0, checkComID.length);
				System.arraycopy(checkedComID, 0, concat, checkComID.length, checkedComID.length);
				System.out.println(Arrays.toString(concat));
				
				ComService comSvc2 = new ComService();
				Set<ComVO> set2 = new LinkedHashSet<ComVO>();
				ComVO comVO2 = null;
				for(int i = 0;i<concat.length;i++) {
					comVO2 = comSvc2.getOneCom(concat[i]);
					set2.add(comVO2);
				}
				
				Iterator it = set2.iterator();
				while(it.hasNext()) {
					ComVO comVO = (ComVO)it.next();
					for(int i = 0;i<checkedComID.length;i++) {
						if(comVO.getComID() == checkedComID[i]) {
							it.remove();
						}
					}
				}
				String jsonStr2 = new JSONArray(set2).toString();
				System.out.println(jsonStr2);
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				out.print(jsonStr2);
				out.flush();
				out.close();
			}else {
			
				ComService comSvc = new ComService();
				Set<ComVO> set = new LinkedHashSet<ComVO>();
				ComVO comVO = null;
				for(int i = 0 ; i<checkComID.length;i++) {
					comVO = comSvc.getOneCom(checkComID[i]);
					set.add(comVO);
				}
				
				String jsonStr = new JSONArray(set).toString();
//				System.out.println(jsonStr);
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				out.print(jsonStr);
				out.flush();
				out.close();
			}
		}
		
		if("addRecipe".equals(action)) {
			try {
				Integer memID = new Integer(request.getParameter("memID"));
				String recName = request.getParameter("title");
				Part part = request.getPart("recipePic");
				InputStream is = part.getInputStream();
				byte[] recPic = null;
				recPic = new byte[is.available()];
				is.read(recPic);
				is.close();
				String recContent = request.getParameter("intro");
				Integer recSize = new Integer(request.getParameter("size"));
				Integer recCookTime = new Integer(request.getParameter("cooktime"));
				Float totalCal = new Float(request.getParameter("totalCal"));
				Float totalCarb = new Float(request.getParameter("totalCarb"));
				Float totalPro = new Float(request.getParameter("totalPro"));
				Float totalFat = new Float(request.getParameter("totalFat"));
				Integer recStatus = 1;
				Integer recBonus = 0;
				//食材表格用
				String[] arr = request.getParameterValues("alreadyChecked");
				Integer[] ingComID = new Integer[arr.length];
				for (int i = 0; i < ingComID.length; i++) {
					ingComID[i] = Integer.parseInt(arr[i]);
				}
				String[] arr2 = request.getParameterValues("ingNums");
				Integer[] ingNums = new Integer[arr2.length];
				for (int i = 0; i < ingNums.length; i++) {
					ingNums[i] = Integer.parseInt(arr2[i]);
				}
				//步驟表格用
				String[] fileNameArr = request.getParameterValues("fileName");
//				
				List<Part> listPart = new ArrayList<Part>();
				for(int i = 0 ;i<fileNameArr.length;i++) {
					Part partStep = request.getPart(fileNameArr[i]);
					listPart.add(partStep);
				}
				
				String[] recsContent = request.getParameterValues("stepText");
				RecService recSvc = new RecService();
				recSvc.addRec(memID, recName, recPic, recContent, recSize, recCookTime, totalCal, totalCarb, totalPro,
						totalFat, recStatus, recBonus, ingComID, ingNums, listPart, recsContent);
				String url = "/front_end/recipe/listRecbyMemID.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		
		if("updateRecipe".equals(action)) {
			Integer memID = new Integer(request.getParameter("memID"));
			Integer recID = new Integer(request.getParameter("recID"));
			String recName = request.getParameter("title");
			
			//判斷圖片是否有重新上傳
			RecService recSvc = new RecService();
			Part part = request.getPart("recipePic");
			byte[] recPic = null;
			if(part.getSize()==0) {
				RecVO recVO = recSvc.getOneRec(recID);
				recPic = recVO.getRecPicture1();
			}else {
				InputStream is = part.getInputStream();
				recPic = new byte[is.available()];
				is.read(recPic);
				is.close();				
			}
			
			
			String recContent = request.getParameter("intro");
			Integer recSize = new Integer(request.getParameter("size"));
			Integer recCookTime = new Integer(request.getParameter("cooktime"));
			Float totalCal = new Float(request.getParameter("totalCal"));
			Float totalCarb = new Float(request.getParameter("totalCarb"));
			Float totalPro = new Float(request.getParameter("totalPro"));
			Float totalFat = new Float(request.getParameter("totalFat"));

			//食材表格用
			String[] arr = request.getParameterValues("alreadyChecked");
			Integer[] ingComID = new Integer[arr.length];
			for (int i = 0; i < ingComID.length; i++) {
				ingComID[i] = Integer.parseInt(arr[i]);
			}
			String[] arr2 = request.getParameterValues("ingNums");
			Integer[] ingNums = new Integer[arr2.length];
			for (int i = 0; i < ingNums.length; i++) {
				ingNums[i] = Integer.parseInt(arr2[i]);
			}
			//步驟表格用
			String[] fileNameArr = request.getParameterValues("fileName");
			String[] arr3 = request.getParameterValues("recsID");
			Integer[] recsIDs = new Integer[arr3.length];
			for(int i = 0 ;i<recsIDs.length; i ++) {
				if(arr3[i].equals("")) {
					recsIDs[i] = 0;
				}else {
					recsIDs[i] = Integer.parseInt(arr3[i]);					
				}
			}
			
			System.out.println(Arrays.toString(recsIDs));
			
			byte[] stepPic = null;
			List<byte[]> listStepPic = new ArrayList<byte[]>();
			RecsService recsSvc = new RecsService();
			for(int i = 0 ; i<recsIDs.length; i++) {
				if(recsIDs[i]==0) {
					//是新增的步驟
					Part partStep = request.getPart(fileNameArr[i]);
					System.out.println(partStep.getSize());
					InputStream ism = partStep.getInputStream();
					stepPic = new byte[ism.available()];
					ism.read(stepPic);
					ism.close();
					listStepPic.add(stepPic);
					
				}else {
					//舊步驟
					Part partStep = request.getPart(fileNameArr[i]);
					if(partStep.getSize()==0) {
						//這邊處理舊步驟圖片沒修改的
						RecsVO recsVO = recsSvc.getOneByRecsID(recsIDs[i]);
						listStepPic.add(recsVO.getRecsPicture());
					}else {
						//處理舊步驟圖片有修改的
						InputStream ism = partStep.getInputStream();
						stepPic = new byte[ism.available()];
						ism.read(stepPic);
						ism.close();
						listStepPic.add(stepPic);
					}
				}
			}
			String[] recsContent = request.getParameterValues("stepText");
			
			recSvc.updateRec(memID, recID,recName, recPic, recContent, recSize, recCookTime, 
					totalCal, totalCarb, totalPro, totalFat, ingComID, 
					ingNums, listStepPic, recsContent);
			
			String url = "/front_end/recipe/listRecbyMemID.jsp";
			RequestDispatcher successView = request.getRequestDispatcher(url);
			successView.forward(request, response);
		}
		
		if("GetRecDetail_ByrecID".equals(action)) {
			Integer recID = new Integer(request.getParameter("recID"));
			
			RecService recSvc = new RecService();
			RecVO recVO = recSvc.getOneRec(recID);
			
			request.setAttribute("recVO", recVO);
			String url = "/front_end/recipe/recDetail.jsp";
			RequestDispatcher successView = request.getRequestDispatcher(url);
			successView.forward(request, response);
			
		}
		
		if("GetRecDetail_ByAjax".equals(action)) {
			Integer recID = new Integer(request.getParameter("recID"));
			ReciService reciSvc = new ReciService();
			List<ReciVO> list = reciSvc.getIngsByRecID(recID);
			String jsonStr = new JSONArray(list).toString();
			System.out.println(jsonStr);
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(jsonStr);
			out.flush();
			out.close();
			
		}
		
		if("GetRecStep_ByAjax".equals(action)) {
			Integer recID = new Integer(request.getParameter("recID"));
			RecsService recsSvc = new RecsService();
			List<RecsVO> list = recsSvc.getAllStepsByRecID(recID);
			String jsonStr = new JSONArray(list).toString();
			System.out.println(jsonStr);
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(jsonStr);
			out.flush();
			out.close();
			
		}
		
		if("updateStatus".equals(action)) {
			Integer recID = new Integer(request.getParameter("recID"));
			Integer recBonus = new Integer(request.getParameter("recBonus"));
			Integer recStatus = new Integer(request.getParameter("recStatus"));
			RecService recSvc = new RecService();
			recSvc.updateStatus(recStatus,recID,recBonus);
			
			PrintWriter out = response.getWriter();
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			String str = "0";
			out.print(str);
			out.flush();
			out.close();
			
		}
		if("GetOneForUpdateRec".equals(action)) {
			Integer recID = new Integer(request.getParameter("recID"));
			RecService recSvc = new RecService();
			RecVO recVO = recSvc.getOneRec(recID);
			request.setAttribute("recVO", recVO);
			String url = "/front_end/recipe/updateRecipe.jsp";
			RequestDispatcher successView = request.getRequestDispatcher(url);
			successView.forward(request, response);
		}
		
		if("addFav".equals(action)) {
			Object memVO = session.getAttribute("memVO");
			String location = request.getParameter("location");
			Integer recID = new Integer(request.getParameter("recID"));
			String recIDStr = request.getParameter("recID");
			if(memVO == null) {
				RecService recSvc = new RecService();
				RecVO recVO = recSvc.getOneRec(recID);
				session.setAttribute("recVO", recVO);
				session.setAttribute("location", location);
				String str = "0";
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				out.print(str);
				out.flush();
				out.close();
			}else {
				MemVO memVO2 = (MemVO)memVO;
				JedisHandleFavorite.saveFavoriteByMemID(memVO2.getMemID(), recIDStr);
				String str = "1";
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				out.print(str);
				out.flush();
				out.close();
			}
		}
		
		if("delFav".equals(action)) {
			String recIDStr = request.getParameter("recID");
			MemVO memVO =(MemVO)session.getAttribute("memVO");
			Integer memID = memVO.getMemID();
			Long count = JedisHandleFavorite.deleteFavoriteByMemID(memID, recIDStr);
			
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(count);
			out.flush();
			out.close();
			
			
//			RecfService recfSvc = new RecfService();
//			recfSvc.deleteFavorite(memID, recID);
			
		}
		
		if("checkIfFav".equals(action)) {
			Integer recIDStr = new Integer(request.getParameter("recID"));
			Integer memID = new Integer(request.getParameter("memID"));
			boolean isAdded = JedisHandleFavorite.checkFavoriteByMemID(memID, recIDStr);
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(isAdded);
			out.flush();
			out.close();
			
//			RecfService recfSvc = new RecfService();
//			List<RecfVO> list = recfSvc.getAllByMemID(memID);
//			RecfVO recfVO = new RecfVO();
//			recfVO.setMemID(memID);
//			recfVO.setRecID(recID);
//			if(list.contains(recfVO)) {
//				String str = "check";
//				response.setContentType("text/plain");
//				response.setCharacterEncoding("UTF-8");
//				PrintWriter out = response.getWriter();
//				out.print(str);
//				out.flush();
//				out.close();
//				return;
//			}
			
		}
		
		if("getAllByCondition".equals(action)) {
			String type = request.getParameter("selectType");
			String text = request.getParameter("selectText");
			RecService recSvc = new RecService();
			List<RecVO> list = recSvc.getAllByCondition(type, text);
			session.setAttribute("conditionList", list);
			String url = "/front_end/recipe/recIndex_condition.jsp";
			RequestDispatcher successView = request.getRequestDispatcher(url);
			successView.forward(request, response);
		}
		
		if("getRecMemFavorite".equals(action)) {
			Integer memID = new Integer(request.getParameter("memID"));
			Set<String> set = JedisHandleFavorite.getFavoriteByMemID(memID);
			List<RecVO> list = new ArrayList<RecVO>();
			RecService recSvc = new RecService();
			for(String recIDStr : set) {
				Integer recID = new Integer(recIDStr);
				RecVO recVO = recSvc.getOneRec(recID);
				recVO.setRecPicture1(new byte[0]);
				list.add(recVO);
			}
			String jsonStr = new JSONArray(list).toString();
			
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(jsonStr);
			out.flush();
			out.close();
			
		}
		
		if("checkIflogintoBoard".equals(action)) {
			Integer memID = new Integer(request.getParameter("memID"));
			MemService memSvc = new MemService();
			MemVO memVO = memSvc.getOneMem(memID);
			String jsonStr = new JSONObject(memVO).toString();
			
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(jsonStr);
			out.flush();
			out.close();
		}
		
		if("getHowManyFav".equals(action)) {
			Integer recIDStr = new Integer(request.getParameter("recID"));

			
			MemService memSvc = new MemService();
			List<MemVO> list = memSvc.getAll();
			Integer count = 0;
			for(MemVO memVO : list) {
				if(JedisHandleFavorite.checkFavoriteByMemID(memVO.getMemID(), recIDStr)) {
					count++;
				}
			}
			System.out.println(count);
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(count);
			out.flush();
			out.close();
			
		}

	}

}

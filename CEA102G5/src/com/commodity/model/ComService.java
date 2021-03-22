package com.commodity.model;

import java.util.List;
import java.util.Map;

import com.util.model.ComCommentVO;

public class ComService {
	private ComDAO_interface dao;
	
	public ComService() {
		dao = new ComDAO();
	}
	
	public ComVO addCom(int comcID,String comName,int comPrice,byte[] comPicture, 
			String comContent, int comStatus, int comWeight, String comUnit, float comCal, float comCarb,
			float comPro, float comFat, String comProp, byte[] comPicture2) {
		
		ComVO comVO = new ComVO();
		
		comVO.setComcID(comcID);
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
		comVO.setComPicture2(comPicture2);
		dao.insert(comVO);
		
		return comVO;
	}
	
	public ComVO updateCom(String comName,int comPrice,byte[] comPicture, 
			String comContent, int comStatus, int comWeight, String comUnit, float comCal, float comCarb,
			float comPro, float comFat, String comProp, int comID) {
		
		ComVO comVO = new ComVO();
		
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
		comVO.setComID(comID);
		dao.update(comVO);
		
		return comVO;
	}
	
	public void deleteCom(int comID) {
		dao.delete(comID);
	}
	
	public ComVO getOneCom(int comID) {
		return dao.findByPrimaryKey(comID);
	}
	
	public List<ComVO> getAll(){
		return dao.getAll();
	}

	public List<ComVO> getAll(Map<String, String[]> map) {
		// TODO Auto-generated method stub
		return dao.getAll(map);
	}
	
	public List<ComVO> getAllForComindex(){
		return dao.getAllForComindex();
	}
	
	public List<ComCommentVO> getAllComComment(Integer comID){
		return dao.getAllComComment(comID);
	}
	public List<ComVO> getFavorite(int memID){
		return dao.getFavorite(memID);
	}
	
}

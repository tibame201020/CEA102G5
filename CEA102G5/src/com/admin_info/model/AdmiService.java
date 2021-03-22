package com.admin_info.model;

import java.util.List;

import com.commodity.model.ComVO;

public class AdmiService {
	
	private AdmiDAO_interface dao;
	
	public AdmiService() {
		dao = new AdmiDAO();
	}
	
	public AdmiVO getByID(Integer admID) {
		return dao.findByPrimaryKey(admID);
	}
	
	public AdmiVO getByAccount(String admAccount) {
		return dao.findByAccount(admAccount);
	}
	
	public List<AdmiVO> getAll(){
		return dao.getAll();
	}
	
	public void delete(Integer admID) {
		dao.delete(admID);
	}
	
	public void back(Integer admID) {
		dao.back(admID);
	}
	
	public AdmiVO addAdmiVO(String admName,String admAccount,String admPassword,Integer[] funID) {
		AdmiVO admiVO = new AdmiVO();
		admiVO.setAdmName(admName);
		admiVO.setAdmAccount(admAccount);
		admiVO.setAdmPassword(admPassword);
		dao.insert(admiVO,funID);
		
		return admiVO;
	}
	
	public AdmiVO updateAdm(String admName, String admAccount,String admPassword,int admID ,Integer[] funID) {
		
		AdmiVO admiVO = new AdmiVO();
		
		admiVO.setAdmName(admName);
		admiVO.setAdmAccount(admAccount);
		admiVO.setAdmPassword(admPassword);
		
		admiVO.setAdmID(admID);
		dao.update(admiVO,funID);
		
		return admiVO;
	}
}

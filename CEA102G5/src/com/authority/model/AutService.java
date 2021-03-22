package com.authority.model;

import java.sql.Connection;
import java.util.List;

import com.admin_info.model.AdmiVO;

public class AutService {
	
	private AutDAO_interface dao;
	
	public AutService() {
		dao = new AutDAO();
	}
	
	
	public boolean check(Integer admiID,Integer funID){
		return dao.check(admiID,funID);
	}
	
	public AutVO addAutVO(Integer admID,Integer funID) {
		Connection con= null;
		AutVO autVO = new AutVO();
		autVO.setAdmID(admID);
		autVO.setFunID(funID);
		
		dao.insert(autVO, con);
		
		return autVO;
	}
	
	public void deleteAdm(int admID) {
		dao.delete(admID);
	}
	
	public List<String> getFun(Integer admID) {
		return dao.getFun(admID);
	}
	

}

package com.function_info.model;

import java.util.List;

public class FuniService {
	
	private FuniDAO_interface dao;
	
	public FuniService() {
		dao = new FuniDAO();
	}
	
	public FuniVO getOneByID(Integer funID) {
		return dao.findByPrimaryKey(funID);
	}
	
	public List<FuniVO> getAll(){
		return dao.getAll();
	}

}

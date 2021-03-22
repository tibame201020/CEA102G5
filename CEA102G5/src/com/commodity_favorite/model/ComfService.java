package com.commodity_favorite.model;

import java.util.Set;

public class ComfService {
	private ComfDAO_Interface dao;
	
	public ComfService() {
		dao = new ComfDAO();
	}
	public void addComf(ComfVO comfVO){
		System.out.println(comfVO.getComID());
		System.out.println(comfVO.getMemID());
		dao.insert(comfVO);
	}
	public void deleteComf(ComfVO comfVO) {
		dao.delete(comfVO);
	}
	public ComfVO findByMemID(int memID) {
		return dao.findByMemID(memID);

	}
	public Set favCom (String memID) {
		return dao.favCom(memID);
	}
	public void addByRedis(String memID, String comID){
		dao.insertByRedis(memID, comID);
	}
	public Boolean check (String memID, String comID) {
		return dao.check(memID, comID);
	}
	public void deleteByRedis(String memID, String comID){
		dao.deleteByRedis(memID, comID);
	}
}

package com.commodity_favorite.model;

import java.util.Set;

public interface ComfDAO_Interface {
	public void insert(ComfVO comfVO);
	public void delete(ComfVO comfVO);
	public ComfVO findByMemID(int memID);
	public Set favCom(String memID);
	public void insertByRedis(String memID,String comID);
	public void deleteByRedis(String memID,String comID);
	public Boolean check(String memID,String comID);
}

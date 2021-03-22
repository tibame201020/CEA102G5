package com.admin_info.model;

import java.util.List;

public interface AdmiDAO_interface {
	public AdmiVO insert (AdmiVO admiVO,Integer[] funID);
	public void update (AdmiVO admiVO ,Integer[] funID);
	public void delete (Integer admID);
	public void back(Integer admID);
	public AdmiVO findByPrimaryKey(Integer admID);
	public AdmiVO findByAccount(String admAccount);
	public List<AdmiVO> getAll();
}

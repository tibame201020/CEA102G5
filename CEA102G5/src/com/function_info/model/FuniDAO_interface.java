package com.function_info.model;

import java.util.List;

public interface FuniDAO_interface {
	
	public FuniVO findByPrimaryKey(Integer funID);
	public List<FuniVO> getAll();

}

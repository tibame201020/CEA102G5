package com.function_info.model;

import java.io.Serializable;

public class FuniVO implements Serializable{
	
	private Integer funID;
	private String funName;
	
	public FuniVO(){
		super();
	}

	public Integer getFunID() {
		return funID;
	}

	public void setFunID(Integer funID) {
		this.funID = funID;
	}

	public String getFunName() {
		return funName;
	}

	public void setFunName(String funName) {
		this.funName = funName;
	}
	
	

}

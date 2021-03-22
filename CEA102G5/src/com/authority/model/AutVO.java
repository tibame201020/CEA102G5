package com.authority.model;

import java.io.Serializable;

public class AutVO implements Serializable{
	
	private Integer admID;
	private Integer funID;
	
	public AutVO() {
		super();
	}

	public Integer getAdmID() {
		return admID;
	}

	public void setAdmID(Integer admID) {
		this.admID = admID;
	}

	public Integer getFunID() {
		return funID;
	}

	public void setFunID(Integer funID) {
		this.funID = funID;
	}
	
}

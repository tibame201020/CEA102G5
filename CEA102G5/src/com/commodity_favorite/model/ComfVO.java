package com.commodity_favorite.model;

import java.io.Serializable;

public class ComfVO implements Serializable{
	
	private Integer memID;
	private Integer comID;
	
	public ComfVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getMemID() {
		return memID;
	}
	public void setMemID(Integer memID) {
		this.memID = memID;
	}
	public Integer getComID() {
		return comID;
	}
	public void setComID(Integer comID) {
		this.comID = comID;
	}
	
}

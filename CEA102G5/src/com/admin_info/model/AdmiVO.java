package com.admin_info.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class AdmiVO implements Serializable {
	
	private Integer admID;
	private String admName;
	private String admAccount;
	private String admPassword;
	private Boolean admStatus;
	private Timestamp admTime;
	
	public AdmiVO() {
		super();
	}
	
	public Integer getAdmID() {
		return admID;
	}
	public void setAdmID(Integer admID) {
		this.admID = admID;
	}
	public String getAdmName() {
		return admName;
	}
	public void setAdmName(String admName) {
		this.admName = admName;
	}
	public String getAdmAccount() {
		return admAccount;
	}
	public void setAdmAccount(String admAccount) {
		this.admAccount = admAccount;
	}
	public String getAdmPassword() {
		return admPassword;
	}
	public void setAdmPassword(String admPassword) {
		this.admPassword = admPassword;
	}
	public Boolean getAdmStatus() {
		return admStatus;
	}
	public void setAdmStatus(Boolean admStatus) {
		this.admStatus = admStatus;
	}
	public Timestamp getAdmTime() {
		return admTime;
	}
	public void setAdmTime(Timestamp admTime) {
		this.admTime = admTime;
	} 

}

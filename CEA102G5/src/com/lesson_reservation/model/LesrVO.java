package com.lesson_reservation.model;

import java.sql.Date;

public class LesrVO implements java.io.Serializable {
	private Integer lesID;
	private Integer memID;
	private String lesrComments;
	private String lesrAnswer;
	private Boolean lesrStatus;
	private String lesrReason;
	private Date lesrTime;
	private Date lesDate;
	private Long lesrTimeLong;
	
	public LesrVO() {
		super();	
	}

	public Long getLesrTimeLong() {
		return lesrTimeLong;
	}

	public void setLesrTimeLong(Long lesrTimeLong) {
		this.lesrTimeLong = lesrTimeLong;
	}

	public Date getLesDate() {
		return lesDate;
	}

	public void setLesDate(Date lesDate) {
		this.lesDate = lesDate;
	}

	public Integer getLesID() {
		return lesID;
	}

	public void setLesID(Integer lesID) {
		this.lesID = lesID;
	}

	public Integer getMemID() {
		return memID;
	}

	public void setMemID(Integer memID) {
		this.memID = memID;
	}

	public Boolean getLesrStatus() {
		return lesrStatus;
	}

	public void setLesrStatus(Boolean lesrStatus) {
		this.lesrStatus = lesrStatus;
	}

	public String getLesrReason() {
		return lesrReason;
	}

	public void setLesrReason(String lesrReason) {
		this.lesrReason = lesrReason;
	}

	public Date getLesrTime() {
		return lesrTime;
	}

	public void setLesrTime(Date lesrTime) {
		this.lesrTime = lesrTime;
	}

	public String getLesrComments() {
		return lesrComments;
	}

	public void setLesrComments(String lesrComments) {
		this.lesrComments = lesrComments;
	}

	public String getLesrAnswer() {
		return lesrAnswer;
	}

	public void setLesrAnswer(String lesrAnswer) {
		this.lesrAnswer = lesrAnswer;
	}

}

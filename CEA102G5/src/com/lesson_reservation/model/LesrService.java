package com.lesson_reservation.model;


import java.util.List;
import java.util.Set;

import com.lesson.model.LesVO;

public class LesrService {

	private LesrDAO_interface dao;

	public LesrService() {
		dao = new LesrDAO();
	}

	public LesrVO addLesr(Integer lesID, Integer memID, String lesrComments, String lesrAnswer, Boolean lesrStatus,
			String lesrReason) {

		LesrVO lesrVO = new LesrVO();

		lesrVO.setLesID(lesID);
		lesrVO.setMemID(memID);
		lesrVO.setLesrComments(lesrComments);
		lesrVO.setLesrAnswer(lesrAnswer);
		lesrVO.setLesrStatus(lesrStatus);
		lesrVO.setLesrReason(lesrReason);
		

		dao.insert(lesrVO);

		return lesrVO;
	}

	public LesrVO updateLesr(Integer lesID, Integer memID, String lesrComments, String lesrAnswer, Boolean lesrStatus,
			String lesrReason ,java.sql.Date lesrTime) {

		LesrVO lesrVO = new LesrVO();

		lesrVO.setLesID(lesID);
		lesrVO.setMemID(memID);
		lesrVO.setLesrComments(lesrComments);
		lesrVO.setLesrAnswer(lesrAnswer);
		lesrVO.setLesrStatus(lesrStatus);
		lesrVO.setLesrReason(lesrReason);
		lesrVO.setLesrTime(lesrTime);
		
		dao.update(lesrVO);

		return lesrVO;
	}
	
	public LesVO updateLes(Integer lesID,Integer lesAlready) {

		LesVO lesVO = new LesVO();

		lesVO.setLesID(lesID);
		lesVO.setLesAlready(lesAlready);				
		dao.updateLes(lesVO);

		return lesVO;
	}

	public void deleteLesr(Integer lesID, Integer memID) {
		dao.delete(lesID, memID);
	}
	public Set<LesrVO> getLesByMem(Integer memID) {
		return dao.getLesByMem(memID);
	}
	public Set<LesrVO> getMemByLes(Integer lesID) {
		return dao.getMemByLes(lesID);
	}

	public LesrVO getOneLesr(Integer lesID ,Integer memID) {
		return dao.findByPrimaryKey(lesID , memID);
	}

	public List<LesrVO> getAll() {
		return dao.getAll();
	}
	public LesrVO getOneReservation(Integer lesID ,Integer memID) {
		return dao.findByPrimaryKey(lesID , memID);
	}
	public Boolean search(Integer memID, Integer lesID) {
		return dao.search(memID, lesID);
	}
}
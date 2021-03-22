package com.lesson_favorites.model;

import java.util.Set;

public class LesfService {

	private LesfDAO_interface dao;

	public LesfService() {
		dao = new LesfDAO();
	}

	public LesfVO addLesf(Integer lesID, Integer memID) {		
		LesfVO lesfVO = new LesfVO();
		lesfVO.setLesID(lesID);
		lesfVO.setMemID(memID);		
		dao.insert(lesfVO);

		return lesfVO;
	}
	
	public void deleteLesf(Integer lesID, Integer memID) {
		dao.delete(lesID, memID);
	}
	
	public Set<LesfVO> getOneLesf(Integer memID) {
		return dao.findByPrimaryKey(memID);
	}
   
	public Boolean search(Integer memID, Integer lesID) {
		return dao.search(memID, lesID);
	}
}

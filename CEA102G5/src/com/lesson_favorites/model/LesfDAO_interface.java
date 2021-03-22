package com.lesson_favorites.model;

import java.util.Set;

public interface LesfDAO_interface {
	 public void insert(LesfVO lesfVO);
	 public void delete(Integer lesID, Integer memID);
	 public Set<LesfVO> findByPrimaryKey(Integer memID);
	 public Boolean search(Integer memID , Integer lesID);
}


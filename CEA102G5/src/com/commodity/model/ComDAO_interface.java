package com.commodity.model;

import java.util.List;
import java.util.Map;

import com.util.model.ComCommentVO;



public interface ComDAO_interface {
	public void insert(ComVO comVO);
    public void update(ComVO comVO);
    public void delete(int comID);
    public ComVO findByPrimaryKey(int comID);
    public List<ComVO> getAll();
    public List<ComVO> getAllForComindex();
    public List<ComCommentVO> getAllComComment(Integer comID);
    //萬用複合查詢
    public List<ComVO> getAll(Map<String,String[]> map);
    public List<ComVO> getFavorite(int memID);

}

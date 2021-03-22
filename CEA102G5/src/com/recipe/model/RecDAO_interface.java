package com.recipe.model;

import java.util.List;
import java.util.Map;

import com.recipe_ingredients.model.ReciVO;
import com.recipe_step.model.RecsVO;


public interface RecDAO_interface {
	public void insertWithReciRecs(RecVO recVO,List<ReciVO> reciList,List<RecsVO> recsList);
	public void updateStatus(Integer recStatus,Integer recID,Integer recBonus);
	public void updateBonus(Integer memID);
    public void update(RecVO recVO,List<ReciVO> reciList,List<RecsVO> recsList);
    public void delete(Integer recID);
    public RecVO findByPrimaryKey(Integer recID);
    public List<RecVO> getAll();
    public List<RecVO> getAllByMemID(Integer memID);
    public List<RecVO> getAllByStatus(Integer recStatus);
    public List<RecVO> getAllByCondition(String column,String value);
}

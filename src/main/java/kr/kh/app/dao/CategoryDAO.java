package kr.kh.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.CategoryVO;

public interface CategoryDAO {

	ArrayList<CategoryVO> selectCategoryList();

	CategoryVO selectCategoryByName(@Param("category_name")String category_name);

	boolean insertCategory(@Param("category")CategoryVO category);

	boolean deleteCategory(@Param("category")CategoryVO category);


}

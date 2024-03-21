package kr.kh.app.service;

import java.util.ArrayList;

import kr.kh.app.model.vo.CategoryVO;

public interface CategoryService {

	ArrayList<CategoryVO> getCategoryList();

	boolean insertCategory(CategoryVO category) throws Exception;

}

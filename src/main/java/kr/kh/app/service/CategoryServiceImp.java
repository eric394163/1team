package kr.kh.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.CategoryDAO;
import kr.kh.app.model.vo.CategoryVO;

public class CategoryServiceImp implements CategoryService {
	private CategoryDAO categoryDao;
	
	public CategoryServiceImp() {
		String resource = "kr/kh/app/config/mybatis-config.xml";
		
		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			SqlSession session = sessionFactory.openSession(true);
			categoryDao = session.getMapper(CategoryDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//문자열 체크
	private boolean checkString(String str) {
		if(str == null || str.length() == 0) {
			return false;
		}
		return true;
	}

	@Override
	public ArrayList<CategoryVO> getCategoryList() {
		return categoryDao.selectCategoryList();
	}

	@Override
	public boolean insertCategory(CategoryVO category) throws Exception {
		if(category == null || !checkString(category.getCategory_name())) {
			return false;
		}
		if (categoryDao.selectCategoryByName(category.getCategory_name()) != null) {
			throw new Exception("카테고리가 중복됩니다.");
		}
		return categoryDao.insertCategory(category);
	}

	@Override
	public boolean deleteCategory(CategoryVO category) {
		if(category == null) {
			return false;
		}
		return categoryDao.deleteCategory(category);
	}
}

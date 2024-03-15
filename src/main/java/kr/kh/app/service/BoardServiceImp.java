package kr.kh.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.BoardDAO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.pagination.BoardListCriteria;

public class BoardServiceImp implements BoardService{

	private BoardDAO boardDao;
	
	public BoardServiceImp() {
		String resource = "kr/kh/app/config/mybatis-config.xml";
		
		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			SqlSession session = sessionFactory.openSession(true);
			boardDao = session.getMapper(BoardDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int getTotalCount(BoardListCriteria cri) {
		if(cri == null) {
			cri = new BoardListCriteria();
		}
		return boardDao.selectTotalCount(cri);
	}

	@Override
	public ArrayList<PostVO> getBoardList(BoardListCriteria cri) {
		if(cri == null) {
			cri = new BoardListCriteria();
		}
		return boardDao.selectBoardList(cri);
	}
}

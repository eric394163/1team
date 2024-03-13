package kr.kh.app.service;


import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.PostDAO;
import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.pagination.Criteria;

public class SubPostServiceImp implements SubPostService {
	
	private PostDAO postDao;
	
	public SubPostServiceImp() {
		String resource = "kr/kh/app/config/mybatis-config.xml";
		
		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			SqlSession session = sessionFactory.openSession(true);
			postDao = session.getMapper(PostDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	//클릭해서 넘어온 게시판번호의 게시명을 가져올 서비스 명령
	@Override
	public BoardVO getSubBoard(int board_id) {
		return postDao.selectSubBoard(board_id);
	}
	
	@Override
	public int getSubTotalCount(Criteria cri, int board_id) {
		if(cri == null) {
			return 0;
		}
		return postDao.selectSubTotalCount(cri, board_id);
	}

	@Override
	public ArrayList<PostVO> getSubPostList(Criteria cri, int board_id) {
		if(cri == null) {
			cri = new Criteria();
		}
		return postDao.selectSubPostList(cri, board_id);
	}

}

package kr.kh.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.PostDAO;
import kr.kh.app.model.vo.AttachVO;
import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.pagination.Criteria;

public class PostServiceImp implements PostService {
	private PostDAO postDao;

	public PostServiceImp() {
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

	@Override
	public ArrayList<BoardVO> getBoardList() {
		return postDao.selectBoardList();
	}

	@Override
	public boolean insertPost(PostVO post) {
		if (post == null || !checkString(post.getPost_content()) || !checkString(post.getPost_title())) {
			return false;
		}

		boolean res = postDao.insertPost(post);

		if (!res) {
			return false;
		}

		return res;
	}

	private boolean checkString(String str) {
		if (str == null || str.length() == 0) {
			return false;
		}
		return true;
	}


	@Override
	public ArrayList<PostVO> getTotalSearchResultList(Criteria cri) {
		if (cri == null) {
			cri = new Criteria();
		}
		return postDao.selectTotalSearchResultList(cri);
	}

	@Override
	public ArrayList<PostVO> getTotalPostList(Criteria cri) {
		if (cri == null) {
			cri = new Criteria();
		}

		return postDao.selectTotalPostList(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		if (cri == null) {
			cri = new Criteria();
		}
		return postDao.selectTotalCount(cri);
	}

	@Override
	public PostVO getPost(int num) {
		return postDao.selectPost(num);
	}

	@Override
	public ArrayList<AttachVO> getFile(int num) {
		return postDao.selectFileByPost_id(num);
	}

	@Override
	public int getTotalPostCount(Criteria cri) {
		if (cri == null) {
			cri = new Criteria();
		}
		return postDao.selectTotalPostCount(cri);
	}

}

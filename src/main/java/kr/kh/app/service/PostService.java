package kr.kh.app.service;

import java.util.ArrayList;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.pagination.Criteria;

public interface PostService {

	ArrayList<BoardVO> getBoardList();

	boolean insertPost(PostVO post);

	ArrayList<PostVO> getTotalPostList(Criteria cri);	// 전체 게시글 조회

	int getTotalCount(Criteria cri);
	
}

package kr.kh.app.service;

import java.util.ArrayList;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.pagination.Criteria;


public interface PostService {

	ArrayList<BoardVO> getBoardList();

	boolean insertPost(PostVO post);

    int getTotalPostCount(Criteria cri);

    ArrayList<PostVO> getTotalSearchResultList(Criteria cri);

	ArrayList<PostVO> getTotalPostList();

	
}

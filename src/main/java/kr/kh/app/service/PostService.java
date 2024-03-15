package kr.kh.app.service;

import java.util.ArrayList;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.PostVO;


public interface PostService {

	ArrayList<BoardVO> getBoardList();

	boolean insertPost(PostVO post);

<<<<<<< HEAD
=======
	ArrayList<PostVO> getTotalPostList();	// 전체 게시글 조회
>>>>>>> b11be37048b754907451b8d3ea8a9165e0cccd9d
	
}

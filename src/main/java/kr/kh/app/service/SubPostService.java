package kr.kh.app.service;

import java.util.ArrayList;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.pagination.Criteria;

public interface SubPostService {
	//클릭해서 넘어온 게시판번호의 게시명을 가져올 서비스
	BoardVO getSubBoard(int board_id);

	//게시판번호에 맞는 전체게시글리스트 개수 가져오는 서비스
	int getSubTotalCount(Criteria cri, int board_id);

	//게시판번호에 맞는 게시글리스트 가져오는 서비스
	ArrayList<PostVO> getSubPostList(Criteria cri, int board_id);

}

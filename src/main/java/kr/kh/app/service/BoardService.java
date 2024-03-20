package kr.kh.app.service;

import java.util.ArrayList;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.pagination.BoardListCriteria;

public interface BoardService {

	int getTotalCount(BoardListCriteria cri);

	ArrayList<PostVO> getBoardList(BoardListCriteria cri);

	//클릭해서 넘어온 게시판번호의 게시명을 가져올 서비스
	BoardVO getSubBoard(int boNum);

}

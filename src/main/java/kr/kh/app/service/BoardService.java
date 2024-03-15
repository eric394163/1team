package kr.kh.app.service;

import java.util.ArrayList;

import kr.kh.app.model.vo.PostVO;
import kr.kh.app.pagination.BoardListCriteria;

public interface BoardService {

	int getTotalCount(BoardListCriteria cri);

	ArrayList<PostVO> getBoardList(BoardListCriteria cri);

}

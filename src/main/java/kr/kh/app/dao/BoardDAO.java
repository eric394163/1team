package kr.kh.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.pagination.BoardListCriteria;

public interface BoardDAO {

	int selectTotalCount(@Param("cri")BoardListCriteria cri);

	ArrayList<PostVO> selectBoardList(@Param("cri")BoardListCriteria cri);

	BoardVO selectSubBoard(int board_id);

}

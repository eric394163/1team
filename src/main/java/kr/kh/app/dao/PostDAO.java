package kr.kh.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.pagination.Criteria;

public interface PostDAO {

	ArrayList<BoardVO> selectBoardList();

	boolean insertPost(@Param("post")PostVO post);

	//클릭해서 넘어온 게시판명 가져오기
	BoardVO selectSubBoard(@Param("board_id")int board_id);

	int selectSubTotalCount(@Param("cri")Criteria cri, @Param("board_id")int board_id);

	ArrayList<BoardVO> selectSubBoardList(@Param("cri")Criteria cri, @Param("board_id")int board_id);
}

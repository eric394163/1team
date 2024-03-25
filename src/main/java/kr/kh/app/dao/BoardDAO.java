package kr.kh.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.pagination.Criteria;

public interface BoardDAO {

	int selectTotalCount(@Param("cri")Criteria cri);

	ArrayList<PostVO> selectBoardList(@Param("cri")Criteria cri);

	BoardVO selectSubBoard(int board_id);

	int selectCommentPostCount(@Param("cri")Criteria cri);

	ArrayList<PostVO> selectCommentPostList(@Param("cri")Criteria cri);

	int selectLikePostCount(@Param("cri")Criteria cri);

	ArrayList<PostVO> selectLikePostList(@Param("cri")Criteria cri);

	boolean insertBoard(@Param("bo")BoardVO board);

	Object selectBoardByName(@Param("board_name")String board_name);

	ArrayList<BoardVO> selectCaBoardList(@Param("ca_num")int ca_num);

	boolean deleteBoard(@Param("board_id")int board_id);

	boolean updateBoard(@Param("bo")BoardVO board);

}

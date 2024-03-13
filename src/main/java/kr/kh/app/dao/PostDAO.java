package kr.kh.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.pagination.Criteria;

public interface PostDAO {

	ArrayList<BoardVO> selectBoardList();

	boolean insertPost(@Param("post")PostVO post);

	ArrayList<PostVO> selectTotalPostList(@Param("cri") Criteria cri);

}

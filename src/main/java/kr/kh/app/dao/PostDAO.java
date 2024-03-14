package kr.kh.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.AttachVO;
import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.PostVO;

public interface PostDAO {

	ArrayList<BoardVO> selectBoardList();

	boolean insertPost(@Param("post")PostVO post);

	void insertFile(@Param("attach")AttachVO attachVo);

	void insertLink(@Param("attach")AttachVO attach);
	
	
}

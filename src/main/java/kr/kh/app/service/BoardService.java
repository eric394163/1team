package kr.kh.app.service;

import java.util.ArrayList;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.pagination.Criteria;

public interface BoardService {

	int getTotalCount(Criteria cri);

	ArrayList<PostVO> getBoardList(Criteria cri);

	//클릭해서 넘어온 게시판번호의 게시명을 가져올 서비스
	BoardVO getSubBoard(int boNum);

	int getCommentPostCount(Criteria cri);

	ArrayList<PostVO> getCommentPostList(Criteria cri);

	int getLikePostCount(Criteria cri);

	ArrayList<PostVO> getLikePostList(Criteria cri);

	boolean insertBoard(BoardVO board) throws Exception;

	ArrayList<BoardVO> getCaBoardList(int ca_num);

	boolean deleteBoard(int board_id);

	boolean updateBoard(BoardVO board);

}

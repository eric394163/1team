package kr.kh.app.service;

import java.util.ArrayList;

import javax.servlet.http.Part;

import kr.kh.app.model.vo.AttachVO;
import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.model.vo.UserVO;
import kr.kh.app.pagination.Criteria;

public interface PostService {

	ArrayList<BoardVO> getBoardList();

	boolean insertPost(PostVO post, ArrayList<Part> partList, AttachVO attach);

	ArrayList<PostVO> getTotalPostList(Criteria cri); // 전체 게시글 조회

	int getTotalCount(Criteria cri);

	PostVO getPost(int num);

	ArrayList<AttachVO> getFile(int num);

	AttachVO getLink(int num);
	
	int getTotalPostCount(Criteria cri);

	ArrayList<PostVO> getTotalSearchResultList(Criteria cri);

	boolean updateBoard(PostVO post, UserVO user, String[] nums, ArrayList<Part> fileList, AttachVO attach);

    ArrayList<PostVO> getPopularViewPostList(Criteria cri);

	ArrayList<PostVO> getPopularLikePostList(Criteria popularLikeCri);

}

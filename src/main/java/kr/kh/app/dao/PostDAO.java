package kr.kh.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.AttachVO;
import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.CommentVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.model.vo.ReportVO;
import kr.kh.app.model.vo.UpvoteVO;
import kr.kh.app.pagination.Criteria;

public interface PostDAO {

	ArrayList<BoardVO> selectBoardList();

	boolean insertPost(@Param("post") PostVO post);

	int selectTotalPostCount(@Param("cri") Criteria cri);

	ArrayList<PostVO> selectTotalSearchResultList(@Param("cri") Criteria cri);

	ArrayList<PostVO> selectTotalPostList(@Param("cri") Criteria cri);

	int selectTotalCount(@Param("cri") Criteria cri);

	PostVO selectPost(@Param("num") int num);

	ArrayList<AttachVO> selectFileByPost_id(@Param("num") int num);

	AttachVO selectLinkByPost_id(@Param("num") int num);

	void insertFile(@Param("attach") AttachVO attachVo);

	void insertLink(@Param("attach") AttachVO attach);

	boolean deletePost(@Param("num") int num);

	void deleteFile(@Param("attach_num") int attach_num);

	boolean deleteLink(@Param("attach") AttachVO attachVo);
	
	boolean updatePost(@Param("post")PostVO post);

	AttachVO selectFile(@Param("attach_num") int attach_num);

	AttachVO selectLink(@Param("num") int num);

	ArrayList<PostVO> selectTotalPopularViewPostList(@Param("cri") Criteria cri);

	ArrayList<PostVO> selectTotalPopularLikePostList(@Param("cri") Criteria cri);

	boolean updateAttach(@Param("attach")AttachVO attach);

	AttachVO selectAttachPath(@Param("attach_post_id") int attach_post_id);

	void insertLike(@Param("like")UpvoteVO like);
    int selectReportedPostCount(@Param("cri") Criteria cri);

	ArrayList<PostVO> selectReportedPostList(@Param("cri") Criteria cri);
	boolean insertComment(@Param("co")CommentVO comment);

	ArrayList<CommentVO> selectCommentList(@Param("cri")Criteria cri);

	int selectTotalCountComment(@Param("cri")Criteria cri);

	CommentVO selectComment(@Param("comment_id")int num);

	boolean deleteComment(@Param("comment_id")int num);

	boolean updateComment(@Param("co")CommentVO comment);


	UpvoteVO selectLike(@Param("user_id")String user_id, @Param("post_id")int post_id);

	void updateLike(@Param("like")UpvoteVO like);

	boolean updatePostView(@Param("num")int num);

	boolean updatePostUpvotePlus(@Param("num")int post_id);

	boolean updatePostUpvoteMinus(@Param("num")int post_id);

	int selectPostReportedListCount(@Param("cri") Criteria cri);

	ArrayList<ReportVO> selectPostReportedList(@Param("cri") Criteria cri);

}

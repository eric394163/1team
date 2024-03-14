package kr.kh.app.service;

import java.util.ArrayList;

import javax.servlet.http.Part;

import kr.kh.app.model.vo.AttachVO;
import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.PostVO;

public interface PostService {

	ArrayList<BoardVO> getBoardList();

	boolean insertPost(PostVO post, ArrayList<Part> partList, AttachVO attachVo);
	
}

package kr.kh.app.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import javax.servlet.http.Part;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.PostDAO;
import kr.kh.app.model.vo.AttachVO;
import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.model.vo.UserVO;
import kr.kh.app.pagination.Criteria;
import kr.kh.app.utils.FileUploadUtils;
import lombok.Data;

public class PostServiceImp implements PostService {
	private PostDAO postDao;
	private static String uploadPath = "D:\\musicfile";

	public PostServiceImp() {
		String resource = "kr/kh/app/config/mybatis-config.xml";

		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			SqlSession session = sessionFactory.openSession(true);
			postDao = session.getMapper(PostDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}

		File file = new File(uploadPath);
		if (!file.exists()) {
			file.mkdirs();
		}
	}

	private void uploadFile(Part part, int post_id) {
		if (part == null || post_id == 0) {
			return;
		}

		String fileOriName = FileUploadUtils.getFileName(part);
		if (fileOriName == null || fileOriName.length() == 0) {
			return;
		}

		String fileName = FileUploadUtils.upload(uploadPath, part);
		AttachVO attachVo = new AttachVO(post_id, fileName);
		postDao.insertFile(attachVo);

	}

	private void uploadLink(AttachVO attach, int post_id) {
		if (attach == null || post_id == 0) {
			return;
		}

		postDao.insertLink(attach);
	}

	private boolean checkString(String str) {
		if (str == null || str.length() == 0) {
			return false;
		}
		return true;
	}

	private void deleteFile(AttachVO fileVo) {
		if (fileVo == null) {
			return;
		}

		File file = new File(uploadPath + fileVo.getAttach_path().replace('/', File.separatorChar));

		if (file.exists()) {
			file.delete();
		}
		postDao.deleteFile(fileVo.getAttach_num());

	}


//	 private void deleteLink(AttachVO attachVo) { 
//		 if (attachVo == null) { 
//			 return;
//	 }
//	 
//		 postDao.deleteLink(attachVo.getAttach_num()); 
//	 }
	 

	@Override
	public ArrayList<BoardVO> getBoardList() {
		return postDao.selectBoardList();
	}

	@Override
	public boolean insertPost(PostVO post, ArrayList<Part> partList, AttachVO attach) {
		if (post == null || !checkString(post.getPost_content()) || !checkString(post.getPost_title())) {
			return false;
		}

		boolean res = postDao.insertPost(post);

		if (!res) {
			return false;
		}

		if (partList == null || partList.size() == 0) {
			return true;
		}

		// 첨부파일 업로드
		for (Part part : partList) {
			uploadFile(part, post.getPost_id());
		}

		if (attach == null || !checkString(attach.getAttach_path())) {
			return true;
		}

		// 링크 업로드
		uploadLink(attach, post.getPost_id());

		return res;
	}

	@Override
	public ArrayList<PostVO> getTotalSearchResultList(Criteria cri) {
		if (cri == null) {
			cri = new Criteria();
		}
		return postDao.selectTotalSearchResultList(cri);
	}

	@Override
	public ArrayList<PostVO> getTotalPostList(Criteria cri) {
		if (cri == null) {
			cri = new Criteria();
		}

		return postDao.selectTotalPostList(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		if (cri == null) {
			cri = new Criteria();
		}
		return postDao.selectTotalCount(cri);
	}

	@Override
	public PostVO getPost(int num) {
		return postDao.selectPost(num);
	}

	@Override
	public ArrayList<AttachVO> getFile(int num) {
		return postDao.selectFileByPost_id(num);
	}

	@Override
	public AttachVO getLink(int num) {
		return postDao.selectLinkByPost_id(num);
	}

	@Override
	public int getTotalPostCount(Criteria cri) {
		if (cri == null) {
			cri = new Criteria();
		}
		return postDao.selectTotalPostCount(cri);
	}

	@Override
	public boolean updateBoard(PostVO post, UserVO user, String[] nums, ArrayList<Part> fileList) {

		System.out.println("postService: " + user);

		if (post == null || !checkString(post.getPost_title()) || !checkString(post.getPost_content())) {
			return false;
		}

		if (user == null) {
			return false;
		}

		PostVO dbPost = postDao.selectPost(post.getPost_id());
		System.out.println(dbPost);

		if (dbPost == null || !dbPost.getPost_user_id().equals(user.getUser_id())) {
			return false;
		}

		if (nums != null) {
			for (String numStr : nums) {
				try {
					int num = Integer.parseInt(numStr);
					AttachVO attachVo = postDao.selectFile(num);
					deleteFile(attachVo);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		if (fileList != null) {
			for (Part file : fileList) {
				uploadFile(file, post.getPost_id());
			}
		}

		boolean res = postDao.updatePost(post);

		return res;
	}

	@Override
	public boolean updateAttach(PostVO post, UserVO user, String link, AttachVO attach) {
		if (post == null) {
			return false;
		}

		if (user == null) {
			return false;
		}

		if (link != null) {
			System.out.println("으으앙아아아아악");
			try {
				int attach_post_id = attach.getAttach_post_id();
				
				 AttachVO attachVo = postDao.selectAttachPath(attach_post_id); 

				postDao.deleteLink(attachVo); 

				
				
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
		}

		uploadLink(attach, attach.getAttach_post_id());

		return true;
	}

	@Override
	public boolean deletePost(int num, UserVO user) {
		if (user == null) {
			return false;
		}

		PostVO post = postDao.selectPost(num);

		if (post == null || !post.getPost_user_id().equals(user.getUser_id())) {
			return false;
		}

		ArrayList<AttachVO> fileList = postDao.selectFileByPost_id(num);
		for (AttachVO file : fileList) {
			deleteFile(file);
		}

		return postDao.deletePost(num);
	}

	// 조회수 인기 게시글 리스트 조회
	@Override
	public ArrayList<PostVO> getPopularViewPostList(Criteria cri) {
		if (cri == null) {
			cri = new Criteria();
		}
		System.out.println("cri : " + cri);
		return postDao.selectTotalPopularViewPostList(cri);

	}

	@Override
	public ArrayList<PostVO> getPopularLikePostList(Criteria cri) {
		if (cri == null) {
			cri = new Criteria();
		}
		return postDao.selectTotalPopularLikePostList(cri);
	}

}

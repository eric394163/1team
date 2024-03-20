package kr.kh.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.UserDAO;
import kr.kh.app.model.dto.LoginDTO;
import kr.kh.app.model.dto.SignUpDTO;
import kr.kh.app.model.vo.BlockedVO;
import kr.kh.app.model.vo.UserVO;
import kr.kh.app.pagination.Criteria;
import kr.kh.app.utils.CheckErrAndMsg;
import kr.kh.app.utils.NullCheck;

public class UserServiceImp implements UserService {
	private UserDAO userDao;

	NullCheck nullCheck = new NullCheck();

	public UserServiceImp() {
		String resource = "kr/kh/app/config/mybatis-config.xml";

		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			SqlSession session = sessionFactory.openSession(true);
			userDao = session.getMapper(UserDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public UserVO login(LoginDTO loginDTO) {
		if (loginDTO == null) {
			System.out.println("loginDTO is null");
			return null;
		}
		// 아이디를 주고 회원 정보를 요청
		String id = loginDTO.getId();
		System.out.println("id: " + id);
		UserVO user = userDao.selectUser(id);
		System.out.println("user: " + user);

		if (user == null) {
			System.out.println("user is null");
			return null;
		}
		// 비번이 같은지 확인
		if (user.getUser_pw().equals(loginDTO.getPw())) {
			System.out.println("login success");
			return user;
		}
		return null;
	}

	@Override
	public boolean signUp(SignUpDTO signUpDTO) throws Exception {

		// CheckErrAndMsg checkErrAndMsg = new CheckErrAndMsg();

		// ArrayList<String> msgList = new ArrayList<String>(); // 메세지 스트링 메이커를 위한 리스트

		if (signUpDTO == null ||
				signUpDTO.getId() == null ||
				!signUpDTO.getId().matches("^\\w{6,12}$") ||
				signUpDTO.getPw() == null ||
				!signUpDTO.getPw().matches("^[a-zA-Z0-9!@#]{6,15}$") ||
				signUpDTO.getEmail() == null ||
				!signUpDTO.getEmail().matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$") ||
				signUpDTO.getNickname() == null ||
				!signUpDTO.getNickname().matches("^[a-zA-Z0-9가-힣_]{2,10}$") ||
				signUpDTO.getBirth() == null) {
			// return null;
			return false;
		} // 메서드로 따로 빼기

		// return 대신에 throw new Exception("아이디가 중복됩니다.");

		// 밑에 객체 없애고

		if (userDao.selectUserById(signUpDTO.getId()) != null) {
			// checkErrAndMsg.setMsg("아이디가 중복됩니다.");
			// // msgList.add("아이디");
			// checkErrAndMsg.setTrueOrFalse(false);
			// return checkErrAndMsg;
			throw new Exception("아이디가 중복됩니다.");
		}
		if (userDao.selectUserByEmail(signUpDTO.getEmail()) != null) {
			// checkErrAndMsg.setMsg("이메일이 중복됩니다.");
			// checkErrAndMsg.setTrueOrFalse(false);
			// return checkErrAndMsg;
			throw new Exception("이메일이 중복됩니다.");
		}
		if (userDao.selectUserByNickname(signUpDTO.getNickname()) != null) {
			// checkErrAndMsg.setMsg("닉네임이 중복됩니다.");
			// checkErrAndMsg.setTrueOrFalse(false);
			// return checkErrAndMsg;
			throw new Exception("닉네임이 중복됩니다.");
		}

		try {
			if (userDao.insertMember(signUpDTO)) {
				// checkErrAndMsg.setTrueOrFalse(true);
				// checkErrAndMsg.setMsg("회원가입 성공");
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			// checkErrAndMsg.setTrueOrFalse(false);
			// checkErrAndMsg.setMsg("회원가입 실패");
			return false;

		}
		return false;

	}

	@Override
	public int getTotalBlockedUserCount(Criteria cri) {
		if (cri == null) {
			return 0;
		}
		return userDao.selectTotalBlockedUserCount(cri);
	}

	@Override
	public ArrayList<BlockedVO> getBlockedUserList(Criteria cri) {
		if (cri == null) {
			return null;
		}
		return userDao.selectBlockedUserList(cri);
	}
}

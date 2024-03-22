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
	
	//문자열 체크
	private boolean checkString(String str) {
		if(str == null || str.length() == 0) {
			return false;
		}
		return true;
	}

	@Override
	public UserVO login(LoginDTO loginDTO) {
		if (loginDTO == null) {
			return null;
		}
		// 아이디를 주고 회원 정보를 요청
		String id = loginDTO.getId();
		UserVO user = userDao.selectUser(id);

		if (user == null) {
			System.out.println("user is null");
			return null;
		}
		// 비번이 같은지 확인
		if (user.getUser_pw().equals(loginDTO.getPw())) {
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
	public UserVO getUser(String email, String birth) {
		if(!checkString(email) || !checkString(birth)) {
			return null;
		}
		return userDao.selectFindUser(email, birth);
	}

	@Override
	public UserVO getUser(String id) {
		if(!checkString(id)) return null;
		return userDao.selectUser(id);
	}

	@Override
	public boolean updateUserPw(UserVO user) {
		if(user == null || 
			!checkString(user.getUser_id()) ||
			!checkString(user.getUser_pw())) return false;
		return userDao.updateUserPw(user);
	}

	@Override
	public String checkId(String id) {
		UserVO user = userDao.selectUser(id);
		return user == null ? "1" : "";
	}

	@Override
	public boolean updateSignUp(SignUpDTO signUpDTO) throws Exception {
		if (signUpDTO == null ||
				signUpDTO.getPw() == null ||
				!signUpDTO.getPw().matches("^[a-zA-Z0-9!@#]{6,15}$") ||
				signUpDTO.getEmail() == null ||
				!signUpDTO.getEmail().matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$") ||
				signUpDTO.getNickname() == null ||
				!signUpDTO.getNickname().matches("^[a-zA-Z0-9가-힣_]{2,10}$") ||
				signUpDTO.getBirth() == null) {
			return false;
		} 
		UserVO user = userDao.selectUser(signUpDTO.getId());
		System.out.println(signUpDTO.getId());

		if(!user.getUser_id().equals(signUpDTO.getId() )) {
			if (userDao.selectUserById(signUpDTO.getId()) != null) {
				throw new Exception("아이디가 중복됩니다.");
			}
		}
		if(!user.getUser_email().equals(signUpDTO.getEmail())) {
			if (userDao.selectUserByEmail(signUpDTO.getEmail()) != null) {
				throw new Exception("이메일이 중복됩니다.");
			}
		}
		if(!user.getUser_nickname().equals(signUpDTO.getNickname())) {
			if (userDao.selectUserByNickname(signUpDTO.getNickname()) != null) {
				throw new Exception("닉네임이 중복됩니다.");
			}
		}

		try {
			if (userDao.updateUser(signUpDTO)) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;

		}
		return false;
	}

	@Override
	public boolean updateDropUser(UserVO dropUser, String user_id) {
		if(dropUser == null || !checkString(user_id)) {
			return false;
		}
		return userDao.updateDropUser(dropUser, user_id);
	}

	@Override
	public String checkEmail(String email) {
		UserVO user = userDao.selectUserByEmail(email);
		return user == null ? "1" : "";
	}

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

	@Override
	public boolean unblockUser(BlockedVO blocked) {
		return userDao.deleteBlockedUser(blocked);
	}

	@Override
	public ArrayList<UserVO> getUserList(Criteria cri) {
		return userDao.selectUserList(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		if (cri == null) {
			cri = new Criteria();
		}
		return userDao.selectTotalCount(cri);
	}

	@Override
	public boolean updateUserByUserState(UserVO updateUser) {
		return userDao.updateUserByUserState(updateUser);
	}

	@Override
	public boolean updateUserByUserState2(UserVO updateUser) {
		return userDao.updateUserByUserState2(updateUser);
	}


}

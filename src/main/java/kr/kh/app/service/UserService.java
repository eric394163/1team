package kr.kh.app.service;

import java.util.ArrayList;

import kr.kh.app.model.dto.LoginDTO;
import kr.kh.app.model.dto.SignUpDTO;
import kr.kh.app.model.vo.BlockedVO;
import kr.kh.app.model.vo.UserVO;
import kr.kh.app.pagination.Criteria;

public interface UserService {

    UserVO login(LoginDTO loginDTO);

    boolean signUp(SignUpDTO signUpDTO) throws Exception;

	String checkId(String id);

	boolean updateSignUp(SignUpDTO signUpDto) throws Exception;
    int getTotalBlockedUserCount(Criteria cri);

    ArrayList<BlockedVO> getBlockedUserList(Criteria cri);

	UserVO getUser(String email, String birth);

	UserVO getUser(String id);

	boolean updateUserPw(UserVO user);

	boolean updateDropUser(UserVO dropUser, String user_id);

	String checkEmail(String email);

    boolean unblockUser(BlockedVO blocked);

	ArrayList<UserVO> getTotalUserList(Criteria cri);

	int getTotalUserCount(Criteria cri);

	ArrayList<UserVO> getUserList(Criteria cri);

	int getTotalCount(Criteria cri);

	boolean updateUserByUserState(UserVO updateUser);

	boolean updateUserByUserState2(UserVO updateUser);
	
    ArrayList<BlockedVO> getBlockedUsers(String userId);

}

package kr.kh.app.service;

import kr.kh.app.model.dto.LoginDTO;
import kr.kh.app.model.dto.SignUpDTO;
import kr.kh.app.model.vo.UserVO;

public interface UserService {

    UserVO login(LoginDTO loginDTO);

    boolean signUp(SignUpDTO signUpDTO);

	UserVO getUser(String email, String birth);

	UserVO getUser(String id);

	boolean updateUserPw(UserVO user);

}

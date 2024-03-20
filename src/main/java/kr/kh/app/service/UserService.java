package kr.kh.app.service;

import kr.kh.app.model.dto.LoginDTO;
import kr.kh.app.model.dto.SignUpDTO;
import kr.kh.app.model.vo.UserVO;

public interface UserService {

    UserVO login(LoginDTO loginDTO);

    boolean signUp(SignUpDTO signUpDTO) throws Exception;

	String checkId(String id);

	boolean updateSignUp(SignUpDTO signUpDto) throws Exception;

	boolean updateDropUser(UserVO dropUser, String user_id);

	String checkEmail(String email);

}

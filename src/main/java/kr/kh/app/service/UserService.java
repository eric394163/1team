package kr.kh.app.service;

import kr.kh.app.model.dto.LoginDTO;
import kr.kh.app.model.dto.SignUpDTO;
import kr.kh.app.model.vo.UserVO;
import kr.kh.app.utils.CheckErrAndMsg;

public interface UserService {

    UserVO login(LoginDTO loginDTO);

    CheckErrAndMsg signUp(SignUpDTO signUpDTO);

}

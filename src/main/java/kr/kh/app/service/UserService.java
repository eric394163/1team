package kr.kh.app.service;

import kr.kh.app.model.dto.LoginDTO;
import kr.kh.app.model.vo.UserVO;

public interface UserService {

    UserVO login(LoginDTO loginDTO);

}

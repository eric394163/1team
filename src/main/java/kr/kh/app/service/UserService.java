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

}

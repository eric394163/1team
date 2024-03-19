package kr.kh.app.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.dto.SignUpDTO;
import kr.kh.app.model.vo.UserVO;

public interface UserDAO {

    UserVO selectUser(@Param("user_id") String id);

    boolean insertMember(@Param("user") SignUpDTO signUpDTO);

	UserVO selectFindUser(@Param("user_email")String email,@Param("user_birth") String birth);

	boolean updateUserPw(@Param("user")UserVO user);

}

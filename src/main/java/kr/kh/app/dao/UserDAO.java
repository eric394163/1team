package kr.kh.app.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.dto.SignUpDTO;
import kr.kh.app.model.vo.UserVO;

public interface UserDAO {

    UserVO selectUser(@Param("user_id") String id);

    boolean insertMember(@Param("user") SignUpDTO signUpDTO);

    UserVO selectUserById(@Param("id") String id);

    UserVO selectUserByEmail(@Param("email") String email);

    UserVO selectUserByNickname(@Param("nickname") String nickname);

	boolean updateUser(@Param("user")SignUpDTO signUpDTO);

	boolean updateDropUser(@Param("user")UserVO dropUser, @Param("id")String user_id);

}

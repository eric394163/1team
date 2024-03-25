package kr.kh.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.dto.SignUpDTO;
import kr.kh.app.model.vo.BlockedVO;
import kr.kh.app.model.vo.UserVO;
import kr.kh.app.pagination.Criteria;

public interface UserDAO {

    UserVO selectUser(@Param("user_id") String id);

    boolean insertMember(@Param("user") SignUpDTO signUpDTO);

	UserVO selectFindUser(@Param("user_email")String email,@Param("user_birth") String birth);

	boolean updateUserPw(@Param("user")UserVO user);
	
    UserVO selectUserById(@Param("id") String id);

    UserVO selectUserByEmail(@Param("email") String email);

    UserVO selectUserByNickname(@Param("nickname") String nickname);

    boolean updateUser(@Param("user") SignUpDTO signUpDTO);

    int selectTotalBlockedUserCount(@Param("cri") Criteria cri);

    ArrayList<BlockedVO> selectBlockedUserList(@Param("cri") Criteria cri);

	boolean updateDropUser(@Param("user")UserVO dropUser, @Param("id")String user_id);

    boolean deleteBlockedUser(@Param("blocked") BlockedVO blocked);

	ArrayList<UserVO> selectTotalUserList(@Param("cri")Criteria cri);

	int selectTotalUserCount(@Param("cri")Criteria cri);

	ArrayList<UserVO> selectUserList(@Param("cri")Criteria cri);

	int selectTotalCount(@Param("cri")Criteria cri);

	boolean updateUserByUserState(@Param("user")UserVO updateUser);

	boolean updateUserByUserState2(@Param("user")UserVO updateUser);
    
    ArrayList<BlockedVO> selectBlockedUsers(@Param("id") String user_id);

	boolean updateUserByUserRoleUserToOp(@Param("user")UserVO updateUser);

	boolean updateUserByUserRoleOpToUser(@Param("user")UserVO updateUser);

}

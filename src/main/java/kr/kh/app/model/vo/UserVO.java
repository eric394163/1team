package kr.kh.app.model.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class UserVO {
    private String userId;
    private String userPw;
    private String userNickname;
    private String userEmail;
    private Date userBirth;
    private Date userStateDate;
    private String userRole;
    private String userState;


}

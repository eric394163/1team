package kr.kh.app.model.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class UserVO {
	private String user_id;
    private String user_pw;
    private String user_nickname;
    private String user_email;
    private Date user_birth;
    private Date user_state_date;
    private String user_role;
    private String user_state;

    public UserVO(String id, String pw) {
		this.user_id = id;
		this.user_pw = pw;
	}
    
    public UserVO(String id, String pw, String email, Date state_date, String state) {
		this.user_id = id;
		this.user_pw = pw;
		this.user_email = email;
		this.user_state_date = state_date;
		this.user_state = state;
	}
}

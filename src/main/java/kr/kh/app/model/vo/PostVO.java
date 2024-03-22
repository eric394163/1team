package kr.kh.app.model.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PostVO {

    private int post_id;
    private int post_board_num;
    private String post_title;
    private String post_content;
    private Date post_date;
    private int post_view;
    private int post_upvotes;
    private int post_reported;
    private String post_user_id;
    private BoardVO board;
    private UserVO user;
    private String board_name; // ksh_전 조인으로 게시판 이름 보이게 해서 이거 있어야 해요
    private Date report_date;

    public PostVO(int post_board_num, String post_title, String post_content, String post_user_id, Date post_date) {
        this.post_board_num = post_board_num;
        this.post_title = post_title;
        this.post_content = post_content;
        this.post_user_id = post_user_id;
        this.post_date = post_date;
    }

    public PostVO(int post_id, String post_title, String post_content, int post_board_num) {
        this.post_id = post_id;
        this.post_title = post_title;
        this.post_content = post_content;
        this.post_board_num = post_board_num;
    }

    public PostVO(String post_title, String post_content, int post_board_num) {
        this.post_title = post_title;
        this.post_content = post_content;
        this.post_board_num = post_board_num;
    }

}
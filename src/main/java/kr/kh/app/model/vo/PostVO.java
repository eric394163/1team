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

}

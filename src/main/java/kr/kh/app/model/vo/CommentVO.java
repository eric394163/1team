package kr.kh.app.model.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CommentVO {
    private int comment_id;
    private String comment_user_id;
    private int comment_post_num;
    private String comment_content;
    private Date comment_date;

}

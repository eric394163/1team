package kr.kh.app.model.vo;

import java.text.SimpleDateFormat;
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
    
    public String transDate() {
    	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	String str = format.format(comment_date);
    	return str;
    }
    
	public CommentVO(int comment_post_num, String comment_content, String comment_user_id) {
		this.comment_post_num = comment_post_num;
		this.comment_content = comment_content;
		this.comment_user_id = comment_user_id;
	}
  
}

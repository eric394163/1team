package kr.kh.app.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class UpvoteVO {
	
	private int post_id; 
	private String user_id; 
	private int upvote;
}

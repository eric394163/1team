package kr.kh.app.pagination;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CommentCriteria extends Criteria {

	private int post_num;
	
	public CommentCriteria(int page, int perPageNum, int post_num) {
		super(page, perPageNum);
		this.post_num = post_num;
	}
}

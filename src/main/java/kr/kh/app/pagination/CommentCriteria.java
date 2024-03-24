package kr.kh.app.pagination;

import kr.kh.app.model.vo.UserVO;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CommentCriteria extends Criteria {

	private int post_num;
	private UserVO user;
	
	public CommentCriteria(int page, int perPageNum, int post_num, UserVO user) {
		super(page, perPageNum);
		this.post_num = post_num;
		this.user = user;
	}
}

package kr.kh.app.pagination;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BoardListCriteria extends Criteria {

	private int boNum;
	
	public BoardListCriteria(int page, int perPageNum, String search, String type, int boNum) {
		super(page, perPageNum, search, type);
		this.boNum = boNum;
	}

	@Override
	public String toString() {
		return "BoardListCriteria [boNum=" + boNum + ","+super.toString()+"]";
	}
	
	
}

package kr.kh.app.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BoardVO {
	private int board_id;
    private String board_name;
    private int board_category_num;

    public BoardVO(int ca_num, String board_name) {
    	board_category_num = ca_num;
    	this.board_name = board_name;
    }
}

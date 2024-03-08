package kr.kh.app.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BoardVO {
    private int boardId;
    private String boardName;
    private int boardCategoryNum;

}

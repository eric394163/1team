package kr.kh.app.model.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CommentVO {
    private int commentId;
    private String commentUserId;
    private int commentPostNum;
    private String commentContent;
    private Date commentDate;

}

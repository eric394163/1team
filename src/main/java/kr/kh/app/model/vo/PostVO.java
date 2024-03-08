package kr.kh.app.model.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PostVO {
    private int postId;
    private int postBoardNum;
    private String postTitle;
    private String postContent;
    private Date postDate;
    private int postView;
    private int postUpvotes;
    private int postReported;
    private String postUserId;

}

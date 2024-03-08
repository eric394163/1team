package kr.kh.app.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AttachVO {
    private int attachNum;
    private int attachLinkCheck;
    private String attachPath;
    private int attachPostId;
}

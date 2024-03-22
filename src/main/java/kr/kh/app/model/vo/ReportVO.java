package kr.kh.app.model.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReportVO {
    private int report_id;  
    private int report_post_id; //신고된 게시글 번호
    private String report_reason; // 신고 사유
    private String report_content; // 신고 내용 
    private Date report_date; // 신고일 
    private String report_state; // 신고 처리
    private String report_user_id; // 신고자 
}

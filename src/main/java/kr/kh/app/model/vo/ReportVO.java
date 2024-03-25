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


    public ReportVO(int post_id, String report_reason, String report_content, String report_state,
            String report_user_id) {
        this.report_post_id = post_id;
        this.report_reason = report_reason;
        this.report_content = report_content;
        this.report_state = report_state;
        this.report_user_id = report_user_id;
    }

    
}

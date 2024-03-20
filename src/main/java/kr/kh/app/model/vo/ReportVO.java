package kr.kh.app.model.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReportVO {
    private int report_id;
    private int report_post_id;
    private String report_reason;
    private String report_content;
    private Date report_date;
    private String report_state;
    private String report_user_id;
}

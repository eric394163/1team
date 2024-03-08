package kr.kh.app.model.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReportVO {
    private int reportId;
    private int reportPostId;
    private String reportReason;
    private String reportContent;
    private Date reportDate;
    private String reportState;
    private String reportUserId;
}

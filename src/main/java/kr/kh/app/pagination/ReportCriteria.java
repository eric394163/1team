package kr.kh.app.pagination;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReportCriteria extends Criteria{

    private int reportedPostId;

    public ReportCriteria(int page, int perPageNum, int reportedPostId) {
        super(page, perPageNum);
        this.reportedPostId = reportedPostId;
    }


}

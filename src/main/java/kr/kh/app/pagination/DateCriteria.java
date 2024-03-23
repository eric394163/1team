package kr.kh.app.pagination;

import java.time.LocalDate;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class DateCriteria extends Criteria {

    private LocalDate startDate;
    private LocalDate endDate;

    public DateCriteria(int page, int perPageNum, LocalDate today, LocalDate weekAgo, String blocking_user_id) {
        super(page, perPageNum);
        this.startDate = today;
        this.endDate = weekAgo;
        this.setBlocking_user_id(blocking_user_id);
    }

}

package kr.kh.app.pagination;

import java.time.LocalDate;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class DateCriteria extends Criteria {

    private LocalDate startDate;
    private LocalDate endDate;

    public DateCriteria(int page, int perPageNum, LocalDate today, LocalDate weekAgo) {
        super(page, perPageNum);
        this.startDate = today;
        this.endDate = weekAgo;
    }

}

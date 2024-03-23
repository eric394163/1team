package kr.kh.app.pagination;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BlockedCriteria extends Criteria {

    private String blocking_user_id;

    public BlockedCriteria(int page, int perPageNum, String blockingUser) {
        super(page, perPageNum);
        this.blocking_user_id = blockingUser;

    }

    public BlockedCriteria(int page, int perPageNum, String search, String blockingUser) {
        super(page, perPageNum, search);
        this.blocking_user_id = blockingUser;
    }

    public BlockedCriteria(int page, int i, String type, String search, String blocking_user_id) {
        super(page, i, type, search);
        this.blocking_user_id = blocking_user_id;

    }

}

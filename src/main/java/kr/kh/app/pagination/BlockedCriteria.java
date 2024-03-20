package kr.kh.app.pagination;

import java.util.ArrayList;

import kr.kh.app.model.vo.UserVO;
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



}

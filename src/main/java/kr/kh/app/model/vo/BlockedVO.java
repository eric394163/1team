package kr.kh.app.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BlockedVO {

    private int blocked_id;
    private String blocking_user_id;
    private String blocked_user_id;

    public BlockedVO(String blocking_user_id, String blocked_user_id) {
        this.blocking_user_id = blocking_user_id;
        this.blocked_user_id = blocked_user_id;
    }

}

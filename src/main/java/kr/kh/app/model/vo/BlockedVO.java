package kr.kh.app.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BlockedVO {
    private int blocked_id;
    private String blocking_user_id;
    private String blocked_user_id;

}


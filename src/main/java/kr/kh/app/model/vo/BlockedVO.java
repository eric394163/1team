package kr.kh.app.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BlockedVO {
    private int blockedId;
    private String blockingUserId;
    private String blockedUserId;
}

package kr.kh.app.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AttachVO {
    private int attach_num;
    private int attach_link_check;
    private String attach_path;
    private int attach_post_id;
    
    public AttachVO(int attach_post_id, String attach_path) {
    	this.attach_post_id = attach_post_id;
    	this.attach_path = attach_path;
    }
}

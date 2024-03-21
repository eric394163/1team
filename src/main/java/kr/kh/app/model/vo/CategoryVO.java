package kr.kh.app.model.vo;

import lombok.Data;
import lombok.AllArgsConstructor;

@Data
@AllArgsConstructor
public class CategoryVO {
	
	private int category_id; 
	private String category_name;
	
	public CategoryVO(String category_name) {
		this.category_name = category_name;
	}
}

package kr.health.mvc.vo;


import javax.xml.bind.annotation.XmlRootElement;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@XmlRootElement
@AllArgsConstructor
@NoArgsConstructor
public class TrainerVO {
	// 예약회원번호
	private int pt_idx;
	
	// 트레이너아이디
	private String trainer_id;
	
	 // 예약시간 
    private String pt_time;

    // 이름 
    private String member_name;

    // 나이 
    private String pt_age;

    // 운동할부위 
    private String pt_exercise;

    // pt남은횟수 
    private int pt_remain;

    // 전화번호 
    private String member_phone;
    
    // 예약날짜
    private String pt_date;
    
    private String pt_mode; // insert(저장), update(수정), delete(삭제)
}

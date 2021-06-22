package kr.health.mvc.vo;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@XmlRootElement
@AllArgsConstructor
@NoArgsConstructor
public class JoinVO {
	// 회원 번호
	private int member_idx;
	
	// 아이디 
    private String member_id;

    // 비밀번호 
    private String member_password;

    // 이름 
    private String member_name;	

    // 생년월일 
    private String member_birth;

    // 전화번호 
    private String member_phone;

    // 몸무게 
    private int weight;

    // 키 
    private int height;

    // 등급 
    private int grade;
    
    private String member_mode; // insert(저장), update(수정), delete(삭제)
}

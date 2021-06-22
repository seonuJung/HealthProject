package kr.health.mvc.vo;

import java.util.Date;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@XmlRootElement
@AllArgsConstructor
@NoArgsConstructor
public class CommentVO {
	 // 댓글번호 
    private int cm_idx;
    
    // 해당글 번호
    private int 	ref;
    
    // 이름 
    private String sys_name;
    
    // 아이디 
    private String sys_id;

    // 내용 
    private String sys_content;

    // 등록날짜 
    private Date sys_date;
    
    private String cm_mode; // insert(저장), update(수정), delete(삭제)
}

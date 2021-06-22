package kr.health.mvc.vo;

import java.util.Date;
import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@XmlRootElement
@AllArgsConstructor
@NoArgsConstructor
public class SuggestionsVO {
	// 글번호 
    private int sg_idx;

    // 이름 
    private String member_name;

    // 아이디 
    private String member_id;
    
    // 제목 
    private String member_title;

    // 내용 
    private String member_content;

    // 등록날짜 
    private Date member_date;
    
    private String suggestion_mode; // insert(저장), update(수정), delete(삭제)
    
    private List<CommentVO> list;
}

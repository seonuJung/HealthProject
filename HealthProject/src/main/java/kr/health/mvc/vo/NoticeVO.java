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
public class NoticeVO {
	// 글번호 
	private int notice_idx;

	// 이름 
    private String sys_name;

    // 제목 
    private String sys_title;

    // 내용 
    private String sys_content;

    // 등록날짜 
    private Date sys_date;
    
    private String notice_mode; // insert(저장), update(수정), delete(삭제)
}

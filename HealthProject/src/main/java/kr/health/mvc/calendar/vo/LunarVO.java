package kr.health.mvc.calendar.vo;

import lombok.Data;

@Data
public class LunarVO {
	private String solar;
	private String lunar;
	private String ganji;
	
	// 양력데이터 가져오기
	public int getSolarYear() {
		return Integer.parseInt(solar.split("-")[0]); 
	}
	public int getSolarMonth() {
		return Integer.parseInt(solar.split("-")[1]); 
	}
	public int getSolarDate() {
		return Integer.parseInt(solar.split("-")[2].split(" ")[0]); 
	}
	public int getSolarDay() { 
		String w = "일월화수목금토";
		return w.indexOf(solar.split("-")[2].split(" ")[1].charAt(1)); 
	}
//	// 음력데이터 가져오기
//	public int getLunarYear() {
//		return Integer.parseInt(lunar.split("-")[0]); 
//	}
//	public int getLunarMonth() {
//		return Integer.parseInt(lunar.split("-")[1]); 
//	}
//	public String getLunarDate() {
//		return lunar.split("-")[2].split(" ")[0]; 
//	}
//	// 간지데이터 가져오기
//	public String getGanjiDateKor() {
//		String[] gan = ganji.split(" ");
//		return gan.length==2 ? gan[1].substring(0,2) : gan[2].substring(0,2);
//	}
//	public String getGanjiDateHan() {
//		String[] gan = ganji.split(" ");
//		return gan.length==2 ? gan[1].substring(3,5) : gan[2].substring(3,5);
//	}
}

package kr.health.mvc.calendar.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import kr.health.mvc.calendar.vo.LunarVO;



@Service
public class LunarService {
	// 선택된 년,월 읽기
	public List<LunarVO> getLunar(int yy, int mm) {
		String url = "https://astro.kasi.re.kr/life/pageView/5?" + String.format("search_year=%04d&search_month=%02d", yy, mm);
		Document doc = null;
		List<LunarVO> lunarList = null;
		try {
			doc = Jsoup.connect(url).get();
			Elements elements = doc.select("table tbody tr");
			lunarList = new ArrayList<LunarVO>();

			// 데이터를 list에담기
			for (Element e : elements) {
				Elements day = e.select("td");
				LunarVO vo = new LunarVO();
				vo.setSolar(day.get(0).text());
				vo.setLunar(day.get(1).text());
				vo.setGanji(day.get(2).text());
				lunarList.add(vo);
			}
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		return lunarList;
	}
}

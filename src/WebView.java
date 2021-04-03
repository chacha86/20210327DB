import java.util.ArrayList;

// 웹브라우저에 데이터 출력
public class WebView {
	
	public void printArticles(ArrayList<Article> articles) {
		System.out.println("=== 웹 출력 ===");
		for(int i = 0; i < articles.size(); i++) {
			System.out.println("제목 : " + articles.get(i).getTitle());
			System.out.println("내용 : " + articles.get(i).getBody());
		}
	}
}

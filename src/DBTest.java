import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;

public class DBTest {

	
	
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		
		Dao dao = new Dao();
		WebView wv = new WebView();
		Scanner sc = new Scanner(System.in);
		// 주소록 프로세스
		
		while(true) {
			System.out.println("메뉴를 입력해주세요 :");
			String cmd = sc.nextLine();
			
			if(cmd.equals("list")) {
				ArrayList<Article> articles = dao.selectArticles();
				wv.printArticles(articles);
			} else if(cmd.equals("add")) {
				dao.insertArticle();
			}
		}
		
		
		
		
		
		
		
		
		
		
		
	}

}

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBTest {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		
		// DB를 사용하고 싶다.
		// MySql DBMS를 사용하고 있다.
		// MySql DBMS를 사용하려면 MySql Driver를 사용할 수 있어야 된다.
		// 자바 개발자는 Driver를 JDBC로 다룬다.
		
		// JDBC
		// 1. Driver 찾기 - 찾은 드라이버는 DriverManager로 사용 가능
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		// 2. DBMS에 연결
		
		String url = "jdbc:mysql://localhost:3306/board?serverTimezone=UTC";
		String id = "sbsst"; // root
		String pw = "sbs123414"; // "";
		
		Connection conn = DriverManager.getConnection(url, id, pw); // 연결.
		
		// 3. sql 문을 실행.
		// 3.1 - 실행할 sql문
		String sql = "SELECT * FROM article";
		
		// 3.2 - 작성된 sql문을 DBMS에 전달.
		// Connection - 팀장.  실무자 - Statement
		// sql처리 실무자 파견
		
		// 자동임포트 : ctrl + shift + o
		Statement stmt = conn.createStatement();
		
		// 3.3 - DBMS에서 가져온 데이터를 ResultSet으로 담아 옴.
		// ResultSet -> 조회 결과물(데이터)을 담는 상자.
		ResultSet rs = stmt.executeQuery(sql); // 조회 결과가 있는 경우 => select 문
		// stmt.executeUpdate(sql); // 조회 결과 없이 DB에 반영만 하는 경우 => insert, update, delete
		
		
		// 4. next메서드로 커서를 이동시켜 각 row들의 데이터를 읽어옴
		while(rs.next()) {
			String title = rs.getString("title"); // 해당 커서가 위치한 row의 title 컬럼 데이터를 반환.
			System.out.println(title);
		}
		
		// 사용한 자원들 반납
		if(rs != null) {			
			rs.close();
		}
		if(stmt != null) {
			stmt.close();
		}
		if(conn != null) {
			conn.close();			
		}
		
	}

}

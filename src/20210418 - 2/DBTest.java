import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;

public class DBTest {

	
	
	public static void main(String[] args) throws ClassNotFoundException, SQLException, IOException {
		
		MyBatisDao mdao = new MyBatisDao();
		
//		AddrDao dao = new AddrDao(); 
		WebView wv = new WebView();
		Scanner sc = new Scanner(System.in);
		// 주소록 프로세스
		
		while(true) {
			System.out.println("메뉴를 입력해주세요 :");
			String cmd = sc.nextLine();
			
			if(cmd.equals("list")) {
				ArrayList<Addr> list = mdao.getAddresses();
				wv.printAddrs(list);
				
			} else if(cmd.equals("add")) { // insert
				System.out.println("이름 : ");
				String name = sc.nextLine();
				
				System.out.println("주소 : ");
				String address = sc.nextLine();
				
				System.out.println("전화번호 : ");
				String phone = sc.nextLine();
				
				mdao.insertAddr(name, address, phone);
			} else if(cmd.equals("delete")) { // delete
				
				System.out.println("삭제할 회원 번호 : ");
				int idx = Integer.parseInt(sc.nextLine());
				mdao.deleteAddr(idx);
				
			} else if(cmd.equals("update")) { // update
				System.out.println("수정할 회원 번호 : ");
				int idx = Integer.parseInt(sc.nextLine());
				
				System.out.println("이름 : ");
				String name = sc.nextLine();
				
				System.out.println("주소 : ");
				String address = sc.nextLine();
				
				System.out.println("전화번호 : ");
				String phone = sc.nextLine();
				
				mdao.updateAddr(name, address, phone, idx);
			} else if(cmd.equals("search")) {
				
				System.out.println("검색 대상을 선택해주세요. : (1. name, 2. address, 3. phone)");
				String searchTarget = sc.nextLine();
				
				System.out.println("검색 키워드를 입력해주세요 : ");
				String searchKeyword = sc.nextLine();
				
				ArrayList<Addr> list = mdao.getSearchedList(searchTarget, searchKeyword);
				wv.printAddrs(list);
			}
		}

	}

}

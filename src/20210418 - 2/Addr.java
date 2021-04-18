import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// 자바 어노테이션 -> 자바한테 말해주는 메시지

// 이건 데이터를 운반하는 클래스입니다.
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Addr {
	private int idx;
	private String name;
	private String address;
	private String phone;
	private String regDate;
	
	public Addr(String name, String address, String phone) {
		super();
		this.name = name;
		this.address = address;
		this.phone = phone;
	}
	
}

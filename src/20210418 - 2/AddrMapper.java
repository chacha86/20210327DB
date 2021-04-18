import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

// 메서드 명세서
@Mapper
public interface AddrMapper {
	
	// mybatis야 내가  getAddresses 라는 이름으로 메서드를 부르면 data가져와줘
	// 1. sql
	// 2. parameter
	// 3. return type

	// 어노테이션 붙이기
	ArrayList<Addr> getAddresses(); 
	void insertAddress(Addr addr);
	void deleteAddress(int idx);
	void updateAddress(Addr addr);
	ArrayList<Addr> getSearchedList(Map param);
	ArrayList<Addr> getSearchedListByAddress(String keyword); 
}


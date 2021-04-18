import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisDao {

	SqlSessionFactory sqlSessionFactory;

	public MyBatisDao() throws IOException {
		// 경로
		String resource = "mybatis-config.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		
		System.out.println(sqlSessionFactory);
	}

	public ArrayList<Addr> getAddresses() {
		SqlSession session = sqlSessionFactory.openSession();
		AddrMapper mapper = session.getMapper(AddrMapper.class);
		ArrayList<Addr> addresses = mapper.getAddresses();			
		
		return addresses;
	}
	
	public void insertAddr(String name, String address, String phone) {
		SqlSession session = sqlSessionFactory.openSession();
		AddrMapper mapper = session.getMapper(AddrMapper.class);
		Addr addr = new Addr(name, address, phone);
		mapper.insertAddress(addr);
		
		session.commit(); // commit은 작업한 내용을 실제 DB에 반영하겠다는 의미
		
	}

	public void deleteAddr(int idx) {
		SqlSession session = sqlSessionFactory.openSession(); // 트랜잭션 시작
		AddrMapper mapper = session.getMapper(AddrMapper.class);
		mapper.deleteAddress(idx);

		session.commit(); // commit은 작업한 내용을 실제 DB에 반영하겠다는 의미 -> 트랜잭션의 종료
	}

	public void updateAddr(String name, String address, String phone, int idx) {
		SqlSession session = sqlSessionFactory.openSession();
		AddrMapper mapper = session.getMapper(AddrMapper.class);
		Addr addr = new Addr(idx, name, address, phone, null);
		mapper.updateAddress(addr);
		
		session.commit(); // commit은 작업한 내용을 실제 DB에 반영하겠다는 의미
	}

	public ArrayList<Addr> getSearchedList(String target, String keyword) {

		SqlSession session = sqlSessionFactory.openSession();
		AddrMapper mapper = session.getMapper(AddrMapper.class);
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("target", target);
		paramMap.put("keyword", keyword);
		ArrayList<Addr> addresses = mapper.getSearchedList(paramMap);						
		
		return addresses;
	}
}

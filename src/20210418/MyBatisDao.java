import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

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
		
		// mybatis 매개변수를 한개만 받게 되어 있음.
		// 객체로 받는다. -> DTO(VO)
		Addr addr = new Addr(name, address, phone);
		mapper.insertAddress(addr);
		
		
		session.commit(); // commit은 작업한 내용을 실제 DB에 반영하겠다는 의미
		
	}

}

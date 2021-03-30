package service;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisConnector {

	// single-ton pattern:
	static MyBatisConnector single = null;
	SqlSessionFactory factory = null;

	public static MyBatisConnector getInstance() {
		if (single == null)
			single = new MyBatisConnector();
		return single;
	}
	
	public MyBatisConnector() {
		
		try {
			
			Reader reader = Resources.getResourceAsReader( "config/mybatis/sqlMapConfig.xml" );
			factory = new SqlSessionFactoryBuilder().build( reader );
			reader.close();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
	public SqlSessionFactory getSqlSessionFactory() {
		return factory;
	}
	
}

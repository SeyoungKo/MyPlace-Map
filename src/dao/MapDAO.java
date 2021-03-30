package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import service.MyBatisConnector;
import vo.MapVO;

public class MapDAO {
	SqlSessionFactory factory;
	
	static MapDAO single=null;
	public static MapDAO getInstance() {
		if(single==null) {
			single=new MapDAO();
			
		}
		return single;
		
	}
	
	public MapDAO() {
		factory=MyBatisConnector.getInstance().getSqlSessionFactory();
	
	}
	
	public List<MapVO> select(String id){
		List<MapVO> list=null;
		SqlSession sqlSession=factory.openSession();
		list=sqlSession.selectList("map.map_select",id);
		sqlSession.close();
		return list;
		
	}
	
	public MapVO selectone(MapVO vo) {
		SqlSession sqlSession=factory.openSession();
		vo=sqlSession.selectOne("map.map_selectone",vo);
		return vo;
		
	}
	
	public int insert(MapVO vo) {
		SqlSession sqlSession=factory.openSession(true);
		int res=sqlSession.insert("map.map_insert",vo);
		sqlSession.close();
		return res;
		
	}
	
	public List<MapVO> shareselect(){
		List<MapVO> list=null;
		SqlSession sqlSession=factory.openSession();
		list=sqlSession.selectList("map.map_shareselect");
		sqlSession.close();
		return list;
		
	}
	
	public int shareinsert(MapVO vo) {
		SqlSession sqlSession=factory.openSession(true);
		int res=sqlSession.insert("map.map_shareinsert",vo);
		sqlSession.close();
		return res;
		
	}
	
	public MapVO shareone(int idx) {
		SqlSession sqlSession=factory.openSession();
		MapVO vo=sqlSession.selectOne("map.map_shareselectone",idx);
		sqlSession.close();
		return vo;
		
	}
	
	public int update_readhit(int idx) {
		SqlSession sqlSession=factory.openSession(true);
		int res=sqlSession.update("map.map_upreadhit",idx);
		sqlSession.close();
		return res;
		
	}
	
	public List<MapVO> searchall() {
		List<MapVO> list=null;
		SqlSession sqlSession=factory.openSession();
		list=sqlSession.selectList("map.map_searchall");
		sqlSession.close();
		return list;
		
	}
	
	public List<MapVO> search(MapVO vo) {
		List<MapVO> list=null;
		SqlSession sqlSession=factory.openSession();
		list=sqlSession.selectList("map.map_search",vo);
		sqlSession.close();
		return list;
		
	}
	
	public List<MapVO> searchcate(String cate) {
		List<MapVO> list=null;
		SqlSession sqlSession=factory.openSession();
		list=sqlSession.selectList("map.map_searchcate",cate);
		sqlSession.close();
		return list;
		
	}
	
	public List<MapVO> searcharea(String area) {
		List<MapVO> list=null;
		SqlSession sqlSession=factory.openSession();
		list=sqlSession.selectList("map.map_searcharea",area);
		sqlSession.close();
		return list;
		
	}
	
	public int comment(MapVO vo) {
		SqlSession sqlSession=factory.openSession(true);
		int res=sqlSession.insert("map.map_inscomment",vo);
		sqlSession.close();
		return res;
		
	}
	
	public List<MapVO> commentsel(int idx){
		List<MapVO> list=null;
		SqlSession sqlSession=factory.openSession(true);
		list=sqlSession.selectList("map.map_selcomment",idx);
		sqlSession.close();
		return list;
		
	}

	public int userInsert(MapVO vo) {
		SqlSession sqlSession = factory.openSession(true);
		int res = sqlSession.insert("user.user_insert", vo);
		sqlSession.close();
		return res;
	
	}
	
	public MapVO selectOne(String id) {
		SqlSession sqlSession = factory.openSession();
		MapVO vo = sqlSession.selectOne("user.user_one", id);
		sqlSession.close();
		return vo;
	
	}
	
	public MapVO selectlogin(MapVO vo) {
		SqlSession sqlSession=factory.openSession();
		MapVO list=sqlSession.selectOne("user.user_login",vo);
		sqlSession.close();
		return list;
		
	}

	public List<MapVO> selectList(MapVO vo){
		SqlSession sqlSession = factory.openSession();
		List<MapVO> list = sqlSession.selectList("map.map_subMap",vo);
		sqlSession.close();
		return list;
	}

	public List<MapVO> sSelect(String id) {
		SqlSession sqlSession = factory.openSession();
		List<MapVO> list = sqlSession.selectList("schedule.schedule_select",id);
		sqlSession.close();
		return list;

	}
	
	
	public MapVO sSelectOne(int idx) {
		SqlSession sqlSession = factory.openSession();
		MapVO vo = sqlSession.selectOne("schedule.schedule_one", idx);
		sqlSession.close();
		return vo;
	}
	
	
	public int sInsert(MapVO vo) {
		SqlSession sqlSession = factory.openSession(true);
		int res = sqlSession.insert("schedule.schedule_insert", vo);
		sqlSession.close();
		return res;
	}
	
	public int sDelete(int idx) {
		SqlSession sqlSession = factory.openSession(true);
		int res = sqlSession.update("schedule.schedule_delete", idx);
		sqlSession.close();
		return res;
	}

}

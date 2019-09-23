package co.kr.khaki.zone;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class KhakiZoneDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public void insert(KhakiZoneDTO khakiZoneDTO) {
		System.out.println("KhakiZoneDAO Insert!");
		System.out.println(khakiZoneDTO);
		
		my.insert("zoneDAO.zone_insert", khakiZoneDTO);
	}
	
	public int cntAll(){
		System.out.println("khakizoneDAO cnt!");
		return my.selectOne("zoneDAO.zone_cntAll");
	}
	
	public List<KhakiZoneDTO> select_page(int idx){
		System.out.println("khakizoneDAO select_page!");
		System.out.println("index : "+idx);
		return my.selectList("zoneDAO.select_page", idx);
	}
	
}
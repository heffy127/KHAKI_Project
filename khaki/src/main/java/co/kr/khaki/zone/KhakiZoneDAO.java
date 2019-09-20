package co.kr.khaki.zone;

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
	
}
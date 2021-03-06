package co.kr.khaki.zone.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.khaki.zone.DTO.KhakiZoneDTO;
import co.kr.khaki.zone.DTO.KhakiZone_CarmanageDTO;

@Repository
public class KhakiZoneDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public List<KhakiZone_CarmanageDTO> select_zone_num(){
		System.out.println("KhakiZoneDAO zone_nums select!");
		return my.selectList("zoneDAO.zone_nums");
	}
	
	public void delete(int zone_num) {
		System.out.println("KhakiZoneDAO Delete!");
		my.delete("zoneDAO.zone_delete", zone_num);
	}
	
	public void update(KhakiZoneDTO khakiZoneDTO) {
		System.out.println("KhakiZoneDAO Update!");
		my.update("zoneDAO.zone_update", khakiZoneDTO);
	}
	
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
	
	public List<KhakiZoneDTO> selectAll() {
		System.out.println("DAO 2번");
		return my.selectList("zoneDAO.zone_selectAll");
	}
	
}
package co.kr.khaki.zone.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import co.kr.khaki.common.pagination;
import co.kr.khaki.zone.DAO.KhakiZoneDAO;
import co.kr.khaki.zone.DTO.KhakiZoneDTO;

@Service
public class KhakiZoneServiceImpl implements KhakiZoneServiceInterface {

	
	@Autowired
	KhakiZoneDAO zonedao;
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.zone.service.KhakiZoneServiceInterface#khakizone(int, int)
	 */
	/* (non-Javadoc)
	 * @see co.kr.khaki.zone.service.KhakiZoneServiceInterface#khakizone(int, int)
	 */
	@Override
	public ArrayList khakizone(int curPage, int pageSize) {
		// 페이지 네이션 부분
		int total = zonedao.cntAll();
		pagination pg = new pagination(total, curPage, pageSize);
		
		List<KhakiZoneDTO> select_list = zonedao.select_page(pg.getStartIndex());
		
		KhakiZoneCal zonecal = new KhakiZoneCal(select_list);
		
		ArrayList arr = new ArrayList();
		
		arr.add(pg);
		arr.add(select_list);
		arr.add(zonecal);
		
		return arr;
	}
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.zone.service.KhakiZoneServiceInterface#khakizone_insert(co.kr.khaki.zone.DTO.KhakiZoneDTO, int, int)
	 */
	/* (non-Javadoc)
	 * @see co.kr.khaki.zone.service.KhakiZoneServiceInterface#khakizone_insert(co.kr.khaki.zone.DTO.KhakiZoneDTO, int, int)
	 */
	@Override
	public ArrayList khakizone_insert(KhakiZoneDTO khakiZoneDTO, int curPage, int pageSize) {
		
		zonedao.insert(khakiZoneDTO);
		
		// 페이지 네이션 부분
		int total = zonedao.cntAll();
		pagination pg = new pagination(total, curPage, pageSize);
		
		List<KhakiZoneDTO> select_list = zonedao.select_page(pg.getStartIndex());
		
		KhakiZoneCal zonecal = new KhakiZoneCal(select_list);
		
		ArrayList arr = new ArrayList();
		
		arr.add(pg);
		arr.add(select_list);
		arr.add(zonecal);
		
		return arr;
	}
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.zone.service.KhakiZoneServiceInterface#khakizone_update(co.kr.khaki.zone.DTO.KhakiZoneDTO, int, int)
	 */
	/* (non-Javadoc)
	 * @see co.kr.khaki.zone.service.KhakiZoneServiceInterface#khakizone_update(co.kr.khaki.zone.DTO.KhakiZoneDTO, int, int)
	 */
	@Override
	public ArrayList khakizone_update(KhakiZoneDTO khakiZoneDTO, @RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="5") int pageSize) {
		
		zonedao.update(khakiZoneDTO);
		
		// 페이지 네이션 부분
		int total = zonedao.cntAll();
		pagination pg = new pagination(total, curPage, pageSize);
		
		System.out.println("index 숫자 : " + pg.getStartIndex());
		List<KhakiZoneDTO> select_list = zonedao.select_page(pg.getStartIndex());
		
		KhakiZoneCal zonecal = new KhakiZoneCal(select_list);
		
		ArrayList arr = new ArrayList();
		
		arr.add(pg);
		arr.add(select_list);
		arr.add(zonecal);
		
		return arr;
	}

	/* (non-Javadoc)
	 * @see co.kr.khaki.zone.service.KhakiZoneServiceInterface#khakizone_delete(int, int, int)
	 */
	/* (non-Javadoc)
	 * @see co.kr.khaki.zone.service.KhakiZoneServiceInterface#khakizone_delete(int, int, int)
	 */
	@Override
	public ArrayList khakizone_delete(int zone_num, int curPage, int pageSize) {
		
		zonedao.delete(zone_num);
		
		// 페이지 네이션 부분
		int total = zonedao.cntAll();
		pagination pg = new pagination(total, curPage, pageSize);
		
		List<KhakiZoneDTO> select_list = zonedao.select_page(pg.getStartIndex());
		
		KhakiZoneCal zonecal = new KhakiZoneCal(select_list);
		
		ArrayList arr = new ArrayList();
		
		arr.add(pg);
		arr.add(select_list);
		arr.add(zonecal);
		
		return arr;
	}
}
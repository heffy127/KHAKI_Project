package co.kr.khaki.zone.service;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.RequestParam;

import co.kr.khaki.zone.DTO.KhakiZoneDTO;

public interface KhakiZoneServiceInterface {

	/* (non-Javadoc)
	 * @see co.kr.khaki.zone.service.KhakiZoneServiceInterface#khakizone(int, int)
	 */
	ArrayList khakizone(int curPage, int pageSize);

	/* (non-Javadoc)
	 * @see co.kr.khaki.zone.service.KhakiZoneServiceInterface#khakizone_insert(co.kr.khaki.zone.DTO.KhakiZoneDTO, int, int)
	 */
	ArrayList khakizone_insert(KhakiZoneDTO khakiZoneDTO, int curPage, int pageSize);

	/* (non-Javadoc)
	 * @see co.kr.khaki.zone.service.KhakiZoneServiceInterface#khakizone_update(co.kr.khaki.zone.DTO.KhakiZoneDTO, int, int)
	 */
	ArrayList khakizone_update(KhakiZoneDTO khakiZoneDTO, int curPage, int pageSize);

	/* (non-Javadoc)
	 * @see co.kr.khaki.zone.service.KhakiZoneServiceInterface#khakizone_delete(int, int, int)
	 */
	ArrayList khakizone_delete(int zone_num, int curPage, int pageSize);

}
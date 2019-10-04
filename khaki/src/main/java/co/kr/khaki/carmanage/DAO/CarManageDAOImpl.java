package co.kr.khaki.carmanage.DAO;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.khaki.carmanage.DTO.CarManageDTO;

@Repository
public class CarManageDAOImpl implements CarManageDAOInter {

	@Autowired
	SqlSessionTemplate my;
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.carmanage.DAO.CarManageDAOInter#check_car_num(java.lang.String)
	 */
	@Override
	public String check_car_num(String car_num) {
		System.out.println("car_num select");
		return my.selectOne("cmDAO.check_car_num",car_num);
	}
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.carmanage.DAO.CarManageDAOInter#search(java.lang.String, java.lang.String)
	 */
	@Override
	public List<CarManageDTO> search(String search_list, String search_obj) {
		
		List<CarManageDTO> selectlist;
		
		if("차량번호".equals(search_list)) {
			System.out.println("차량번호 검색!");
			selectlist = my.selectList("cmDAO.select_car_num", search_obj);
		}else if("차량명".equals(search_list)) {
			System.out.println("차량명 검색!");
			selectlist = my.selectList("cmDAO.select_car_name", search_obj);
		}else if("브랜드".equals(search_list)) {
			System.out.println("브랜드 검색!");
			selectlist = my.selectList("cmDAO.select_car_brand", search_obj);
		}else if("연료종류".equals(search_list)) {	//연료 종류가 넘어옴
			System.out.println("연료종류 검색!");
			selectlist = my.selectList("cmDAO.select_car_fuel", search_obj);
		}else {
			System.out.println("전체 검색!");
			// 검색어 종류가 없는 것은 전체를 가져옴
			selectlist = my.selectList("cmDAO.selectAll");
		}
		
		return selectlist;
	}

	/* (non-Javadoc)
	 * @see co.kr.khaki.carmanage.DAO.CarManageDAOInter#selectAll()
	 */
	@Override
	public List<CarManageDTO> selectAll() {
		System.out.println("carManageDAO selectAll!");
		return my.selectList("cmDAO.selectAll");
	}
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.carmanage.DAO.CarManageDAOInter#insert(co.kr.khaki.carmanage.DTO.CarManageDTO)
	 */
	@Override
	public void insert(CarManageDTO carManageDTO) {
		System.out.println("CarManageDAO Insert!");
		
		// date 객체를 이용해서 today 현재 시간을 가져와서 simpledateformat으로 형식을 변경하여 set을 통해 저장
		Date today = new Date();
		SimpleDateFormat sp = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss a");
		
		carManageDTO.setReg_date(sp.format(today));
		// write_date의 value에 상관없이 오늘날짜가 들어가도록 설계(DB상에서 바로 넣는 방법 찾아보기...)
		System.out.println(carManageDTO);
		my.insert("cmDAO.insert", carManageDTO);
	}
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.carmanage.DAO.CarManageDAOInter#select(co.kr.khaki.carmanage.DTO.CarManageDTO)
	 */
	@Override
	public CarManageDTO select(CarManageDTO carManageDTO) {
		System.out.println("carManageDAO select!");
		return my.selectOne("cmDAO.select", carManageDTO);
	}

	/* (non-Javadoc)
	 * @see co.kr.khaki.carmanage.DAO.CarManageDAOInter#selectjunggo()
	 */
	@Override
	public List<CarManageDTO> selectjunggo() {
		System.out.println("carManageDAO select_Junggo");
		return my.selectList("cmDAO.selectjunggo");
	}
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.carmanage.DAO.CarManageDAOInter#selectold()
	 */
	@Override
	public List<CarManageDTO> selectold() {
		System.out.println("carManageDAO select_old");
		return my.selectList("cmDAO.selectold");
	}
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.carmanage.DAO.CarManageDAOInter#delete(java.lang.String)
	 */
	@Override
	public void delete(String car_num) {
		System.out.println("carManageDAO delete!");
		my.delete("cmDAO.delete", car_num);
	}
	
	// 하위 코드 미작성 상태
	/*public void update(NoticeDTO noticeDTO) {
		System.out.println("NoticeDAO Update!");
		my.update("nDAO.update", noticeDTO);
	}
	
	*/
	
}
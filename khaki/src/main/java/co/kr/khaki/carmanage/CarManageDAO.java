package co.kr.khaki.carmanage;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.khaki.carmanage.CarManageDTO;

@Repository
public class CarManageDAO {

	@Autowired
	SqlSessionTemplate my;
	
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
	
	public List<CarManageDTO> selectAll() {
		System.out.println("carManageDAO selectAll!");
		return my.selectList("cmDAO.selectAll");
	}
	
	public CarManageDTO select(CarManageDTO carManageDTO) {
		System.out.println("carManageDAO select!");
		return my.selectOne("cmDAO.select", carManageDTO);
	}
	
	// 하위 코드 미작성 상태
	/*public void update(NoticeDTO noticeDTO) {
		System.out.println("NoticeDAO Update!");
		my.update("nDAO.update", noticeDTO);
	}
	
	public void delete(NoticeDTO noticeDTO) {
		System.out.println("NoticeDAO delete!");
		my.delete("nDAO.delete", noticeDTO);
	}*/
	
	
	
	
	
}

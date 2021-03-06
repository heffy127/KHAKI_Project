package co.kr.khaki.carmanage.DAO;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.khaki.carmanage.DTO.CarConsumableDTO;

@Repository
public class CarConsumableDAOImpl implements CarConsumableDAOInterface {

	@Autowired
	SqlSessionTemplate my;
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.carmanage.DAO.CarConsumableDAOInterface#insert(co.kr.khaki.carmanage.DTO.CarConsumableDTO)
	 */
	@Override
	public void insert(CarConsumableDTO carConsumableDTO) {
		System.out.println("CarConsumableDAO Insert!");
		
		// date 객체를 이용해서 today 현재 시간을 가져와서 simpledateformat으로 형식을 변경하여 set을 통해 저장
		Date today = new Date();
		SimpleDateFormat sp = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss a");
		
		carConsumableDTO.setBelt_operation_time(sp.format(today));
		carConsumableDTO.setBelt_timing_time(sp.format(today));
		carConsumableDTO.setEtc_battery_time(sp.format(today));
		carConsumableDTO.setEtc_coolant_time(sp.format(today));
		carConsumableDTO.setEtc_tire_time(sp.format(today));
		carConsumableDTO.setFilter_aircleaner_time(sp.format(today));
		carConsumableDTO.setFilter_aircon_time(sp.format(today));
		carConsumableDTO.setFilter_fuel_time(sp.format(today));
		carConsumableDTO.setOil_break_time(sp.format(today));
		carConsumableDTO.setOil_engine_time(sp.format(today));
		carConsumableDTO.setOil_transmission_time(sp.format(today));
		
		my.insert("ccDAO.insert", carConsumableDTO);
		
	}	// insert End
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.carmanage.DAO.CarConsumableDAOInterface#select(java.lang.String)
	 */
	@Override
	public CarConsumableDTO select(String carnum1) {
		System.out.println("carnum1 : " + carnum1);
		System.out.println("ccDAO select!");
		
		return my.selectOne("ccDAO.select", carnum1);
	}
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.carmanage.DAO.CarConsumableDAOInterface#updata(co.kr.khaki.carmanage.DTO.CarConsumableDTO)
	 */
	@Override
	public void updata(CarConsumableDTO carConsumableDTO) {
		System.out.println("CarConsumableDAO Updata!");
		
		my.update("ccDAO.update", carConsumableDTO);
	}
	
}

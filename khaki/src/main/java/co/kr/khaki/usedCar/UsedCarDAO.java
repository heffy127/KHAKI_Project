package co.kr.khaki.usedCar;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.khaki.refund.RefundDTO;
import co.kr.khaki.reservation.DTO.PayDTO;

@Repository
public class UsedCarDAO {

	@Autowired
	SqlSessionTemplate my;

	public void insert(UsedCarDTO UsedCarDTO) {
		System.out.println("UsedCarDAO Insert!");
		my.insert("usedCarDAO.insert", UsedCarDTO);
	}

	public void update(UsedCarDTO UsedCarDTO) {
		System.out.println("usedCarDAO Update!");
		my.update("usedCarDAO.update", UsedCarDTO);
	}

	public List<UsedCarDTO> select() {
		System.out.println("usedCarDAO select!");
		return my.selectList("usedCarDAO.select");
	}

	public List<UsedCarDTO> selectAll() {
		System.out.println("usedCarDAO selectAll!");
		return my.selectList("usedCarDAO.selectAll");
	}

	public List<UsedCarDTO> selectName(String name) {
		System.out.println("usedCarDAO selectName!");
		return my.selectList("usedCarDAO.selectName", name);
	}

	public List<UsedCarDTO> selectCarNum(String carNum) {
		System.out.println("usedCarDAO selectCarNum!");
		return my.selectList("usedCarDAO.selectCarNum", carNum);
	}

	public List<UsedCarDTO> selectPhone(String phone) {
		System.out.println("usedCarDAO selectPhone!");
		return my.selectList("usedCarDAO.selectPhone", phone);
	}

}

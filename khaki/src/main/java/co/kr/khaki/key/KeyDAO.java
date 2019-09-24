package co.kr.khaki.key;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class KeyDAO {
	
	@Autowired
	SqlSessionTemplate myBatis;
	
	// 키생성
	public void insert(KeyDTO myKeyDTO) {
		myBatis.insert("keyDAO.insertKey",myKeyDTO);
	}
	
	// 문열림 / 잠김
	public void updateDoor(KeyDTO myKeyDTO) {
		myBatis.update("keyDAO.updateDoor", myKeyDTO);
	}
	
	// 시동
	public void updateStartCar(KeyDTO myKeyDTO) {
		myBatis.update("keyDAO.updateStart", myKeyDTO);
	}
	
	// 차량반납
	public void updateReturnCar(KeyDTO myKeyDTO) {
		myBatis.update("keyDAO.updateReturn", myKeyDTO);
	}
	
	// key List
	public List<KeyDTO> selectAll() {
		return myBatis.selectList("keyDAO.keyAll");
	}
}

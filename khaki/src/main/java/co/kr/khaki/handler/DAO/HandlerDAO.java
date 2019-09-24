package co.kr.khaki.handler.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.khaki.handler.DTO.HandlerDTO;

@Repository
public class HandlerDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public void insert(HandlerDTO HandlerDTO) {
		System.out.println("HanlderDAO Insert!");
		my.insert("hDAO.insert", HandlerDTO);
	}
	
	public void update(HandlerDTO HandlerDTO) {
		System.out.println("HanlderDAO Update!");
		my.update("hDAO.update", HandlerDTO);
	}
	
	public void delete(HandlerDTO HandlerDTO) {
		System.out.println("HanlderDAO delete!");
		my.delete("hDAO.delete", HandlerDTO);
	}
	
	public List<HandlerDTO> select(HandlerDTO HandlerDTO) {
		System.out.println("HanlderDAO select!");
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@ " + HandlerDTO.getStartLocation());
		return my.selectList("hDAO.select", HandlerDTO);
	}
	
	public List<HandlerDTO> select2(HandlerDTO HandlerDTO) {
		System.out.println("HanlderDAO select!");
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@ " + HandlerDTO.getReturnLocation());
		return my.selectList("hDAO.select2", HandlerDTO);
	}
	
	public List<HandlerDTO> selectAll() {
		System.out.println("HanlderDAO selectAll!");
		return my.selectList("hDAO.selectAll");
	}
	
}


package co.kr.khaki.handler.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.khaki.handler.DTO.HandlerUseDTO;

@Repository
public class HandlerUseDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public void insert(HandlerUseDTO HandlerUseDTO) {
		System.out.println("HanlderUseDAO Insert!");
		my.insert("huDAO.insert", HandlerUseDTO);
	}
	
	public void delete(HandlerUseDTO HandlerUseDTO) {
		System.out.println("HanlderUseDAO delete!");
		my.delete("huDAO.delete", HandlerUseDTO);
	}
	
	public List<HandlerUseDTO> select(String h_id) {
		System.out.println("HanlderUseDAO select!");
		return my.selectList("huDAO.select", h_id);
	}
	
	public void update(HandlerUseDTO HandlerUseDTO) {
		System.out.println("HanlderUseDAO Update!");
		my.update("huDAO.update", HandlerUseDTO);
	}
	
}


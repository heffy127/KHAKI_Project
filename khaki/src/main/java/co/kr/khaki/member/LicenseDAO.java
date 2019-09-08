package co.kr.khaki.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LicenseDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public LicenseDTO selectId(String id) {
		LicenseDTO licenseDTO = my.selectOne("licenseDAO.selectId", id);
		System.out.println("selectId license 성공");
		return licenseDTO;
	}
	
	public void insertLicense(LicenseDTO licenseDTO) {
		my.insert("licenseDAO.insertLicense", licenseDTO);
		System.out.println("insertLicense 성공");
	}
	
	public void deleteLicense(String id) {
		my.delete("licenseDAO.deleteLicense", id);
		System.out.println("면허정보 삭제");
	} 
	
	public void updatePermission(LicenseDTO licenseDTO) {
		my.update("licenseDAO.updatePermission", licenseDTO);
		System.out.println("면허 심사완료");
	}
	
	public List<LicenseDTO> selectAll() {
		List<LicenseDTO> list = my.selectList("licenseDAO.selectAll");
		System.out.println("면허 selectAll 완료");
		return list;
	}
}

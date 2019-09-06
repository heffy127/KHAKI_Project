package co.kr.khaki.member;

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
}

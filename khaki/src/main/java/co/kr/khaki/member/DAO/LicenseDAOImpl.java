package co.kr.khaki.member.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.khaki.member.DTO.LicenseDTO;

@Repository
public class LicenseDAOImpl implements LicenseDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.member.DAO.LicenseDAO#selectId(java.lang.String)
	 */
	@Override
	public LicenseDTO selectId(String id) {
		LicenseDTO licenseDTO = my.selectOne("licenseDAO.selectId", id);
		System.out.println("selectId license 성공");
		return licenseDTO;
	}
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.member.DAO.LicenseDAO#insertLicense(co.kr.khaki.member.DTO.LicenseDTO)
	 */
	@Override
	public void insertLicense(LicenseDTO licenseDTO) {
		my.insert("licenseDAO.insertLicense", licenseDTO);
		System.out.println("insertLicense 성공");
	}
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.member.DAO.LicenseDAO#deleteLicense(java.lang.String)
	 */
	@Override
	public void deleteLicense(String id) {
		my.delete("licenseDAO.deleteLicense", id);
		System.out.println("면허정보 삭제");
	} 
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.member.DAO.LicenseDAO#updatePermission(co.kr.khaki.member.DTO.LicenseDTO)
	 */
	@Override
	public void updatePermission(LicenseDTO licenseDTO) {
		my.update("licenseDAO.updatePermission", licenseDTO);
		System.out.println("면허 심사완료");
	}
	
	/* (non-Javadoc)
	 * @see co.kr.khaki.member.DAO.LicenseDAO#selectAll()
	 */
	@Override
	public List<LicenseDTO> selectAll() {
		List<LicenseDTO> list = my.selectList("licenseDAO.selectAll");
		System.out.println("면허 selectAll 완료");
		return list;
	}
}

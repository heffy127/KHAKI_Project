package co.kr.khaki.member.DAO;

import java.util.List;

import co.kr.khaki.member.DTO.LicenseDTO;

public interface LicenseDAOInter {

	LicenseDTO selectId(String id);

	void insertLicense(LicenseDTO licenseDTO);

	void deleteLicense(String id);

	void updatePermission(LicenseDTO licenseDTO);

	List<LicenseDTO> selectAll();

}
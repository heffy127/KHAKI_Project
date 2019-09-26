package co.kr.khaki.member.DAO;

import java.util.List;

import co.kr.khaki.member.DTO.MemberAdminDTO;

public interface MemberAdminDAOInter {

	List<MemberAdminDTO> selectAll();

	List<MemberAdminDTO> selectId(String id);

	List<MemberAdminDTO> selectName(String name);

	List<MemberAdminDTO> selectLicenseSort(String permission);

	List<MemberAdminDTO> selectLicenseSort_null();

	List<MemberAdminDTO> selectPushSort_smsPush();

	List<MemberAdminDTO> selectPushSort_emailPush();
	
	int countMemberAll();

}
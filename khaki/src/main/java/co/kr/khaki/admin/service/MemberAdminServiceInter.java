package co.kr.khaki.admin.service;

import java.util.List;

import co.kr.khaki.admin.DTO.MemberAdminDTO;
import co.kr.khaki.member.DTO.LicenseDTO;

public interface MemberAdminServiceInter {

	// 관리자 회원정보 모두 불러오기
	List<MemberAdminDTO> selectAll();

	// 관리자 회원정보 ID로 검색
	List<MemberAdminDTO> selectFromId(String id);

	// 관리자 회원정보 이름으로 검색
	List<MemberAdminDTO> selectFromName(String name);

	// 관리자 운전면허 승인
	void updatePermission(LicenseDTO licenseDTO);

	// 운전면허 정보 조회
	List<MemberAdminDTO> selectLicense(String permission);

	// 푸시 정보 조회
	List<MemberAdminDTO> selectPush(String push);

}
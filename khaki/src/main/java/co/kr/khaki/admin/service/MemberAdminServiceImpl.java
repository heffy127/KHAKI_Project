package co.kr.khaki.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.khaki.admin.DAO.MemberAdminDAOInter;
import co.kr.khaki.admin.DTO.MemberAdminDTO;
import co.kr.khaki.member.DAO.LicenseDAOInter;
import co.kr.khaki.member.DAO.MemberDAOInter;
import co.kr.khaki.member.DAO.MemberLevelDAOInter;
import co.kr.khaki.member.DTO.LicenseDTO;

@Service
public class MemberAdminServiceImpl implements MemberAdminServiceInter {
   
   @Autowired
   MemberDAOInter memberDAO;
   @Autowired
   MemberLevelDAOInter memberLevelDAO;
   @Autowired
   LicenseDAOInter licenseDAO;
   @Autowired
   MemberAdminDAOInter memberAdminDAO;
      
    // 관리자 회원정보 모두 불러오기
   /* (non-Javadoc)
 * @see co.kr.khaki.admin.service.MemberAdminServiceInter#selectAll()
 */
@Override
public List<MemberAdminDTO> selectAll(){
      
      return memberAdminDAO.selectAll(); 
   }
   
   // 관리자 회원정보 ID로 검색
   /* (non-Javadoc)
 * @see co.kr.khaki.admin.service.MemberAdminServiceInter#selectFromId(java.lang.String)
 */
@Override
public List<MemberAdminDTO> selectFromId(String id){
      
      return memberAdminDAO.selectId(id);
   }
   
   // 관리자 회원정보 이름으로 검색
   /* (non-Javadoc)
 * @see co.kr.khaki.admin.service.MemberAdminServiceInter#selectFromName(java.lang.String)
 */
@Override
public List<MemberAdminDTO> selectFromName(String name){
      
      return memberAdminDAO.selectId(name);
   }
   
   // 관리자 운전면허 승인
   /* (non-Javadoc)
 * @see co.kr.khaki.admin.service.MemberAdminServiceInter#updatePermission(co.kr.khaki.member.DTO.LicenseDTO)
 */
@Override
public void updatePermission(LicenseDTO licenseDTO) {
	
	   licenseDAO.updatePermission(licenseDTO);
   }
   
   // 운전면허 정보 조회
   /* (non-Javadoc)
 * @see co.kr.khaki.admin.service.MemberAdminServiceInter#selectLicense(java.lang.String)
 */
@Override
public List<MemberAdminDTO> selectLicense(String permission){
      
       if(permission.equals("NULL")) { // 미등록 조회
           List<MemberAdminDTO> memberAdminList = memberAdminDAO.selectLicenseSort_null();
           return memberAdminList;
         }else { // 그 외 조회
           List<MemberAdminDTO> memberAdminList = memberAdminDAO.selectLicenseSort(permission);
           return memberAdminList;
         }
   }
   
   // 푸시 정보 조회
   /* (non-Javadoc)
 * @see co.kr.khaki.admin.service.MemberAdminServiceInter#selectPush(java.lang.String)
 */
@Override
public List<MemberAdminDTO> selectPush(String push){
	   
	   if(push.equals("sms")) { // 휴대전화 푸시 조회
		   List<MemberAdminDTO> memberAdminList = memberAdminDAO.selectPushSort_smsPush();
		   return memberAdminList;
	   }else { // 그 외 조회
		   List<MemberAdminDTO> memberAdminList = memberAdminDAO.selectPushSort_emailPush();
		   return memberAdminList;
	   }
   }
   
}
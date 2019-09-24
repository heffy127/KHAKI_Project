package co.kr.khaki.member.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.khaki.member.DTO.MemberAdminDTO;

@Repository
public class MemberAdminDAOImpl implements MemberAdminDAO {

   @Autowired
   SqlSessionTemplate my;
   
   /* (non-Javadoc)
 * @see co.kr.khaki.member.DAO.MemberAdminDAO#selectAll()
 */
@Override
public List<MemberAdminDTO> selectAll() {
      List<MemberAdminDTO> list = my.selectList("memberAdminDAO.selectAll");
      System.out.println("selectAll_admin 성공");
      return list;
   }
   
   /* (non-Javadoc)
 * @see co.kr.khaki.member.DAO.MemberAdminDAO#selectId(java.lang.String)
 */
@Override
public List<MemberAdminDTO> selectId(String id) {
      List<MemberAdminDTO> list = my.selectList("memberAdminDAO.selectId",id);
      System.out.println("selectId_admin 성공");
      return list;
   }
   
   /* (non-Javadoc)
 * @see co.kr.khaki.member.DAO.MemberAdminDAO#selectName(java.lang.String)
 */
@Override
public List<MemberAdminDTO> selectName(String name) {
      List<MemberAdminDTO> list = my.selectList("memberAdminDAO.selectName",name);
      System.out.println("selectName_admin 성공");
      return list;
   }
   
   /* (non-Javadoc)
 * @see co.kr.khaki.member.DAO.MemberAdminDAO#selectLicenseSort(java.lang.String)
 */
@Override
public List<MemberAdminDTO> selectLicenseSort(String permission) {
      List<MemberAdminDTO> list = my.selectList("memberAdminDAO.selectLicenseSort",permission);
      System.out.println("selectLicenseSort 성공");
      return list;
   }
   
   /* (non-Javadoc)
 * @see co.kr.khaki.member.DAO.MemberAdminDAO#selectLicenseSort_null()
 */
@Override
public List<MemberAdminDTO> selectLicenseSort_null() {
      List<MemberAdminDTO> list = my.selectList("memberAdminDAO.selectLicenseSort_null");
      System.out.println("selectLicenseSort_null 성공");
      return list;
   }
   
   /* (non-Javadoc)
 * @see co.kr.khaki.member.DAO.MemberAdminDAO#selectPushSort_smsPush()
 */
@Override
public List<MemberAdminDTO> selectPushSort_smsPush() {
      List<MemberAdminDTO> list = my.selectList("memberAdminDAO.selectPushSort_smsPush");
      System.out.println("selectPushSort_smsPush 성공");
      return list;
   }
   
   /* (non-Javadoc)
 * @see co.kr.khaki.member.DAO.MemberAdminDAO#selectPushSort_emailPush()
 */
@Override
public List<MemberAdminDTO> selectPushSort_emailPush() {
      List<MemberAdminDTO> list = my.selectList("memberAdminDAO.selectPushSort_emailPush");
      System.out.println("selectPushSort_emailPush 성공");
      return list;
   }
}
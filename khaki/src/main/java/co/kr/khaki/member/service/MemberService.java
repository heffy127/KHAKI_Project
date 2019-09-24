package co.kr.khaki.member.service;

import org.springframework.web.multipart.MultipartFile;

import co.kr.khaki.member.DTO.LicenseDTO;
import co.kr.khaki.member.DTO.MemberDTO;
import co.kr.khaki.member.DTO.MemberLevelDTO;
import co.kr.khaki.member.DTO.SocialDTO;

public interface MemberService {

	// ID로 회원 검색
	MemberDTO selectFromId(String id);

	// email로 회원 검색
	MemberDTO selectFromEmail(MemberDTO memberDTO);

	// phone번호로 회원 검색
	MemberDTO selectFromPhone(MemberDTO memberDTO);

	// ID로 licenseDTO 찾기
	LicenseDTO selectLicenseFromId(String id);

	// id로 해당 회원 MemberLevelDTO 찾기
	MemberLevelDTO selectLevelFromId(String id);

	// id로 해당 회원 Naver 로그인 ID 찾기
	SocialDTO selectSocialFromId_naver(String id);

	// id로 해당 회원 Kakao 로그인 ID 찾기
	SocialDTO selectSocialFromId_kakao(String id);

	// 내가 쓴 글 count
	int countMyWrite(String writer);

	// 나의 예약 count
	int countMyReservation(String id);

	// 해당 정보가 존재하는 id가 있는지 검색
	String check(MemberDTO memberDTO);

	// 이메일로 아이디 찾기 전 해당 이메일과 이름이 존재하는지 검사 
	String emailNameCheck(MemberDTO memberDTO);

	// 휴대폰 번호로 아이디 찾기 전 해당 이메일과 이름이 존재하는지 검사 
	String phoneNameCheck(MemberDTO memberDTO);

	// 이메일로 임시 비밀번호 발급 전 해당 이메일과 이름과 아이디가 존재하는지 검사 
	String emailIdNameCheck(MemberDTO memberDTO);

	// 문자로 임시 비밀번호 발급 전 해당 번호와 이름과 아이디가 존재하는지 검사 
	String phoneIdNameCheck(MemberDTO memberDTO);

	// 회원 이메일로 가입 인증번호 전송
	String sendEmailAuth(MemberDTO memberDTO);

	// 회원 이메일로 마이페이지 이메일 인증번호 전송
	String sendEmailAuth_mypage(MemberDTO memberDTO);

	// 회원 이메일로 이메일 찾기 메일 전송
	void sendEmail_findId(MemberDTO memberDTO);

	// 회원 이메일로 임시 비밀번호를 담은 이메일 전송
	void sendEmail_findPw(MemberDTO memberDTO);

	// 회원 휴대폰 번호로 임시 비밀번호 전송 전 DB에 저장
	void sendSms_findPw(MemberDTO memberDTO);

	// DB에 저장된 레벨, 경험치 정보를 통해 프로필에 출력시킬 수 있도록 퍼센트화
	int[] showStat(MemberLevelDTO memberLevelDTO);

	// 회원 레벨 생성
	void insertLevel(String id);

	// 비밀번호 해시화 후 DB에 저장
	void insertHashPw(MemberDTO memberDTO);

	// 소셜 가입의 경우 social 테이블에 저장 (회원가입 시)
	void insertSocial(SocialDTO socialDTO, MemberDTO memberDTO);

	// social 테이블에 저장
	void insertSocial(SocialDTO socialDTO);

	// license 테이블에 저장
	void insertLicense(LicenseDTO licenseDTO);

	// 소셜 로그인 가입여부 파악
	String snsJoinCheck(SocialDTO socialDTO);

	// 비밀번호 변경
	void updatePw(MemberDTO memberDTO);

	// 이메일 변경
	void updateEmail(MemberDTO memberDTO);

	// 휴대폰 번호 변경
	void updatePhone(MemberDTO memberDTO);

	// 주소 변경
	void updateAddress(MemberDTO memberDTO);

	// 푸시 설정 변경
	void updatePush(MemberDTO memberDTO);

	// 회원 포인트 변경
	void updatePoint(String id, int point);

	// 추천인 포인트 변경
	void updatePointReco(String reco, String id, int point);

	// 회원 정보 삭제
	void deleteMember(String id);

	// 소셜 계정 삭제
	void deleteSocial(SocialDTO socialDTO);

	// 운전면허 정보 삭제
	void deleteLicense(String id);

	// MultiPartFile을 통한 프로필 사진 업로드
	MemberDTO photoUpload(MemberDTO memberDTO, MultipartFile mf, String path);

}
package co.kr.khaki.common;

import co.kr.khaki.member.DTO.MemberLevelDTO;

public class CalculateMemberLevel {
	
	double upgrade = 1.1; // 다음 요구경험치 증가 정도
	
	public CalculateMemberLevel() {
		super();
	}

	public MemberLevelDTO setLevel(MemberLevelDTO memberLevelDTO, int inputExp) {
		int memberExpLimit = 1000; // 1에서 2레벨로의 요구 경험치
		int exp = memberLevelDTO.getExp();
		int memberLevel = memberLevelDTO.getMemberLevel();
		exp += inputExp;
		
		int i = 1;
		while(i < memberLevel) {
			memberExpLimit = (int)Math.round(memberExpLimit * upgrade); // 레벨이 올라갈수록 이전 레벨보다 10% 증가한  경험치 필요
			i++;
		}
		while(exp >= memberExpLimit) { // 멤버의 경험치가 레벨 요구경험치보다 높을 경우
			memberLevel++; // 레벨 1 증가
			exp -= memberExpLimit; // 멤버의 경험치 - 이전 요구경험치
			memberExpLimit = (int)Math.round(memberExpLimit * upgrade); // 레벨이 올라갈수록 이전 레벨보다 10% 증가한  경험치 필요
			System.out.println("레벨업 제한 증가 : " + memberExpLimit);
		}
		memberLevelDTO.setExp(exp);
		memberLevelDTO.setMemberLevel(memberLevel);
		return memberLevelDTO;
	}
	
	public int[] showStat(MemberLevelDTO memberLevelDTO) {
		int memberExpLimit = 1000; // 1에서 2레벨로의 요구 경험치
		int exp = memberLevelDTO.getExp();
		int memberLevel = memberLevelDTO.getMemberLevel();
		int[] array = new int[2];
		
		int i = 1;
		while(i < memberLevel) {
			memberExpLimit = (int)Math.round(memberExpLimit * upgrade); // 레벨이 올라갈수록 이전 레벨보다 10% 증가한  경험치 필요
			i++;
		}
		array[0] = memberExpLimit; // 요구경험치
		array[1] = (int)((double)exp / memberExpLimit * 100); // 레벨업까지의 퍼센트
		System.out.println(array[0]);
		System.out.println(array[1]);
		return array;
	}

	
}

package co.kr.khaki.member;

import java.util.Random;

public class AuthNumber {
	public String makeAuthNum() {
		Random rand = new Random();
		int num[] = new int[6];
		for(int i=0; i < num.length; i++)
			num[i] = rand.nextInt(10);
		
		String certify = "";
		
		for(int i=0; i < num.length; i++)
			certify = certify.concat(String.valueOf(num[i]));
		
		return certify;
	}
}

package co.kr.khaki.common;

import java.util.Arrays;
import java.util.Collections;
import java.util.Random;

public class TempPw { // 임시 비밀번호 9자리 생성
	public String setTempPw(){
		//2개
		String[] upper = new String[] {"A", 
				"B", "C", "D", "E", "F", 
				"G", "H", "J", "K", 
				"L", "M", "N", "O", "P", 
				"Q", "R", "S", "T", "U", 
				"V", "W", "X", "Y", "Z"};
		//2개
		String[] lower = new String[] {"a", 
				"b", "c", "d", "e", "f", 
				"g", "h", "i", "j", "k", 
				"m", "n", "o", "p", 
				"q", "r", "s", "t", "u", 
				"v", "w", "x", "y", "z"};
		//4개
		String[] number = new String[] {"0", 
				"1", "2", "3", "4", "5", 
				"6", "7", "8", "9"};
		//1개
		String[] special = new String[] {"!",
				"@", "#", "$", "?"}; 
		
		String[] temp = new String[9];
		Random rand = new Random();
		for(int i=0; i<2; i++) {
			temp[i] = upper[rand.nextInt(25)];
			System.out.println(i + temp[i]);
		}
		for(int i=2; i<4; i++) {
			temp[i] = lower[rand.nextInt(25)];
			System.out.println(i + temp[i]);
		}
		for(int i=4; i<8; i++) {
			temp[i] = number[rand.nextInt(10)];
			System.out.println(i + temp[i]);
		}
		for(int i=8; i<9; i++) {
			temp[i] = special[rand.nextInt(5)];
			System.out.println(i + temp[i]);
		}
		Collections.shuffle(Arrays.asList(temp)); // 셔플
		String tempPw = "";
		for(int i = 0; i < temp.length; i++) {
			tempPw = tempPw + temp[i];
		}
		return tempPw;
	}
}


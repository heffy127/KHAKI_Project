package co.kr.khaki.zone.service;

import java.util.List;

import co.kr.khaki.zone.DTO.KhakiZoneDTO;

/**
 * @author 민병호
 */
public class KhakiZoneCal {
	
	// 지도 중심좌표 옮길 떄 사용
	private float center_x;	//지도 중심좌표 x
	private float center_y;	//지도 중심좌표 y
	
	// 지도상 지도레벨 설정 시 사용
	private float max_x=0;	//좌표상 최대 x값
	private float max_y=0;	//좌표상 최대 y값
	private float min_x=0;	//좌표상 최소 x값
	private float min_y=0;	//좌표상 최소 y값
	
	// 지도상 표현된 좌표중 차이가 가장 큰 값
	private float between_max=0;
	
	// 배열 생성
	
	// 파라미터 있는 생성자 : 전체 list를 받아와서 사용
	public KhakiZoneCal(List<KhakiZoneDTO> list) {
		
		float sum_x=0;	// x좌표의 합
		float sum_y=0;	// y좌표의 합
		float[] arr_x = new float[list.size()];
		float[] arr_y = new float[list.size()];
		
		for (int i = 0; i < list.size(); i++) {
			arr_x[i] = list.get(i).getZone_location_x();
			arr_y[i] = list.get(i).getZone_location_y();
		}
		
		// 최대 최소값 찾기위한 변수
		max_x = arr_x[0];
		min_x = arr_x[0];
		max_y = arr_y[0];
		min_y = arr_y[0];
		
		if(list.size() > 1) {
			for (int i = 0; i < arr_x.length; i++) {
				if(max_x < arr_x[i]) {
					max_x = arr_x[i];
				}
				if(min_x > arr_x[i]) {
					min_x = arr_x[i];
				}
				// 편의상 반복횟수가 같기 때문에 활용
				if(max_y < arr_y[i]) {
					max_y = arr_y[i];
				}
				if(min_y > arr_y[i]) {
					min_y = arr_y[i];
				}
			}
			float between_x = max_x - min_x;
			float between_y = max_y - min_y;
			
			// 결과 넣기
			this.center_x = (max_x + min_x)/2;
			this.center_y = (max_y + min_y)/2;
			
			// 가장 큰 차이 값을 저장
			if(between_x > between_y) {
				this.between_max = between_x;
			}else {
				this.between_max = between_y;
			}
		}else {
			this.center_x = arr_x[0];
			this.center_y = arr_y[0];
			this.between_max = (float)0.5;	//지도 레벨 1 이하면 설정 시 
		}
	}
	
	// setter, getter 메소드
	public float getBetween_max() {
		return between_max;
	}

	public float getMin_x() {
		return min_x;
	}

	public void setMin_x(float min_x) {
		this.min_x = min_x;
	}

	public float getMin_y() {
		return min_y;
	}

	public void setMin_y(float min_y) {
		this.min_y = min_y;
	}

	public void setBetween_max(float between_max) {
		this.between_max = between_max;
	}
	
	public float getMax_x() {
		return max_x;
	}

	public void setMax_x(float max_x) {
		this.max_x = max_x;
	}

	public float getMax_y() {
		return max_y;
	}

	public void setMax_y(float max_y) {
		this.max_y = max_y;
	}

	public float getCenter_x() {
		return center_x;
	}

	public void setCenter_x(float center_x) {
		this.center_x = center_x;
	}

	public float getCenter_y() {
		return center_y;
	}

	public void setCenter_y(float center_y) {
		this.center_y = center_y;
	}

	@Override
	public String toString() {
		return "KhakiZoneCal [center_x=" + center_x + ", center_y=" + center_y + ", max_x=" + max_x + ", max_y=" + max_y
				+ ", min_x=" + min_x + ", min_y=" + min_y + ", between_max=" + between_max + "]";
	}	
}
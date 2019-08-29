package co.kr.khaki.carmanage;

public class CarConsumableDTO {

	private String carnum1;
	private int belt_timing_num;
	private String belt_timing_time;
	private int belt_operation_num;
	private String belt_operation_time;
	private int oil_engine_num;
	private String oil_engine_time;
	private int oil_transmission_num;
	private String oil_transmission_time;
	private int oil_break_num;
	private String oil_break_time;
	private int filter_aircon_num;
	private String filter_aircon_time;
	private int filter_fuel_num;
	private String filter_fuel_time;
	private int filter_aircleaner_num;
	private String filter_aircleaner_time;
	private int etc_coolant_num;
	private String etc_coolant_time;
	private int etc_battery_num;
	private String etc_battery_time;
	private int etc_tire_num;
	private String etc_tire_time;
	
	/*
carnum1, belt_timing_num, belt_timing_time, belt_operation_num, belt_operation_time, 
oil_engine_num, oil_engine_time, oil_transmission_num, oil_transmission_time,
oil_break_num, oil_break_time, filter_aircon_num, filter_aircon_time,
filter_fuel_num, filter_fuel_time, filter_aircleaner_num, filter_aircleaner_time,
etc_coolant_num, etc_coolant_time, etc_battery_num, etc_battery_time,
etc_tire_num, etc_tire_time
	 */
	
	public String getCarnum1() {
		return carnum1;
	}
	public void setCarnum1(String carnum1) {
		this.carnum1 = carnum1;
	}
	public int getBelt_timing_num() {
		return belt_timing_num;
	}
	public void setBelt_timing_num(int belt_timing_num) {
		this.belt_timing_num = belt_timing_num;
	}
	public String getBelt_timing_time() {
		return belt_timing_time;
	}
	public void setBelt_timing_time(String belt_timing_time) {
		this.belt_timing_time = belt_timing_time;
	}
	public int getBelt_operation_num() {
		return belt_operation_num;
	}
	public void setBelt_operation_num(int belt_operation_num) {
		this.belt_operation_num = belt_operation_num;
	}
	public String getBelt_operation_time() {
		return belt_operation_time;
	}
	public void setBelt_operation_time(String belt_operation_time) {
		this.belt_operation_time = belt_operation_time;
	}
	public int getOil_engine_num() {
		return oil_engine_num;
	}
	public void setOil_engine_num(int oil_engine_num) {
		this.oil_engine_num = oil_engine_num;
	}
	public String getOil_engine_time() {
		return oil_engine_time;
	}
	public void setOil_engine_time(String oil_engine_time) {
		this.oil_engine_time = oil_engine_time;
	}
	public int getOil_transmission_num() {
		return oil_transmission_num;
	}
	public void setOil_transmission_num(int oil_transmission_num) {
		this.oil_transmission_num = oil_transmission_num;
	}
	public String getOil_transmission_time() {
		return oil_transmission_time;
	}
	public void setOil_transmission_time(String oil_transmission_time) {
		this.oil_transmission_time = oil_transmission_time;
	}
	public int getOil_break_num() {
		return oil_break_num;
	}
	public void setOil_break_num(int oil_break_num) {
		this.oil_break_num = oil_break_num;
	}
	public String getOil_break_time() {
		return oil_break_time;
	}
	public void setOil_break_time(String oil_break_time) {
		this.oil_break_time = oil_break_time;
	}
	public int getFilter_aircon_num() {
		return filter_aircon_num;
	}
	public void setFilter_aircon_num(int filter_aircon_num) {
		this.filter_aircon_num = filter_aircon_num;
	}
	public String getFilter_aircon_time() {
		return filter_aircon_time;
	}
	public void setFilter_aircon_time(String filter_aircon_time) {
		this.filter_aircon_time = filter_aircon_time;
	}
	public int getFilter_fuel_num() {
		return filter_fuel_num;
	}
	public void setFilter_fuel_num(int filter_fuel_num) {
		this.filter_fuel_num = filter_fuel_num;
	}
	public String getFilter_fuel_time() {
		return filter_fuel_time;
	}
	public void setFilter_fuel_time(String filter_fuel_time) {
		this.filter_fuel_time = filter_fuel_time;
	}
	public int getFilter_aircleaner_num() {
		return filter_aircleaner_num;
	}
	public void setFilter_aircleaner_num(int filter_aircleaner_num) {
		this.filter_aircleaner_num = filter_aircleaner_num;
	}
	public String getFilter_aircleaner_time() {
		return filter_aircleaner_time;
	}
	public void setFilter_aircleaner_time(String filter_aircleaner_time) {
		this.filter_aircleaner_time = filter_aircleaner_time;
	}
	public int getEtc_coolant_num() {
		return etc_coolant_num;
	}
	public void setEtc_coolant_num(int etc_coolant_num) {
		this.etc_coolant_num = etc_coolant_num;
	}
	public String getEtc_coolant_time() {
		return etc_coolant_time;
	}
	public void setEtc_coolant_time(String etc_coolant_time) {
		this.etc_coolant_time = etc_coolant_time;
	}
	public int getEtc_battery_num() {
		return etc_battery_num;
	}
	public void setEtc_battery_num(int etc_battery_num) {
		this.etc_battery_num = etc_battery_num;
	}
	public String getEtc_battery_time() {
		return etc_battery_time;
	}
	public void setEtc_battery_time(String etc_battery_time) {
		this.etc_battery_time = etc_battery_time;
	}
	public int getEtc_tire_num() {
		return etc_tire_num;
	}
	public void setEtc_tire_num(int etc_tire_num) {
		this.etc_tire_num = etc_tire_num;
	}
	public String getEtc_tire_time() {
		return etc_tire_time;
	}
	public void setEtc_tire_time(String etc_tire_time) {
		this.etc_tire_time = etc_tire_time;
	}
	@Override
	public String toString() {
		return "CarConsumableDTO [carnum1=" + carnum1 + ", belt_timing_num=" + belt_timing_num + ", belt_timing_time="
				+ belt_timing_time + ", belt_operation_num=" + belt_operation_num + ", belt_operation_time="
				+ belt_operation_time + ", oil_engine_num=" + oil_engine_num + ", oil_engine_time=" + oil_engine_time
				+ ", oil_transmission_num=" + oil_transmission_num + ", oil_transmission_time=" + oil_transmission_time
				+ ", oil_break_num=" + oil_break_num + ", oil_break_time=" + oil_break_time + ", filter_aircon_num="
				+ filter_aircon_num + ", filter_aircon_time=" + filter_aircon_time + ", filter_fuel_num="
				+ filter_fuel_num + ", filter_fuel_time=" + filter_fuel_time + ", filter_aircleaner_num="
				+ filter_aircleaner_num + ", filter_aircleaner_time=" + filter_aircleaner_time + ", etc_coolant_num="
				+ etc_coolant_num + ", etc_coolant_time=" + etc_coolant_time + ", etc_battery_num=" + etc_battery_num
				+ ", etc_battery_time=" + etc_battery_time + ", etc_tire_num=" + etc_tire_num + ", etc_tire_time="
				+ etc_tire_time + "]";
	}
	
	
	
	
}

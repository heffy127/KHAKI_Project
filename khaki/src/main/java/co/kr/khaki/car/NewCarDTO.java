package co.kr.khaki.car;

public class NewCarDTO {
   private String car_name;
   private String car_image;
   private String fuel_type;
   private String driven;
   private String fee_hour;
   private String fee_km;
   private String reg_date;
   private String zone_name;
   public String getCar_name() {
      return car_name;
   }
   public void setCar_name(String car_name) {
      this.car_name = car_name;
   }
   public String getCar_image() {
      return car_image;
   }
   public void setCar_image(String car_image) {
      this.car_image = car_image;
   }
   public String getFuel_type() {
      return fuel_type;
   }
   public void setFuel_type(String fuel_type) {
      this.fuel_type = fuel_type;
   }
   public String getDriven() {
      return driven;
   }
   public void setDriven(String driven) {
      this.driven = driven;
   }
   public String getFee_hour() {
      return fee_hour;
   }
   public void setFee_hour(String fee_hour) {
      this.fee_hour = fee_hour;
   }
   public String getFee_km() {
      return fee_km;
   }
   public void setFee_km(String fee_km) {
      this.fee_km = fee_km;
   }
   public String getReg_date() {
      return reg_date;
   }
   public void setReg_date(String reg_date) {
      this.reg_date = reg_date;
   }
   public String getZone_name() {
      return zone_name;
   }
   public void setZone_name(String zone_name) {
      this.zone_name = zone_name;
   }
   
}
package spring.data;

import java.sql.Timestamp;

public class MemberDto {
   private int member_num;
   private String id;
   private String password;
   private String name;
   private String gender;
   private String birth;
   private String year;
   private String month;
   private String day;
   private Timestamp joinday;
   private String email;
   private String phone;
   private String grade;
   
   public int getMember_num() {
      return member_num;
   }
   public void setMember_num(int member_num) {
      this.member_num = member_num;
   }
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public String getPassword() {
      return password;
   }
   public void setPassword(String password) {
      this.password = password;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getGender() {
      return gender;
   }
   public void setGender(String gender) {
      this.gender = gender;
   }
   public String getBirth() {
      return birth;
   }
   public void setBirth(String birth) {
      this.birth = birth;
   }
   public Timestamp getJoinday() {
      return joinday;
   }
   public void setJoinday(Timestamp joinday) {
      this.joinday = joinday;
   }
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   public String getPhone() {
      return phone;
   }
   public void setPhone(String phone) {
      this.phone = phone;
   }
   public String getGrade() {
      return grade;
   }
   public void setGrade(String grade) {
      this.grade = grade;
   }
   
   public String getYear() {
	   return year;
   }
   public void setYear(String year) {
	   this.year = year;
   }
   public String getMonth() {
	   return month;
   }
   public void setMonth(String month) {
	   this.month = month;
   }
   public String getDay() {
	   return day;
   }
   public void setDay(String day) {
	   this.day = day;
   }
   
   
  
}
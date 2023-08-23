
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author meher
 */
public class Staffinfo {

    private int staff_id, salary;
    private String name, email, phone_num, address, dob, gender, joining_date, position;

    public Staffinfo(int staff_id, String name, String email, String phone_num, String address, String dob, String gender, int salary, String joining_date, String position) {
        this.staff_id = staff_id;
        this.name = name;
        this.email = email;
        this.phone_num = phone_num;
        this.address = address;
        this.dob = dob;
        this.gender = gender;
        this.salary = salary;
        this.joining_date = joining_date;
        this.position = position;
  

    }

    public int getstaff_id() {
        return staff_id;
    }

    public String getname() {
        return name;
    }

    public String getemail() {
        return email;
    }

    public String getphone_num() {
        return phone_num;
    }

    public String getaddress() {
        return address;
    }

    public String getdob() {
        return dob;
    }

    public String getgender() {
        return gender;
    }

    public int getsalary() {
        return salary;
    }

    public String getjoining_date() {
        return joining_date;
    }

    public String getposition() {
        return position;
    }

    
}

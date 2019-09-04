
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package mypackage;


public class Patient {
    private int admitno;
    private String pname;
    private String pid;
    private int age;
    private String gender;
    private String dcategory;
    private String admitfor;
    private String refdoc;
    private long mobile;
    private String mail;
    private String address;
    private int roomno;
    private String addate;
    private int priority;

    public void setAddate(String addate) {
        this.addate = addate;
    }

    public String getAddate() {
        return addate;
    }

    public int getPriority() {
        return priority;
    }

    public void setPriority(int priority) {
        this.priority = priority;
    }
    

    public Patient(int admitno, String pname, String pid, int age, String gender, String dcategory, String admitfor, String refdoc, long mobile, String mail, String address) {
        this.admitno = admitno;
        this.pname = pname;
        this.pid = pid;
        this.age = age;
        this.gender = gender;
        this.dcategory = dcategory;
        this.admitfor = admitfor;
        this.refdoc = refdoc;
        this.mobile = mobile;
        this.mail = mail;
        this.address = address;
    }

    Patient() {
    }
    public int getRoomno() {
        return roomno;
    }

    public void setRoomno(int roomno) {
        this.roomno = roomno;
    }
    
    public int getAdmitno() {
        return admitno;
    }

    public void setAdmitno(int admitno) {
        this.admitno = admitno;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDcategory() {
        return dcategory;
    }

    public void setDcategory(String dcategory) {
        this.dcategory = dcategory;
    }

    public String getAdmitfor() {
        return admitfor;
    }

    public void setAdmitfor(String admitfor) {
        this.admitfor = admitfor;
    }

    public String getRefdoc() {
        return refdoc;
    }

    public void setRefdoc(String refdoc) {
        this.refdoc = refdoc;
    }

    public long getMobile() {
        return mobile;
    }

    public void setMobile(long mobile) {
        this.mobile = mobile;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    void display()
    {
        System.out.println(this.getAdmitno());
        System.out.println(this.getPid());
        System.out.println(this.getPname());
        System.out.println(this.getPriority());
    }
}

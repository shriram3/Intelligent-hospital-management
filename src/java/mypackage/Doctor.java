/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package mypackage;

/**
 *
 * @author Laptop
 */
public class Doctor { 
    private String name;
    private String id;
    private String gender;
    private String specialization;
    private String qualification;
    private String experience;
    private String workmode;
    private String merit;
    private long mobile;
    private String mail;
    private String address;
    private String shift;

    public String getShift() {
        return shift;
    }

    public void setShift(String shift) {
        this.shift = shift;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getWorkmode() {
        return workmode;
    }

    public void setWorkmode(String workmode) {
        this.workmode = workmode;
    }

    public String getMerit() {
        return merit;
    }

    public void setMerit(String merit) {
        this.merit = merit;
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
    
    public void displayDoctorDetails()
    {
        System.out.println("Doctor ID :"+this.getId());
        System.out.println("Doctor Name :"+this.getName());
        System.out.println("Gender :"+this.getGender());
        System.out.println("Specialization :"+this.getSpecialization());
        System.out.println("Experience :"+this.getExperience());
        System.out.println("Qualification :"+this.getQualification());
        System.out.println("Work Mode :"+this.getWorkmode());
        System.out.println("Doctor Shift :"+this.getShift());
        System.out.println("Doctor Merit :"+this.getMerit());
        System.out.println("Mobile :"+this.getMobile());
        System.out.println("Email-ID :"+this.getMail());
        System.out.println("Address :"+this.getAddress());
    }
}

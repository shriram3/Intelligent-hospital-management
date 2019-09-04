/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package mypackage;

/**
 *
 * @author SHRIRAM I
 */
public class Room {
    public int roomid;
    public int floor;
    public int admissionno;
    public String Patientid;
    public String disease;
    public String docid;
    public String dischargedate;
     public Room()
     {
         
     }
    public Room(int roomid, int floor, int admissionno, String Patientid, String disease, String docid, String dischargedate) {
        this.roomid = roomid;
        this.floor = floor;
        this.admissionno = admissionno;
        this.Patientid = Patientid;
        this.disease = disease;
        this.docid = docid;
        this.dischargedate = dischargedate;
    }
    
    
    public int getRoomid() {
        return roomid;
    }

    public void setRoomid(int roomid) {
        this.roomid = roomid;
    }

    public int getFloor() {
        return floor;
    }

    public void setFloor(int floor) {
        this.floor = floor;
    }

    public int getAdmissionno() {
        return admissionno;
    }

    public void setAdmissionno(int admissionno) {
        this.admissionno = admissionno;
    }

    public String getPatientid() {
        return Patientid;
    }

    public void setPatientid(String Patientid) {
        this.Patientid = Patientid;
    }

    public String getDisease() {
        return disease;
    }

    public void setDisease(String disease) {
        this.disease = disease;
    }

    public String getDocid() {
        return docid;
    }

    public void setDocid(String docid) {
        this.docid = docid;
    }

    public String getDischargedate() {
        return dischargedate;
    }

    public void setDischargedate(String dischargedate) {
        this.dischargedate = dischargedate;
    }

    @Override
    public String toString() {
        return "Room{" + "roomid=" + roomid + ", floor=" + floor + ", admissionno=" + admissionno + ", Patientid=" + Patientid + ", disease=" + disease + ", docid=" + docid + ", dischargedate=" + dischargedate + '}';
    }
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Domain.Car;
import dao.GenericDao;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.util.Date;
import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;

public class CarModel {
    Car car = new Car();
    private String platenoInput="";
    private String manufacturedDateInput="";
    private String costInput="";
    private String institutionInput="";
    private double costValue;    
    private String costMsg="";
    private String dateMsg="";
    private String plateMsg="";
    private String manuMsg="";
    private String generaMsg="";
    
    private LocalDate manufacturedate;
    
    public boolean applyModelValues(){
        boolean error =false;
        try {
            car.setPlateNo(platenoInput);
            car.setManufacturinDate(manufacturedate);
            car.setCost(costValue);
            car.setInstitution(institutionInput);
        } catch (Exception ex) {
            error = true;
        }
        return error;
    }
    public boolean invokingApplication(){
        boolean error = false;
        try {
            GenericDao<Car> dao = new GenericDao<Car>(Car.class);
            dao.save(car);
            generaMsg ="Car is successfully registered!!!";
        } catch (Exception e) {
            error =true;
            generaMsg ="Car Failed to be registered!!!; May be you are saving it for the second time ";
        }
        return error;
    }
    
    public void applyRequestValue(HttpServletRequest request){
        platenoInput = request.getParameter("a");
        manufacturedDateInput = request.getParameter("c");
        costInput = request.getParameter("d");
        institutionInput = request.getParameter("b");
    }
   
    public boolean covertCost(){
        boolean error = false;
        try {
            costValue = Double.parseDouble(costInput);
        } catch (Exception e) {
            error = true;
            costMsg = "Cost must be of type 'Double'";
        }
        try {
            manufacturedate = LocalDate.parse(manufacturedDateInput);
        } catch (Exception e) {
            error= true;
            manuMsg="Manufacturing Date must be date";
        }
        return error;
    }
    public boolean Validating(){
        boolean error = false;
        
        if(platenoInput == null|| platenoInput.isEmpty()){
            error = true;
            plateMsg = "Plate Number is required please!!";
        }
        
        if(!Pattern.matches("G[RP][0-9]{3}[A-Z]", platenoInput)){ 
            error =true;
            plateMsg ="Plate must be valid with format like GR###X or GP###X(# stands for number from 0-9 and X for alphabet from A-Z in capital)";
        }
        if(manufacturedDateInput == null || manufacturedDateInput.isEmpty()){
            error = true;
            manuMsg = "Manufacturing Date is required please!!";
        }
       
        if(costInput == null || costInput.isEmpty()){
            error = true;
            costMsg = "Cost of car is required please!!";
        }
        return error;
    }
    public String getPlatenoInput() {
        return platenoInput;
    }

    public void setPlatenoInput(String platenoInput) {
        this.platenoInput = platenoInput;
    }

    public String getManufacturedDateInput() {
        return manufacturedDateInput;
    }

    public void setManufacturedDateInput(String manufacturedDateInput) {
        this.manufacturedDateInput = manufacturedDateInput;
    }

    public String getCostInput() {
        return costInput;
    }

    public void setCostInput(String costInput) {
        this.costInput = costInput;
    }

    public String getInstitutionInput() {
        return institutionInput;
    }

    public void setInstitutionInput(String institutionInput) {
        this.institutionInput = institutionInput;
    }

    public double getCostValue() {
        return costValue;
    }

    public void setCostValue(double costValue) {
        this.costValue = costValue;
    }

    public String getCostMsg() {
        return costMsg;
    }

    public void setCostMsg(String costMsg) {
        this.costMsg = costMsg;
    }
    public String getDateMsg() {
        return dateMsg;
    }

    public void setDateMsg(String dateMsg) {
        this.dateMsg = dateMsg;
    }

    public String getPlateMsg() {
        return plateMsg;
    }

    public void setPlateMsg(String plateMsg) {
        this.plateMsg = plateMsg;
    }

    public String getManuMsg() {
        return manuMsg;
    }

    public void setManuMsg(String manuMsg) {
        this.manuMsg = manuMsg;
    }

    public String getGeneraMsg() {
        return generaMsg;
    }

    public void setGeneraMsg(String generaMsg) {
        this.generaMsg = generaMsg;
    }

    public Car getCar() {
        return car;
    }

    public void setCar(Car car) {
        this.car = car;
    }

    public LocalDate getManufacturedate() {
        return manufacturedate;
    }

    public void setManufacturedate(LocalDate manufacturedate) {
        this.manufacturedate = manufacturedate;
    }
    
}

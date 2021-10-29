/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Domain;



import java.time.LocalDate;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table (name = "Cars_table")
public class Car {
    @Id
    private String plateNo;
    private LocalDate manufacturinDate;
    private double cost;
    private String institution;

    public String getPlateNo() {
        return plateNo;
    }

    public void setPlateNo(String plateNo) {
        this.plateNo = plateNo;
    }

    public LocalDate getManufacturinDate() {
        return manufacturinDate;
    }

    public void setManufacturinDate(LocalDate manufacturinDate) {
        this.manufacturinDate = manufacturinDate;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public String getInstitution() {
        return institution;
    }

    public void setInstitution(String institution) {
        this.institution = institution;
    }
}

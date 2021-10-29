/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;
import Model.CarModel;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CarController", urlPatterns = {"/CarController"})
public class CarController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
           
            CarModel carmod =(CarModel) request.getAttribute("carModel");
            if(carmod == null){
                carmod = new CarModel();
                request.setAttribute("carModel", carmod);
            }
            RequestDispatcher rd = request.getRequestDispatcher("/SaveForm.jsp");
            RequestDispatcher rdList = request.getRequestDispatcher("/carList.jsp");
            
            carmod.applyRequestValue(request);
            if(carmod.covertCost()){
               rd.forward(request, response);
            }
            if(carmod.Validating()){
               rd.forward(request, response);
            }
            if(carmod.applyModelValues()){
               rd.forward(request, response);
            }
            if(carmod.invokingApplication()){
               rd.forward(request, response);
            }
            rdList.forward(request, response);
            
        }catch(Exception ex){
            
  }
    }
}



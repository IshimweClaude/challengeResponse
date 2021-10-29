<%-- 
    Document   : carList
    Created on : Oct 21, 2021, 4:14:45 PM
    Author     : Bienvenue
--%>
<%@page import="java.util.List"%>
<%@page import="Domain.Car"%>
<%@page import="Domain.Car"%>
<%@page import="dao.GenericDao"%>
<%@page import="java.time.Period"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>       
.customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

.customers td, .customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

.customers tr:nth-child(even){background-color: #f2f2f2;}

.customers tr:hover {background-color: #ddd;}

.customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
}
    .ga{
     font-size: 1em;
        background: #04AA6D;
	display: inline-block;
	padding: 10px 30px;
	margin-top: 20px;
	text-transform: uppercase;
	text-decoration: none;
	letter-spacing: 2px;
	transition: 0.5s;
            }
            .tit{
                color: #04AA6D;
            }      
      
            
        </style>
    </head>
    <body>
        <%
            GenericDao<Car> Cardao = new GenericDao<>(Car.class);
            List<Car> cars =Cardao.findAll();
        %>
    <center>
        <h1 class="tit">LIST OF RWANDA GOVERNMENT'S CARS REGISTERED</h1>
        <hr >
        <table border="1" class="customers" id="cooperative_table">
            <thead>
               
                <tr>
                    <th>PLATE NUMBER</th>
                    <th>INSTITUTION</th>
                    <th>MANUFACTURED DATE</th>
                    <th>COST</th>
                    <th>DELETE</th>
                    <th>UPDATE</th>
                </tr>
             </thead>
             <tbody>
                 <% 
                     for(Car car : cars){
                 %>
                <tr>
                    <td><%=car.getPlateNo()%></td>
                    <td><%=car.getInstitution()%></td>
                    <td><%=car.getManufacturinDate()%></td>
                    <td><%=car.getCost()%></td>
                    <td><a href="deleteForm.jsp?a=<%=car.getPlateNo()%>">Delete</a></td>
                    <td><a href="updateForm.jsp?a=<%=car.getPlateNo()%>">Update</a></td>
                </tr>
                    <%}%>
             </tbody>
            </table>
        <a href="SaveForm.jsp" class="ga">BACK TO FORM</a>
    </center>

    </body>
</html>





<%@page import="Model.CarModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css"  href="./font-awesome-4.7.0/css/font-awesome.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous"/>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js" integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous"/>
        
        
   </head>
<style>
    body{
        background-color: #111;
    }
* {
  box-sizing: border-box;
  
}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: #4CAF50;
  color: black;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}

input[type=submit]:hover {
  background-color: black;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}

.li{
   font-size: 1em;
	color: #fff;
	background: #04AA6D;
	display: inline-block;
	padding: 5px 30px;
	margin-top: 20px;
	text-transform: uppercase;
	text-decoration: none;
	letter-spacing: 2px;
	transition: 0.5s;
}
.msg{
    color: red;
}

    </style>

    <body>
       <%
               CarModel carmod =(CarModel) request.getAttribute("carModel");
            if(carmod == null){
                carmod = new CarModel();
                request.setAttribute("carModel", carmod);
            }
        %>
        
</center> 

<div class="container">
    <div class="container-fluid" style="background: #000; color: white;margin: 0;">
        <h1 class="tt">RWANDA GOVERNMENT CARS REGISTRATION</h1>
         </div>
    <br>
    <div>
        <h4 class="msg"><%=carmod.getGeneraMsg()%></h4>
    </div>
        <br>
  <form action="CarController" method="POST">
  <div class="row">
    <div class="col-25">
      <label for="pn">Plate Number</label>
    </div>
    <div class="col-75">
        <input type="text" id="pn" name="a" placeholder="Car plate number..." value="<%=carmod.getPlatenoInput()%>">
        <div><h4 class="msg"><%=carmod.getPlateMsg()%></h4></div>
    </div>
  </div>
  
  <div class="row">
    <div class="col-25">
      <label for="institution">Institution</label>
    </div>
    <div class="col-75">
      <select id="institution" name="b" value="<%=carmod.getInstitutionInput()%>">
        <option value="RDB">RDB</option>
        <option value="NPD">NPD</option>
        <option value="RIB">RIB</option>
      </select>
      
    </div>
  </div>

 <div class="row">
    <div class="col-25">
      <label for="date">Manufacturing Date Date</label>
    </div>
    <div class="col-75">
        <input type="date" id="date" name="c" placeholder="Your date.." value="<%=carmod.getManufacturedate()%>">
        <div><h4 class="msg"><%=carmod.getManuMsg()%></h4></div>
    </div>
  </div>  
          <div class="row">
    <div class="col-25">
      <label for="capital">Cost</label>
    </div>
    <div class="col-75">
        <input type="text" id="capital" name="d" placeholder="Your capital.." value="<%=carmod.getCostValue()%>">
        <div><h4 class="msg"><%=carmod.getCostMsg()%></h4></div>
    </div>
  </div>    
  <br>
    <div class="row">
    <input type="submit" value="Submit">
    </div>
  </form>
</div>
       <a href="carList.jsp" class="li">View List</a>   
       </center> 
    </body>
</html>

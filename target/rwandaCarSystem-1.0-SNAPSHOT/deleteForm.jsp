<%@page import="Domain.Car"%>
<%@page import="dao.GenericDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String id = request.getParameter("a") ;
            GenericDao<Car> dao = new GenericDao<Car>(Car.class);
            Car car =dao.findById(id);
            if(!(car == null)){
                dao.delete(car);
            }
            response.sendRedirect("carList.jsp");
            
        %>
    </body>
</html>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="mileage.VehicleMileage" %>
<%
    String vehicleType = request.getParameter("vehicleType");
    String vehicleName = request.getParameter("vehicleName");
    String model = request.getParameter("model");
    double initialKm = Double.parseDouble(request.getParameter("initialKm"));
    double finalKm = Double.parseDouble(request.getParameter("finalKm"));
    double fuelUsed = Double.parseDouble(request.getParameter("fuelUsed"));

    // Calculate mileage and determine condition
    double mileage = VehicleMileage.calculateMileage(initialKm, finalKm, fuelUsed);
    String condition = VehicleMileage.determineCondition(vehicleType, mileage);

    // Create an instance of VehicleMileage and insert data into the database
    VehicleMileage app = new VehicleMileage();
    app.insertIntoDatabase(vehicleType, vehicleName, model, initialKm, finalKm, fuelUsed, condition);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Mileage Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e0f7fa; /* Light blue background */
            margin: 0;
            padding: 0;
        }
        .container {
            width: 50%;
            margin: 0 auto;
            background-color: #007BFF; /* Blue background for the container */
            padding: 20px;
            border-radius: 8px;
            color: white; /* White text */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Mileage Recorded</h1>
        <p>Vehicle Type: <%= vehicleType %></p>
        <p>Vehicle Name: <%= vehicleName %></p>
        <p>Model: <%= model %></p>
        <p>Mileage: <%= mileage %></p>
        <p>Condition: <%= condition %></p>
    </div>
</body>
</html>

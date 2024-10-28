<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Vehicle Mileage Input</title>
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
        input[type="submit"] {
            background-color: #28a745; /* Green submit button */
            color: white; /* White text for button */
            border: none; /* No border */
            padding: 10px;
            border-radius: 5px;
            cursor: pointer; /* Pointer cursor on hover */
        }
        input[type="submit"]:hover {
            background-color: #218838; /* Darker green on hover */
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Enter Vehicle Details</h1>
        <form action="result.jsp" method="post">
            Vehicle Type: <input type="text" name="vehicleType" required>
            Vehicle Name: <input type="text" name="vehicleName" required>
            Model: <input type="text" name="model" required>
            Initial Km: <input type="number" step="0.01" name="initialKm" required>
            Final Km: <input type="number" step="0.01" name="finalKm" required>
            Fuel Used (liters): <input type="number" step="0.01" name="fuelUsed" required>
            <input type="submit" value="Submit">
        </form>
    </div>
</body>
</html>

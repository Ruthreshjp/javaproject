package mileage;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class VehicleMileage {

    // Function to calculate mileage
    public static double calculateMileage(double initialKm, double finalKm, double fuelUsed) {
        double kilometers = finalKm - initialKm;
        return kilometers / fuelUsed;
    }

    // Function to determine vehicle condition
    public static String determineCondition(String vehicleType, double mileage) {
        if (vehicleType.equalsIgnoreCase("bike") && mileage > 40) {
            return "Good";
        } else if (vehicleType.equalsIgnoreCase("car") && mileage > 18) {
            return "Good";
        } else if (vehicleType.equalsIgnoreCase("heavy") && mileage > 4) {
            return "Good";
        } else {
            return "Poor";
        }
    }

    // Method to insert data into the SQLite database
    public void insertIntoDatabase(String vehicleType, String vehicleName, String model, double initialKm, double finalKm, double fuelUsed, String vehicleCondition) {
        String url = "jdbc:sqlite:C:\\Users\\RUTHRESH.J.P\\MySQLiteDB";  // SQLite database file

        String sql = "INSERT INTO VehicleData (vehicle_type, vehicle_name, model, initial_km, final_km, fuel_used, vehicle_condition) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            // Load the SQLite JDBC driver
            Class.forName("org.sqlite.JDBC");

            try (Connection conn = DriverManager.getConnection(url);
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, vehicleType);
                pstmt.setString(2, vehicleName);
                pstmt.setString(3, model);
                pstmt.setDouble(4, initialKm);
                pstmt.setDouble(5, finalKm);
                pstmt.setDouble(6, fuelUsed);
                pstmt.setString(7, vehicleCondition);

                pstmt.executeUpdate();
                System.out.println("Data inserted successfully.");
            }
        } catch (ClassNotFoundException e) {
            System.out.println("SQLite JDBC Driver not found.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Database connection or insertion failed.");
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Taking user input
        System.out.println("Enter vehicle type (car/bike/heavy): ");
        String vehicleType = scanner.nextLine();

        System.out.println("Enter vehicle name: ");
        String vehicleName = scanner.nextLine();

        System.out.println("Enter vehicle model: ");
        String model = scanner.nextLine();

        System.out.println("Enter initial kilometer reading: ");
        double initialKm = scanner.nextDouble();

        System.out.println("Enter final kilometer reading: ");
        double finalKm = scanner.nextDouble();

        System.out.println("Enter fuel used (liters): ");
        double fuelUsed = scanner.nextDouble();

        // Calculate mileage and determine condition
        double mileage = calculateMileage(initialKm, finalKm, fuelUsed);
        String condition = determineCondition(vehicleType, mileage);

        // Output the results
        System.out.println("Vehicle Type: " + vehicleType);
        System.out.println("Vehicle Name: " + vehicleName);
        System.out.println("Model: " + model);
        System.out.println("Mileage: " + mileage);
        System.out.println("Condition: " + condition);

        // Insert data into the database
        VehicleMileage app = new VehicleMileage();
        
        app.insertIntoDatabase(vehicleType, vehicleName, model, initialKm, finalKm, fuelUsed, condition);
        scanner.close();
    }
}

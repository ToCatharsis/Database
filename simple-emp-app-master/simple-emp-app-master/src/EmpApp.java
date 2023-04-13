import oracle.jdbc.pool.OracleDataSource;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;
import java.util.Properties;

public class EmpApp {

    //	String filepath
    Connection conn; // obiekt Connection do nawiazania polaczenia z baza danych

    public static void main(String[] args) {
        EmpApp app = new EmpApp();

        try {
            app.setConnection(); // otwarcie polaczenia z BD
            app.showEmployeesWithSalary(); // test polaczenia
            app.closeConnection();// zamkniecie polaczenia z BD
        } catch (SQLException eSQL) {
            System.out.println("Blad przetwarzania SQL " + eSQL.getMessage());
        } catch (IOException eIO) {
            System.out.println("Nie mozna otworzyc pliku");
        }
    }

    public void setConnection() throws SQLException, IOException { // metoda nawiazuje polaczenie

        File myObj = new File("connection.properties");
        String pathToProperties = myObj.getAbsolutePath();
        pathToProperties = pathToProperties.replace("connection.properties", "simple-emp-app-master\\connection.properties");
        pathToProperties = pathToProperties.replace("\\", "\\\\");

        Properties prop = new Properties();
        FileInputStream in = new FileInputStream(pathToProperties); // w pliku znajduja sie parametry polaczenia
        prop.load(in); // zaczytanie danych z pliku properties
        in.close(); // zamkniecie pliku

        String host = prop.getProperty("jdbc.host");
        String username = prop.getProperty("jdbc.username");
        String password = prop.getProperty("jdbc.password");
        String port = prop.getProperty("jdbc.port");
        String serviceName = prop.getProperty("jdbc.service.name");

        String connectionString = String.format(
                "jdbc:oracle:thin:%s/%s@//%s:%s/%s",
                username, password, host, port, serviceName);

        System.out.println(connectionString);
        OracleDataSource ods; // nowe zrodlo danych (klasa z drivera  Oracle)
        ods = new OracleDataSource();

        ods.setURL(connectionString);
        conn = ods.getConnection(); // nawiazujemy polaczenie z BD

        DatabaseMetaData meta = conn.getMetaData();

        System.out.println("Polaczenie z baza danych nawiazane.");
        System.out.println("Baza danych:" + " " + meta.getDatabaseProductVersion());
    }

    public void closeConnection() throws SQLException { // zamkniecie polaczenia
        conn.close();
        System.out.println("Polaczenie z baza zamkniete poprawnie.");
    }

    public void showEmployeesWithSalary() throws SQLException {
        System.out.println("Lista pracowników:");

        Statement stat = conn.createStatement(); // Statement przechowujacy polecenie SQL

        // wydajemy zapytanie oraz zapisujemy rezultat w obiekcie typu ResultSet
        ResultSet rs = stat.executeQuery("SELECT e.first_name, e.last_name, p.salary FROM employees e join payroll p using (employee_id)");
        System.out.println("---------------------------------");
        // iteracyjnie odczytujemy rezultaty zapytania
        while (rs.next())
            System.out.println(rs.getString(1) + " " + rs.getString(2) + " " + rs.getString(3));
        System.out.println("---------------------------------");

        rs.close();
        stat.close();
    }
}

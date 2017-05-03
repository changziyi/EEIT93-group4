import java.sql.Driver;
import java.sql.DriverManager;
import java.util.Enumeration;

public class JDBCdriver {

    public static void main(String args[]){
         Enumeration<Driver>drivers = DriverManager.getDrivers();//Generic

         while(drivers.hasMoreElements()){
         Driver driver = drivers.nextElement();
         System.out.println(driver.getClass().getName());

         //com.microsoft.sqlserver.jdbc.SQLServerDriver
   }
}
}
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConnect {

    public Connection conn = null;
    

    public DBConnect(String URL, String userName, String password) {
        try {
            //        URL: String connection: Server, database
//        userName, passwrod: account of server
//        call driver
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            
//          call connection
          conn=DriverManager.getConnection(URL,userName, password);
            System.out.println("connected");
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
           // Logger.getLogger(DBConnect.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBConnect.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    public DBConnect(){
        this("jdbc:sqlserver://localhost:1433;databaseName=SWP291_G4","sa","123");
    }
    public static void main(String[] args) {
        new DBConnect();
    }
}

package com.edutecno.procesaconexion;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;

public class DatabaseConnection {

    private static Connection conn = null;

    // Generate a connection from the pool
    public static Connection generaPoolConexion() {
        try {
            if (conn == null || conn.isClosed()) {
                Context initContext = new InitialContext();
                DataSource ds = (DataSource) initContext.lookup("java:/comp/env/jdbc/ConexionOracle");
                conn = ds.getConnection();
            }
        } catch (Exception e) {
            e.printStackTrace();
            conn = null;
        }
        return conn;
    }



}

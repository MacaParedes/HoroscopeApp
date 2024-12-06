package com.edutecno.dao;

import com.edutecno.modelo.Horoscopo;
import com.edutecno.procesaconexion.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HoroscopoDAOImpl implements HoroscopoDAO{

    @Override
    public List<Horoscopo> obtenerHoroscopos() {
        List<Horoscopo> listaHoroscopo = new ArrayList<>();
        String consultaSql = "SELECT * FROM HOROSCOPO";

        try (Connection conn =  DatabaseConnection.generaPoolConexion();
             PreparedStatement pstm = conn.prepareStatement(consultaSql);
             ResultSet rs = pstm.executeQuery()) {

            while (rs.next()) {
                Horoscopo horoscopo = new Horoscopo(
                        rs.getString("ANIMAL"),
                        rs.getDate("FECHA_INICIO"),
                        rs.getDate("FECHA_FIN")
                );
                listaHoroscopo.add(horoscopo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaHoroscopo;
    }
}

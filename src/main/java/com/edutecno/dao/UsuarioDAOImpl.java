package com.edutecno.dao;

import com.edutecno.modelo.Usuario;
import com.edutecno.procesaconexion.DatabaseConnection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAOImpl implements UsuarioDAO {

    private static final Logger log = LoggerFactory.getLogger(UsuarioDAOImpl.class);


    @Override
    public List<Usuario> getUsuarios() {
        List<Usuario> usuarios = new ArrayList<>();
        String query = "SELECT * FROM HOROSCOPE_USER.USUARIOS";
        try (Connection conn = DatabaseConnection.generaPoolConexion();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {  // Iterate over the ResultSet rows
                Usuario user = new Usuario(
                        rs.getString("ID"),
                        rs.getString("NOMBRE"),
                        rs.getString("USERNAME"),
                        rs.getString("EMAIL"),
                        rs.getDate("FECHA_NACIMIENTO"),
                        rs.getString("PASSWORD"),
                        rs.getString("ANIMAL")
                );
                usuarios.add(user);
                log.info("Fetched user: {}", user);  // Log each fetched user
            }
        } catch (Exception e) {
            log.error("Error fetching users", e);
        }
        System.out.print("USUARIOS     AQUI" + usuarios);
        return usuarios;
    }

    @Override
    public Usuario validateUser(String username, String password) {
        Usuario user = null;
        String query = "SELECT * FROM HOROSCOPE_USER.USUARIOS WHERE USERNAME = ? AND PASSWORD = ?";

        try (Connection conn = DatabaseConnection.generaPoolConexion();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, username);
            stmt.setString(2, password);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    user = new Usuario(
                            rs.getString("ID"),
                            rs.getString("NOMBRE"),
                            rs.getString("USERNAME"),
                            rs.getString("EMAIL"),
                            rs.getDate("FECHA_NACIMIENTO"),
                            rs.getString("PASSWORD"),
                            rs.getString("ANIMAL")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }


    @Override
    public boolean createUser(Usuario user) {
        log.info("User {}" , user.toString());
        String query = "INSERT INTO USUARIOS (ID, NOMBRE, USERNAME, EMAIL, FECHA_NACIMIENTO, PASSWORD) " +
                "VALUES (USUARIOS_SEQ.NEXTVAL, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.generaPoolConexion();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, user.getNombre());
            stmt.setString(2, user.getUsername());
            stmt.setString(3, user.getEmail());
            stmt.setDate(4, user.getFechaNacimiento());
            stmt.setString(5, user.getPassword());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    @Override
    public List<Usuario> buscarUsuarios(String criterio) {
        List<Usuario> usuarios = new ArrayList<>();
        String query = "SELECT * FROM USUARIOS WHERE USERNAME LIKE ? OR EMAIL LIKE ? OR ID LIKE ?";
        try (Connection conn = DatabaseConnection.generaPoolConexion();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            String likeCriterio = "%" + criterio + "%";
            stmt.setString(1, likeCriterio);
            stmt.setString(2, likeCriterio);
            stmt.setString(3, likeCriterio);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Usuario user = new Usuario(
                            rs.getString("ID"),
                            rs.getString("NOMBRE"),
                            rs.getString("USERNAME"),
                            rs.getString("EMAIL"),
                            rs.getDate("FECHA_NACIMIENTO"),
                            rs.getString("PASSWORD"),
                            rs.getString("ANIMAL")
                    );
                    usuarios.add(user);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        log.info("usuarios {}", usuarios);
        return usuarios;
    }


    @Override
    public boolean deleteUser(String userId) {
        String query = "DELETE FROM USUARIOS WHERE ID = ?";
        try (Connection conn = DatabaseConnection.generaPoolConexion();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, userId);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateUser(Usuario user) {
        String query = "UPDATE USUARIOS SET nombre = ?, username = ?, email = ? WHERE id = ?";
        int rowsUpdated = 0;

        try (Connection conn = DatabaseConnection.generaPoolConexion();
             PreparedStatement ps = conn.prepareStatement(query)) {

            // Log query and parameters
            System.out.println("Executing query: " + query);
            System.out.println("Parameters: nombre=" + user.getNombre() + ", username=" + user.getUsername() + ", email=" + user.getEmail() + ", id=" + user.getId());

            // Set parameters in the query
            ps.setString(1, user.getNombre());
            ps.setString(2, user.getUsername());
            ps.setString(3, user.getEmail());
            ps.setInt(4, Integer.parseInt(user.getId())); // Parse ID as integer since `id` is SERIAL

            // Execute the update
            rowsUpdated = ps.executeUpdate();

            // Log the result
            System.out.println("Rows updated: " + rowsUpdated);
        } catch (Exception e) {
            // Log any errors
            System.err.println("Error updating user: " + e.getMessage());
            e.printStackTrace();
        }

        return rowsUpdated > 0; // Return true if at least one row was updated
    }



    @Override
    public Usuario getUserById(String id) {
        Usuario user = null;
        String query = "SELECT id, nombre, username, email FROM usuarios WHERE id = ?";

        try (Connection conn = DatabaseConnection.generaPoolConexion();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = new Usuario(
                            rs.getString("id"),
                            rs.getString("nombre"),
                            rs.getString("username"),
                            rs.getString("email")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }




}

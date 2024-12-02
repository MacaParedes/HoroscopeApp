package com.edutecno.dao;

import com.edutecno.modelo.Usuario;

import java.util.List;

public interface UsuarioDAO {

    Usuario validateUser(String username, String password);
    List<Usuario> getUsuarios();
    boolean createUser(Usuario user);










}

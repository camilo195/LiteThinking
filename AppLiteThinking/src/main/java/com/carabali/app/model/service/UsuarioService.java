package com.carabali.app.model.service;

import java.util.List;

import com.carabali.app.model.dto.UsuarioDTO;

public interface UsuarioService {
	
	List<UsuarioDTO> getAllUser();
	UsuarioDTO getUserByName(String name);
	UsuarioDTO getUserByApellido(String apellido);
	UsuarioDTO editUser(Long id, UsuarioDTO user);
	void deleteUser(Long id);
}

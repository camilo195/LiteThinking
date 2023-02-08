package com.carabali.app.model.dao;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.carabali.app.model.entity.Usuario;

public interface UsuarioDao extends CrudRepository<Usuario, Long>{

	

	@Query("SELECT u FROM Usuario u WHERE u.nombre = :nombre")
	Usuario findByNombreUser(String nombre);
	
	Usuario findByApellido(String apellido);
}

package com.carabali.app.model.serviceImpl;

import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.carabali.app.model.dao.UsuarioDao;
import com.carabali.app.model.dto.UsuarioDTO;
import com.carabali.app.model.entity.Usuario;
import com.carabali.app.model.service.UsuarioService;

@Service
public class UsuarioServiceImpl implements UsuarioService {
	
	@Autowired
	private UsuarioDao usuarioDao;	
	
	@Autowired
	private ModelMapper modelmapper;
	
	@Override
	@Transactional(readOnly = true)
	public List<UsuarioDTO> getAllUser() {
		List<Usuario> users = (List<Usuario>) usuarioDao.findAll();
		
		return users.stream()
				.map(usuario -> modelmapper
				.map(usuario, UsuarioDTO.class))
				.collect(Collectors.toList());
	}

	@Override
	@Transactional(readOnly = true)
	public UsuarioDTO getUserByName(String name) {
		Usuario user= usuarioDao.findByNombreUser(name);
		UsuarioDTO userDto = modelmapper.map(user, UsuarioDTO.class);
		return userDto;
	}

	@Override
	@Transactional(readOnly = true)
	public UsuarioDTO getUserByApellido(String apellido) {
		Usuario user= usuarioDao.findByApellido(apellido);
		UsuarioDTO userDto = modelmapper.map(user, UsuarioDTO.class);
		return userDto;
	}

	@Override
	public UsuarioDTO editUser(Long id, UsuarioDTO usuarioDto) {
		Usuario usuario = usuarioDao.findById(id).get();
		
		usuario.setNombre(usuarioDto.getNombre());
		usuario.setApellido(usuarioDto.getApellido());
		usuario.setCorreo(usuarioDto.getCorreo());
		usuario.setContrasena(usuarioDto.getContrasena());
		
		Usuario usuarioEdit = usuarioDao.save(usuario);
			
		return modelmapper.map(usuarioEdit, UsuarioDTO.class);
	}

	@Override
	public void deleteUser(Long id) {
		if(id != null) {
			usuarioDao.deleteById(id);
		}
	}

}

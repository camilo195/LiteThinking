package com.carabali.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.carabali.app.model.dto.UsuarioDTO;
import com.carabali.app.model.entity.Usuario;
import com.carabali.app.model.service.UsuarioService;

@RestController
@RequestMapping("/api_web")
public class UsuarioController {
	
	@Autowired
	private UsuarioService usuarioService;
	
	@GetMapping("/usuarios")
	public ResponseEntity<List<UsuarioDTO>> findAllUsuer(){
		return new ResponseEntity<>(usuarioService.getAllUser(), HttpStatus.OK);
	}
	
	@GetMapping("/usuario/nombre/{nombre}")
	public ResponseEntity<UsuarioDTO> findUserByName(@PathVariable("nombre") String nombre){
		return new ResponseEntity<>(usuarioService.getUserByName(nombre), HttpStatus.OK);
	}
	
	@GetMapping("/usuario/apellido/{apellido}")
	public ResponseEntity<UsuarioDTO> findUserByApellido(@PathVariable("apellido") String apellido){
		return new ResponseEntity<>(usuarioService.getUserByApellido(apellido), HttpStatus.OK);
	}
	
	@PutMapping("/usuario/{id}")
	public ResponseEntity<UsuarioDTO> editUserById(@PathVariable("id") Long id, @RequestBody UsuarioDTO usuarioDto){
		return new ResponseEntity<>(usuarioService.editUser(id, usuarioDto), HttpStatus.CREATED);
	}
	
	@DeleteMapping("/usuario/{id}")
	public ResponseEntity<Void> deleteUser(@PathVariable("id") Long id){
		if(id != null) {
			usuarioService.deleteUser(id);
			return new ResponseEntity<Void>(HttpStatus.OK);
		}else {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		}
		
	}
	

}

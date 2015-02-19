package org.bibpessoal.fachadas;

import java.util.List;

import org.bibpessoal.daos.UsuarioDAO;
import org.bibpessoal.entidade.Usuario;

public class FachadaBibPessoal {
	private static FachadaBibPessoal instancia;
	private UsuarioDAO usuarioDAO;
	
	private FachadaBibPessoal() {
		super();
		usuarioDAO = new UsuarioDAO();
	}
	
	public static FachadaBibPessoal getInstancia() {
		if (instancia == null) {
			instancia = new FachadaBibPessoal();
		}
		return instancia;
	}
	
	public Usuario autenticar(String login, String senha) {
		return usuarioDAO.autenticar(login, senha);
	}

	public boolean cadastraUsuario(Usuario novo) {
		return usuarioDAO.cadastraUsuario(novo);
	}
	
	public List<Usuario> listarUsuarios(int idLogado) {
		return usuarioDAO.listarUsuarios(idLogado);
	}
}

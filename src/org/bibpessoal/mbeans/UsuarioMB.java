package org.bibpessoal.mbeans;

import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import org.bibpessoal.entidade.Usuario;
import org.bibpessoal.fachadas.FachadaBibPessoal;

@ManagedBean(name="usuarioMB")
@SessionScoped
public class UsuarioMB {
	private String login, senha;
	private Usuario usuario = null;
	private String mensagem = null;
	private String msgOk = null;
	private FachadaBibPessoal fachada;
	List<Usuario> usuarios = new ArrayList<Usuario>();
	
	public UsuarioMB() {
		super();
		fachada = FachadaBibPessoal.getInstancia();
	}
	
	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	public boolean isComMensagem() {
		return mensagem != null;
	}

	public String getMensagem() {
		String retorno = mensagem;
		mensagem = null;
		return retorno;
	}

	public void setMensagem(String mensagem) {
		this.mensagem = mensagem;
	}
	
	public boolean isComMsgOk() {
		return msgOk != null;
	}
	
	public String getMsgOk() {
		String retorno = msgOk;
		msgOk = null;
		return retorno;
	}

	public void setMsgOk(String mensagem) {
		this.msgOk = mensagem;
	}

	public List<Usuario> getUsuarios() {
		this.usuarios = fachada.listarUsuarios(usuario.getId());
		return usuarios;
	}

	public void setUsuarios(List<Usuario> usuarios) {
		this.usuarios = usuarios;
	}

	public String autenticar() {
		usuario = fachada.autenticar(login, senha);
		if (usuario == null) {
			this.setMensagem("Usuário e senha inválidos!");
			return "index.jsp";
		}
		return "minhaBiblioteca.jsp";
	}
	
	public String logout() {
		usuario = null;
		return "index.jsp";
	}
}

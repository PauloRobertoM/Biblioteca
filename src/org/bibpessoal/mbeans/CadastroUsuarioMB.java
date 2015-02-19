package org.bibpessoal.mbeans;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.context.FacesContext;

import org.bibpessoal.entidade.Usuario;
import org.bibpessoal.fachadas.FachadaBibPessoal;

@ManagedBean(name="cadastroMB")
@RequestScoped
public class CadastroUsuarioMB {
	private Usuario novo;
	private String confirmaSenha;
	
	private FachadaBibPessoal fachada;
	private UsuarioMB usuarioMB;

	public CadastroUsuarioMB() {
		super();
		novo = new Usuario();
		fachada = FachadaBibPessoal.getInstancia();
		usuarioMB = (UsuarioMB) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("usuarioMB");
	}

	public Usuario getNovo() {
		return novo;
	}

	public void setNovo(Usuario novo) {
		this.novo = novo;
	}
	
	public String getConfirmaSenha() {
		return confirmaSenha;
	}

	public void setConfirmaSenha(String confirmaSenha) {
		this.confirmaSenha = confirmaSenha;
	}
	
	public String cadastrarUsuario() {
		if (novo.getNome()!=null && !novo.getNome().isEmpty() &&
			novo.getLogin()!=null && !novo.getLogin().isEmpty() &&
			novo.getSenha()!=null && !novo.getSenha().isEmpty() &&
			novo.getEmail()!=null && !novo.getEmail().isEmpty() &&
			confirmaSenha!=null && !confirmaSenha.isEmpty()) {
			if (novo.getSenha().equals(confirmaSenha)) {
				boolean ok = fachada.cadastraUsuario(novo);
				if (ok) {
					usuarioMB.setMsgOk("Usuário cadastrado com sucesso!");
					return "index.jsp";
				} else {
					usuarioMB.setMensagem("Não foi possível cadastrar o usuário!");		
				}
			} else {
				usuarioMB.setMensagem("As senhas informadas não são iguais!");
			}
		} else {
			usuarioMB.setMensagem("Parâmetros inválidos (preencha todos)!");
		}
		return "cadastroUsuario.jsp";
	}
}

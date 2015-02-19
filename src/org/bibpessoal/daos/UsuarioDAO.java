package org.bibpessoal.daos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.bibpessoal.entidade.Usuario;

public class UsuarioDAO {
	private Connection con;
	private Statement comando;

	public UsuarioDAO() {
		super();
		conectar();
	}

	private void conectar() {
		if (con == null) {
			try {  
				con = FabricaDeConexao.getConexao();  
				comando = con.createStatement();  
				System.out.println("Conectado!");  
			} catch (ClassNotFoundException e) {  
				imprimeErro("Erro ao carregar o driver", e.getMessage());  
			} catch (SQLException e) {  
				imprimeErro("Erro ao conectar", e.getMessage());  
			}  
		}
	} 

	public void fechar() {  
		try {  
			comando.close();  
			con.close();  
			System.out.println("Conexão Fechada");  
		} catch (SQLException e) {  
			imprimeErro("Erro ao fechar conexão", e.getMessage());  
		}  
	}  

	private void imprimeErro(String msg, String msgErro) {   
		System.err.println(msg);  
		System.out.println(msgErro);  
	} 

	public Usuario autenticar(String login, String senha) {  
		conectar();
		ResultSet rs;
		Usuario usr = null;
		try {
			PreparedStatement ps = con.prepareStatement("SELECT * FROM usuario WHERE login=? and senha=?");
			ps.setString(1, login);
			ps.setString(2, senha);
			rs = ps.executeQuery();
			while (rs.next()) {  
				// pega todos os atributos da postagem
				usr = new Usuario();
				usr.setId(rs.getInt("id"));
				usr.setNome(rs.getString("nome"));
				usr.setLogin(rs.getString("login"));
				usr.setSenha(rs.getString("senha"));
				usr.setEmail(rs.getString("email"));
			}
		} catch (SQLException e) {  
			imprimeErro("Erro ao buscar usuario", e.getMessage());  
		}
		return usr;
	} 

	public boolean cadastraUsuario(Usuario novo) {
		conectar();
		try {
			PreparedStatement psInsere = con.prepareStatement("INSERT INTO usuario (nome,login,senha,email) VALUES (?,?,?,?)");
			psInsere.setString(1, novo.getNome());
			psInsere.setString(2, novo.getLogin());
			psInsere.setString(3,novo.getSenha());
			psInsere.setString(4, novo.getEmail());
			int result = psInsere.executeUpdate();
			return result > 0;
		} catch (SQLException e) {
			imprimeErro("Erro ao buscar usuario", e.getMessage());
		}
		return false;
	} 
	
	public List<Usuario> listarUsuarios(int idLogado){  
		conectar();
		ResultSet rs;  
		try {  
			rs = comando.executeQuery("SELECT * FROM Usuario WHERE id<>" + idLogado);
			List<Usuario> usuarios = new ArrayList<Usuario>();
			while (rs.next()) {  
				// pega todos os atributos da postagem
				Usuario user = new Usuario();
				user.setId(rs.getInt("id"));
				user.setNome(rs.getString("nome"));
				user.setLogin(rs.getString("login"));
				user.setSenha(rs.getString("senha"));
				user.setEmail(rs.getString("email"));
				
				usuarios.add(user);  
			}
			return usuarios;
		} catch (SQLException e) {
			System.out.println(e.getMessage()); 
		}
		return null;
		
	}
}
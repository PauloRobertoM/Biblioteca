package org.bibpessoal.daos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class FabricaDeConexao {
	private static final String MySQLDriver = "com.mysql.jdbc.Driver"; 
	private static final String URL = "jdbc:mysql://localhost/mydb";
	private static final String NOME = "root";
	private static final String SENHA = "admin"; 

	public static Connection getConexao() throws ClassNotFoundException, SQLException {  
		Class.forName(MySQLDriver);  
		return DriverManager.getConnection(URL, NOME, SENHA);  
	}  
}
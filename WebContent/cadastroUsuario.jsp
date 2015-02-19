<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Biblioteca Pessoal</title>
</head>
<body>
<f:view>
<h2>Biblioteca Pessoal - Cadastro de Usuário</h2>
<p>Efetue o seu cadastro no sistema para poder gerenciar a sua coleção particular de livros.</p>
		<h:outputText value="#{usuarioMB.mensagem}" rendered="#{usuarioMB.comMensagem}" style="color: #FF0000"></h:outputText>
		<h:form>
			<h:panelGrid border="1" columns="2" style="text-align: right">
				<h:outputText value="Nome: "></h:outputText>
				<h:inputText value="#{cadastroMB.novo.nome}"></h:inputText>
				<h:outputText value="E-mail: "></h:outputText>
				<h:inputText value="#{cadastroMB.novo.email}"></h:inputText>
				<h:outputText value="Login: "></h:outputText>
				<h:inputText value="#{cadastroMB.novo.login}"></h:inputText>
				<h:outputText value="Senha: "></h:outputText>
				<h:inputSecret value="#{cadastroMB.novo.senha}"></h:inputSecret>
				<h:outputText value="Confirma Senha: "></h:outputText>
				<h:inputSecret value="#{cadastroMB.confirmaSenha}"></h:inputSecret>

			</h:panelGrid>
			<h:commandButton value="Cadatrar Usuário" action="#{cadastroMB.cadastrarUsuario}"></h:commandButton>
		</h:form>
	</f:view>
</body>
</html>
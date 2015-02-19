<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Sistema de Biblioteca Pessoal</title>
		
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.js"></script>
		<script src="http://cdn.jsdelivr.net/jquery.validation/1.13.1/jquery.validate.min.js"></script>
		<script>
		$(function() {
		    $('#form').validate({
		        rules: {
		        	login: {
		                required: true,
		            },
		            senha: {
		                required: true
		            }
		        },
		        messages: {
		        	login: "<font color='red'> Informe o seu login</font>",
		        	senha: "<font color='red'> Informe a sua senha</font>"
		        }
		    });
		});
		</script>
	</head>
	<body>
		<f:view>
			<h2>Biblioteca Pessoal</h2>
			Faça o seu login para acessar o sistema, ou realize o seu cadastro gratuitamente.
			
			<!-- Esse ** prependId ** recebe false, para não passar o seu id para os próximos -->
			
			<h:form id="form" prependId="false">
				<h:outputText style="color: #FF0000" value="#{usuarioMB.mensagem}" rendered="#{usuarioMB.comMensagem}"></h:outputText><br/>
				Login: <h:inputText value="#{usuarioMB.login}" id="login"></h:inputText><br/>
				Senha: <h:inputSecret value="#{usuarioMB.senha}" id="senha"></h:inputSecret><br/>
				<h:commandButton value="Efetuar Login" action="#{usuarioMB.autenticar}"></h:commandButton>
			</h:form>
		</f:view>
	</body>
</html>
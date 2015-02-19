<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<jsp:directive.include file="seguranca/controleDeAcesso.jsp" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Minha Biblioteca</title>

	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
		    $("tr:odd").css("background-color", "#CDC8B1");
		     $("tr:even").css("background-color", "#D3D3D3");
		     $("table").css("width", "50%");
		     $("th").css("height", "25px");
		     $("th").css("background-color", "#2F4F4F");
		     $("th").css("color", "#FFFFFF");
		     $("td").css("padding", "10px");
		});
		$(document).ready(function(){
		    $("tr:odd").css("background-color", "#CDC8B1");
		     $("tr:even").css("background-color", "#D3D3D3");
		});
		
	</script>

</head>
<body>
	<f:view>
		<h2>
			Biblioteca de
			<h:outputText value="#{usuarioMB.usuario.nome}"></h:outputText>
		</h2>
		<hr/>
		<h:form>
			<h:commandLink action="#{usuarioMB.logout}" >
				<h:outputText value="Efetuar Logout" id="logout"></h:outputText>
			</h:commandLink>
		</h:form>
		<hr/>
		<h3>Usuários Cadastrados</h3>
		<h:dataTable border="1" value="#{usuarioMB.usuarios}" var="usuario">
			<h:column id="column1">
				<f:facet name="header">
					<h:outputText value="ID"></h:outputText>
				</f:facet>
				<h:outputText value="#{usuario.id}"></h:outputText>
			</h:column>
			<h:column id="column2">
				<f:facet name="header">
					<h:outputText value="Nome"></h:outputText>
				</f:facet>
				<h:outputText value="#{usuario.nome}"></h:outputText>
			</h:column>
			<h:column id="column3">
				<f:facet name="header">
					<h:outputText value="Login"></h:outputText>
				</f:facet>
				<h:outputText value="#{usuario.login}"></h:outputText>
			</h:column>
			<h:column id="column4">
				<f:facet name="header">
					<h:outputText value="E-mail"></h:outputText>
				</f:facet>
				<h:outputText value="#{usuario.email}"></h:outputText>
			</h:column>
			
			
		</h:dataTable>
		
	</f:view>
</body>
</html>
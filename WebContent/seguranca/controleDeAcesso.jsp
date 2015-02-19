<%@ page import="org.bibpessoal.mbeans.UsuarioMB, org.bibpessoal.entidade.Usuario" %>
<%
	UsuarioMB mb = (UsuarioMB) session.getAttribute("usuarioMB");
	if (mb != null) {
		if(mb.getUsuario() == null) {
			mb.setMensagem("Precisa estar logado para acessar tal página!");
			response.sendRedirect("http://localhost:8080/BibliotecaPessoal/faces/index.jsp");
		}
	} else {
		response.sendRedirect("http://localhost:8080/BibliotecaPessoal/faces/index.jsp");
	}
%>

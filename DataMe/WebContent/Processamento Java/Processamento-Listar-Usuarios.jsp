<%@ page language="java" contentType="text/html; utf8"
    pageEncoding="utf8"%>

<%@page import="java.util.ArrayList" %>
<%@page import="Bean.UsuarioBean" %>
<%@page import="Dao.UsuarioDao" %>

<%
	UsuarioBean usuario_logado = (UsuarioBean) session.getAttribute("usuario_logado");
	UsuarioDao usuario_dao = new UsuarioDao();
	
	ArrayList<UsuarioBean> lista_usuario = usuario_dao.ListarUsuarios(usuario_logado.getUuid());
	
	for (UsuarioBean usuario : lista_usuario) {
%>
		<tr>
			<td><button class='fas fa-pencil-alt campoRedondo neomorphismo neonHover opacito' aria-hidden='true' onclick="redirecionamentoAlterarUsuario(this)" data-uuid_usuario="<%=usuario.getUuid()%>"></button></td>
<%
		if (usuario.isBloqueado() == 1) {
%>
			<td><button class='fas fa-lock campoRedondo neomorphismo neonHover opacito' aria-hidden='true' onclick="animacaoBloqueioUsuario(this); listaBloqueioUsuario(this);" data-uuid_usuario="<%=usuario.getUuid()%>"></button></td>
<%
		} else {
%>
			<td><button class='fas fa-unlock campoRedondo neomorphismo neonHover opacito' aria-hidden='true' onclick="animacaoBloqueioUsuario(this); listaBloqueioUsuario(this);" data-uuid_usuario="<%=usuario.getUuid()%>"></button></td>
<%
		}
%>
			<td><%=usuario.getNivel() %></td>
			<td><%=usuario.getNickname() %></td>
			<td><%=usuario.getEmail() %></td>
		</tr>
<%
	}
%>
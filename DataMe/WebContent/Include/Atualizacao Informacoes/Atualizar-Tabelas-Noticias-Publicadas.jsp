<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
    
<%@page import="Bean.UsuarioBean" %>

<%@page import="Bean.NoticiaPostBean" %>
<%@page import="Dao.NoticiaPostDao" %>

<%@page import="java.util.ArrayList" %>
    
<!DOCTYPE html>
<html>
	<head></head>
	<body>
	
	<%
		UsuarioBean usuario_logado = (UsuarioBean) session.getAttribute("usuario_logado");
		NoticiaPostBean noticia = new NoticiaPostBean();
		NoticiaPostDao noticia_dao = new NoticiaPostDao();
		
		noticia.setUuidUsuario(usuario_logado.getUuid());
		ArrayList<NoticiaPostBean> lista_noticias = noticia_dao.ListarNoticiasPublicadas(noticia);
		
		for (NoticiaPostBean noticia_selecionada : lista_noticias) {
	%>
			<tr>
				<td><button class='fas fa-pencil-alt campoRedondo neomorphismo neonHover opacito' aria-hidden='true' onclick="redirecionamentoAlterarNoticia(this)" data-uuid_noticia="<%=noticia_selecionada.getUuidNoticiaPost()%>"></button></td>
				<td><%=noticia_selecionada.getNivel() %></td>
				<td><%=noticia_selecionada.getTitulo() %></td>
			</tr>
	<%
			}
	%>
</html>
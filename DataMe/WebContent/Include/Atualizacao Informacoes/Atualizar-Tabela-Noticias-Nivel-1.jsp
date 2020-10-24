<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
    
<%@page import="Bean.NoticiaPostBean" %>
<%@page import="Dao.NoticiaPostDao" %>

<%@page import="java.util.ArrayList" %>
    
<%
	NoticiaPostDao noticia_dao = new NoticiaPostDao();
	ArrayList<NoticiaPostBean> lista_noticias = noticia_dao.ListarPreviewNoticiasNivel1();
		
	for (NoticiaPostBean noticia_selecionada : lista_noticias) {
%>
		<tr>
			<td><button class='fas fa-eye campoRedondo neomorphismo neonHover opacito' aria-hidden='true' onclick="redirecionamentoVisualizarNoticia(this)" 
			data-uuid_noticia="<%=noticia_selecionada.getUuidNoticiaPost()%>" data-uuid_usuario_noticia="<%=noticia_selecionada.getUuidUsuario()%>"></button></td>
			<td><%=noticia_selecionada.getTitulo() %></td>
			<td><%=noticia_selecionada.getDataHoraPostagem() %></td>
		</tr>
<%
	}
%>
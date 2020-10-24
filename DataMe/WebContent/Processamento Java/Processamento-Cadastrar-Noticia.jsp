<%@ page language="java" contentType="text/html; utf8"
    pageEncoding="utf8"%>

<%@page import="Bean.AlterarSenhaBean" %>
<%@page import="Bean.UsuarioBean" %>
<%@page import="Bean.NoticiaPostBean" %> 
<%@page import="Dao.NoticiaPostDao" %>
<%@page import="Seguranca.StripHTML" %>

<%
	UsuarioBean usuario = (UsuarioBean) session.getAttribute("usuario_logado");

	NoticiaPostBean noticia = new NoticiaPostBean();
	noticia.setUuidUsuario(usuario.getUuid());
	noticia.setTitulo(StripHTML.StripString(request.getParameter("titulo")));
	noticia.setDescricao(request.getParameter("descricao"));
	noticia.setNivel(Integer.parseInt(request.getParameter("nivel")));
	noticia.setStatus(Integer.parseInt(request.getParameter("status")));
	noticia.setUuidNoticiaPost(request.getParameter("uuidNoticia"));
	
	NoticiaPostDao noticia_dao = new NoticiaPostDao();
	boolean retorno;
	
	// cadastro de notícia
	if (noticia.getUuidNoticiaPost().equals("none_hash")) { retorno = noticia_dao.CadastrarNoticia(noticia); }
	
	// alteração de notícia
	else { retorno = noticia_dao.AlterarNoticia(noticia); }
	
	// processamento com sucesso
	if (retorno) {
%>
		1
<%
	}
	
	// processamento com falhas
	else {
%>
		0
<%
	}
%>
<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8"%>
    
<%@page import="java.sql.*" %>
<%@page import="Bean.UsuarioBean" %>
<%@page import="Dao.UsuarioDao" %>
<%@page import="BancoDados.ConexaoMySQL" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%
	// Exibe imagem na página por completo de maneira visual
	UsuarioDao usuario_dao = new UsuarioDao();
	byte[] avatar = usuario_dao.SelecionarAvatar(request.getParameter("usuario_uuid"));
		
	OutputStream avatar_output = response.getOutputStream();	
	avatar_output.write(avatar);
	avatar_output.flush();
	avatar_output.close();
%>
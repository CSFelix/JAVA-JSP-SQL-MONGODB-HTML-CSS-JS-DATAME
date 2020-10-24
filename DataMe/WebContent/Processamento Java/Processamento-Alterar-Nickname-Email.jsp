<%@ page language="java" contentType="text/html; utf8"
    pageEncoding="utf8"%>
<%@page import="Bean.UsuarioBean" %>
<%@page import="Dao.UsuarioDao" %>
<%@page import="Seguranca.StripHTML" %>
<%
	String nickname = StripHTML.StripString(request.getParameter("nicknameUsuario"));
	String email = StripHTML.StripString(request.getParameter("emailUsuario"));
	
	UsuarioBean usuario = new UsuarioBean();
	UsuarioBean usuario_logado = (UsuarioBean) session.getAttribute("usuario_logado");
	UsuarioDao usuario_dao = new UsuarioDao();
	
	usuario.setNickname(nickname);
	usuario.setEmail(email);
	usuario.setUuid(usuario_logado.getUuid());
	
	int retorno = usuario_dao.AlterarDados(usuario);
	
	// erro no processamento
	if (retorno == 0) {
%>
		😥 Falha na alteração: problemas internos, tente mais tarde!
<%
	// email fora do padrão regex
	}  else if (!StripHTML.VerificaEmail(usuario.getEmail())) {
%>
		😥 Falha na alteração: email fora do padrão (apenas letras, números e underlines são permitidos)!
<%
	// email e nickname já cadastrados
	} else if (retorno == 1) {
%>
		😥 Falha na alteração: email e nickname já cadastrados!
<%
	// email já cadastrado
	} else if (retorno == 2) {
%>
		😥 Falha na alteração: email já cadastrado!
<%
	// nickname já cadastrado
	} else if (retorno == 3) {
%>
		😥 Falha na alteração: nickname já cadastrado!
<%
	// alteração efetuada com sucesso
	} else if (retorno == 4) {
%>
		🎉 Dados alterados com sucesso!
<%
	}
%>
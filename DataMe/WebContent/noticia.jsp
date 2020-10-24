<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
   
<%@page import="Bean.UsuarioBean" %>
<%@page import="Dao.UsuarioDao" %>

<%@page import="Bean.NoticiaPostBean" %>
<%@page import="Dao.NoticiaPostDao" %>    
    
<%@page import="Seguranca.StripHTML" %>
    
<!DOCTYPE html>
<html lang="pt-br">
	<%
	NoticiaPostBean noticia = new NoticiaPostBean();
	noticia.setUuidNoticiaPost(request.getParameter("hash_noticia"));
	noticia.setUuidUsuario(request.getParameter("hash_usuario"));
	
	NoticiaPostDao noticia_dao = new NoticiaPostDao();
	noticia = noticia_dao.SelecionarNoticia(noticia);
	
	UsuarioDao usuario_dao = new UsuarioDao();
	UsuarioBean usuario = usuario_dao.SelecionarUsuarioNoticia(request.getParameter("hash_usuario"));
	%>

	<jsp:include page="Include\head-painel.jsp" />
	
	<body>
		<jsp:include page="Include\header.jsp" />
		<jsp:include page="Include\modal.jsp" />
		
		<section class="container flexCenter">
			<!-- botões configurações -->
			<jsp:include page="Include\botoes-configuracoes.jsp" />
		
			<!--  painel -->
			<section class="formBiometria neomorphismo uiFade">
				<!-- dados usuário que cadastrou notícia -->
				<section>
					<center>
						<p>👤 Publicada por:</p>
						<br><br>
						
						<!-- foto de perfil -->
						<div class="foto">
							<a href="#" id="botaoModalAvatar" class="profile-pic neonHover">
								<div class="profile-pic" style="background-image: url(Include/imagem.jsp?usuario_uuid=<%=usuario.getUuid()%>);">
									<span>Apenas Visualização</span>
								</div>
							</a>
						</div>
					
						<br>
						<h3><%=usuario.getNickname() %></h3>
						<br>
						<h5><%=usuario.getEmail() %></h5>
						<br>
						<h5><%=noticia.getDataHoraPostagem() %></h5>
						<br><br>
						
						<!-- botão de retorno -->
						<a href="painel.jsp"><button class="fas fa-backward campoRedondo neomorphismo neonHover opacito uiFade" title="Retornar\Cancelar"></button></a>
						<br><br>
						<br><br>
					</center>
				</section>
				
				<br><br>
				<hr class="hrHorizontal">
				<br><br>
				
				<!-- dados notícia -->
				<section>
					<center>
						<p>📰 Notícia</p>
						<br><br>
					
						<h1><%=noticia.getTitulo() %></h1>
						<br><br>
						<div><%=noticia.getDescricao() %></div>
					</center>
				</section>
			</section>
		</section>
		
		<jsp:include page="Include\footer.jsp" />
	</body>
	
	<jsp:include page="Include\script-painel.jsp" />
	<jsp:include page="Include\Resetar Sessoes\Resetar-Sessoes-Painel.jsp" />
	<jsp:include page="Include\Display Mensagens\Display-Mensagem-Cadastro-Usuario.jsp" />
	<jsp:include page="Include\Display Mensagens\Display-Mensagem-Alteracao-Nickname-Senha.jsp" />
	<jsp:include page="Include\Display Mensagens\Display-Mensagem-Alteracao-Biometria.jsp" />
</html>
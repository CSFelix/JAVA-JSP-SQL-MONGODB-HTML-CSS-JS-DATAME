/*
 * Aplica animação de escala na seção inicial após o login na aplicação
 * */
$(document).ready(function() { 
	$( ".uiFold" ).hide(); 
	$( ".uiFold" ).toggle( "fold", 2000); 
});


/*
 * Aplica animação de explode nos formulários de login, cadastro e recuperação de senha
 */
$(document).ready(function() { 
	$( ".uiFade" ).hide(); 
	$( ".uiFade" ).toggle( "fade"); 
});


/*
 * Aplica animação de toogle na lista de mensagens
 */
$(document).ready(function() { 
	$(".listaMensagens").css("display", "none");
	$("#mensagens").click(function() { $(".listaMensagens").slideToggle(500);});
});

/*
 * Aplica animação de toogle na imagem de perfil do usuário
 */
$(document).ready(function() { 
	$(".fotoReconhecimento").css("display", "none");
	$("#mensagemInformacaoFotoReconhecimento").css("display", "none");
	
	$(".fotoPerfilCadastroUsuario").css("display", "none");
	$("#mensagemInformacaoFotoPerfil").css("display", "none");
	
	
	$("#botaoFotoReconhecimento").click(function() {
		$(".fotoReconhecimento").slideToggle(500);
		$("#mensagemInformacaoFotoReconhecimento").slideToggle(500);
		
		$(".fotoPerfilCadastroUsuario").css("display", "none");
		$("#mensagemInformacaoFotoPerfil").css("display", "none");
	});
	
	$("#botaoFotoPerfil").click(function() { 
		$(".fotoReconhecimento").css("display", "none");
		$("#mensagemInformacaoFotoReconhecimento").css("display", "none");
		
		$(".fotoPerfilCadastroUsuario").slideToggle(500);
		$("#mensagemInformacaoFotoPerfil").slideToggle(500);
	});
});
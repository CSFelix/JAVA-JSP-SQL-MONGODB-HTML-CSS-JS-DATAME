/*
 * processamento do cadastro de usuários
 * Assintótica(t), sendo 't' o tempo de comunicação com o servidor
 * */
$(document).ready(function() {
	$("#cadastrarUsuario").click(function() {
		var nickname = $("#nicknameCadastroUsuario").val();
		var email = $("#emailCadastroUsuario").val();
		var nivelUsuario = $("#nivelUsuario").val();
		var bloqueio = ($("#botaoBloqueio").hasClass("fa-unlock") ? 0 : 1);
		
		/// capturar uuid
		const queryString = window.location.search;
		const urlParams = new URLSearchParams(queryString);
		var uuid_usuario = urlParams.get("hash_usuario");
		
		// Dados não preenchidos
		if (nickname == "" || email == "") { alert("Nickname e Email devem estar preenchidos antes de salvarmos o cadastro do usuário."); }
		
		// Dados preenchidos
		else {
			$.ajax({
				type: "POST",
				url: "Processamento Java\\Processamento-Cadastrar-Usuario.jsp",
				data: { "nicknameCadastroUsuario": nickname, "emailCadastroUsuario": email, 
					    "nivelUsuario": nivelUsuario, "bloqueio": bloqueio, "uuid_usuario": uuid_usuario },
				success: function(data) {
				
					// falha interna
					if (data.includes("0")) {
						$("#mensagemErroNickname").hide();
						$("#mensagemErroEmail").hide();
						
						$("#mensagemErroProcessamento").text("😥  Falha no Processamento: estamos com problemas internos, por favor, tente novamente mais tarde");
						$("#mensagemErroProcessamento").show();
					}
					
					// nickname fora do padrão
					else if (data.includes("1")) {
						$("#mensagemErroEmail").hide();
						$("#mensagemErroProcessamento").hide();
						
						$("#mensagemErroNickname").text("😥 Falha na Validação: Nickname deve ter entre 5 e 15 caracteres");
						$("#mensagemErroNickname").show();
					}
					
					// nickname já cadastrado
					else if (data.includes("2")) {
						$("#mensagemErroEmail").hide();
						$("#mensagemErroProcessamento").hide();
						
						$("#mensagemErroNickname").text("😥  Falha na Validação: Nickname já Cadastrado");
						$("#mensagemErroNickname").show();
					}
					
					// email fora do padrão
					else if (data.includes("3")) {
						$("#mensagemErroNickname").hide();
						$("#mensagemErroProcessamento").hide();
						
						$("#mensagemErroEmail").text("😥  Falha na Validação: Email deve ter entre 5 e 200 caracteres");
						$("#mensagemErroEmail").show();
					}
					
					// email já cadastrado
					else if (data.includes("4")) {
						$("#mensagemErroNickname").hide();
						$("#mensagemErroProcessamento").hide();
						
						$("#mensagemErroEmail").text("😥  Falha na Validação: Email já Cadastrado");
						$("#mensagemErroEmail").show();
					}
					
					// nickname\email fora do padrão
					else if (data.includes("5")) {
						$("#mensagemErroProcessamento").hide();
						
						$("#mensagemErroNickname").text("😥  Falha na Validação: Nickname deve ter entre 5 e 15 caracteres");
						$("#mensagemErroEmail").text("😥  Falha na Validação: Email deve ter entre 5 e 200 caracteres");
						
						$("#mensagemErroNickname").show();
						$("#mensagemErroEmail").show();
					}
					
					// nickname fora do padrão e email já cadastrado
					else if (data.includes("6")) {
						$("#mensagemErroProcessamento").hide();
						
						$("#mensagemErroNickname").text("😥  Falha na Validação: Nickname deve ter entre 5 e 15 caracteres");
						$("#mensagemErroEmail").text("😥  Falha na Validação: Email já Cadastrado");
						
						$("#mensagemErroNickname").show();
						$("#mensagemErroEmail").show();
					}
					
					// nickname já cadastrado e email fora do padrão
					else if (data.includes("7")) {
						$("#mensagemErroProcessamento").hide();
						
						$("#mensagemErroNickname").text("😥  Falha na Validação: Nickname já Cadastrado");
						$("#mensagemErroEmail").text("😥  Falha na Validação: Email deve ter entre 5 e 200 caracteres");
						
						$("#mensagemErroNickname").show();
						$("#mensagemErroEmail").show();
					}
					
					// nickname\email já cadastados
					else if (data.includes("8")) {
						$("#mensagemErroProcessamento").hide();
						
						$("#mensagemErroNickname").text("😥  Falha na Validação: Nickname já Cadastrado");
						$("#mensagemErroEmail").text("😥  Falha na Validação: Email já Cadastrado");
						
						$("#mensagemErroNickname").show();
						$("#mensagemErroEmail").show();
					}
					
					// cadastro efetuado com sucesso
					else if (data.includes("9")) {
						$("#mensagemErroNickname").hide();
						$("#mensagemErroEmail").hide();
						$("#mensagemErroProcessamento").hide();
						
						window.location.replace("painel.jsp");
					}
				}
					
			});
		}
	});
});
$("#mensagemErroNickname").hide();
$("#mensagemErroEmail").hide();
$("#mensagemErroProcessamento").hide();
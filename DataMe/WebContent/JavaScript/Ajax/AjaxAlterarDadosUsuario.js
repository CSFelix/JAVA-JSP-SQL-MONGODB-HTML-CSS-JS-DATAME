/*
 * processamento do alteração de usuários
 * Assintótica(t), sendo 't' o tempo de comunicação com o servidor
 * */

$(document).ready(function() {
	$("#salvarDadosUsuario").click(function() {
		var nickname = $("#nicknameUsuario").val();
		var email = $("#emailUsuario").val();
		
		// Dados não preenchidos
		if (nickname == "" || email == "") { alert("Nickname e Email devem estar preenchidos antes de alterar os dados."); }
			
		// Dados preenchidos
		else {
			$.ajax({
				type: "POST",
				url: "Processamento Java\\Processamento-Alterar-Nickname-Email.jsp",
				data: { "nicknameUsuario": nickname, "emailUsuario": email },
					
				// se o processamento der certo, uma mensagem é exibida ao usuário
				success: function(data) {
					$("#mensagemAlteracaoNicknameEmail").text(data);
					$("#mensagemAlteracaoNicknameEmail").show();
					}
				});
			}
		});
	});
/*
 * processamento do cadastro de solicitação da alteração da foto para reconhecimento facial (biometria)
 * Assintótica(t), sendo 't' o tempo de comunicação com o servidor
 * */

$(document).ready(function() {
	$("#enviarRequisicaoAlteracaoBiometria").click(function() {				
		$.ajax({
			type: "POST",
			url: "Processamento Java\\Processamento-Alterar-Biometria.jsp",
			data: { },
					
			// se o processamento der certo, uma mensagem é exibida ao usuário
			success: function(data) {
				$("#mensagemAlteracaoBiometria").text(data);
				$("#mensagemAlteracaoBiometria").show();
				}
			});
		});
	});
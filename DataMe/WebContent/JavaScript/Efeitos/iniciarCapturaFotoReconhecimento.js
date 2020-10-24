/*
 * capturaão da foto a ser utilizada no reconhecimento facial
 * */
// ocultação dos elementos utilizados somente na captura e captura de variáveis globais
$(document).ready(function() {
	// ocultação
	$("#camera").css("display", "none");
	$(".separador").css("display", "none");
	$("#capturarFoto").css("display", "none");
	$("#previaImagemCapturada").css("display", "none");
	$("#formulario").css("display", "none");
});

// inicialização da câmera e do processo de captura
$("#iniciarCaptura").click(function() {
	// retira dados da página
	$(".tituloSection").css("display", "none");
	$(".mensagemInformacao").css("display", "none");
	$("#iniciarCaptura").css("display", "none");
	
	// reposicionamento do painel para flex-direction row
	$(".formBiometria").css("flex-direction", "row");
	
	// adiciona conteúdos para captura da face
	$("#camera").css("display", "block");
	$(".separador").css("display", "block");
	$("#capturarFoto").css("display", "block");
	
	// preparação da webcam
	Webcam.set({
		// tamanho da janela de visualização
		width: 320,
		height: 240,
		
		// tamanho da área capturada
		dest_width: 640,
		dest_height: 480,
		
		// tamanho da área capturada considerado
		crop_width: 480,
		crop_height: 480,

		// formato da imagem
		image_format: 'jpeg',
		jpeg_quality: 100
		
		// girar imagem para ficar posicionada do jeito real
		//flip_horiz: true
	});
	
	Webcam.attach('#camera');
});

// captura e visualização da preview

$("#capturarFoto").click(function() {
	Webcam.snap(function(data_uri) {
		
		// exibição do resultado da captura
		$("#previaImagemCapturada").attr("src", data_uri);
		$("#previaImagemCapturada").css("display", "block");
		
		// preparação do formulário
		$("#formulario").css("display", "block");
		$("#formulario").html('<form method="POST" action="ProcessamentoAlterarImagemReconhecimento" class="modal-content neomorphismo" enctype="multipart/form-data">' +
								'<input name="uuid_usuario" type="hidden" value="' + window.localStorage.getItem("uuid_usuario") + '">' +
								'<input name="uuid_alterar_biometria" type="hidden" value="' + window.localStorage.getItem("uuid_alterar_biometria") + '">' +
								'<input name="fotoReconhecimento" type="hidden" value="' + data_uri + '"/>' +
								'<input type="submit" class="botao neomorphismo opacito neonHover" value="Enviar">' +
								'</form>');
	});
});
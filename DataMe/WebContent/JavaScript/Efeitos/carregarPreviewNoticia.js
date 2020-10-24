/*
 * Carregamento das informações das notícias durante a alteração da mesma
 * */
$(function() {
	$("#botaoCarregarNoticia").click(function() {
		var titulo = $("#tituloCadastroNoticia").val();
		var descricao = $("#descricaoCadastroNoticia").val();
		var preview = "<h2><b>" + titulo + "</b></h2>" 
						+ "<br><br>"
						+ descricao;
		
		$("#previewDescricaoNoticia").html(preview);
	});
});
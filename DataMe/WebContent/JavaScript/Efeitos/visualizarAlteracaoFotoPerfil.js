/*
 * realiza visualização da foto de perfil durante a alteração do cadastro do usuário
 * Assintótica: O(1)
 * */

function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    
    reader.onload = function(e) {
    	 $("#fotoVisualizacao").css("background-image", "url(" + e.target.result + ")"); 
    	 $("#fotoVisualizacao").css("background-color", "transparent"); 
    }
    
    reader.readAsDataURL(input.files[0]); // converte imagem para base 64
  }
}

$("#selecionarFoto").change(function() { readURL(this); });
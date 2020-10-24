/*
 * blloqueio da opção de inspecionar elemento nas páginas de login\alteração de senha, bem como
 * aos usuários bloqueados para tal funcionallidade
 * 
 * Assintótica: O(5) >> O(1)
 * */

// Clique Direito do Mouse
document.addEventListener('contextmenu', function(e) { e.preventDefault(); });

document.onkeydown = function(e) {

	// F12
  	if(event.keyCode == 123) { return false; }

  	// CTRL SHIFT I
  	else if(e.ctrlKey && e.shiftKey && e.keyCode == 'I'.charCodeAt(0)) { return false; }

  	// CTRL SHIFT C
  	else if(e.ctrlKey && e.shiftKey && e.keyCode == 'C'.charCodeAt(0)) { return false; }

  	// CTRL SHIFT J
  	else if(e.ctrlKey && e.shiftKey && e.keyCode == 'J'.charCodeAt(0)) { return false; }

  	// CTRL U
  	else if(e.ctrlKey && e.keyCode == 'U'.charCodeAt(0)) { return false; }
}
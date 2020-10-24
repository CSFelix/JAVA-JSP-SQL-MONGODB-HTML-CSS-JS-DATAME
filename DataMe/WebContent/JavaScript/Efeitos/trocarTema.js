/*
 * alteraçao entre o tema claro e escuro bem como a recuperação do último tema utilizado
 * Assintótica: O(1)
 * */

const trocarModo = document.querySelector('.trocar-modo input[type="checkbox"]');
const temaAtual = localStorage.getItem('theme');
const fraseModo = document.getElementById("frase-modo");

// recupera último tema salvo pelo usuário
if (temaAtual) {
    document.documentElement.setAttribute('data-theme', temaAtual);
    
    // se for o modo escuro, o input fica checado e a bolinha de troca de modo passa
    // ao lado direito
    if (temaAtual === 'escuro') { 
    	trocarModo.checked = true;
    	fraseModo.innerHTML = "Ative o Modo Claro!";
    }
}

function TrocarTema(e) {
    /*
     * Verifica se o input está checado e atribui o tema à página
     * - Checado >> Tema Escuro
     * - Não-Checado >> Tema Claro
     * 
     * Assintótica: O(1)
     * */
	
    if (e.target.checked) {
        document.documentElement.setAttribute('data-theme', 'escuro');
        localStorage.setItem('theme', 'escuro');
        fraseModo.innerHTML = "Ative o Modo Claro!";
    }
    else {        
        document.documentElement.setAttribute('data-theme', 'claro');
        localStorage.setItem('theme', 'claro');
        fraseModo.innerHTML = "Ative o Modo Escuro!";
    }    
}

trocarModo.addEventListener('change', TrocarTema, false);
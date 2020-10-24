function myFunction() {
	/*
	 * filtro dos usuários na tabela de visualização pelo nickname
	 * Assintótica: O(n), sendo 'n' a quantidade de usuários exceto o que está visualizando
	 * */
	
	var nickname, filtro, tabela, tr, td, i, valorNicknameTabela;
	nickname = document.getElementById("filtroNickname");
	filtro = nickname.value.toUpperCase();
	tabela = document.getElementById("tabelaUsuariosCadastrados");
	tr = tabela.getElementsByTagName("tr");
	
	for (i = 0; i < tr.length; i++) {
		td = tr[i].getElementsByTagName("td")[3];
   
		if (td) { 
			valorNicknameTabela = td.textContent || td.innerText;
			
			if (valorNicknameTabela.toUpperCase().indexOf(filtro) > -1) { tr[i].style.display = ""; } 
			else { tr[i].style.display = "none"; }
		}       
	}
}
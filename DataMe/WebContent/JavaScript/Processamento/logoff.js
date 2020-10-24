/*
 * encaminha o usuário à página de processamento para logoff da conta
 * Assintótica: O(1)
 * */

$(function() {
	$("#logoff").click(function() {
		window.location.replace("Processamento Java\\Processamento-Logoff.jsp");
	});
});
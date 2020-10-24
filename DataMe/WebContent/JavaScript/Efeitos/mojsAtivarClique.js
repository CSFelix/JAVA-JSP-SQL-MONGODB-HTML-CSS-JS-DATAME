document.onclick = (e) => {
	// captura posição x e y do mouse durante o click
	const position = {
		x: e.pageX,
		y: e.pageY
	}
				
	// o efeito é gerado durante 1segundo		
	setTimeout(function teste() {	
		circle.tune(position);
		burst.tune(position);
		bang.tune(position);
		
		burst.replay();
		bang.replay();
		circle.replay();
		}, 100);
}
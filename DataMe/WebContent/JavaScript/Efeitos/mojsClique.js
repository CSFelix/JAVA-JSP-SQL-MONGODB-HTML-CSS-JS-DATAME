// poeira, balõezinhos
const bang = new mojs.Burst({
	left: 0,
	top: 0,
	radius: { 2 : 40 },
	angle: 45,
	count: 15,
	children: {
		radius: 8,
		fill: 'white',
		scale: { 1: 0, easing: 'sin.in'},
		pathScale: [.7, null],
		duration: [500, 700],
		degreeShift: [13, null]
	},
	duration: 500, scale: { 1: 0, easing: 'sin.in'},
});

// confetes
const burst = new mojs.Burst({
	count: 15,
	left: 0,
	top: 0,
	children: {
		shape: ['circle', 'polygon', 'rect'],
		fill: ['#6886C5', '#FFE0AC', '#FFACB7'],
		degreeShift: 'rand(-360, 360)',
		delay: 'stagger(0, 30)'
	},
	duration: 400,
	angle: {0: 90}, scale: { 1: 0, easing: 'sin.in'},
});

// círuclo que diminui de escala
const circle = new mojs.Shape({
	left: 0,
	top: 0,
	strokeWidth: 8,
	fill: 'none',
	radius: 80,
	scale: { 1 : 0 },
	opacity: { 1 : 0 },
	shape: 'circle',
	stroke: '#5386E4',
	strokeWidth: 8,
	fill: 'none',
	duration: 500,
	angle: {0: 90}
});	
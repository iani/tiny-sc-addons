//:

`\boat +> \boat;

//:
{
	Mix([\boat, \bell, \conga, \tamb, \sd, \ride].collect({ | n, i |
		n.playBuf(n)
	}))
} => \bufmix;

//:

{ Line.kr(1, 0.1, 60)} +>.rate \bufmix;

{ Line.kr(0.1, 2, 60)} +>.rate \bufmix;

{ LFDNoise0.kr(5).range(-0.1, 10) } +>.rate \bufmix;



{ LFDNoise0.kr(5).range(0, 0.1) } +>.amp \bufmix;
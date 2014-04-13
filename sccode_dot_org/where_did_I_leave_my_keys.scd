/*
«Where did I leave my keys?» by julian.rohrhuber on 01 Nov'13 22:05 in speculativemultichannelcrossing
Cross-tuning between multiple signal dimensions. The code is finished without listening.

http://sccode.org/1-4Ve#c318

Copied: Mon, Apr 14 2014, 00:35 EEST
*/
// where did I leave my keys?
(
var n = 30, m = 5;
Ndef.clear(3);
Ndef.ar(\x, n);
Ndef(\y, { Splay.ar(Ndef.ar(\x, m, LFNoise1.kr(1/m).range(0, n - m - 1))).clip2 * 0.5 }).play; 
Ndef(\x, { 
	{ 
		var a = Ndef.ar(\x, 1, LFNoise0.kr(Rand()) * Rand() + Rand() * n);
		a + 0.1 * SinOsc.ar(ExpRand(0.2, 1000)) 
	} ! n
}); 
)

// where did I put my keys?
(
var n = 30, m = 5;
Ndef.clear(3);
Ndef.ar(\x, n);
Ndef(\y, { Splay.ar(Ndef.ar(\x, m, LFNoise1.kr(1/m).range(0, n - m - 1))).clip2 * 0.5 }).play; 
Ndef(\x, { 
	{
		var a = Ndef.ar(\x, 1, LFNoise0.kr(Rand()) * Rand() + Rand() * n);
		SinOsc.ar(ExpRand(0.2, 1000), a) 
	} ! n
}); 
)
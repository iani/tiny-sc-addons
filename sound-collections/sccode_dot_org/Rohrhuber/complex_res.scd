/*
«playing around with ComplexRes UGen» by julian.rohrhuber on 16 Mar'14 16:33 in subtractive synthesis

http://sccode.org/1-4VX

Copied: Mon, Apr 14 2014, 13:42 EEST
*/
(
z = { exprand(100.0, 5000.0) } ! 20;
Ndef(\x, {
	var in = Decay.ar(Dust.ar(MouseX.kr(0.0001, 0.1, 1) * z, 10), 0.3) * PinkNoise.ar(0.4 ! (z.size div: 3), 1);
	z = z * LFNoise1.ar(0.2 ! z.size).range(1, 2) * LFNoise0.ar(20 ! z.size).exprange(1, 1.8);
	Splay.ar(ComplexRes.ar(in, z, 10 / z)) * 2
}).play
)


// this started out as a comparison between BPF and ComplexRes


(
z = [253.12, 2881.123, 2883.4, 1002.2, 882.01];
Ndef(\x, {
	var in = Decay.ar(Dust.ar(5, 100), 0.3) * PinkNoise.ar(0.4, 1);
	ComplexRes.ar(in, z, 10 / z).sum
}).play
)


(
z = [253.12, 2881.123, 2883.4, 1002.2, 882.01];
Ndef(\x, {
	var in = Decay.ar(Dust.ar(5, 100), 0.3) * PinkNoise.ar(0.4, 1);
	BPF.ar(in, z, (10 / z) * 2).sum
}).play
)

(
z = [253.12, 2881.123, 2883.4, 1002.2, 882.01];
Ndef(\x, {
	var in = Decay.ar(Dust.ar(5, 100), 0.3) * PinkNoise.ar(0.4, 1);
	z = z * LFNoise0.ar(13).range(1, 2);
	ComplexRes.ar(in, z, 10 / z).sum
}).play
)


(
z = [253.12, 2881.123, 2883.4, 1002.2, 882.01];
Ndef(\x, {
	var in = Decay.ar(Dust.ar(5, 100), 0.3) * PinkNoise.ar(0.4, 1);
	z = z * LFNoise0.ar(13).range(1, 2);
	BPF.ar(in, z, (10 / z) * 2).sum
}).play
)
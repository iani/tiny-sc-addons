/*
Sounds collected by Mahshad Juleh as part of coursework for a class in 
Sound Synthesis Techniques at IU AVARTS, WS 2013-14.

Based on various sources (Wiki Book on SuperCollider, free tutorials in 
pdf, Help files of SC, in-class exercises).

Tue, Jun  3 2014, 12:55 EEST

Note: No use of tiny-sc here.

*/

//:

SynthDef(\strings, { arg out, freq=440, amp=0.1, gate=1, pan, freqLag=0.2;
	var env, in, delay, f1, f2;
	f1 = freq.lag(freqLag);
	f2 = freq.lag(freqLag * 0.5);
	delay = 0.25 / f2;
	env = Env.asr(0.1, 1, 1);
	in = WhiteNoise.ar(180);
	in = CombL.ar(in, delay, delay, 1);
	in = Resonz.ar(in, SinOscFB.kr(0.1, 0, 0.5).range(200, 1500), 0.001).abs;
	in = in * EnvGen.kr(env, gate, doneAction:2);
	Out.ar(out, Pan2.ar(in, pan, amp));
}).add;

//:

(
Pdef(\vi3,
	Pbind(
        \instrument, \strings,
        \degree, Pseq([
			Pn(\rest, 2),
			Pshuf([0, 2, 3, 5], 10), 
			Pseq([\rest], { 9.rand })
        ], inf) 
        + Prand([0, 0, 0, [0, 3], [0, 1]], inf),
        \dur, Pseq([1, 2, 0.3, 0.5, 0.5]/2, inf) + (Prand([0.3, 0, 0.2], inf) * 0.1),
        \detune, Pseg(Pwhite(-10, 10, inf), 1.3)
	)
).play
);

//:
x = {
	var beam_envelope, phasor, beam, feedback, transporter, reverb, activateEnv, percEnv, activate, buffer; 
	buffer = LocalBuf(SampleRate.ir * 0.12);
// feedback has to be 0 at the beginning, to avoid input 
// nil before sound has been produced
	feedback = 0;
// Activate Sound (fig 56.3)
	activateEnv = EnvGen.ar(Env.new([0, 1, 1, 0], [0.01, 0.01, 5]));
	percEnv = EnvGen.ar(Env.new([1, 1, 0], [0.1, 0.12]));
	activate = (1 - activateEnv * MouseX.kr(0, 1020) + 775) + (WhiteNoise.ar(0.1) + SinOscFB.ar(30, 0, mul:40));
	activate = OnePole.ar(activateEnv, exp(-2pi * (30 * SampleDur.ir))) * LFSaw.ar(activate, 1, 0.5, 0.5 );
// adding a percussive shape at the beginning of the sound
	activate = (activate + (WhiteNoise.ar * percEnv)) * 3;
	activate = Clip.ar(activate, -1, 1);
	activate = BPF.ar(activate, [775,1550,2325]*120, 130.reciprocal).sum * 0.5;
// Beam Sound  
	beam = LFSaw.ar(467.1, 1, 0.5, 0.5 ) - 0.5;
	beam = beam - (Wrap.ar(beam) - 0.5);
// two stage FM process
	phasor = LFSaw.ar( beam * 6500 + 277, 1, 0.5, 0.5) - 0.5;
	beam = beam * (phasor - (Wrap.ar(phasor) - 0.5));
	beam = DelTapWr.ar(buffer, beam + (feedback * 0.7));
	beam_envelope = Line.ar(0,1,12);
	feedback = DelTapRd.ar(buffer, beam, 
		(1 - beam_envelope * 12 + 1 
// flanger effect w/ variable delays spaced 12ms apart [0,12,24]
			+ 12 * (0..2))
// DelTapRd requires delaytime in seconds (the equivalence in pd [vd~] 
// calculates with miliseconds, for it the division by 1000)
		/ 1000, 
		interp: 4).sum * 0.3;
	transporter = (beam_envelope * (-1) + 1).min(beam_envelope) * 4 * feedback;
	transporter = (transporter - OnePole.ar(transporter, exp(-2pi * (100 * SampleDur.ir))));
	transporter = BPF.ar(transporter, 
// whole tone scale
		Array.geom(12, 466.164, 1.12247), 
		[1200, 1100, 930, 910, 880, 840, 800, 760, 720, 680, 640, 620].reciprocal).sum * 12;
	reverb = GVerb.ar(transporter + (activate * 0.1), 100, 8, 0.1, 0.9);
	reverb = reverb + (activate * 0.5)!2;
}.play;

//:

~sound = { | rate = 1, attack = 0, release = 0.02 |
	WhiteNoise.ar * EnvGen.ar(Env.perc(attack, release, curve: 0), Dust.kr(rate))!2
}.play;

//:
~sound.set(\rate, 2);
~sound.set(\attack, 0.1);
~sound.set(\release, 0.02);
//:
~freq1 = 5000;
~freq = 1500;
~speed = 260;
fork{
	inf.do{
		(0.3.rand).wait;
		f = {|speed = 1|
			var env = Env([0.0, 0.5, 0.0, 6.0, 0.9, 0.0], [0.05, 0.1, 0.01, 1.0, 1.5]/~speed, -4);
			var envgen = EnvGen.ar(env, doneAction: 2);
			SinOsc.ar(
				envgen * 100 + [[~freq, ~freq1]]
			) * envgen * 0.01!2
		}.play;
	}
}

//:


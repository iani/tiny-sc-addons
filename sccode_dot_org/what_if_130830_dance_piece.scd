/*
«What If 130830» by nova on 30 Aug'13 14:19 in rhythmic
A piece i'm working on for a dance performance.

http://sccode.org/1-4Up

Copied: Sun, Apr 13 2014, 23:57 EEST
*/

( // 'random' sequences of rhythms, reverb,...
z = {
    var trig, seq;
    trig = Impulse.kr(6);
    seq = Drand([
        Dseq([4,0,0,1,Drand([1,4]),1,0,1]),
        Dseq([1,0,2,0,Drand([0,1,4]),0,1,1]),
        Dseq([4,0,0,2,Drand([1,2,4]),0,1,1]),
        Dseq([4,0,1,2,Drand([0,1,4]),1,2,0]),
        Dseq([1,1,4,1,Drand([1,4]),2,3,3]),
        Dseq([4,1,0,1,Drand([0,4]),1,0,1])
    ], inf);

	g = HenonN.ar(
		[120,120],
		LFNoise2.kr(1, 0.2, 1.2),
		LFNoise2.kr(1, 0.15, 0.15)
	)
	* 0.2
	+ SinOsc.ar([61,40], mul:0.7)

	// add lovely chaos noise (taken from documentation example)
	+ {
		LatoocarfianC.ar(
			SampleRate.ir/4,
			LFNoise2.kr(2,1.5,1.5),
			LFNoise2.kr(2,1.5,1.5),
			LFNoise2.kr(2,0.5,1.5),
			LFNoise2.kr(2,0.5,1.5)
		) * 0.1 // volume
	}
	+
	{ FBSineN.ar(
    LFNoise2.kr(1, 1e4, 1e4),
    LFNoise2.kr(1, 32, 33),
    LFNoise2.kr(1, 0.5),
    LFNoise2.kr(1, 0.05, 1.05),
    LFNoise2.kr(1, 0.3, 0.3)
	) * 0.2 * SinOsc.kr(0.01) }
	;

    trig = Demand.kr(trig, 0, seq * 0.2) * trig;
	{ MoogFF.ar(
		g,
		SinOsc.kr(0.1,0,1,1) * 1000 + 3000)}.dup
	* Decay.kr(trig, Demand.kr(trig,0,Drand([1,2,4,6], inf)*0.1)) // envelope
	;
};

{
	GVerb.ar(
		in: EnvGen.kr(Env.linen(20, 240, 40, 0.6, \sine)) * z * 0.9,
		roomsize: 30,
		revtime: 4, // SinOsc.kr(0.1,0,4,4.1),
		damping:0.4, // SinOsc.kr(0.12,0,0.4,0.5),
		inputbw:1,
		spread:15,
		drylevel:SinOsc.kr(0.02,0,0.5,0.5),
		earlyreflevel:SinOsc.kr(0.01,0,0.5,0.5),
		taillevel:SinOsc.kr(0.02,pi,0.05,0.05)
	);
}.play

SynthTree.faders;
//:
Server.killAll;

//:


{b=SinOsc;Pan2.ar(AllpassC.ar(a=b.ar(PulseCount.ar(Impulse.ar(9),PinkNoise.ar)*437),0.1,0.01),b.ar(79*b.ar(1/8).abs/a))} => \tickly;

//:


{b=SinOsc;Pan2.ar(AllpassC.ar(a=b.ar(PulseCount.ar(Impulse.ar(9),PinkNoise.ar)*437),0.1,0.01),b.ar(79*b.ar(1/1).abs/a))} => \tickly;

//:


{b=SinOsc;Pan2.ar(AllpassC.ar(a=b.ar(PulseCount.ar(Impulse.ar(4),PinkNoise.ar)*437),0.1,0.01),b.ar(79*b.ar(1/1).abs/a))} => \tickly;

//:


{b=SinOsc;Pan2.ar(AllpassC.ar(a=b.ar(PulseCount.ar(Impulse.ar(3),PinkNoise.ar)*437),0.1,0.01),b.ar(79*b.ar(1/1).abs/a))} => \tickly;

//:

{ LPF.ar(Inp.ar, 300.dup) * 20 } => \lpf;

//:

\tickly.st => \lpf;

//:

\tickly.st => \root;

//:

{ Resonz.ar(Inp.ar, [500, 1000], 0.1) * 20 } => \lpf;

//:

{ Resonz.ar(Inp.ar, LFNoise0.kr(2, 1000, 1100), 0.1) * 150 } => \lpf;

//:
{b=SinOsc;
	AllpassC.ar(a=b.ar(PulseCount.ar(
		Impulse.ar(1),
		PinkNoise.ar)*437),0.1,0.01)
} => \tickly;
//:
{b=SinOsc;
	AllpassC.ar(a=b.ar(PulseCount.ar(
		Impulse.ar([8, 4]),
		PinkNoise.ar)*437),0.1,0.01)
} => \tickly;
//:
{b=SinOsc;
	AllpassC.ar(a=b.ar(PulseCount.ar(
		Impulse.ar([8, 4]),
		PinkNoise.ar)*
		[500, 1000] ),
		0.1,
		LFNoise1.kr(0.5).range(0.01, 0.5))
} => \tickly;
//:
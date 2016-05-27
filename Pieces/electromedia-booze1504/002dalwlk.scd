SynthTree.faders;
Server.killAll;

//:

{ 10 * GVerb.ar(TGrains.ar(2, Pulse.ar(3),
	Buffer.read(s,Platform.resourceDir+/+"sounds/a11wlk01.wav"),Sweep.ar(x=Pulse.ar(4s)), x, Sweep.ar(x)))
} ++> \dalwlk;

//:
\dalwlk.st.fadeTime_(0.05)
//:

{ 100 * GVerb.ar(TGrains.ar(2, Pulse.ar(3),
	Buffer.read(s,Platform.resourceDir+/+"sounds/a11wlk01.wav"),Sweep.ar(x=Pulse.ar(4s)), x, Sweep.ar(x)))
} ++> \dalwlk;

//:

{ 100 * GVerb.ar(TGrains.ar(2, Pulse.ar(30),
	Buffer.read(s,Platform.resourceDir+/+"sounds/a11wlk01.wav"),Sweep.ar(x=Pulse.ar(4s)), x, Sweep.ar(x)))
} ++> \dalwlk;

//:

{ 140 * GVerb.ar(TGrains.ar(2, Pulse.ar(3),
	Buffer.read(s,Platform.resourceDir+/+"sounds/a11wlk01.wav"),Sweep.ar(x=Pulse.ar(16s)), x, Sweep.ar(x)))
} ++> \dalwlk;

//:

{ 50 * GVerb.ar(TGrains.ar(4, Pulse.ar(3),
	Buffer.read(s,Platform.resourceDir+/+"sounds/a11wlk01.wav"),Sweep.ar(x=Pulse.ar(1)), x, Sweep.ar(x)))
} ++> \dalwlk;

//:

{
	25 * GVerb.ar(TGrains.ar(4, Pulse.ar(3),
	Buffer.read(s,Platform.resourceDir+/+"sounds/a11wlk01.wav"),Sweep.ar(x=Pulse.ar(LFNoise0.kr(0.3, 5, 5.2))), x, Sweep.ar(x)))
} ++> \dalwlk;

//:
32s
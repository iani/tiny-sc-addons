SynthTree.faders;

// Set global fade time to 3 seconds
10 =!> \fadeTime;
// Fade in a synth.
{ WhiteNoise.ar(0.1) } => \sound2;
// Cross-fade another synth in its place
{ SinOsc.ar(0.1 * LFNoise0.kr(5).range(400, 4000)) } => \sound2;
// And a third synth
{ LPF.ar(0.5 * GrayNoise.ar, LFNoise0.kr(5).range(600, 8000)) } => \sound2;
// Set global fade time to 0.01 seconds
0.01 =!> \fadeTime;
// Notice difference in cross-fading duration
{ LFDNoise3.ar(LFNoise0.kr(15).range(400, 4000), 0.1) } => \sound2;
// One more time
{ 0.1 * SinOsc.ar(LFNoise0.kr(15).range(400, 4000)) } => \sound2;
// Fadeout also uses the global default
\sound2.fadeOut;

1 => ~out;
0 => ~out;

a = { | out = 0 | Out.ar(out, WhiteNoise.ar(0.1)) }.play;

a.set(\out, 1);
a.set(\out, 0);

a.free;
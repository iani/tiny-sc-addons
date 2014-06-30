
{ Pan2.ar(PinkNoise.ar(0.1), \pos.kr(0)) } => \stereocheck;

-1 +>.pos \stereocheck;

1 +>.pos \stereocheck;

0 +>.pos \stereocheck;

//: more soundcheck

//: Sound check: Stereo
{ WhiteNoise.ar(LFPulse.kr(1, [0, 0.5], 0.25, 0.1)) } => \stereocheck;

{ SinOsc.ar(400, 0, LFPulse.kr(1, [0, 0.5], 0.25, 0.1)) } => \stereocheck;


//: Sound Check: Quad
{ PanAz.ar(4, WhiteNoise.ar(0.1), \pos.kr(0)) } => \quadcheck;

{ SinOsc.kr(0.1).range(-2, 2) } +>.pos \quadcheck;
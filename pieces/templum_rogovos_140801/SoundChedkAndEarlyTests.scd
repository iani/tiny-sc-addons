/*
Performance for Performigrations project kick-off meeting at P. Pepoli 20141516.

Fri, May 16 2014, 04:52 CEST
*/

//: Sound check: Stereo
{ WhiteNoise.ar(LFPulse.kr(0.3, [0, 0.5], 0.5, 0.05 )) }.play;
//: find path to load
{ | p | p.postln; }.doPath;
//: load buffer from path
~tipsy = Buffer.read(nil, "/Users/iani/Music/sounds/1306TipsyCity/Y13M06D17/tipsy.WAV");
//: See buffer details (number, frames, numChans, rate, path)
~tipsy;
//: test buffer
~tipsy.play;
//: Buf play synthdef
SynthDef(\buf1, { 
	\buf.playBuf.ladsrOut;
}).add;
//: Test synthdef
Synth(\buf1, [buf: ~tipsy, out: 1]);
//: Test synthdef with different starting point in sample
Synth(\buf1, [buf: ~tipsy, startPos: 1000]);
//: Test with pattern
Edef(\test1, (instrument: \buf1, buf: \tipsy.b, startPos: Pwhite(0, 10, inf))) => \p1;
//: amp adjustment
\test1 =< (amp: 1, fadeIn: 0.2, rate: [1, 2].pseq, dur: [1, 2].pseq);

//: ================
/* Note: Stopping pattern with cmd-period kills the buffer and sets ~tipsy to nil!
(Why this "feature?")
To avoid this situation, redo below using BufferList:
*/
// ================================================================
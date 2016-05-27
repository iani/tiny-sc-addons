// Processing sounds in supercollider
// 27 May 2016 16:01


/* Instructions
Download a sample from Freesound to play with: 

This sample: https://www.freesound.org/people/Corsica_S/sounds/106013/
*/

//: Boot the server

Server.default.boot;

//: Load the file in a buffer - by selecting it from a file dialog:

File.openDialog ("select an audio file", { | path |
	~buffer = Buffer.read (Server.default, path);
	~buffer.postln;
});


//: View the buffer
~buffer;
//: Test the buffer
~buffer.play;

//: Basic playback, looping
(
var bufnum;
bufnum = ~buffer.bufnum;
a = {
	 PlayBuf.ar (1,
		 bufnum,
		 BufRateScale.kr (bufnum),
		 1, // trigger
		 0, // start position
		 1, // loop
	 )
 }.play
)
//: Basic playback, looping, vary rate by mouse
(
var bufnum;
bufnum = ~buffer.bufnum;
a = {
	 PlayBuf.ar (1,
		 bufnum,
		 BufRateScale.kr (bufnum) * MouseX.kr (0.2, 10),
		 1, // trigger
		 0, // start position
		 1, // loop
	 )
 }.play
)
//: Basic playback, looping, scrubbing through the buffer with a UGen
(
var bufnum;
bufnum = ~buffer.bufnum;
a = {
	 BufRd.ar (1,
		 bufnum,
		 LFDNoise1.ar (2) * BufFrames.ir(bufnum),
		 1, // loop
	 )
 }.play
)
//: Basic playback, looping, scrubbing through the buffer with a UGen
// add a resonant filter
(
var bufnum;
bufnum = ~buffer.bufnum;
a = {
	var src;
	src = BufRd.ar (1,
		 bufnum,
		 LFDNoise1.ar (2) * BufFrames.ir(bufnum),
		 1, // loop
	);
	Resonz.ar (src, MouseX.kr (200, 2000), 0.02) * 3
 }.play
)
//:

// A complicated example to analyse:
// From: http://sccode.org/1-51A :
// «Looping sampler with crossfading» by coreyker
//: Basic playback, looping, scrubbing through the buffer with a UGen

SynthDef(\simpler, {
	arg buf=0
	,freq=220
	,sampleStart=0
	,loopStart=0
	,loopLen=1 // between 0 (min) and 1 (max)
	,fadeTime=0.1
	,gate=1
	,attack=0.01
	,sustain=1
	,release=1
	,f0=220;

	var rate = freq / f0;
	var sr = rate*BufSampleRate.kr(buf);
	var fadeFrames = fadeTime*sr;
	var loopEnd = loopLen*(BufFrames.kr(buf) - loopStart) + loopStart;
	var loopFrames = loopEnd - loopStart + 1;
	var loopTime = (loopFrames - fadeFrames)/sr;
	var startUpTime = (loopStart - sampleStart)/sr;

	var trigLoop = TDuty.ar(Dseq([startUpTime + loopTime, Dseq([loopTime], inf)]), gapFirst:1);

	var phaseA = Phasor.ar(trigLoop, rate, sampleStart, inf, loopStart);
	var phaseB = Phasor.ar(trigLoop, rate, loopEnd - fadeFrames, inf, loopEnd - fadeFrames);

	var srcA = BufRd.ar(buf.numChannels, buf, phaseA);
	var srcB = BufRd.ar(buf.numChannels, buf, phaseB);

	var startLoop = SetResetFF.ar(trigLoop);
	var loopPan = Phasor.ar(trigLoop, 2/fadeFrames * rate, -1, inf, -1).clip(-1,1);

	var out = Select.ar(startLoop, [srcA, LinXFade2.ar(srcB, srcA, pan:loopPan)]);
	var env = EnvGen.ar(Env.asr(attack, sustain, release, 1), gate, doneAction:2);

	Out.ar(0, Splay.ar(out) * env);
}).add;

// Try it out:
~buf = Buffer.read(s, Platform.resourceDir +/+ 'sounds/a11wlk01.wav');

Pdef(\p, Pbind(*[
	instrument: \simpler
	,buf: ~buf
	,octave: Prand([3,4,5],inf)
	,degree: Pn(Plazy({Pseq([-4,0,5,7,9,12].scramble.clump(2),2)}))
	,dur: 0.5
	,strum: Prand([0, 0.125, 0.25], inf)
	,strumEndsTogether: false
	,loopStart: Pwhite(90000, 150000)
	,sampleStart: Pwhite(50000, 85000)
	,loopLen: 0.4
	,fadeTime: 0.15
	,attack: 0.25
	,release: 4
])).play;

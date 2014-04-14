/*
«Part-Aleatoric Sample Machine» by nathan on 01 Feb'14 17:26 in sampleraleatoric
This piece is a demonstration of the Part-Aleatoric Sample Machine, a project I am working on to explore possible interfaces between human and non-human listening. In the PASM, a computer uses chance principles to select samples for playback and apply effects; a human performer decides how long each sample is played for, and also operates a simple sine wave oscillator.
The samples used in the piece were recorded at Linton Falls, North Yorkshire, and can be downloaded from http://afternoondust.co.uk/blog/140201_1630-water-piece.


http://sccode.org/1-4VF

Copied: Mon, Apr 14 2014, 13:08 EEST
*/

/* 140201_1630 (water piece)

by Nathan Thomas
nathan@afternoondust.co.uk
http://www.afternoondust.co.uk

This piece is a demonstration of the Partly-Aleatoric Sample Machine v1.

Don't forget to update the paths to the audio samples on lines 23-26.

Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License:
http://creativecommons.org/licenses/by-nc-sa/3.0/

*/

/*
Adapted by IZ to use mono audio files.
*/

(
Server.default = s = Server.internal;
s.boot;
)

// Load samples
/*
a = Buffer.read(s, "path/to/audio/samples/linton_falls_02.wav");
b = Buffer.read(s, "path/to/audio/samples/linton_falls_gutter_01.wav");
c = Buffer.read(s, "path/to/audio/samples/linton_falls_gutter_02.wav");
d = Buffer.read(s, "path/to/audio/samples/linton_falls_tap_01.wav");
*/

{ | p | a = Buffer.read(Server.default, p) }.doPath;
{ | p | b = Buffer.read(Server.default, p) }.doPath;
{ | p | c = Buffer.read(Server.default, p) }.doPath;
{ | p | d = Buffer.read(Server.default, p) }.doPath;


/*
([a, b, c, d] collect: _.path).asCompileString;

[ "/Users/iani/Music/sounds/1307SyrosSounds/02SoundsSyrosDanae/bells and kitchen 1.wav",
 "/Users/iani/Music/sounds/1307SyrosSounds/01SoundsSyrosAndrea/boat attachment .wav", 
"/Users/iani/Music/sounds/1307SyrosSounds/01SoundsSyrosAndrea/dog barking.wav", 
"/Users/iani/Music/sounds/1307SyrosSounds/01SoundsSyrosAndrea/machine port.wav" ]

*/

// Create SynthDefs
(
	// Sample playback SynthDef
	SynthDef("playbuf", { arg bufnum, outBus=0, gate=1;
		var sig, env;
		env = EnvGen.kr(Env.asr(0,1,0),gate, doneAction:2);
		sig = PlayBuf.ar(1,bufnum,BufRateScale.kr(bufnum)) * env;
		Out.ar(outBus, sig)
	}).add;

	// Effect SynthDefs

	SynthDef("hipass", { arg inBus, freq = 3200;
		var sig, filter;
		sig = In.ar(inBus,1);
		filter = BHiPass.ar(sig, freq, 1,1);
		Out.ar(0,filter)
	}).add;

	SynthDef("lopass", { arg inBus, freq = 200;
		var sig, filter, norm;
		sig = In.ar(inBus,1);
		filter = BLowPass.ar(sig, freq, 1,1);
		norm = Normalizer.ar(filter,0.4);
		Out.ar(0,norm)
	}).add;

	SynthDef("reverb", { arg inBus, roomSize=0.6, damp=0.4;
		var sig, reverb;
		sig = In.ar(inBus,1);
		reverb = FreeVerb.ar(sig, mix:0.5, room:roomSize,damp:damp, mul:1);
		Out.ar(0,reverb)
	}).add;

	// Synth line SynthDef
	SynthDef("synth", { arg outBus=0, gate=1, freq=770;
		var synth, env;
		env = EnvGen.kr(Env.adsr(10,6,1,6),gate,doneAction:2);
		synth = SinOsc.ar([freq,1700],Rand(0,0.3),0.1) * env;
		Out.ar(outBus,synth!2)
	}).add;

	// Create effect busses
	k = Bus.audio(s,2);
	l = Bus.audio(s,2);
	m = Bus.audio(s,2);

)

// Begin sample playback
(
	z = Synth(\hipass,[\inBus,m]);
	u = Synth.before(z, \lopass,[\inBus,l]);
	t = Synth.before(u, \reverb,[\inBus,k]);
	x = Synth.before(t, \playbuf, [\bufnum, [a,b,c,d].choose, \outBus, [0,k,l,m].choose]);
)

// Change samples (freeing synths and creating new ones prevents noise when switching sample buffers)
(
	x.set(\gate,0); z.free; u.free; t.free;
    z = Synth(\hipass,[\inBus,m]);
	u = Synth.before(z, \lopass,[\inBus,l]);
	t = Synth.before(u, \reverb,[\inBus,k]);
	y = Synth.before(t, \playbuf, [\bufnum, [a,b,c,d].choose, \outBus, [0,k,l,m].choose]);
)

// Change samples 2
(
	y.set(\gate,0); z.free; u.free; t.free;
	z = Synth(\hipass,[\inBus,m]);
	u = Synth.before(z, \lopass,[\inBus,l]);
	t = Synth.before(u, \reverb,[\inBus,k]);
	x = Synth.before(t, \playbuf, [\bufnum, [a,b,c,d].choose, \outBus, [0,k,l,m].choose]);
)

// Synth part with optional effect routing
w = Synth("synth",[\freq, [770,900,1400].choose]);
w.set(\gate,0);
w.set(\outBus,l);
w.set(\outBus,k);
w.set(\outBus,m);

// Free sample playback and effect synths
x.free; z.free; u.free; t.free;
// Free effect busses
m.free; l.free; k.free;


currentEnvironment.clear;
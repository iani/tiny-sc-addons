Server.killAll;

BufferList.loadBuffer("/Users/iani/Music/sounds/1306TipsyCity/Y13M06D17/tipsy.WAV");

//:
`\tipsy +> \sound;
//:
1 +>.amp 

//:
\tipsy.b;
//:
Server.default.scope;
//:
{
	var source;
	source = \buf.playBuf(\tipsy.b)
} => \listenAmp;

//:

3 +>.amp \listenAmp;

//:
{
	var source, amplitude;
	source = \buf.playBuf(\tipsy.b);
	amplitude = Amplitude.kr(source);
	Out.kr(0, amplitude);
	source;
} => \listenAmp;

//:
{
	var source, amplitude, wet;
	source = \buf.playBuf(\tipsy.b);
	amplitude = Amplitude.kr(source);
	Out.kr(0, amplitude);
	wet = \wet.kr(0);
	[1 - wet * source, wet * WhiteNoise.ar(amplitude)];
} => \listenAmp;
//:
0.5 +>.wet \listenAmp;
1 +>.wet \listenAmp;

//:
{
	var source, onsets;
	source = SinOsc.ar(400, 0, Decay.kr(Impulse.kr(1))) * 0.1;
	onsets = Coyote.kr(source, fastMul: \fastMul.kr(0.6), thresh: \thresh.kr(0.05));
	Out.kr(1, onsets);
	[source, GrayNoise.ar(Decay2.kr(onsets)) * 0.1];
} => \consetsTest;

//:
0.

0.1 +>.thresh \onsetsTest;
0.01 +>.thresh \onsetsTest;
0.2 +>.thresh \onsetsTest;

//:
{
	var source, onsets;
	source = \buf.playBuf(\tipsy.b);
	onsets = Coyote.kr(source, fastMul: \fastMul.kr(0.6), thresh: \thresh.kr(0.05));
	Out.kr(2, onsets);
	[source, WhiteNoise.ar(Decay2.kr(onsets)) * \tsignalAmp.kr(0.1)];
} => \consets;
//:

3 +>.fastMul \consets;
0.04 +>.thresh \consets;

//: Pitch
/*
kr (in: 0, initFreq: 440, minFreq: 60, maxFreq: 4000, execFreq: 100, 
maxBinsPerOctave: 16, median: 1, ampThreshold: 0.01, peakThreshold: 0.5, 
downSample: 1, clar: 0)
*/

//:
{
	var source, pitch, hasPitch;
	source = \buf.playBuf(\tipsy.b);
	#pitch, hasPitch = Pitch.kr(source, ampThreshold: \ampThreshold.kr(0.02), 
		median: \median.kr(7));
	Out.kr(3, pitch);
	[source, SinOsc.ar(pitch, 0, \pitchAmp.kr(0.1))];
} => \consets;
//:


//:
{
	var source, pitch, hasPitch;
	source = \buf.playBuf(\tipsy.b);
	#pitch, hasPitch = Pitch.kr(source, ampThreshold: \ampThreshold.kr(0.02), 
		median: \median.kr(7));
	Out.kr(3, pitch);
	[source, SinOsc.ar(pitch, 0, \pitchAmp.kr(0.1)) * hasPitch];
} => \consets;

//:
{
	var in, chain, freq, rq, centroid;
	b = LocalBuf(2048, 1);
	freq = MouseY.kr(100, 1000, 1);
	in = Blip.ar(freq, MouseX.kr(1, 100, 1));
	chain = FFT(b, in);
	centroid = SpecCentroid.kr(chain);
	centroid.poll(10);
	in.dup * 0.1;
} => \centroid1;

//:
{
	var in, chain, freq, rq, centroid;
	b = LocalBuf(2048, 1);
	freq = MouseY.kr(100, 1000, 1);
	in = Blip.ar(freq, MouseX.kr(1, 100, 1));
	chain = FFT(b, in);
	centroid = SpecCentroid.kr(chain);
	[in, SinOsc.ar(centroid * \centroidScale.kr(1))] * 0.1
} => \centroid2;

//:

0.25 +>.centroidScale \centroid2;

//:
{
	var source, chain, wet;
	source = \buf.playBuf(\tipsy.b);
	chain = FFT(LocalBuf(2048), source);
	chain = PV_MagAbove(chain, \thresh.kr(0));
	wet = \wet.kr(0);
	[1 - wet * source, wet * IFFT(chain) * \fxamp.kr(1)]
} => \magAbove;
//:
1 +>.wet \magAbove;
1 +>.fxamp \magAbove;
0.1 +>.thresh \magAbove;
//:
{ Line.kr(0, 2, 10) } +>.thresh \magAbove;
//:
{ Line.kr(2, 0, 10) } +>.thresh \magAbove;


//:
{
	var source, chain, wet;
	source = \buf.playBuf(\tipsy.b);
	chain = FFT(LocalBuf(2048), source);
	chain = PV_MagBelow(chain, \thresh.kr(1));
	wet = \wet.kr(0);
	[1 - wet * source, wet * IFFT(chain) * \fxamp.kr(1)]
} => \magBelow;
//:
1 +>.wet \magBelow;
1 +>.fxamp \magBelow;
0.1 +>.thresh \magBelow;
//:
//:
{ XLine.kr(3, 0.001, 30) } +>.thresh \magBelow;
//:
{ XLine.kr(0.001, 3, 30) } +>.thresh \magBelow;

3 +>.thresh \magBelow;


/* 
Time-Domain and Frequency-Domain representations of sound.

Waveform and Spectral displays.

Mon, May 19 2014, 07:29 CEST
*/

//: Start a sound
{ SinOsc.ar(400, 0, 0.1) } => \testsound;

//: Time Domain: Waveform
Server.default.scope(2);

//: Frequency Domain: Spectrum
FreqScope();

//: Change the sound: Mouse control of frequency
{ SinOsc.ar(MouseX.kr(300, 3000), 0, 0.1) } => \testsound;
  
// Frequency displays of various waveforms

//: Saw
{ LFSaw.ar(MouseX.kr(300, 3000), 0, 0.1) } => \testsound;

//: Pulse
{ LFPulse.ar(MouseX.kr(300, 3000), 0, 0.5, 0.1) } => \testsound;

//: Formant
{ 
	Formant.ar(
		\fundfreq.kr(440),  // fundamental frequency
		\formfreq.kr(1760), // formant frequency
		\bwfreq.kr(880),    // frequency bandwidth
		0.1)
} => \testsound;

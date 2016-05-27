//: Korg nano fader setup is:
/*
Faders: Channels 0-8, CC num: 1
Knobs: Channels 0-8, CC num: 11
Button row 1 (low): Channels 0-8, CC num: 31, val: 0 = off, 127 = on;
Button row 2 (hi): Channels 0-8, CC num: 21, val: 0 = off, 127 = on;
*/

//: Assignment draft:
/*
Button row 2 (upper): -> set activate control to synthree corresponding channel number.

The correspondences are: 

0 -> \ypochthonio
1 -> \tiboom
2 -> \dalwlk
3 -> \dryklank
4 -> \tickly
5 -> \veryfast
6 -> \vb1
7 -> \vb2
8 -> \pingoh

*/
//:
Help.gui;
//:
Server.killAll;
//:
MIDIIn.connectAll;
//:
MIDIFunc.trace(false);
//:
MIDIFunc.trace(true);
//: synthree switch buttons = button row 2 (hi)
~synthrees = [
	\ypochthonio.st,
	\tiboom.st,
	\dalwlk.st,
	\dryklank.st,
	\tickly.st,
	\veryfast.st,
	\vb1.st,
	\vb2.st,
	\pingo.st
];


//: Upper button row selects the sythtree that will respond to MIDI
MIDIdef.cc(\faders, { | ... args |
	~activest = ~synthrees[args[2]];
	postf("Activating midi for: %\n", ~synthrees[args[2]]);
}, 21);

//: lower button switches a synthree on - off
MIDIdef.cc(\faders, { | id, val, num, chan |
	var st;
	st = ~synthrees[chan];
	[id, chan, num, val].postln;
	// { 
		
		// }
	//	postf("Activagting midi for: %\n", ~synthrees[args[2]]);
}, 31);


//: fader controls
MIDIdef.cc(\faders, { | ... args |
	// args.postln;
	var fader;
	fader = format("fader%", args[2]).asSymbol;
	[~activest.name, fader].postln;
	["setting synthree parameter:", ~activest.name, args[0]].postln;
	~activest.set(fader, args[0] / 127)
}, 1);

// ================================================================
//: testing
{ WhiteNoise.ar(\fader0.kr(0.1).postln) } => \ypochthonio;
{ WhiteNoise.ar(0.1) } => \ypochthonio;

\ypochthonio.set(\amplitude, 0.01);


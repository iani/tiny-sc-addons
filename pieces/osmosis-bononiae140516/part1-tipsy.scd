/*
Performance for Performigrations project kick-off meeting at P. Pepoli 20141516.
Server.killAll;
Fri, May 16 2014, 04:52 CEST
*/
//: Sound check: Stereo
{ WhiteNoise.ar(LFPulse.kr(0.3, [0, 0.5], 0.5, 0.05 )) }.play;

// Redo using BufferList
//:  This one is added to startup.scd for the preparation of the piece
// BufferList.loadBuffer("/Users/iani/Music/sounds/1306TipsyCity/Y13M06D17/tipsy.WAV");
//:
//: Creating 4x magabove + 4x magbelow stereo players
var st;
(1..4) do: 
{ | i |
	st = format("below%", i).asSymbol;
    `\bufmagbelows =|> st;
	st.buf(\tipsy);
	st.buf(\tipsy).set(\amp, 0);
	st.knobs;
};
///// //: Creating 4x magabove + 4x magbelow stereo players
(1..4) do: 
{ | i |
	st = format("above%", i).asSymbol;
    `\bufmagaboves =|> st;
	st.buf(\tipsy).set(\amp, 0);
	st.knobs;
};

//: ====================== START ====================
var st;
(1..4) do: 
{ | i |
	format("below%", i).asSymbol.start;
	format("above%", i).asSymbol.start;
};
\above4.set(\amp, 0.5);
\above4.knobs;

//: ================
//: Creating 4x magabove + 4x magbelow stereo players
var st;
(1..4) do: 
{ | i |
	format("below%", i).asSymbol.fadeOut(10);
	format("above%", i).asSymbol.fadeOut(10);
};

//: ================================================================
// PATTERN PART
// ================================================================

Edef(\pabove1, (instrument: \bufmagaboves, buf: \tipsy.b, 
	startPos: (0..6000).pseq, legato: 1.2, dur: 0.5,
	amp: 9)) => \pabove1;
//:
\pabove1 =< (pos: (-0.9, -0.8 .. 0.9).pseq);
//:
\pabove1 =< (rate: [1, 1.2, 0.8, 2].prand);
//:
\pabove1 =< (dur: [0.25, 0.5].pseq);
//:
\pabove1 =< (pos: [-0.25, 0.5].pseq);
//: 
\pabove1 =< (dur: [0.3 pn: 10, 0.1 pn: 8, 1, 0.05 pn: 16].prand);
//:
\pabove1 =< (rate: [0.5, 1, 1.2, 0.8, 0.9, 1.4, 1.5, 1.7, 2].prand);
//:
\pabove1 =< (dur: 5);
//:
\pabove1 =< (dur: 0.1);
//:
\pabove1 =< (legato: 0.1);
//:
\pabove1 =< (legato: 0.5);
//:
\pabove1 =< (legato: [0.5, 0.1, 0.1, 0.01, 2].prand);
//:
\pabove1 =< (dur: 0.1);
//:
\pabove1 =< (amp: 1);
//:
\pabove1 =< (amp: [1, 0, 0, 0, 0, 0].prand);
//:
\pabove1 =< (amp: [1, 0, 0.1, 0.2, 0.4, 0.2, 0, 0].prand);
//:
\pabove1 =< (amp: [1, 0, 0.1, 0.2, 0.4, 0.2, 0, 0].pseq);
//:
\pabove1 =< (magabove: 1);
//:
\pabove1 =< (magabove: 0.5);
//:
\pabove1 =< (magabove: 0.1);
//:
\pabove1 =< (magabove: [0.1, 0.5, 1].prand);
//:
\pabove1 =< (magabove: [0.1, 0.5, 1].pseq);

\pabove1 =< (magabove: [0.01, 0.05, 0.1, 0.2, 0.5, 1].prand)

//: ================================================================

Edef(\pbelow1, (instrument: \bufmagbelows, buf: \tipsy.b, 
	startPos: (0..3550).prand, legato: 1.2, dur: 0.5,
	amp: 1)) => \pbelow1;
//:
\pbelow1 =< (rate: (0.05, 0.1 .. 3).pseq);
//:
\pbelow1 =< (pos: (-0.9, -0.8 .. 0.9).pseq);
//:
\pbelow1 =< (rate: [1, 1.2, 0.8, 2].prand);
//:
\pbelow1 =< (dur: [0.25, 0.5].pseq);
//:
\pbelow1 =< (pos: [-0.25, 0.5].pseq);
//: 
\pbelow1 =< (dur: [0.3 pn: 10, 0.1 pn: 8, 1, 0.05 pn: 16].prand);
//:
\pbelow1 =< (rate: [0.5, 1, 1.2, 0.8, 0.9, 1.4, 1.5, 1.7, 2].prand);
//:
\pbelow1 =< (dur: 5);
//:
\pbelow1 =< (dur: 0.15);

//:
\pbelow1 =< (amp: 1);
//:
\pbelow1 =< (amp: [1, 0, 0, 0, 0, 0].prand);
//:
\pbelow1 =< (amp: [1, 0, 0.1, 0.2, 0.4, 0.2, 0, 0].prand);
//:
\pbelow1 =< (amp: [1, 0, 0.1, 0.2, 0.4, 0.2, 0, 0].pseq);
//:
\pbelow1 =< (magbelow: 1);
//:
\pbelow1 =< (magbelow: 0.5);
//:
\pbelow1 =< (magbelow: 0.1);
//:
\pbelow1 =< (magbelow: [0.1, 0.5, 1].prand);
//:
\pbelow1 =< (magbelow: [0.1, 0.5, 1].pseq);

//:
\pbelow1 =< (rate: [0.5, 1, 0.8, 0.9, 0.4, 0.5, 0.7, 0.2].prand);
//:
\pbelow1 =< (amp: [1, 2, 3].prand);

//: FADEOUT
//:
\pabove1.fadeOut(9);
\pbelow1.fadeOut(9);



//: ================================================================
// Possible coda: "Bourree"


//: Start a named pattern reference in a SynthTree
Edef(\simple, (degree: [1, 2, 3].pseq, amp: 0.3)) => \wander;

//: Change the named pattern Edef.  (Edef(\simple) =< ... also possible)
\simple =< (degree: Pbrown(-5, 5, 3, inf));
//: Modify some more
\simple =< (degree: Pbrown(-5, 5, 3, inf), dur: [(1, 0.95 .. 0.125).pseq1, 0.11 pn: 100].pseq);
//:
\simple =< (dur: 0.125, amp: 0.3);

//:
\simple =< (dur: [0.125, 0.125, 0.125, 0.25, 0.25, 1, 0.5, 0.5].prand, amp: 0.3);

//: And more
\simple =< (instrument: [\bassfoundation, \sine].prand);

//: Many keys in event OK
\simple =< (legato: { 0.4 exprand: 1.5 }.pfunc, amp: [Pn(0.2, 3), 0.1, 0.05, 0.05].pseq);

//: Modify how the synthtree interprets the stream
(degree:{if(~degree%3==0){~degree+(0..2)*[2,3].choose}{~degree}})%>\wander;

//: Add another SynthTree playing from the same stream as \wander
\wander cloneInto: \other;

//: Modify how the second SynthTree plays the stream
(degree: { 20 + ~degree }, ratio: 0.5) %> \other;

//: Like it? Lets have more:
(degree: { (10, 19 .. 32) + ~degree }) %> \other;

//: Hm, up there a little louder:
(amp: { Pbrown(0.5, 2, 0.1, inf).asStream * (~amp ? 0.01) }) %> \other;

//: Or maybe try playing inverse amplitude:
(amp: { 1 - (~amp ? 0.01) / 10 }) %> \other;

//: See if propagation works
Edef(\simple) =< (degree: Pwhite(-10.1, -12, inf));
//: OK
Edef(\simple) =< (degree: (-10..10).pyramid(5).pseq);
//: OK
Edef(\simple) =< (degree: (10..-10).pyramid(5).pseq);

//:
Edef(\simple) =< (degree: [1, 2].pseq);
//: Pauses? Suddenly a whiff of baroque.
(
(amp: [0, 0, 0.1, 0.2, 0.05].pseq, degree: { ~degree }) %> \wander;
(amp: [0, 0.1].pseq, degree: { 2 + ~degree }) %> \other;
)
//: Try some modulation
(
\simple =< (mtranspose: Pstutter(12, (-4..2).pseq),
	ctranspose: Pstutter(24, ((0..5) * 5 % 12).pseq),
	scale: Scale.harmonicMinor
);
)
//: Fade out
\wander.fadeOut(5);
\other.fadeOut(10);


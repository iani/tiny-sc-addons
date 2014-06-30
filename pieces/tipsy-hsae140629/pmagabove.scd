//: ================================================================
// PATTERN PART
// ================================================================

Edef(\pabove1, (instrument: \bufmagaboves, buf: \tipsy.b, 
	startPos: (0..6000).prand, legato: 1.1, dur: 0.5,
	amp: 0.5)) => \pabove1;
//:
\pabove1 =< (startPos: (3..50).prand);

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
\pabove1 =< (dur: 15);
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

//:
\pabove1.fadeOut(9);

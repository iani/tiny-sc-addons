/*
«functors - Using Pdef for building abstract pattern functions while live coding» by julian.rohrhuber on 27 Sep'13 20:22 in patternlive codingabstractiontutorial
A simple example that shows of how to build higher-level patterns using Pdef

http://sccode.org/1-4UV

Copied: Mon, Apr 14 2014, 13:44 EEST
*/

// For a long time I was thinking of what would be the best way to do this: function composition (functors) in live coding with patterns - it seems all in place anyway.

// some synthdef
(
SynthDef(\Pdefhelp, { arg out, freq, sustain=1, amp=1, pan;
    var env, u=1;
    env = EnvGen.kr(Env.perc(0.03, sustain), 1, doneAction:2);
    3.do { var d; d = exprand(0.01, 1); u = SinOsc.ar(d * 300, u, rrand(0.1,1.2) * d, 1) };
    Out.ar(out, Pan2.ar(SinOsc.ar(u + 1 * freq, 0, amp * env), pan));
}).add;
)

Pdef(\stut, { Pstutter(~stutter ? 1, ~pattern) }); // this defines a function that maps one pattern to another.
Pdef(\x, Pbind(\instrument, \Pdefhelp, \note, Pseq([0, 4, 7, 3, 0, 1, 0], inf)));
Pdef(\y, Pdef(\stut) <> (pattern: Pdef(\x), stutter: Pseq([2, 2, 4, 3], inf)) <> (dur: 0.1, legato: 0.2)).play;
Pdef(\y, Pdef(\stut) <> (pattern: Pdef(\x), stutter: Pseq([2, 2, 4, 3], inf)) <> (dur: 0.1, legato: 0.2)).play;


// Up to a certain point, this also works for non-event-patterns:

// pattern as an argument
Pdefn(\x, Pseq([1, 2, 5, 6, 7], inf));
Pdefn(\x); // omitting the second argument, we can access the proxy
Pdefn(\x).asStream.nextN(20); // ... play one event stream
Pdefn(\x).source.postcs; // ... and inspect the event pattern itself.


// function as an argument, create a new pattern each time it is called
Pdefn(\x, { Pseq({ 10.rand } ! 8) });
Pn(Pdefn(\x)).asStream.nextN(16);

// the function is called in the incoming event as current environment, so parameters can be passed:
Pdef(\stut, { Pstutter(~stutter ? 1, ~pattern) }); // note that we use a Pdef here, not a Pdefn
Pdefn(\y, Pdef(\stut) <> (pattern: Pdefn(\x), stutter: Pseq([2, 2, 4, 3], inf))).asStream.nextN(16);

::
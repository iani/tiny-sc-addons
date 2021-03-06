/*
«the ocean» by sadguitarius on 17 Oct'11 19:15 in ambientnaturesound effectsocean
It works with laptops too, not just seashells... Thanks to Andy Hayleck from the SC list for the code I used as a starting point.

http://sccode.org/1-1n

Copied: Mon, Apr 14 2014, 19:24 EEST
*/
//:
a = {
x = OnePole.ar(WhiteNoise.ar(0.1)+Dust.ar(100, 0.5), 0.7);
x = x + Splay.ar(FreqShift.ar(x, 0.5/(4..7)));
}.play;

//:

a.release(5);
//:
a = { | dustrate = 100, numerator = 0.5, poleparam = 0.7 |
x = OnePole.ar(WhiteNoise.ar(0.1)+Dust.ar(dustrate, 0.5), poleparam);
x = x + Splay.ar(FreqShift.ar(x, numerator / (4..7)));
}.play;

//:
a.set(\dustrate, 1000);
//:
a.set(\numerator, 1);
//:
a.set(\poleparam, 0.59)
//:
a.release(5);
//:
b = { Out.kr(0, LFNoise2.kr(1, 0.99)) }.play;

//:
c = { Out.kr(1, LFNoise0.kr(0.2, 10)) }.play;
//:
a.map(\poleparam, 0);
a.map(\numerator, 1);
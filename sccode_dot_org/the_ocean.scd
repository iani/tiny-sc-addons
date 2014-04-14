/*
«the ocean» by sadguitarius on 17 Oct'11 19:15 in ambientnaturesound effectsocean
It works with laptops too, not just seashells... Thanks to Andy Hayleck from the SC list for the code I used as a starting point.

http://sccode.org/1-1n

Copied: Mon, Apr 14 2014, 19:24 EEST
*/
//:
{
x = OnePole.ar(WhiteNoise.ar(0.1)+Dust.ar(100, 0.5), 0.7);
x = x + Splay.ar(FreqShift.ar(x, 0.5/(4..7)));
}.play
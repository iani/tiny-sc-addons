/*
«metallic rhythmic patterns» by Jonatan Liljedahl on 06 Sep'11 15:01 in sctweetrhythmicmetallic

http://sccode.org/1-16

Copied: Mon, Apr 14 2014, 12:48 EEST
*/
play{Limiter.ar(GVerb.ar(sin(Ringz.ar(Impulse.ar(2**LFNoise0.ar(1!2).range(1,4).round),[40,200,234,889],0.7).sum*2),5,2,0.7))}

play{Limiter.ar(GVerb.ar(sin(Ringz.ar(Impulse.ar(2**LFNoise0.ar(1!3).range(1,5).round/2),[40,200,234,889,1320,150],0.7).sum),5,2,0.7)/2)}


10 ! 5

"hello".scramble;

{ "hello".scramble } ! 10; 
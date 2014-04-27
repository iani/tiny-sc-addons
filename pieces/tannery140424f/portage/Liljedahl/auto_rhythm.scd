/*

«auto rhythm» by Jonatan Liljedahl on 16 Sep'11 11:03 in sctweetrhythmicrandomness
quantized random triggers creates a rhythm that increases in density over the first 30 seconds.

http://sccode.org/1-1b

Copied: Mon, Apr 14 2014, 12:50 EEST
*/

{Ringz.ar(CoinGate.ar([5,3,9]/10*Line.kr(0,1,30),T2A.ar(Impulse.kr([4,12,6]))),[45,9e3,50,8e3],[6,1,10,3]/10,[9,2,3,1]).sin.sum.tanh!2} => \lil4;


/*
«metallic rhythmic patterns» by Jonatan Liljedahl on 06 Sep'11 15:01 in sctweetrhythmicmetallic

http://sccode.org/1-16

Copied: Mon, Apr 14 2014, 12:48 EEST
*/
play{Limiter.ar(GVerb.ar(sin(Ringz.ar(Impulse.ar(2**LFNoise0.ar(1!2).range(1,4).round),[40,200,234,889],0.7).sum*2),5,2,0.7))} => \lil5;


//:
play{Limiter.ar(GVerb.ar(sin(Ringz.ar(Impulse.ar(2**LFNoise0.ar(1!3).range(1,5).round/2),[40,200,234,889,1320,150],0.7).sum),5,2,0.7)/2)} => \lil2


//;
{Ringz.ar(CoinGate.ar([5,3,9]/10*Line.kr(0,1,30),T2A.ar(Impulse.kr([4,12,6]))),[45,9e3,50,8e3],[6,1,10,3]/10,[9,2,3,1]).sin.sum.tanh!2} => \lil1


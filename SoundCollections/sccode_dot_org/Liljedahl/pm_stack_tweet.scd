/*
«PM stack tweet» by Jonatan Liljedahl on 09 Aug'11 08:43 in sctweettechnophasemodulation
A long chain of phasemodulating sinewaves, modulation amount growing for 4 minutes, ending in noise.

http://sccode.org/1-8

Copied: Mon, Apr 14 2014, 12:31 EEST
*/
play{x=0;(50..120).do{|f|f=f/2;x=SinOsc.ar(f+[0,1],x*Line.kr(1,3,240,doneAction:2))};tanh(x+Ringz.ar(Impulse.ar(2),45,0.3,3))}
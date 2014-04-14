/*
«Dark sea horns» by Jonatan Liljedahl on 10 Aug'11 16:48 in sctweetambientfeedbacknoise
phasemodulation feedback and allpass network

http://sccode.org/1-j

Copied: Mon, Apr 14 2014, 11:55 EEST
*/
n=LFNoise1;Ndef(\x,{a=SinOsc.ar(65,Ndef(\x).ar*n.ar(0.1,3),n.ar(3,6)).tanh;9.do{a=AllpassL.ar(a,0.3,{0.2.rand+0.1}!2,5)};a.tanh}).play
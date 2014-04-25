/*
«tweets more tweets» by aucotsi on 26 Aug'11 18:00 in sctweet

http://sccode.org/1-X

Copied: Mon, Apr 14 2014, 12:42 EEST

*/

// a drum part
play{b=SinOsc.kr(1);a=Line.kr(0.1,2*pi,37);FreeVerb.ar(SinOsc.ar(b*340!2*Impulse.kr(b*680),LFPulse.kr(2,0,pi/2),LFPulse.kr(3,0,1/pi*a)))}

//sticky morning clock
play{c=LFPulse.kr(0.5);b=SinOsc.kr(0.0034);a=Line.kr(0.1,2pi,37);FreeVerb.ar(Blip.ar(a*340!2*Impulse.kr(b*34/pi),c*TIRand.kr(0,113,c),c))}

// another drum part
play{a=Impulse;b=SinOsc;a.kr(6).lag*Crackle.ar(LFSaw.kr(5).abs.lag2)+a.ar(7).lag*b.ar(222*b.kr(29))+([a.kr(2,0,4)+a.kr(1)].lag*b.ar(70!2))}

/// i like to play these two on series
play{a=Impulse;a.kr(8).lag2*Crackle.ar(LFSaw.kr(5).abs.lag2)+GVerb.ar([a.kr(2,0,4).lag+a.kr(1,pi/5).lag]*Blip.ar(5,2,0.2)!2,6,0.4)}
///
play{a=Impulse;a.kr(8).lag2*Crackle.ar(LFSaw.kr(7).abs.lag3)+GVerb.ar([a.kr(2,0,4).lag+a.kr(1,pi/1.2).lag]*SinOsc.ar(20)!2,6,0.4,0.4)}
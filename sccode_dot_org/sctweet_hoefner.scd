/*
«sctweet - my first one» by daniel.k.hoepfner on 07 Jan'14 23:05 in tweets

http://sccode.org/1-4Vw
Copied: Sun, Apr 13 2014, 23:10 EEST
*/

{CombC.ar(Decay2.ar(Impulse.ar(1))*SinOsc.ar(800)*0.1,4,LFNoise2.ar(LFNoise1.kr(0.1).range(0.1,2)).range(0.1,3),100)!2}.play
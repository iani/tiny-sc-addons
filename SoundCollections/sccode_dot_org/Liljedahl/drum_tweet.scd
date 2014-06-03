/*
«drum tweet» by Jonatan Liljedahl on 28 Aug'11 14:00 in sctweetdrums
variation on one of the tweets by aucotsi: http://sccode.org/1-X

http://sccode.org/1-Z

Copied: Mon, Apr 14 2014, 12:38 EEST
*/

play{a=Impulse;tanh(a.kr(8).lag*Crackle.ar(LFSaw.kr(3).abs.lag*1.8)+GVerb.ar([a.kr(2)+a.kr(4,0.5)].lag*Blip.ar(4.9,7,0.4)!2,1,1)*5)}
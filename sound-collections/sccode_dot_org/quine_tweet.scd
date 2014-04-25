/*
«Quine tweet» by backseatviolist on 10 Mar'14 07:01 in sctweet noise quine
Uses its own source code as a waveform and LFO.

http://sccode.org/1-4VV

Copied: Sun, Apr 13 2014, 17:06 EEST

*/

interpret(x="/***/play{RLPF.ar(COsc.ar(b=Buffer.loadCollection(s,x.ascii.normalize(-1,1)),Osc.kr(b,1,0,65,35)),Osc.kr(b,0.1,0,300,1e3))/5}")

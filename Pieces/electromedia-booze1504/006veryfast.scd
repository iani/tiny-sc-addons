SynthTree.faders;
Server.killAll;

\veryfast.st.fadeTime_(5);

//:

{ LPF.ar(Inp.ar, [400, 600]) * 15 } => \veryfastlpf;
//:

{ HPF.ar(Inp.ar, [400, 600]) * 15 } => \veryfastlpf;
//:
{ LPF.ar(Inp.ar, LFNoise0.kr([2, 3]).range(1000, 2000)) * 15 } => \veryfastlpf;
//:
{ HPF.ar(Inp.ar, LFNoise0.kr([1, 2]).range(1000, 2000)) * 15 } => \veryfastlpf;
//:
{ Resonz.ar(Inp.ar, LFNoise0.kr([3, 2]).range(1800, 2000)) * 15 } => \veryfastlpf;
//:
{ Resonz.ar(Inp.ar, LFNoise1.kr([5, 5]).range(200, 10000)) * 25 } => \veryfastlpf;
//:
\veryfast.st => \veryfastlpf;
//:
\veryfast.st => \root;
//:

{a=SinOsc;p=Pulse;GVerb.ar(WhiteNoise.ar*p.ar(TChoose.kr(a.kr(2),[5,8,20,30]))*p.ar(16,0.1))+a.ar(97*p.ar(4),0,p.kr(5,add:1))} => \veryfast;


//:

{a=SinOsc;p=Pulse;GVerb.ar(WhiteNoise.ar*p.ar(TChoose.kr(a.kr(3),[5,8,20,30]))*p.ar(

	LFNoise1.ar(0.2).range(4, 20)

	,0.1))+a.ar(97*p.ar(4),0,p.kr(5,add:1))} => \veryfast;


//:

{a=SinOsc;p=Pulse;GVerb.ar(WhiteNoise.ar*p.ar(TChoose.kr(a.kr(2),[5,8,20,30]))*p.ar(6,0.1))+a.ar(97*p.ar(4),0,p.kr(5,add:1))} => \veryfast;


//:

{a=SinOsc;p=Pulse;GVerb.ar(WhiteNoise.ar*p.ar(TChoose.kr(a.kr(2),[5,8,20,30]))*p.ar(1,0.1))+a.ar(97*p.ar(4),0,p.kr(5,add:1))} => \veryfast;


//:

{a=SinOsc;p=Pulse;GVerb.ar(WhiteNoise.ar*p.ar(TChoose.kr(a.kr(2),[5,8,20,30]))*p.ar(8,0.1))+a.ar(97*p.ar(4),0,p.kr(5,add:1))} => \veryfast;


//:

{a=SinOsc;p=Pulse;GVerb.ar(WhiteNoise.ar*p.ar(TChoose.kr(a.kr(2),[5,8,20,30]))*p.ar(8,0.1))+a.ar(97*p.ar(8),0,p.kr(15,add:1))} => \veryfast;


//:

{a=SinOsc;p=Pulse;GVerb.ar(WhiteNoise.ar*p.ar(TChoose.kr(a.kr(2),[5,8,20,30]))*p.ar(8,0.1))+a.ar(97*p.ar(2),0,p.kr(1,add:1))} => \veryfast;


//:

{a=SinOsc;p=Pulse;GVerb.ar(WhiteNoise.ar*p.ar(TChoose.kr(a.kr(2),[5,8,20,30]))*p.ar(4,0.1))+a.ar(97*p.ar(2),0,p.kr(1,add:1))} => \veryfast;


//:

{a=SinOsc;p=Pulse;GVerb.ar(WhiteNoise.ar*p.ar(TChoose.kr(a.kr(2),[5,8,20,30]))*p.ar(4,0.1))+a.ar(97*p.ar(2),0,p.kr(1,add:1))} => \veryfast;


//:

{a=SinOsc;p=Pulse;GVerb.ar(WhiteNoise.ar*p.ar(TChoose.kr(a.kr(10),[5,8,20,30]))*p.ar(10,0.1))+a.ar(97*p.ar(10),0,p.kr(10,add:1))} => \veryfast;


//:

{a=SinOsc;p=Pulse;GVerb.ar(WhiteNoise.ar*p.ar(TChoose.kr(a.kr(15),[5,8,20,30]))*p.ar(15,0.1))+a.ar(97*p.ar(15),0,p.kr(15,add:1))} => \veryfast;


//:

{a=SinOsc;p=Pulse;GVerb.ar(WhiteNoise.ar*p.ar(TChoose.kr(a.kr(20),[5,8,20,30]))*p.ar(20,0.1))+a.ar(97*p.ar(20),0,p.kr(20,add:1))} => \veryfast;


//:

{a=SinOsc;p=Pulse;GVerb.ar(WhiteNoise.ar*p.ar(TChoose.kr(a.kr(20),[5,8,20,30]))*p.ar(20,0.1))+a.ar(97*p.ar(20),0,p.kr(10,add:1))} => \veryfast;


//:

{a=SinOsc;p=Pulse;GVerb.ar(WhiteNoise.ar*p.ar(TChoose.kr(a.kr(20),[5,8,20,30]))*p.ar(20,0.1))+a.ar(97*p.ar(10),0,p.kr(10,add:1))} => \veryfast;


//:

{a=SinOsc;p=Pulse;GVerb.ar(WhiteNoise.ar*p.ar(TChoose.kr(a.kr(20),[5,8,20,30]))*p.ar(10,0.1))+a.ar(97*p.ar(10),0,p.kr(10,add:1))} => \veryfast;


//:

{a=SinOsc;p=Pulse;GVerb.ar(WhiteNoise.ar*p.ar(TChoose.kr(a.kr(10),[5,8,20,30]))*p.ar(10,0.1))+a.ar(97*p.ar(10),0,p.kr(10,add:1))} => \veryfast;


//:

{a=SinOsc;p=Pulse;GVerb.ar(WhiteNoise.ar*p.ar(TChoose.kr(a.kr(10),[5,8,20,30]))*p.ar(10,0.1))+a.ar(97*p.ar(10),0,p.kr(5,add:1))} => \veryfast;


//:

{a=SinOsc;p=Pulse;GVerb.ar(WhiteNoise.ar*p.ar(TChoose.kr(a.kr(10),[5,8,20,30]))*p.ar(5,0.1))+a.ar(97*p.ar(10),0,p.kr(5,add:1))} => \veryfast;


//:

{a=SinOsc;p=Pulse;GVerb.ar(WhiteNoise.ar*p.ar(TChoose.kr(a.kr(5),[5,8,20,30]))*p.ar(5,0.1))+a.ar(97*p.ar(10),0,p.kr(5,add:1))} => \veryfast;


//:

{a=SinOsc;p=Pulse;GVerb.ar(WhiteNoise.ar*p.ar(TChoose.kr(a.kr(5),[5,8,20,30]))*p.ar(5,0.1))+a.ar(97*p.ar(10),0,p.kr(50,add:1))} => \veryfast;


//:

{a=SinOsc;p=Pulse;GVerb.ar(WhiteNoise.ar*p.ar(TChoose.kr(a.kr(5),[5,8,20,30]))*p.ar(5,0.1))+a.ar(97*p.ar(50),0,p.kr(50,add:1))} => \veryfast;


//:

{a=SinOsc;p=Pulse;GVerb.ar(WhiteNoise.ar*p.ar(TChoose.kr(a.kr(5),[5,8,20,30]))*p.ar(50,0.1))+a.ar(97*p.ar(50),0,p.kr(50,add:1))} => \veryfast;


//:

{a=SinOsc;p=Pulse;GVerb.ar(WhiteNoise.ar*p.ar(TChoose.kr(a.kr(50),[5,8,20,30]))*p.ar(50,0.1))+a.ar(97*p.ar(50),0,p.kr(50,add:1))} => \veryfast;


//:

{a=SinOsc;p=Pulse;GVerb.ar(WhiteNoise.ar*p.ar(TChoose.kr(a.kr(50),[5,8,20,30]))*p.ar(50,0.1))+a.ar(97*p.ar(50),0,p.kr(5,add:1))} => \veryfast;


//:

{a=SinOsc;p=Pulse;GVerb.ar(WhiteNoise.ar*p.ar(TChoose.kr(a.kr(50),[5,8,20,30]))*p.ar(50,0.1))+a.ar(97*p.ar(5),0,p.kr(5,add:1))} => \veryfast;


//:

{a=SinOsc;p=Pulse;GVerb.ar(WhiteNoise.ar*p.ar(TChoose.kr(a.kr(50),[5,8,20,30]))*p.ar(50,0.1))+a.ar(97*p.ar(5),0,p.kr(5,add:1))} => \veryfast;


//:

{ Dust.ar(LFNoise1.kr(0.3).range(5, 100).dup) * 2 } => \dust;

{ Resonz.ar(Dust.ar(LFNoise1.kr(0.3).range(5, 100).dup), 400) * 2 } => \dust;

{ Resonz.ar(Dust.ar(LFNoise1.kr(0.3).range(5, 10).dup),
	LFNoise0.kr(4).range(300, 13000), 0.01
) * 2 } => \dust;





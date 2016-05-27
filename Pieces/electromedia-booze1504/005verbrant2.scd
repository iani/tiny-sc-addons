Server.killAll;
//:
m=[GrainSin,GrainFM];
i = 0;
{b=GbmanN.ar(_);CombN.ar(GVerb.ar(m[i].ar(2,Saw.kr(9-i),t=8e-3,c=Convolution.ar(b.(6),b.(5))/4,c/t)),t,t)/9} => \vb1;
//:
\vb1.fadeOut;
//:
m=[GrainSin,GrainFM];
i = 1;
{b=GbmanN.ar(_);CombN.ar(GVerb.ar(m[i].ar(2,Saw.kr(9-i),t=8e-3,c=Convolution.ar(b.(6),b.(5))/4,c/t)),t,t)/9} => \vb2;
//:
m=[GrainSin,GrainFM];
i = 1;
{b=GbmanN.ar(_);CombN.ar(GVerb.ar(m[i].ar(2,Saw.kr(9-i),t=8e-3,c=Convolution.ar(b.(7),b.(8))/4,c/t)),t,t)/9} => \vb2;
//:
m=[GrainSin,GrainFM];
i = 1;
{b=GbmanN.ar(_);CombN.ar(GVerb.ar(m[i].ar(2,Saw.kr(9-i),t=8e-3,c=Convolution.ar(b.(9),b.(10))/4,c/t)),t,t)/9} => \vb2;
//:
m=[GrainSin,GrainFM];
i = 1;
{b=GbmanN.ar(_);CombN.ar(GVerb.ar(m[i].ar(2,Saw.kr(9-i),t=8e-3,c=Convolution.ar(b.(9),b.(10))/6,c/t)),t,t)/9} => \vb2;
//:
m=[GrainSin,GrainFM];
i = 1;
{b=GbmanN.ar(_);CombN.ar(GVerb.ar(m[i].ar(2,Saw.kr(9-i),t=8e-3,c=Convolution.ar(b.(9),b.(10))/6,c/t)),t,t)/10} => \vb2;
//:
m=[GrainSin,GrainFM];
i = 1;
{b=GbmanN.ar(_);CombN.ar(GVerb.ar(m[i].ar(4,Saw.kr(9-i),t=8e-3,c=Convolution.ar(b.(9),b.(10))/6,c/t)),t,t)/10} => \vb2;
//:
m=[GrainSin,GrainFM];
i = 1;
{b=GbmanN.ar(_);CombN.ar(GVerb.ar(m[i].ar(4,Saw.kr(9-i),t=8e-3,c=Convolution.ar(b.(9),b.(10))/6,c/t)),t,t)/10} => \vb2;
//:
m=[GrainSin,GrainFM];
i = 1;
{b=GbmanN.ar(_);CombN.ar(GVerb.ar(m[i].ar(4,Saw.kr(3-i),t=8e-3,c=Convolution.ar(b.(9),b.(10))/6,c/t)),t,t)/10} => \vb2;
//:
m=[GrainSin,GrainFM];
i = 1;
{b=GbmanN.ar(_);CombN.ar(GVerb.ar(m[i].ar(4,Saw.kr(
	LFNoise0.kr(0.2).range(1, 20)
),t=8e-3,c=Convolution.ar(b.(9),b.(10))/6,c/t)),t,t)/10} => \vb2;
//:
m=[GrainSin,GrainFM];
i = 1;
{b=GbmanN.ar(_);CombN.ar(GVerb.ar(m[i].ar(4,Saw.kr(
	LFNoise0.kr(0.2).range(1, 20)
),t=LFNoise1.kr(0.3).range(0.0001, 0.01),c=Convolution.ar(b.(9),b.(10))/6,c/t)),t,t)/10} => \vb2;
//:
m=[GrainSin,GrainFM];
i = 1;
{b=GbmanN.ar(_);CombN.ar(GVerb.ar(m[i].ar(4,Saw.kr(
	LFNoise0.kr(0.2).range(1, 20)
),t=LFNoise1.kr(0.3).range(0.0001, 0.01),c=Convolution.ar(b.(2),b.(3))/6,c/t)),t,t)/10} => \vb2;
//:
\vb2.fadeOut;
//:
m=[GrainSin,GrainFM];
i = 0;
{b=GbmanN.ar(_);CombN.ar(GVerb.ar(m[i].ar(4,Saw.kr(
	LFNoise0.kr(0.2).range(1, 20)
),t=LFNoise1.kr(0.3).range(0.0001, 0.01),c=Convolution.ar(b.(2),b.(3))/6,c/t)),t,t)/10} => \vb1;
//:


Server.killAll;
//:
SynthTree.faders;
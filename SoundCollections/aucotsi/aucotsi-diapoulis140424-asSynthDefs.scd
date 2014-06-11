/*
Collected SC-tweets by Yorgos Diapoulis.
From: https://gist.github.com/yorgosdiapoulis/11268826

Copied Thu, Apr 24 2014, 23:46 EEST

Here conversion to synthdefs/templates for tiny-sc
*/
//:

(`\mysterymetals) => \test;
10 => ~amp;

1 => ~pulse;

3 => ~pulse;
20 => ~spulse;



//:
`\gardellino => \test;
//:
1 => ~stepper;
40 => ~sweep;
60 => ~sweep2;
100 => ~lo;
400 => ~hi;
0.10 => ~form1;
1/20 => ~form2;
//:
`\boombah => \test123;
//:
40 => ~pfreq;
500 => ~mystery;
1000 => ~mystery2;

10 => ~d1;
4 => ~d2;
20 => ~d4;
30 => ~d4;

//:

//: 
(degree: 5) => \soundcheck;

//:
[
SynthDef("mysterymetals", {
	var x;
	GVerb.ar(TGrains.ar(2,
		Pulse.ar(\pulse.kr(3)),
		Buffer.read(s,Platform.resourceDir+/+"sounds/a11wlk01.wav"),
		Sweep.ar(x=Pulse.ar(\spulse.kr(4s))),x,Sweep.ar(x))
	).adsrOut 
}),
] do: { | sd | SynthTemplate(sd.name, sd.add, ['aucotsi']) };

//:
[
SynthDef("boombah", {
	var a, f;
	a = SinOsc.ar(_);
	f = Stepper.ar(
		LFPulse.ar(
			\pfreq.kr(53) + (
				\mystery.kr(329) 
				* a.(Duty.ar(
					\dutyRate.kr(1), 0, Dseq([\d1.kr(5),\d2.kr(5),\d3.kr(5),\d4.kr(7)],
						inf))))));
	a.(\mystery2.kr(334)/f).tanh
.dup(2).ladsrOut;
}),

SynthDef("gardellino", {
	var a, b;
	a = SinOsc;
	Formlet.ar(
		a.ar(
			Convolution.ar(
				b = GbmanN.ar(
					Stepper.ar(
						a.ar(\stepper.kr(5)))
				), b
			)
		),
		a.ar(Sweep.ar(a.ar(\sweep.kr(1/9)), \sweep2.kr(2)))
		.range(\lo.kr(1e3), \hi.kr(4e3)), 
		\form1.kr(0.01), \form2.kr(1/99)
	).dup(2).ladsrOut;
}),
] do: { | sd | SynthTemplate(sd.name, sd.add, ['aucotsi']) };
//
//:
// #sc140 #SuperCollider
//:
a=c=nil;b=SinOsc;9.do{|i|a=a++"b.ar("++(99/(i+1)).asString++"*";c=c++")"};play{FreeVerb.ar((a++"9"++c).interpret)!2.ladsrOut;
}),
// #SuperCollider #sc140
//:
SynthDef("auco02", {a=LFCub;GVerb.ar(Formlet.ar(a.ar(Convolution.ar(b=LinCongN.ar(5),b)),a.ar(Sweep.ar(a.ar(1/9),3)).range(1999,3999),0.01,0.1)).ladsrOut;
}),
// #sc140
//:
m=[GrainSin,GrainFM];{|i|play{b=GbmanN.ar(_);CombN.ar(GVerb.ar(m[i].ar(2,Saw.kr(9-i),t=9e-3,c=Convolution.ar(b.(4),b.(5))/4,c/t)),t,t)/9}}!2
//:
SynthDef("auco02", {a=SinOsc;p=Pulse;WhiteNoise.ar*p.kr(10,1e-2)+a.ar(39*p.ar(1))+FreeVerb.ar(a.ar(Convolution.ar(b=HenonN.ar(8),b)))!2/9.ladsrOut;
}),
// #SuperCollider
//:
SynthDef("auco02", {FreeVerb2.ar(RLPF.ar(a=Convolution.ar(StandardN.ar([1,2], 2),Gendy1.ar(4,1,1,1,20,999)),SinOsc.ar(999).range(9,1e4)),a)/222.ladsrOut;
}),
// #sc140
//:
SynthDef("auco02", {FreeVerb2.ar(b=RLPF.ar(Klank.ar(`[(1..82)],Impulse.ar(1),0),SinOsc.ar(122).range(10,3300)),b)/99.ladsrOut;
}),
// #SuperCollider #sc140
//:
fork{loop{Date.getDate.asString.do {|i|{SinOsc.ar(i.ascii)*EnvGen.ar(Env.perc,doneAction:2)!2}.play;i.post;1.wait;};"\r".post}}// #sc140
//:
ProxySpace.push;~a0.play;~a1.play;fork{loop{2.do{|i|currentEnvironment[(\a++i).asSymbol]={GVerb.ar(LFTri.ar(99+9.rand2),1,i)/2};0.2.wait}}}
//:
SynthDef("auco02", {a=SinOsc;p=Pulse;GVerb.ar(WhiteNoise.ar*p.ar(TChoose.kr(a.kr(2),[5,8,20,30]))*p.ar(16,0.1))+a.ar(97*p.ar(4),0,p.kr(5,add:1)).ladsrOut;
}),
// #sc140
//:
SynthDef("auco02", {GVerb.ar(IFFT(PV_BrickWall(FFT(Buffer.alloc(s,1024),WhiteNoise.ar*Pulse.ar(8,2e-2)),SinOsc.ar(Duty.kr(1,0,Dseq((10..19),inf))))))}
//:
SynthDef("auco02", {p=Pulse;WhiteNoise.ar*p.ar(8,h=3e-3)+GVerb.ar(GrainSin.ar(2,p.ar(8),n=h*t=LFNoise0.ar,1/n),2)+PMOsc.ar(9*p.ar(4*t),111,p.kr(6,t,1,1))}
//:
SynthDef("auco02", {a=SinOsc;p=Pulse;WhiteNoise.ar*p.kr(8,0.01)+a.ar(98*n=p.ar(4),0,p.kr(2,add:1))+GVerb.ar(a.ar(99*n)+p.ar(p.kr(3*n)),1,mul:0.1).ladsrOut;
}),
// #sc140
//:
SynthDef("auco02", {p=Pulse;GVerb.ar(IFFT(PV_BrickWall(FFT(Buffer.alloc(s,128),WhiteNoise.ar*p.ar(8,5e-4)+SinOsc.ar(9*p.ar(1),0,n=p.kr(p.ar(5)))),n))).ladsrOut;
}),
//w8
//:
2.do{|i|SynthDef(\++i,{|f|a=[PinkNoise,LFCub];Out.ar(0,a[i].ar(f)*Line.ar(1,0,k=1/6))}).add;Pbind(\instrument,\++i,\f,80*i+k,\dur,i+k).play}
//:
//:240414

//:ps Thu, Apr 24 2014, 23:55 EEST
SynthDef("auco02", {FreeVerb2.ar(b=RLPF.ar(Klank.ar(`[(1..82)],Impulse.ar(1),0),SinOsc.ar(122).range(10,3300)),b)/99.ladsrOut;
}),
// #SuperCollider #sc140
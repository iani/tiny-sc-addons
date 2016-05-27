SynthTree.faders;


//:
//:



play{FreeVerb2.ar(RLPF.ar(a=Convolution.ar(StandardN.ar([1,2], 2),Gendy1.ar(4,1,1,1,20,999)),SinOsc.ar(999).range(9,1e4)),a)/222}// #sc140

play{FreeVerb2.ar(b=RLPF.ar(Klank.ar(`[(1..82)],Impulse.ar(1),0),SinOsc.ar(122).range(10,3300)),b)/99}// #SuperCollider #sc140

fork{loop{Date.getDate.asString.do {|i|{SinOsc.ar(i.ascii)*EnvGen.ar(Env.perc,doneAction:2)!2}.play;i.post;1.wait;};"\r".post}}// #sc140

ProxySpace.push;~a0.play;~a1.play;fork{loop{2.do{|i|currentEnvironment[(\a++i).asSymbol]={GVerb.ar(LFTri.ar(99+9.rand2),1,i)/2};0.2.wait}}}

play{a=SinOsc;p=Pulse;GVerb.ar(WhiteNoise.ar*p.ar(TChoose.kr(a.kr(2),[5,8,20,30]))*p.ar(16,0.1))+a.ar(97*p.ar(4),0,p.kr(5,add:1))}// #sc140

play{GVerb.ar(IFFT(PV_BrickWall(FFT(Buffer.alloc(s,1024),WhiteNoise.ar*Pulse.ar(8,2e-2)),SinOsc.ar(Duty.kr(1,0,Dseq((10..19),inf))))))}

play{p=Pulse;WhiteNoise.ar*p.ar(8,h=3e-3)+GVerb.ar(GrainSin.ar(2,p.ar(8),n=h*t=LFNoise0.ar,1/n),2)+PMOsc.ar(9*p.ar(4*t),111,p.kr(6,t,1,1))}

play{a=SinOsc;p=Pulse;WhiteNoise.ar*p.kr(8,0.01)+a.ar(98*n=p.ar(4),0,p.kr(2,add:1))+GVerb.ar(a.ar(99*n)+p.ar(p.kr(3*n)),1,mul:0.1)}// #sc140

play{p=Pulse;GVerb.ar(IFFT(PV_BrickWall(FFT(Buffer.alloc(s,128),WhiteNoise.ar*p.ar(8,5e-4)+SinOsc.ar(9*p.ar(1),0,n=p.kr(p.ar(5)))),n)))}//w8

2.do{|i|SynthDef(\++i,{|f|a=[PinkNoise,LFCub];Out.ar(0,a[i].ar(f)*Line.ar(1,0,k=1/6))}).add;Pbind(\instrument,\++i,\f,80*i+k,\dur,i+k).play}

//: DONE?
play{GVerb.ar(TGrains.ar(2,Pulse.ar(3),Buffer.read(s,Platform.resourceDir+/+"sounds/a11wlk01.wav"),Sweep.ar(x=Pulse.ar(4s)),x,Sweep.ar(x)))}
//: NOt?
play{a=SinOsc;Formlet.ar(a.ar(Convolution.ar(b=GbmanN.ar(Stepper.ar(a.ar(5))),b)),a.ar(Sweep.ar(a.ar(1/9),2)).range(1e3,4e3),0.01,1/99)!2}//

play{a=SinOsc.ar(_);f=Stepper.ar(LFPulse.ar(53+(329*a.(Duty.ar(1,0,Dseq([5,5,5,7],inf))))));a.(334/f).tanh!2}// #sc140 #SuperCollider

play{a=LFCub;GVerb.ar(Formlet.ar(a.ar(Convolution.ar(b=LinCongN.ar(5),b)),a.ar(Sweep.ar(a.ar(1/9),3)).range(1999,3999),0.01,0.1))}// #sc140
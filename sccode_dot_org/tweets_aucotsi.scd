/*
«tweets again» by aucotsi on 13 Nov'13 13:12 in sctweet tweets

http://sccode.org/1-4Vo#c325

Sun, Apr 13 2014, 23:30 EEST
*/

//1.
play{p=Pulse;GVerb.ar(IFFT(PV_BrickWall(FFT(Buffer.alloc(s,128),WhiteNoise.ar*p.ar(8,5e-4)+SinOsc.ar(9*p.ar(1),0,n=p.kr(p.ar(5)))),n)))}//w8
//2.
play{a=SinOsc;p=Pulse;WhiteNoise.ar*p.kr(8,0.01)+a.ar(98*n=p.ar(4),0,p.kr(2,add:1))+GVerb.ar(a.ar(99*n)+p.ar(p.kr(3*n)),1,mul:0.1)}// #sc140
//3.
play{p=Pulse;WhiteNoise.ar*p.ar(8,h=3e-3)+GVerb.ar(GrainSin.ar(2,p.ar(8),n=h*t=LFNoise0.ar,1/n),2)+PMOsc.ar(9*p.ar(4*t),111,p.kr(6,t,1,1))}
//4.
play{GVerb.ar(IFFT(PV_BrickWall(FFT(Buffer.alloc(s,1024),WhiteNoise.ar*Pulse.ar(8,2e-2)),SinOsc.ar(Duty.kr(1,0,Dseq((10..19),inf))))))}
//5.
play{a=SinOsc;p=Pulse;GVerb.ar(WhiteNoise.ar*p.ar(TChoose.kr(a.kr(2),[5,8,20,30]))*p.ar(16,0.1))+a.ar(97*p.ar(4),0,p.kr(5,add:1))}// #sc140
//6.
ProxySpace.push;~a0.play;~a1.play;fork{loop{2.do{|i|currentEnvironment[(\a++i).asSymbol]={GVerb.ar(LFTri.ar(99+9.rand2),1,i)/2};0.2.wait}}}
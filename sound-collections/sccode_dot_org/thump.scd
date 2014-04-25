/*
«Thumper» by soda paper on 26 Feb'14 22:47 in bassthump
A muffled thump. An attempt at a Jurassic Park © glass of water sort of thing - or breaking into a silo.

http://sccode.org/1-4VR

Copied: Sun, Apr 13 2014, 21:39 EEST

*/
(
{ var nse, env, kic;
	kic = tanh(Ringz.ar(LPF.ar(Trig.ar(Impulse.ar(1.0),SampleDur.ir),1000),30,0.25,7).sin*2);
	env = Env.perc(0.05, 1, 1, -4);
	nse = BrownNoise.ar(2) + PinkNoise.ar(0.5)  * EnvGen.kr(env,Impulse.kr(1), doneAction: 2);

	nse = Mix.ar(BPF.ar(nse,[100,1200,80,40,20],MouseX.kr(0,1),[1,0.2,1,1,1]));
	nse = LPF.ar(nse + kic, MouseY.kr(100,1000))! 2

}.play
)
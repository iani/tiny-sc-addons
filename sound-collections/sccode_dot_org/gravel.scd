/* 
«Gravel» by alextiberiuskirk on 06 Nov'13 16:54 in filtergrainbusbrown noise

http://sccode.org/1-4Vh#c339

Copied on: Sun, Apr 13 2014, 17:32 EEST
*/

(
SynthDef(\Grain,
	{var sig, grain, env, sum, filt, pan1,pan2;
		sig = DynKlank.ar(`[Array.fill(14,{Rand(60,1200)}),Array.fill(14,{ExpRand(0.128, 0.7)}),Array.fill(14,{ExpRand(0.128, 0.7)})],BrownNoise.ar(0.7));
		grain = GrainIn.ar(1,Dust.kr(14), 0.0128, sig);
		grain = CombC.ar(grain, LFNoise0.kr(0.7).range(0.7,3),0.7, 7);
		grain = FreeVerb.ar(grain, 0.3,0.3,0.3);
		env = EnvGen.kr(Env.sine(TRand.kr(1.28,3, Dust.kr(0.07))), Dust.kr(0.07));
		filt = LPF.ar(sig, 500);
		sum = filt*env;
		pan1 = Pan4.ar(sum, FSinOsc.kr(0.128,(pi * 1)), FSinOsc.kr(0.128,(pi * 0.5)));
		pan2 = Pan4.ar(grain, FSinOsc.kr(0.07,(pi * 2)), FSinOsc.kr(0.07,(pi * 1.5)));
		Out.ar(0, pan1+pan2*0.0007);
}).add;
)

//:

(
SynthDef(\Verb,
	{var comb;
		comb = {FreeVerb.ar(In.ar(0),0.3,0.6,0,0.7)}!4;
		//comb1 = {CombC.ar(comb, 1.28,0.3,0.7)}!4;
		Out.ar(0,comb);
}).add;
);

//:


(
(
~sound = Group.head(s);
~fx = Group.tail(s);
);
(
Synth.head(~source,\Grain);
Synth.head(~fx,\Verb);
)
)
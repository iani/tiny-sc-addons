
(
SynthDef(\Synth3,
	{arg ress = 0;
		var klank, env;
		klank = Klank.ar(`[{Rand(70,21000)}!7, {Rand(0.128,0.700)}!7],BrownNoise.ar(0.7));
		klank = klank;
		env = EnvGen.kr(Env.perc(0.07, ress), doneAction:2);
		Out.ar(0, klank*env.dup*0.0128);
}).add;
)


{inf.do{x = rrand(0.01,0.7); Synth(\Synth3, [\ress, x+(7*x)]); x.wait;}}.fork
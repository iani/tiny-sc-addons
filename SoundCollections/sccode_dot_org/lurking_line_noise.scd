

({var
	  rf = 7
	, rt = Impulse.kr(rf)
	, bs = 8.collect({|i| PulseDivider.kr(rt, 16, i*2)})
	, bt = bs[0] + bs[2] + Dust.kr(SinOsc.kr(0.01, 0, 0.25, 0.25))
	, be = Decay.kr(bt, 0.2)
	, se = Decay.kr(bs[5]+bs[6], 0.01)
	, bass = be*SinOsc.ar(SinOsc.ar([5,6], 0, 20, 
		Demand.kr(bt, 0, Drand((30..48), inf)).midicps
	))
	, snar = se*SinOsc.ar(2000+[0, 5])
	, off = (LPF.kr(BrownNoise.kr([1,1]), 10)**(1/3))>0
	, hat = DelayL.kr(Decay.kr(Mix.kr(bs), 0.01), 20, rf.reciprocal*off)*PinkNoise.ar
	, line = Saw.ar(50)*0.1*(LFNoise0.kr(50)>0)*SinOsc.kr(0.1, 0, 0.4, 0.45)
	;
	Out.ar(0, FreeVerb.ar(bass+snar + hat + line, 
		SinOsc.kr(0.01, 0, 0.4, 0.5), 
		0.8, 0.5))
}.play
)
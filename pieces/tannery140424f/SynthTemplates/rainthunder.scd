
[
SynthDef("rainthunder", {
	| 
	lo = 40 
	hi = 50 
	freq = 7000
	a250 = 250
	noiselo = 100
	nosehi = 2500
	|
    Limiter.ar(
        tanh(
            3 * GVerb.ar(
                HPF.ar(
                    PinkNoise.ar(0.08+LFNoise1.kr(0.3,0.02))
					+LPF.ar(Dust2.ar(LFNoise1.kr(0.2).range(lo, hi)), freq),
                    400
                ),
                a250, 100, 0.25, drylevel: 0.3
            ) * Line.kr(0,1,10)
        ) + (
            GVerb.ar(
                LPF.ar(
                    10 * HPF.ar(PinkNoise.ar(LFNoise1.kr(3).clip(0,1)*LFNoise1.kr(2).clip(0,1) ** 1.8), 20)
                    ,LFNoise1.kr(1).exprange(100,2500)
                ).tanh,
               270,30,0.7,drylevel:0.5
            ) * Line.kr(0,0.7,30)
        )
    ).ladsrOut;
})
] do: { | sd | SynthTemplate(sd.name, sd.add, ['tannery', 'rain', 'nature']) };
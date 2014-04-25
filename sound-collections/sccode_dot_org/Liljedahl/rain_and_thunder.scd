/*
«Rain and thunder» by Jonatan Liljedahl on 09 Aug'11 20:34 in rainthundernaturesoundeffects
I tried to help a friends friend to find some suitable recording of rain and thunder on the net, but I ended up coding this up for him instead, and he was happy.

http://sccode.org/1-e

Copied: Mon, Apr 14 2014, 12:28 EEST
*/
(
play {
    Limiter.ar(
        tanh(
            3 * GVerb.ar(
                HPF.ar(
                    PinkNoise.ar(0.08+LFNoise1.kr(0.3,0.02))+LPF.ar(Dust2.ar(LFNoise1.kr(0.2).range(40,50)),7000),
                    400
                ),
                250,100,0.25,drylevel:0.3
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
    )
};
)
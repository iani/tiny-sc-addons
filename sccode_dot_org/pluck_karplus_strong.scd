/*
«Pluck (Karplus-Strong) example» by Bruno Ruviaro on 13 Nov'13 05:32 in karplusstrong synthesis

http://sccode.org/1-4Vn

Copied: Sun, Apr 13 2014, 23:34 EEST
*/
(
SynthDef("plucking", {arg amp = 0.1, freq = 440, decay = 5, coef = 0.1;

var env, snd;
env = EnvGen.kr(Env.linen(0, decay, 0), doneAction: 2);
snd = Pluck.ar(
        in: WhiteNoise.ar(amp),
        trig: Impulse.kr(0),

        maxdelaytime: 0.1,
        delaytime: freq.reciprocal,
        decaytime: decay,
        coef: coef);
    Out.ar(0, [snd, snd]);
}).add;
)

// Example 1
(
Pbind(
    \instrument, "plucking",
    \freq, Pwhite(440, 880),
    \amp, 0.1,
    \decay, 4,
    \coef, 0.1,
    \dur, Prand([0.51, 0.1, 0.1], inf)
).play;
)

// Example 2
(
Pbind(
    \instrument, "plucking",
    \scale, Scale.locrian,
    \degree, Pwhite(7, 15),
    \amp, Pwhite(0.1, 0.5),
    \decay, Pwhite(7, 12),
    \coef, Pwhite(0.01, 0.1),
    \dur, Prand([0.1, 0.2, 0.4, 0.27, 0.13, 0.38], inf)
).play;
)

// Example 3
(
Pbind(
    \instrument, "plucking",
    \scale, Scale.lydian,
    \degree, Pseq([8, 17, 8, 9, 8, 17, 7], inf),
    \amp, Pwhite(0.1, 0.5),
    \decay, Pwhite(1, 2),
    \coef, Pseq([0.7, 0.8, 0.4], inf),
    \dur, Prand([0.1, 0.2, 0.4], inf)
).play;
)

// Example 4
(
Pbind(
    \instrument, "plucking",
    \degree, Pseq([-5, -2, 1, 4, 6, 9], inf),
    \mtranspose, -7,
    \amp, Pwhite(0.2, 0.3),
    \decay, Pseq([7, 6, 6, 5, 4, 3], inf),
    \coef, Pseq([0.45, 0.3, 0.3, 0.2, 0.2, 0.1], inf),
    \dur, Prand([0.9, 0.8, 0.7], inf)
).play;

Pbind(
    \instrument, "plucking",
    \degree, Prand([0, 1, 3, 4, 6, Pseq([7, 8, 9], 1), 9], inf),
	\mtranspose, 7,
    \amp, Pwhite(0.4, 0.5),
    \decay, Pwhite(6, 10),
    \coef, Pseq([0.05, 0.1, 0.15], inf),
    \dur, Prand([0.1, 0.2, 0.4, Rest(0.3)], inf)
).play;

)
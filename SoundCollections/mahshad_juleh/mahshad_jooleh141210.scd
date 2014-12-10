Server.default.boot;

Server.default.prepareForRecord;

Server.default.record;


(

5.do{

{FreeVerb.ar(1 / pow(2.718281,

LFSaw.ar(rrand(10,100),1,1).squared / (2 *

(Latch.ar(WhiteNoise.ar(1).range(0.001, 0.15),

LFSaw.ar(4,1,0.5,0.5) > 0.99)).squared)) * 0.1,

0.33, 2) * EnvGen.kr(Env.linen(20, 40, 20, 1),

doneAction: 2) ! 2}.play
}
)


(

15.do{

{FreeVerb.ar(1 / pow(2.718281,

LFSaw.ar(rrand(5,10),1,1).squared / (2 *

(Latch.ar(WhiteNoise.ar(1).range(0.001, 0.15),

LFSaw.ar(4,1,0.5,0.5) > 0.99)).squared)) * 0.1,

0.33, 2) * EnvGen.kr(Env.linen(20, 40, 20, 1),

doneAction: 2) ! 2}.play
}
)


(

25.do{

{FreeVerb.ar(1 / pow(2.718281,

Saw.ar(rrand(5,10),1,1).squared / (2 *

(Latch.ar(BrownNoise.ar(1).range(0.001, 0.15),

Saw.ar(4,1,0.5,0.5) > 0.99)).squared)) * 0.1,

0.33, 2) * EnvGen.kr(Env.linen(20, 40, 20, 1),

doneAction: 2) ! 2}.play
}
)

(

25.do{

{FreeVerb.ar(1 / pow(2.718281,

SinOsc.ar(rrand(100,6),1.5,1).squared / (2 *

(Latch.ar(LFNoise0.ar(1).range(0.001, 0.15),

Saw.ar(4,1,0.5,0.5) > 0.99)).squared)) * 0.1,

0.33, 2) * EnvGen.kr(Env.linen(20, 40, 20, 1),

doneAction: 2) ! 2}.play
}
)

(

25.do{

{FreeVerb.ar(1 / pow(2.718281,

SinOsc.ar(rrand(100,600),1.5,1).squared / (3 *

(Crackle.ar(LFNoise1.ar(1).range(0.001, 0.15),

Saw.ar(4,1,0.5,0.5) > 0.99)).squared)) * 0.1,

0.33, 2) * EnvGen.kr(Env.linen(200, 40, 120,

1), doneAction: 2) ! 2}.play

}
)


Ndef(\b, { LFDNoise0.ar(500)});
Ndef(\c, { LFDNoise1.ar(0.3).range(5,15)});
Ndef(\d, { LFDNoise3.ar(SinOsc.kr(0.1, 0, 1000, 300), 200, 200)});
Ndef(\a, { Limiter.ar(GVerb.ar(SinOsc.ar(Ndef(\d), mul: Ndef(\b)), roomsize: Ndef(\c)  ) )});
Ndef(\a).play;


(

fork{
  loop{
    play{
     Splay.ar(
       {Formlet.ar(
          Crackle.ar(2,0.03),
          73.rand.midicps,
          0.0005)
        *EnvGen.kr(Env.perc,1,1,0,9,2)
       }!5)
    };
    9.rand.wait;
   }
};

)


Server.default.stopRecording;







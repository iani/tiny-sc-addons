

3 =!> \fadeTime;

//:
(degree: [20, 22].pseq, dur: 0.5) => \riff;

//:
(degree: [10, 11].pseq) => \riff;

//:
(amp: [0.04, 0.04, 0.1].pseq) %> \riff;

//:
(instrument: [\bassfoundation, \ordandonor, \sine].prand) %> \riff;

//:
(dur: [0.1 pn: 10, 1, 0.3 pn: 5].pseq, legato: { 0.5 exprand: 3 }.pfunc ) +> \riff;

//:
(degree: Pwhite(-20, 20, inf)) +> \riff

//:
(degree: Pstutter(2, Pbrown(-15, 15, 1, inf)) + [10, 11].pseq) +> \riff;

//:
(legato: [0.5 ! 15, 20].flat.prand) +> \riff;

//:
(amp: [Pfuncn({ 0 }, 40), [0.01, 0.01, 0.01].pseq(1) ! 10].flat.prand) %> \riff;

//:
(dur: Pbrown(0.02, 0.15, 0.01, inf)) +> \riff;

//:
(amp: { 0.001 exprand: 0.3 }.pfunc) %> \riff;

//:
(degree: (-20..20).prand) %> \riff;

//:
(note: (-10, -9 .. 12).prand) %> \riff

//:
(dur: 0.1) +> \riff;

//:
\riff fadeOut: 5;


//: 
\test fadeOut: 5;


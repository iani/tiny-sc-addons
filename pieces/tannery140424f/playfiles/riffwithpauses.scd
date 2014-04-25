

3 =!> \fadeTime;

//:
(degree: [20, 22].pseq, dur: 0.5) => \test;

//:
(degree: [10, 11].pseq) => \test;

//:
(amp: [0.04, 0.04, 0.1].pseq) %> \test;

//:
(instrument: [\sine, \bassfoundation].prand) %> \test;

//:
(dur: 0.05) +> \test;

//:
(degree: Pbrown(10, 15, 1, inf)) +> \test

//:
(degree: Pstutter(2, Pbrown(-15, 15, 1, inf)) + [10, 11].pseq) +> \test;

//:
(legato: [0.5 ! 15, 20].flat.prand) +> \test;

//:
(amp: [Pfuncn({ 0 }, 40), [0.04, 0.04, 0.1].pseq(1) ! 10].flat.prand) %> \test;

//:
(dur: Pbrown(0.02, 0.15, 0.01, inf)) +> \test;

//:
(amp: { 0.001 exprand: 0.3 }.pfunc) %> \test;

//:
(degree: (-20..20).prand) %> \test;

//:
(note: (-10, -9 .. 12).prand) %> \test

//:
(dur: 0.1) +> \test;

//:
\test fadeOut: 5;



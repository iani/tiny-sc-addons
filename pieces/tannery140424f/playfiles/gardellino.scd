`\gardellino => \gardellino;
//:
3 => ~stepper;
0 => ~steppermin;
2 => ~steppermax;
5 => ~stepperstep;

10 => ~ratelo;
100 => ~ratehi;

40 => ~sweep;
60 => ~sweep2;
30 => ~lo;
50 => ~hi;
0.14 => ~form1;
1/89 => ~form2;
//:
`\boombah => \boombah;
//:
53 => ~pfreq;
329 => ~mystery;
334 => ~mystery2;

5 => ~d1;
5 => ~d2;
7 => ~d4;
12 => ~d4;

//:
`\mysterymetals => \mysterymetals;
3 => ~pulse;
2000 => ~spulse;

(pulse: (1..10).pseq, dur: 1) *> \mysterymetals;

(pulse: (1..10).pseq, dur: 1, spulse: (100, 200..2000).pseq) *> \mysterymetals;

(pulse: { 0.1 exprand: 10 }.pfunc, dur: 1, spulse: (100, 200..2000).pseq) *> \mysterymetals;
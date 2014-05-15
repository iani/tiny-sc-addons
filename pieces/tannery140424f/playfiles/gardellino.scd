`\gardellino => \gardellino;
//:
3 => ~stepper;
0 => ~steppermin;
2 => ~steppermax;
5 => ~stepperstep;

10 => ~lo;
100 => ~hi;

40 => ~sweep;
60 => ~sweep2;
30 => ~lo;
50 => ~hi;
0.01 => ~form1;
1/99 => ~form2;
//: patterns!
(stepper: (0.1, 0.2..5).pseq, dur: 1) *> \gardellino;
//:
(stepper: (0.1, 0.2..5).pseq, lo: Pwhite(10, 100, inf), dur: 1) *> \gardellino

//:
(stepper: (0.1, 0.2..5).pseq,
lo: Pwhite(10, 100, inf),
hi: Pwhite(100, 1000, inf),
dur: 1) *> \gardellino
//:
(stepper: (0.1, 0.2..5).pseq,
lo: Pwhite(10, 100, inf),
hi: Pwhite(100, 1000, inf),
dur: 0.1) *> \gardellino
//:
(stepper: (0.1, 0.2..5).pseq,
lo: Pwhite(10, 100, inf),
hi: Pwhite(100, 1000, inf),
form1: Pbrown(0.01, 0.5, 0.1, inf),
form2: Pbrown(1/99, 1/10, 0.01, inf),
dur: 3) *> \gardellino

//:
\gardellino fadeOut: 3;

//: Record:
Server.default.record;

//: Stop recording
Server.default.stopRecording;
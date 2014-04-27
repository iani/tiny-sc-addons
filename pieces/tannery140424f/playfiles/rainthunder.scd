
`\rainthunder => \rainthunder2;

//: origs:

40 => ~lo; 
50 => ~hi; 
7000 => ~freq;
250 => ~a250;
100 => ~noiselo;
2500 => ~nosehi;

//:

10 => ~lo;
20 => ~hi; 

1000 => ~freq;
100 => ~a250;
20 => ~noiselo;
200 => ~nosehi;

//:

(
lo: (10..100).pseq,
dur: 0.1
) *> \rainthunder;


//:

(
hi: (50..1000).pseq,
dur: 0.1
) *> \rainthunder;

//:

(
freq: Pbrown(100, 10000, 100, inf),
dur: Pbrown(0.1, 1, 0.1, inf),
amp: Pbrown(0.01, 0.3, 0.1, inf),
hi: (50..1000).prand,
lo: (50..1000).prand,
) *> \rainthunder;

//:

(
freq: Pbrown(10, 100, 10, inf),
dur: Pbrown(0.1, 1, 0.1, inf),
amp: Pbrown(0.01, 0.05, 0.1, inf),
hi: (50..60).prand,
lo: (10..20).prand
) *> \rainthunder;

//:
\rainthunder2.fadeOut(5);
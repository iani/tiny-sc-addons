//:

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
(
pfreq: ((1..10) * 53).pseq,
mystery: ((1..10) * 53).pseq,
mystery: ((1..90) * 10).pseq,
dur: Pbrown(0.1, 2, 0.1, inf)
) *> \boombah;

//:
\boombah.resetParams;
//:
\boombah.fadeOut(5);
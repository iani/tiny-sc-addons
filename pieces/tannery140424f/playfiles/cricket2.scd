//:

`\cricket2 => \cricket2;

//:

58.82 => ~imprate;
1000 => ~sdurmul;
4500 => ~bpfadd;
50 => ~bpfmul;
300 => ~bpfrec;
9000 => ~bpfadd2;
500 => ~bpfrec2;
4000 => ~sdurmul2;

//:

40 => ~imprate;
500 => ~sdurmul;
400 => ~bpfadd;
10 => ~bpfmul;
100 => ~bpfrec;
500 => ~bpfadd2;
500 => ~bpfrec2;
2000 => ~sdurmul2;

//:

(dur: 1, imprate: (10..100).pseq1) *> \cricket2;

//:
(dur: 0.1, sdurmul: (100..10000).pseq1) *> \cricket2;

//:
(dur: 0.1, bpfadd: (100..10000).pseq1) *> \cricket2;

//:
(dur: 0.1, bpfmul: (10..100).pseq1) *> \cricket2;


//:
(dur: 1, bpfmul: (1..1000).prand) *> \cricket2;

//:
(dur: Pwhite(0.1, 5, inf), imprate: (1..1000).prand) *> \cricket2;
//:
(dur: Pwhite(0.1, 5, inf), bpfadd: (100, 1000).prand) *> \cricket2;
//:
(dur: 0.1, sdurmul: (100..10000).pseq) *> \cricket2;
//:





// Not so good. Controls not clear. 

`\cicada => \cicada;

//: no effect? 
0.1 => ~trigrate;
7000 => ~pole1;
10000 => ~pole2;
15000 => ~pole3;
15500 => ~pole4;

//: yes effect!!!!
2000 => ~bpfl;

8000 => ~bpfr;

//:  no effect!
0.9 => ~val1l;
64 => ~val1r;
16 => ~val2l;
//: yes effect
10 => ~recip;
50 => ~sinfreq;
1000 => ~samplemul;

//:
(dur: 1, bpfl: (100, 200 .. 2000).pseq, bpfl: (150, 250 .. 2000).pseq) *> \cicada;
(dur: 0.1, recip: (1..100).pseq, sinfreq: (10, 20 .. 2000).pseq) *> \cicada;
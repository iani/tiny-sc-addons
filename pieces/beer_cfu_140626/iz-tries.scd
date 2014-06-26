// =====================================================================
// SuperCollider Workspace
// =====================================================================

Server.killAll;

`\boat +> \test;



`\bassfoundation => \test;


\test.start;


{ WhiteNoise.ar(\level.kr(0.1)) } => \test;

`\boombah => \test;

\test.params;

\test.start;
//: test

0.1 =>.amp 'test';
0 =>.fadeIn 'test';
1 =>.gate 'test';
0.1 =>.level 'test';
0 =>.out 'test';
1 =>.timeScale 'test';
//:

//: test
`\boombah => \test;

1 =>.amp 'test';
100 =>.d1 'test';
100 =>.d2 'test';
100 =>.d3 'test';
100 =>.d4 'test';
100 =>.dutyRate 'test';
0 =>.fadeIn 'test';
1 =>.gate 'test';
114 =>.mystery 'test';
240 =>.mystery2 'test';
0 =>.out 'test';
20.2 =>.pfreq 'test';
1 =>.timeScale 'test';

{ LFDNoise1.kr(0.5).range(10, 20) } =>.pfreq \test;

{ LFDNoise1.kr(0.1).range(1, 100) } =>.d1 \test;

{ LFDNoise1.kr(0.1).range(1, 100) } =>.d2 \test;

{ LFDNoise1.kr(1).range(1, 100) } =>.d3 \test;

{ LFDNoise1.kr(1).range(1, 100) } =>.dutyRate \test;

{ LFDNoise1.kr(1).range(1, 100) } =>.mystery \test;

{ LFDNoise1.kr(1).range(40, 300) } =>.mystery2 \test;


\test.resetParams;


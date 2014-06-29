// =====================================================================
// SuperCollider Workspace
// =====================================================================

Server.killAll;

Server.default.serverRunning;

`\bassfoundation => \test;

500 +>.freq \test;

5 +>.amp \test;

{ SinOsc.ar(5).range(400, 500) } +>.freq \test;

\test.fadeOut(10);

\test.start;


{ WhiteNoise.ar(1.5) } => \test2;

`\boombah => \test2;

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

//:
\test.params;

/: test

1 =>.amp 'test';
5 =>.d1 'test';
5 =>.d2 'test';
5 =>.d3 'test';
7 =>.d4 'test';
1 =>.dutyRate 'test';
0 =>.fadeIn 'test';
1 =>.gate 'test';
329 =>.mystery 'test';
334 =>.mystery2 'test';
0 =>.out 'test';
53 =>.pfreq 'test';
1 =>.timeScale 'test';
//:

1 =>.amp 'test';
100 =>.d1 'test';
100 =>.d2 'test';
100 =>.d3 'test';
1000 =>.d4 'test';
1 =>.dutyRate 'test';
0 =>.fadeIn 'test';
1 =>.gate 'test';
114 =>.mystery 'test';
130 =>.mystery2 'test';
0 =>.out 'test';
100.2 =>.pfreq 'test';
1 =>.timeScale 'test';

{ LFDNoise1.kr(0.5).range(10, 20) } =>.pfreq \test;

{ LFDNoise1.kr(0.1).range(1, 100) } =>.d1 \test;

{ LFDNoise1.kr(0.1).range(1, 100) } =>.d2 \test;

{ LFDNoise1.kr(1).range(1, 100) } =>.d3 \test;

{ LFDNoise1.kr(1).range(1, 100) } =>.dutyRate \test;

{ LFDNoise1.kr(1).range(1, 100) } =>.mystery \test;

{ LFDNoise1.kr(1).range(40, 300) } =>.mystery2 \test;




{ Line.kr(20.2, 200, 10) } =>.pfreq \test;

{ Line.kr(20.2, 200, 10) } =>.pfreq \test;

{ Line.kr(20, 200, 10) } =>.d1 \test;
{ Line.kr(20, 200, 10) } =>.d2 \test;
{ Line.kr(20, 200, 10) } =>.d3 \test;
{ Line.kr(20, 200, 10) } =>.d4 \test;

{ Line.kr(200, 20, 10) } =>.d2 \test;

{ Line.kr(200, 20, 10) } =>.d3 \test;

{ Line.kr(200, 20, 10) } =>.d4 \test;
{ Line.kr(1, 200, 10) } =>.dutyRate \test;
{ Line.kr(200, 20, 10) } =>.d1 \test;

\test.resetParams;


//:
\rainthunder => \rainthunder2;

0.1 +>.amp \rainthunder2;

{ LFDNoise1.kr(1).range(0, 0.1) } +>.amp \rainthunder2;

//:
\rainthunder2.params;



//:

\mysterymetals => \mysterymetals;

20 +>.amp \mysterymetals;

20 +>.amp \rainthunder;

{ GrayNoise.ar(0.1) * (LFDNoise1.kr(\rate.kr(4)) > 0) } => \justnoise;

{ GrayNoise.ar(0.1) * (LFDNoise1.kr(\rate.kr(1)) > 0) } => \justnoise;

400 +>.rate \justnoise;

0.2 +>.amp \justnoise;

{ LFNoise0.kr(4).range(1, 4) } +>.rate \justnoise;

{ GrayNoise.ar(0.1) * (LFDNoise1.kr(\rate.kr(4)) > 0) } => \justnoise;

{ Ringz.ar(Inp.ar, \freq.kr(400), \time.kr(0.1) ) } => \ringz;

\justnoise =<> \ringz;

0.01 +>.amp \justnoise;

{ LFDNoise3.kr(0.1).range(3000, 000) } +>.freq \ringz;

{ Dust.ar(\rate.kr(50)) } => \justnoise;





(degree: )
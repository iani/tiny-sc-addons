\sine => \test;

\prophet5pwmstrings => \test;

\freq -> (30..80).midicps.prand => \test;

\lfowidth -> 0.2 => \test;

\test.legato = [0.4 pn: 5, 0.8 pn: 5, 2].prand;

{ 0.01.exprand(0.2).round(0.1) }.pfunc * Pstutter(20, [1, 1.5, 2, 0.5].prand, inf) =>.d \test;

//:
{ 0.01.exprand(0.2).round(0.1) }.pfunc 
* Pstutter(20, [1 pn: 3, 1.5, 2, 0.5 pn: 5].prand, inf) =>.d \test;

//:

`\sine => \test;

880 => ~freq;

=>


[880, 550].pseq => \freq;

[440, 880].pseq -> 0.1 => ~freq;

[440, 880, 700].pseq --> \freq;

\freq -> 440 => \test;

\freq -> [440, 880].prand => \test;

\freq -> [440, 660, 880].prand => \test;

\freq -> [440, 550, 660, 880].prand => \test;

\freq -> [440, 550, 660, 770, 880].prand => \test;

\freq -> [440, 550, 660, 770, 880, 990].prand => \test;

\freq -> [330, 440, 550, 660, 770, 880, 990].prand => \test;

\freq -> [220, 330, 440, 550, 660, 770, 880, 990].prand => \test;
//:

\freq --> 440;

\freq --> [440, 880].prand;

\freq --> [440, 660, 880].prand;

\freq --> [440, 550, 660, 880].prand;

\freq --> [440, 550, 660, 770, 880].prand;

\freq --> [440, 550, 660, 770, 880, 990].prand;

\freq --> [330, 440, 550, 660, 770, 880, 990].prand;

\freq --> [220, 330, 440, 550, 660, 770, 880, 990].prand;

//:

//:
`\singleoscillatorwobble => \test1;

0.05 => ~amp;

//:
((15..25).prand * 3 + Pstutter((1..5).prand, (1..3).prand, inf)).midicps 
=> 0.1 => ~freq;
//:
0.01 => ~lfowidth;

//:



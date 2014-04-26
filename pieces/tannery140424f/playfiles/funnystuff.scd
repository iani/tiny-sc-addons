

//:
`\bassfoundation => \funnyStuff;

//:
{ 60.rrand(90).midicps }.pfunc => [0.1, 0.1, 0.2].pseq *> \freq;

//:
`\basshighend => \funnyStuff;

//:
`\werkitd => \funnyStuff;

//:
1000 *> \freq;

//:
(dur: 0.1, freq: [1, 2, 3].pseq * 1000) *> \funnyStuff;

//:
(dur: 0.05, freq: (1..13).pseq * 100, amp: [0.01, 0.01, 0.2, 0.03].pseq) *> \funnyStuff


//:
`\bassfoundation => \funnyStuff;

//:
`\organdonor => \funnyStuff;

//:
`\everythingrhodes => \funnyStuff;

//:

(dur: [0.1 pn: 15, 0.05 pn: 30, 0.01 pn: 100].prand,
freq: (1..13).pseq * 100,
amp: [0.01, 0.01, 0.2, 0.03].pseq) *> \funnyStuff;






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

(dur: [0.4 pn: 15, 0.6 pn: 30, 1.2 pn: 10].pseq,
freq: [(20..1).pseq1 * 50, (1..20).pseq1 * 50].pseq,
amp: [0.01, 0.01, 0.2, 0.03].pseq) *> \funnyStuff;


//:
\funnyStuff fadeOut: 5;
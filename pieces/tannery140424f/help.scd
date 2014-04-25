/*
Reference - because tiny-sc is too fresh.

Fri, Apr 25 2014, 10:22 EEST
*/

//: Sending patterns to parameters of synths in SynthTree. 
`\basshighend => \test;
//:
{ 60.rrand(90).midicps }.pfunc => [0.1, 0.1, 0.2].pseq *> \freq;
//: You can change the instrument, the pattern keeps changing
`\bassfoundation => \test;
//:
`\werkitd => \test;
//:
1000 *> \freq;
//:
(dur: 0.1, freq: [1, 2, 3].pseq * 1000) *> \test;
//:
(dur: 0.05, freq: (1..13).pseq * 100, amp: [0.01, 0.01, 0.2, 0.03].pseq) *> \test

//:
`\bassfoundation => \test;
//:
`\organdonor => \test;
//:
`\everythingrhodes => \test;
//: Funny effects
(
(dur: [0.1 pn: 15, 0.05 pn: 30, 0.01 pn: 100].prand,
freq: (1..13).pseq * 100, 
amp: [0.01, 0.01, 0.2, 0.03].pseq) *> \test;
)

//: ...
(
(dur: 0.1,
freq: [ [200, 400].pseq(3) * 1.2, [300, 400].pseq(5) pn: 1, (1..15).pseq1 * 100].prand, 
amp: 0.1) *> \test;
)
//: Playing patterns in multiple parameters
/*
Sending an Event to a Symbol plays patterns to all parameters of the corresponding SynthTree with the same duration pattern.   Here is a sequence that also shows how to chuck SynthDef templates into the SynthTree to change the playing synth.
*/

//: Sending patterns to parameters of synths in SynthTree.
`\basshighend => \funnyStuff;
//: Play a single parameter with a duration pattern
{ 60.rrand(90).midicps }.pfunc => [0.1, 0.1, 0.2].pseq *> \freq;
//: You can change the instrument, the pattern keeps changing
`\bassfoundation => \funnyStuff;
//:
`\werkitd => \funnyStuff;
//: The pattern can be also set to play a single value
1000 *> \freq;
//: An event sets both the duration and the parameter
(dur: [0.1, 0.1].prand, freq: (1..300).prand * 100) *> \funnyStuff;
(dur: [0.1, 0.1].prand, freq: (1..300).prand * 100, amp: (0.1, 0.2 .. 0.5).pchoose * 0.1) *> \funnyStuff;
(dur: [1, 1].prand, freq: (1..300).prand * 100, amp: (0.1, 0.2 .. 0.5).pchoose * 0.1) *> \funnyStuff;
//: An event sets both the duration and the parameter
(dur: [0.01, 10].prand, freq: (1..3).pseq * 1000) *> \funnyStuff;
//: An event sets both the duration and the parameter
(dur: [0.01, 10].prand, freq: (1..3).prand * 1000) *> \funnyStuff;
//: Multiple parameters can be set
(dur: 0.05, freq: (1..13).pseq * 100, amp: [0.1, 0.1, 0.05, 0.5].pseq) *> \funnyStuff

(dur: [0.5, 0.5].prand, freq: (3..8).pseq * 400) *> \funnyStuff;

~dur;

~dur = 1.5;

//: Change the instrument again
`\bassfoundation => \funnyStuff;
//: And again
`\organdonor => \funnyStuff;
//: And again
`\everythingrhodes => \funnyStuff;
//: Funny effects
(
(dur: [0.1 pn: 15, 0.05 pn: 30, 0.01 pn: 100].prand,
freq: (1..13).pseq * 100,
amp: [0.01, 0.01, 0.2, 0.03].pseq) *> \funnyStuff;
)
//:

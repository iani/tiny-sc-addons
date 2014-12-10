//: Playing events directly in SynthTree
//: Set a longish fade time to observe cross-fading
3 =!> \fadeTime;
//: Start playing an EventPattern in a SynthTree (similar to Pbind)
(degree: [20, 22].pseq, dur: 0.5) => \test;
//: Change the pattern on the fly
(degree: [10, 11].pseq, amp: 3) => \test;
//: Modify a parameter in the SynthTree
(amp: [1, 1, 0.2].pseq) +> \test;
//: And nother parameter
(instrument: [\sine, \bassfoundation].prand) +> \test;
//: Change tempo, modifying the stream's event
(dur: 0.05) +> \test;
//: Wander about
(degree: Pbrown(10, 15, 1, inf)) +> \test
//: Wander about differently
(degree: Pstutter(2, Pbrown(-25, 1, 1, inf)) + [10, 11, 14].pseq) +> \test;
//: Insert some held notes
(legato: [0.5 ! 15, 20].flat.prand) +> \test;
//: And silences
(amp: [Pfuncn({ 0 }, 40), [1, 14, 2.1].pseq(1) ! 10].flat.prand) +> \test;
//: Vary the pulse
(dur: Pbrown(0.02, 0.15, 0.01, inf)) +> \test;
//: Modify amplitude
(amp: { 0.001 exprand: 2.3 }.pfunc) +> \test;
//: Modify degree
(degree: (-20..20).prand) +> \test;
//: Use note instead of degree (non-diatonic)
(note: (-10, -9 .. 12).prand) +> \test
//: Modify duration again
(dur: 0.1) +> \test;
//: Fade-out
\test fadeOut: 5;

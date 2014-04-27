
//: Start a named pattern reference in a SynthTree
Edef(\simple, (degree: [1, 2, 3].pseq, amp: 0.3)) => \wander;

//: Change the named pattern Edef.  (Edef(\simple) =< ... also possible)
\simple =< (degree: Pbrown(-5, 5, 3, inf));
//: Modify some more
\simple =< (degree: Pbrown(-5, 5, 3, inf), dur: (1, 0.99 ..0.125).pseq1);
//:
\simple =< (dur: 0.125, amp: 0.3);

//:
\simple =< (dur: [0.125, 0.125, 0.125, 0.25, 0.25, 1, 0.5, 0.5].prand, amp: 0.3);

//: And more
\simple =< (instrument: [\bassfoundation, \organdonor].prand);

//: Many keys in event OK
\simple =< (legato: { 0.4 exprand: 1.5 }.pfunc, amp: [Pn(0.1, 3), 0.1, 0.05, 0.05].pseq);

//: Modify how the synthtree interprets the stream
(degree:{if(~degree%3==0){~degree+(0..2)*[2,3].choose}{~degree}})%>\wander;

//: Add another SynthTree playing from the same stream as \wander
\wander cloneInto: \other;

//: Modify how the second SynthTree plays the stream
(degree: { 20 + ~degree }, ratio: 0.5) %> \other;

//: Like it? Lets have more:
(degree: { (10, 19 .. 32) + ~degree }) %> \other;

//: Hm, up there a little louder:
(amp: { Pbrown(0.5, 2, 0.1, inf).asStream * (~amp ? 0.01) }) %> \other;

//: Or maybe try playing inverse amplitude:
(amp: { 1 - (~amp ? 0.01) / 10 }) %> \other;

//: See if propagation works
Edef(\simple) =< (degree: Pwhite(-10.1, -12, inf));
//: OK
Edef(\simple) =< (degree: (-10..10).pyramid(5).pseq);
//: OK
Edef(\simple) =< (degree: (10..-10).pyramid(5).pseq);

//:
Edef(\simple) =< (degree: [1, 2].pseq);
//: Pauses? Suddenly a whiff of baroque.
(
(amp: [0, 0, 0.1, 0.2, 0.05].pseq, degree: { ~degree }) %> \wander;
(amp: [0, 0.1].pseq, degree: { 2 + ~degree }) %> \other;
)
//: Try some modulation
(
\simple =< (mtranspose: Pstutter(12, (-4..2).pseq),
	ctranspose: Pstutter(24, ((0..5) * 5 % 12).pseq),
	scale: Scale.harmonicMinor
);
)
//: Fade out
\wander.fadeOut(5);
\other.fadeOut(10);
#+END_EXAMPLE


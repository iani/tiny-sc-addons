

//:
`\mysterymetals => \mysterymetals2;
3 => ~pulse;
2000 => ~spulse;

(pulse: (1..10).pseq, dur: 1) *> \mysterymetals2;

(pulse: (1..10).pseq, dur: 1, spulse: (100, 200..2000).pseq) *> \mysterymetals2;

(pulse: { 0.1 exprand: 10 }.pfunc, amp: 0.05, dur: 1, spulse: (100, 200..2000).pseq) *> \mysterymetals2;

(pulse: { 0.1 exprand: 10 }.pfunc, dur: 0.15, spulse: (100 .. 2000).prand) *> \mysterymetals2;

\mysterymetals2 fadeOut: 10;

\mysterymetals2.asSynthTree.start;

\mysterymetals2.resetParams;

//:
\gardellino.fadeOut;
//:
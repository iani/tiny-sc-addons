

//:
`\mysterymetals => \mysterymetals;
3 => ~pulse;
2000 => ~spulse;

(pulse: (1..10).pseq, dur: 1) *> \mysterymetals;

(pulse: (1..10).pseq, dur: 1, spulse: (100, 200..2000).pseq) *> \mysterymetals;

(pulse: { 0.1 exprand: 10 }.pfunc, dur: 1, spulse: (100, 200..2000).pseq) *> \mysterymetals;

\mysterymetals fadeOut: 10;

\mysterymetals.asSynthTree.start;
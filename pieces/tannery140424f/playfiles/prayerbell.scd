



Edef(\bells, (dur: Pwhite(0.2, 10, inf), instrument: \prayer_bell)) => \prayer_bell;

\bells =< (degree: Pwhite(0, 15), level: Pwhite(0.1, 0.9, inf));

Synth(\prayer_bell, [freq: 2000]);


(instrument: \prayer_bell, freq: 1000, dur: 2, sing_switch: 0).play;

 => \prayer_bell;


Edef(\bells2, (dur: Pwhite(2, inf), instrument: \prayer_bell)) => \prayer_bell2;

\bells2 =< (degree: Pwhite(-10, -2), level: Pwhite(0.1, 0.9, inf));

Synth(\prayer_bell, [freq: 2000]);

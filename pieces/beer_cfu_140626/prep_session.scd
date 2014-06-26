
{ Crackle.ar( LFNoise0.kr(\r.kr(16)).range(0.1, 1.75), 0.1, 0.1 ) } => \crackle;

{ Crackle.ar( LFNoise0.kr(\r.kr(16)).range(\lo.kr(0.01), \hi.kr(1.75)), 0.1, 0.1 ) } => \crackle;

{ Crackle.ar( LFDNoise0.kr(\r.kr(16)).range(\lo.kr(0.01), \hi.kr(1.75)), 0.1, 0) } => \crackle;

40 =>.r \crackle;

0.01 =>.lo \crackle;

1.75 =>.hi \crackle;

1 =>.lo \crackle;

5 =>.hi \crackle;

5 =>.amp \crackle;

1 =>.r \crackle;

4 =>.r \crackle;

{ LFNoise0.kr(1).range(0, 5) } =>.amp \crackle;

{ Ringz.ar(Inp.ar, \freq.kr(400), \t.kr(1) )} => \ringz;

{ LFDNoise1.kr(\rate.kr(1).range(\lo.kr(300), \hi.kr(3000))) } =>.freq \ringz;

{ LFDNoise1.kr(\rate.kr(10).range(\lo.kr(3000), \hi.kr(5000))) } =>.freq \ringz;

500 =>.freq \ringz;

{ LFNoise0.kr(0.5).range(0, 2.1) * LFNoise0.kr(1).round(1) } =>.amp \ringz;

{ LFNoise0.kr(14).range(LFNoise1.kr(0.2).range(300, 600), LFNoise1.kr(0.2).range(700, 1200)) } =>.freq \ringz;

\crackle =<> \ringz; 

{ GrayNoise.ar(0.1) } => \noise;

{ LFDNoise0.ar(LFDNoise1.kr(0.4).range(0.1, 10)) > 0 * LFDNoise1.kr(1).range(0.1, 0.5) } =>.amp \noise;

(degree: [10, 20].pwhite, dur: 0.1, instrument: \bassfoundation) => \pat;

(amp: [0, 0 pn: 30, 0.1 pn: 5, 0.4].prand) +> \pat;

(dur: 1) +> \pat;



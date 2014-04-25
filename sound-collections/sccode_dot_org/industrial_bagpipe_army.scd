/*
«Industrial bagpipe army» by wondersluyter on 17 Feb'14 23:44 in subtractive synthesis
Today's attempt at making something with a beat.. Gets interesting when you slow the tempo way down :) https://soundcloud.com/sluyterrific/industrial-bagpipe-army

http://sccode.org/1-4VK

Copied: Sun, Apr 13 2014, 22:02 EEST

*/
(
{
  var tempo = 100;
  var bps = tempo / 60;
  
  var kik_phase = LFNoise1.kr(bps / 2, 0.03);
  var kik_impulse = Impulse.ar(bps, kik_phase, LFNoise1.kr(bps).range(5, 15));
  var kik, kik_low;
  
  var buzz_phase = Demand.kr(Impulse.kr(bps), 0, Dseq(0.5 ! 5 ++ 0, inf)) + LFNoise1.kr(bps / 2, 0.03);
  var buzz_impulse = Impulse.ar(bps, buzz_phase, LFNoise1.kr(bps).range(5, 15));
  var buzz;

  var clap;
  
  var melody_phase = LFNoise1.kr(bps / 2, 0.08);
  var melody_impulse = Impulse.ar(bps * 2, melody_phase);
  var melody_ratio = Demand.ar(melody_impulse, 0, Drand((6..16), inf));
  var melody, melody2;
  var melody2_gate = LFPulse.kr(bps / 24, 0.5);
  
  var freq_root = LFPulse.kr(bps / 48, 0.125, 0.875, 12, 88);
  
  kik = Splay.ar({ |n|
    var impulse = kik_impulse;
    Ringz.ar(
      LPF.ar(impulse, 200),
      10 + Rand(0, 50).round(5), 
      bps.reciprocal
    )
    +
    Ringz.ar(
      PinkNoise.ar(Decay.ar(impulse, bps.reciprocal)),
      LFNoise1.kr(bps).exprange(500, 1000),
      0.01,
      0.05
    )
    +
    Ringz.ar(
      PinkNoise.ar(Decay.ar(impulse, bps.reciprocal)),
      LFNoise1.kr(bps).exprange(1000, 2000),
      0.01,
      0.1
    );
  }.dup(10)).tanh;
  
  kik_low = LPF.ar(kik, 200);
  kik = kik + ([kik_low[1], kik_low[0]] * 0.8);
  
  buzz = Splay.ar({ |n|
    var impulse = buzz_impulse;
    Ringz.ar(
      WhiteNoise.ar(Decay.ar(impulse, bps.reciprocal / 2)),
      LFNoise1.kr(bps / 8).range(4 * freq_root, 7 * freq_root).round(freq_root).lag2(0.5) + (n * freq_root),
      bps.reciprocal * (LFNoise1.kr(bps).range(3, 6) / ((n + 1) * 0.5))
    );
  }.dup(15).scramble).tanh;
  
  clap = Splay.ar({ |n|
    var phase = LFNoise1.kr(bps, 0.05);
    var pulse = LFPulse.ar(bps, phase, 0.5);
    var impulse = Impulse.ar(bps, phase + 0.5);
    (BPF.ar(
      WhiteNoise.ar(Integrator.ar((pulse * 0.0001), 0.9999) * pulse),
      800 + (n * 50),
      0.4
    ) * 5) 
    +
    (BPF.ar(
      WhiteNoise.ar(Decay.ar(impulse, bps.reciprocal / 2)),
      800 + (n * 50),
      0.4
    ) * 7);
  }.dup(5)).tanh;
  
  melody = Splay.ar({ |n|
    var impulse = melody_impulse;
    var ratio = melody_ratio.lag(0.25 * bps.reciprocal);
    var freq = (ratio * freq_root) - (4 * freq_root);
    Ringz.ar(
      PinkNoise.ar(Decay2.ar(impulse, bps.reciprocal * 0.1, bps.reciprocal * 10)), 
      freq + (freq_root * n), 
      bps.reciprocal,
      0.07 * ratio
    )
  }.dup(4)).tanh;
  
  melody2 = Splay.ar({ |n|
    var impulse = melody_impulse;
    var ratio = melody_ratio.lag(0.25 * bps.reciprocal);
    var freq = (ratio * freq_root) - (4 * freq_root);
    BPF.ar(PinkNoise.ar, freq * (n + 1), 0.05, 100);
  }.dup(4));
  
  melody2 = Compander.ar(melody2, kik + buzz, -20.dbamp, 1, 0.05, 0.001, bps.reciprocal / 2);
  
  Limiter.ar((kik * -4.4.dbamp) + (buzz * -26.dbamp) + (clap * -10.dbamp) + (melody * -30.dbamp) + (melody2 * -3.dbamp * melody2_gate));
}.play;
)
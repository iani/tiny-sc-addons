/*
«All available inputs» by wondersluyter on 11 Dec'13 10:09 in
Type and click while breathing into microphone and still pretend not to be insane

http://sccode.org/1-4Vr

Copied: Sun, Apr 13 2014, 22:00 EEST

*/

(
{
  var input, sig = DC.ar(0);
  // Per-key trigger & envelopes
  var trig, env, qenv;
  // Each key's BPF Q attack time (global)
  var qtime = LFNoise2.kr(1).linexp(-1, 1, 0.1, 1);
  // Master trigger sum
  var master_trig = DC.kr(0);
  
  // Live input plus noise, pitch shifted, with a little dust
  input = ({ (SoundIn.ar(0) * 5) + (PinkNoise.ar * 0.5) } ! 2);
  input = input + PitchShift.ar(input, 0.2, 2, 0.5, 0.1);
  input = input + Dust2.ar(20, 2);
  
  // For each useful key on the keyboard... (123..126 are arrows)
  ((0..100) ++ (123..126)).do { |i|
    trig = KeyState.kr(i, 0, 1, 0);
    master_trig = master_trig + trig;
    env = Decay2.kr(trig, 0.01, 0.1) * 0.1;
    // Start wide, get narrow
    qenv = EnvGen.kr(Env([1, 0.01, 1], [qtime, 0.1], \exp, 1), trig);
    // Randomly shifting frequency, pan strangely
    sig = sig + (BPF.ar(input * env, LFNoise1.kr(0.1).range(10, 100).midicps, qenv) * ({ LFNoise0.kr(1).range(0, 1) } ! 2));
  };
 
  // Mouse funkiness
  master_trig = master_trig + MouseButton.kr(0, 1, 0);
  sig = sig + BMoog.ar(MoogFF.ar(input * Decay2.kr(MouseButton.kr(0, 0.02, 0), 0.001, 0.5), MouseY.kr(500, 10000, \exponential)), MouseX.kr(100, 1000, \exponential), 0.2, 1);
  
  // Integrate master trigger -- longer you hold down more keys, bigger it gets
  master_trig = Integrator.kr(master_trig, 0.999);
  master_trig = master_trig / 2000;
  
  // Mix in a delay at a ratio determined by master trigger
  sig + (AllpassC.ar(sig, 0.05, LFNoise2.kr(1).range(0.01, 0.05), 1) * master_trig);
  
}.play;
)


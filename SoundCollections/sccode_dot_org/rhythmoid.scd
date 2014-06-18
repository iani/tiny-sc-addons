/*
«rhythmoid» by vividsnow on 15 Jun'14 17:38 in sketchsteprhythm
bankrupt robot's dance-machine )

http://sccode.org/1-4Wh

Copied: Wed, Jun 18 2014, 21:30 EEST
*/
//:

({var // rhythmoid
r = 87/59/*MouseX.kr(1,10).linexp(1,10,1/10,10)*/, d = 1/r, l = 8, // tempo, bar dur, beat levels
i = Impulse.ar(r*(2**l)), // base beat
pd = {|...a|PulseDivider.ar(*a)},
q = {|n,s=0,p=0| n=n+l; pd.(i, 2**n, s*2.pow(n-(p?0)-1)) }, // quantizer
e = {|p,d,a|EnvGen.ar(Env.perc(a?0.01,d?0.5),p)}, // perc envelope
s = {|...a|Stepper.ar(*a)},
z=Silent.ar
+Ringz.ar(LPF.ar(q.(0),1800),50,d).tanh
+SinOsc.ar(60,0,e.(q.(0)bitXor:q.(1))*3).tanh.madd(0.3)
+Ringz.ar(LPF.ar(q.(-2)bitXor:q.(0),[400,800]),90,d/2,1/2).mean.tanh
+BrownNoise.ar(e.(q.(0,1),d/4)/12*s.(q.(1),0,1,2))
+WhiteNoise.ar(e.(q.(1,1,2),d/4)/30)
+Blip.ar(360,4,e.(q.(-3)bitXor:q.(-2,1),d/8)/14)
+Formlet.ar(LPF.ar(q.(0)bitXor:q.(1,1,2),2300),350,d/8,d/2,1/2)
+Formlet.ar(LPF.ar(q.(-2,1)bitXor:q.(1,1,3),s.(q.(2),0,80,105,3).midicps),s.(q.(3),0,50,80,5).midicps,d/6,d/4,1/6)
+Saw.ar(400,e.(q.(2,(1..4),3), d/8)*s.(q.(-2),0,0,3)/2)
+Ringz.ar(LPF.ar(q.(-2),[400,800])/2,160,d,s.(q.(2),0,7,14)/14).mean.tanh
+PMOsc.ar(300,490,2,0,e.(q.(2))/6)
+PMOsc.ar(200,890,3,0,e.(q.(2,1))/8)
+Pulse.ar(2900,mul:e.(q.(3)bitXor:q.(2,1),d/3)/12)
+LFPar.ar(1900,mul:e.(q.(0,[1,2],[1,3])bitXor:q.(1,1,2),d/3,5e-3)/7)
+SelectX.ar(s.([q.(1),q.(0)].choose,0,0,3.rrand(7)), Saw.ar(Array.rand(7,500,4500),mul:e.(q.(-2)bitXor:q.(0,3,1), d/3))/19)
+Pulse.ar(s.(q.(3),0,60,80,3).midicps,0.5,e.(q.(-1,2,1),d/4)*2).tanh.madd(1/24)
+LFCub.ar(s.(q.(3),0,80,108,6).midicps).madd(Saw.ar(2490)*e.(pd.(q.(-4)bitXor:q.(-3,1),8,1), d/3)/16)
+Pluck.ar(Impulse.ar(s.(q.(4),0,80,108,6).midicps), q.(-2)bitXor:q.(0,3,1), d, d/18, d/2, -0.4).madd(e.(q.(2),d*8)/3) 

//:
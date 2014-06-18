/*
«Digital Bird sounds» by monodread on 20 May'14 16:14 in tweetsbird
I just rewrote one of autocsi's tweets and came out with this which sounds like a digital bird of some kind:

From: http://sccode.org/1-4Wd

Copied on: Wed, Jun 18 2014, 21:33 EEST
*/
//:
(
Ndef(\birdy, {arg freq=1500, amp=0.5, rate=10;
	var osc, son, convIn, rand;
	osc=LFCub;
	rand = LFNoise1.ar(rate);
	convIn=LinCongN.ar(rate);
	son = osc.ar(Convolution.ar(convIn,convIn));
	freq = Latch.kr(rand.range(0,1).round(0.1), rand) * freq;
	freq = osc.ar(osc.ar(rand)*rand.range(0,10)).range(freq, freq*3);
	son = Formlet.ar(son, freq, convIn.abs*0.1, rand.abs);
	son = Normalizer.ar(son, 0.9, 0.1) * convIn.abs * LFPulse.kr(LFPulse.kr(rand.abs), 0, rand.abs);
	son = son + GVerb.ar(son, 99, 2, mul: rand.range(0,0.3));
	son * amp
}).play
)
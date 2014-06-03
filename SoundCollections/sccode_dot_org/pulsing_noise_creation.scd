/*
«Pulsing noise creation» by wondersluyter on 21 Feb'14 01:48 in noisefilteringpulsing
From a while ago

http://sccode.org/1-4VM

Copied: Sun, Apr 13 2014, 22:03 EEST
*/
(
{
	var t, grav, sf, chain, sig;
	sf = LFPulse.ar(0.5);
	grav = LFNoise2.ar(1).range(0.1, 0.7);
	t = TBall.ar(sf, grav, 0.01, 0.0001) * 10;
	
	chain = FFT(LocalBuf(1024), t);
	chain = chain.pvcalc(1024, {|mags, phases|
		[phases, mags];
	});
	chain = PV_BrickWall(chain, LFNoise2.kr(1).range(-1, 0.5));
	chain = PV_RandComb(chain, LFNoise2.kr(1).range(0, 1), Dust.kr(20));
	sig = IFFT(chain);
	
	sig = sig ! 2;
	sig = sig + AllpassC.ar([sig[1], sig[0]], 0.1, {LFNoise2.kr(0.5).range(0.01, 0.1)} ! 2, 2);
	sig = sig + AllpassC.ar(sig, 0.1, {LFNoise2.kr(0.1).range(0.01, 0.1)} ! 2, 1);
	
	sig = LPF.ar(sig, 15000) + LPF.ar([sig[1], sig[0]], 500, 5) + LPF.ar(sig, 200, 10);
	sig = sig * 10;
}.play;
)
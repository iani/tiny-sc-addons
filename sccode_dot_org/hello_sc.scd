/*
«hello SC» by devilfish404 on 16 Aug'13 13:08 in
my first SC patch. nothing special but i wanted to create something musical that is slightly different each time the code gets evaluated. Needs JoshUgens and maybe others.

http://sccode.org/1-4Ue

Copied: Mon, Apr 14 2014, 00:30 EEST
*/
//:

(
{ var arr, x, c, y, p, n, ff, fx, fy, pp, ppv, ppb, ppbv, d, dd, ddarr, ddarrs, ddd, dddd, clar, cl, cn, cy, cs, fl, z1, z2, mx, v, out;

	arr = [60,74,65,64,62,67,69,65,64,62].scramble.midicps;
	n = arr.size;
	x = Impulse.kr(8);
	c = Stepper.kr(CoinGate.kr(0.8,x),0,0,n-1);
	y = Select.kr(c, arr);
	p = Lag2.kr(y,0.01);
	ff = { rrand(100, 2000) } ! n;
	fx = Select.kr(c, ff);
	fl = Lag2.kr(fx, SinOsc.kr(0.2, 0, 1, 1));
	z1 = SinOsc.ar(p,0,1).tanh;
	fy = MoogVCF.ar(z1, fl, 0.6).tanh.clip2;
	v = FreeVerb2.ar(fy, fy, SinOsc.kr( 0.2, 0.9, 0.08, 0.3), 1);



	ddarr =  [38, 38, 38, 42, 42, 36, 36].midicps;
	ddarrs = ddarr.size;
	d = Stepper.kr(PulseDivider.kr(x, 4), 1, 0, ddarrs-1);
	dd = Select.kr(d, ddarr);
	ddd = SinOsc.ar(dd, 0, 0.2).tanh;

	pp = HPF.ar(BPF.ar(Saw.ar([440,330], 0.1), fx, 1 ), 400);
	ppb = DelayC.ar(pp, 0.2, SinOsc.kr(0.1, 0, 1, 0), 1, 0.5);
	ppv = FreeVerb.ar(pp, pp, 0.5, 0.5, 1);

	clar = [0.1, 0.3, 0.1];
	cn = clar.size;
	cl = Stepper.kr(CoinGate.kr(0.7,x),0,0,cn-1);
	cy = Select.kr(cl, clar);
	cs = RLPF.ar(WhiteNoise.ar(cy)*0.7, SinOsc.kr(0.1, 0, 500, 1500), 0.3, 0.5);


	mx = Limiter.ar(Mix.ar([v, ppv*0.7, ddd*0.7, cs*0.5]));



}.play

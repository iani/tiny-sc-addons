
//:
[
SynthDef(\random303, { 
	var lk = [0,3,7,9], jx = [3,4,2,4,2], n, ox = 10, qw, cx, oi,z,w, faz, mp,
	cs = [Select,Stepper,RLPF,LFTri,Pulse,PulseDivider,Lag2,Lag,EnvGen,
		Saw, LPF, PitchShift, AllpassN, Env, LocalIn, LocalOut, Impulse ];
	var fa,ffa, ra, eca, era, fsa, xc, fxc, rq, ec, er,xcs, o,e;
	mp = { |n,alk| alk = alk ? lk;                      
		{midicps(jx .choose * 12 + lk.choose) } !n };   
	faz = [ mp.(3)* 2.midiratio, mp.( 3 )
		*1. midiratio, mp.( 2,[ 0,3,9 ])*5.midiratio,mp.(1 )*1.midiratio ]; 
	fa = faz[[3,0,3,1,2,2,2,2, 1,1,1,1,0,3]].flat; 
	n = fa.size;          
	qw = Impulse.kr(10); 
	cx = PulseDivider.kr(qw, n); 
	oi = Stepper.kr(qw,0,0,n-1); 
	fsa = { [0,0,0, 0.02,0.08,0.1 ].choose }!div(n,4);  
	xcs = Select.kr( Stepper.kr( qw,0,0,fsa.size-1 ), fsa); 
	xc = Lag2.kr( Select.kr(oi, fa), xcs ); 
	ffa = { rrand( 20, 90 ) } ! n;
	ffa.size.do({ |i| var pn = [2,4,8].choose;
		if ( 0.2.coin, { ffa[i] = Select.kr(Stepper.kr(cx, 0,0,pn-1), { rrand( 4, 70 ) } ! n) }) });
	fxc = Lag2.kr( Select.kr(oi, ffa), 0.04);
	ra = { rrand(0.05,0.5) } ! n;
	rq = Lag.kr( cs[0].kr(oi, ra), 0.04);
	eca = { [-4,0,-1].choose } ! n;
	ec = Select.kr(oi,eca);
	o = Saw.ar(xc) + Pulse.ar(xc * 0.01.midiratio,1-rq) + Pulse.ar(xc *0.04.midiratio,LFTri.ar(ox/n).range(0.1,0.9),0.02) + Pulse.ar(xc *
		24.midiratio,LFTri.ar(ox/n/4).range(0.8,0.01),0.05);
	era = { rrand(0.8,0.4) } ! 4;
	er = Select.kr(cs[1].kr(qw, 0,0,3), era);
	e = Env.new([0,1,0],[xcs/5,er],ec);
	e = EnvGen.kr(e, gate:qw);
	fxc = fxc * [1.02, 0.98];
	xc = xc * [0.8,1.2].scramble;
	z = cs[2].ar(o, (fxc * e).midiratio * xc, rq) + (cs[2].ar(o.neg, fxc * (50 * e)
		.midiratio, 0.4) *0.05) + (cs[2].ar(o.neg, fxc * (65 * e).midiratio, rq/2) *0.01) * e;
	z = (z + (cs[11].ar(z,0.001,0.5,0.1,0.1).distort * 0.5)).distort;
	w = z+ cs[14].ar (2). distort;
	10.do({ w = cs[12].ar(w,0.4,{0.03.rand}!2,{0.06.rand}!2) });
	cs[15].ar(cs[10].ar( w*0.9,800 )); 

	((w *0.1 ) + (z * 0.7)).ladsrOut;

}), 
] do: { | sd | SynthTemplate(sd.name, sd.add, ['sccode-instruments']) };


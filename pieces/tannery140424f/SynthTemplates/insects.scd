
[
SynthDef("cricket1", { | 
	sawfreq = 1.43 sawmul = 0.5 sawadd = 0.5
	mod2mul = 40.6
	mod3mul = 3147
	mod3mul2 = 0.3

	|
	var modulator, mod1, mod2, mod3;
	
	// repeat time is 0.7s: equates to 1.43 Hz.
	modulator = LFSaw.ar(sawfreq, 1, sawmul, sawadd);
	mod2 = (modulator * mod2mul * 2pi).cos.squared;
	mod3 = modulator * mod3mul;
	mod3 = (mod3 * 2pi).cos + ((mod3 * 2 * 2pi).cos * mod3mul2);
	mod1 = ((Wrap.ar(modulator.min(0.1714) * 5.84) - 0.5).squared * (-4) + 1) * (mod2 * mod3);
	mod1 = (mod1 * 0.1)!2;
	mod1.ladsrOut;
}),
SynthDef("cricket2", { | 
	imprate = 58.82
	sdurmul = 1000
	bpfadd = 4500
	bpfmul = 50
	bpfrec = 300
	bpfadd2 = 9000
	bpfrec2 = 500
	sdurmul2 = 4000
	|

	var trig, seq, demand, cricket;
	
	// instead of [metro], Impulse.kr is used here. Delta t = 17 ms equates to 58.82 Hz.
	trig = Impulse.kr(imprate);
	
	// the main idea of the following line was to use an approach
	// that uses the same coefficients as described in the pd patch
	seq = Dseq(Array.fill(41, {|i| if(i<7, {(i+2)/9},{0}) }),inf);
	demand = Demand.kr(trig,0,seq);
	
	// Implementation of the pd code for pulses including amplitude grow:
	// cricket = EnvGen.ar(Env.new([0, 1, 1, 0], [0.0001, 0.0001, 0]), trig) * demand;
	
	// 2nd implementation: pure data seemed to slightly disobey its own specifications, 
	// so I analysed the waveform and came up with this:
	cricket = EnvGen.ar(Env.new([0, 1, 0], [4/44100, 0]), trig) * demand;
	
	
	cricket = OnePole.ar(cricket, exp(-2pi * (sdurmul * SampleDur.ir)));
	cricket = (
			// changed the Q factor of the first 3 BPFs to approximate farnells sound 
			BPF.ar(cricket, bpfadd + ((0..2)*bpfmul), bpfrec.reciprocal, 100)).sum 
			+ BPF.ar(cricket, bpfadd2, bpfrec2.reciprocal, 42
	);		   
	cricket = ((cricket - OnePole.ar(cricket, exp(-2pi * (sdurmul2 * SampleDur.ir)))) * 0.5)!2;
	cricket.ladsrOut
}),
SynthDef("cicada", { | 
	trigrate = 0.1
	pole1 = 8000
	pole2 = 8000
	pole3 = 10000
	pole4 = 10000
	bpfl = 7500
	bpfr = 5500
	|
	var sig, trig, seq, freq, mul, vals;
	
	trig = Impulse.kr(trigrate);
	vals = [
		[0.5, 128],
		[8,6],
		[30,3]
	];
	freq = TChoose.kr(trig, vals);
	
	sig = WhiteNoise.ar;
	// The one pole filters in pure data and SC differ, so I changed the coefficents 
	// a little. Also the  multiplication by 5 is not in the book, but helps to 
	// approach the audible result of Farnells patch.
	sig = (sig - OnePole.ar(sig, exp(-2pi * (pole1 * SampleDur.ir))));
	sig = (sig - OnePole.ar(sig, exp(-2pi * (pole2 * SampleDur.ir))));
	sig = OnePole.ar(sig, exp(-2pi * (pole3 * SampleDur.ir)));
	sig = OnePole.ar(sig, exp(-2pi * (pole4 * SampleDur.ir)));
	sig = sig * 5;

		
	sig = BPF.ar(sig, [bpfl, bpfr], 40.reciprocal).sum * SinOsc.ar(500);
	sig = sig * (1 / (SinOsc.ar( freq[0], 0, freq[1] ).squared + 1));
	sig = (sig - OnePole.ar(sig, exp(-2pi * (4000 * SampleDur.ir)))) * 4.dup;
	sig.ladsrOut
})

] do: { | sd | SynthTemplate(sd.name, sd.add, ['tannery', 'insects']) };
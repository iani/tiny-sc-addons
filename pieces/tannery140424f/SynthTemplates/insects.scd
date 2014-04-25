
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
})

] do: { | sd | SynthTemplate(sd.name, sd.add, ['tannery', 'insects']) };
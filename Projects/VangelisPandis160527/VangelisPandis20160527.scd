
// Wind
//:
~wind = { | freq = 1000 |
	// Alternative: 
	// freq = \freq.kr (1000);
	LPF.ar (
		WhiteNoise.ar (0.2),
		freq
	)
}.play
//:
~wind = { | freq = 1000 |
	// Alternative: 
	// freq = \freq.kr (1000);
	Resonz.ar (
		WhiteNoise.ar (2.2),
		freq,
		0.01
	)
}.play
//:

~wind.set (\freq, 2500);

//:

~player = {
	loop {
		~wind.set (\freq, 400 exprand: 2000);

		0.1.wait;
	}
}.fork;

//: adding sequences of time and frequency

~player = {
	var dt, freq;
	dt = Pseq ([0.1, 0.2, 0.5, 0.1, 1], inf).asStream;
	freq = Pseq ([60, 63, 65, 67, 70].midicps * 2, inf).asStream;
	loop {
		~wind.set (\freq, freq.next);

		dt.next.wait;
	}
}.fork;
/// Wed, Jun 11 2014, 12:42 EEST
// Courtesy of Alexandros Aggelakis

(
SynthDef.new(\fast, {
arg freq=440, at = 0.005, rl = 0.3, dc = 0.05, amp = 1, pan=0, cutoffL = 20000, cutoffH = 100, gate = 0.5;
	var sig, env;
 
 
	sig = VarSaw.ar(freq: freq/2, mul: amp*1.5) ;
	env = EnvGen.ar(Env.perc(at, rl, dc, -4), doneAction:2);
	sig = Pan2.ar(sig, pan, amp);
	sig = LPF.ar(sig, cutoffL);
	sig= HPF.ar(sig, cutoffH);
	sig = sig * env;
	Out.ar(0, sig);
 
 
}).add;
)
 
 
 
(
SynthDef.new(\fast2, {
arg freq=440, at = 0.005, rl = 0.3, dc = 0.05, amp = 1, pan=0, cutoffL = 20000, cutoffH = 100, gate = 0.5;
	var sig, env;
 
 
	sig = VarSaw.ar(freq: freq/2, mul: amp*1.5) *  VarSaw.ar(freq: freq/4, mul: amp*1.5);
	env = EnvGen.ar(Env.perc(at, rl, dc, -4), doneAction:2);
	sig = Pan2.ar(sig, pan, amp);
	sig = LPF.ar(sig, cutoffL);
	sig= HPF.ar(sig, cutoffH);
	//sig = sig * env * gate;
	sig = sig * env;
	Out.ar(0, sig);
 
 
}).add;
)
 
 
(
Pdef(
\fastpat,
	Pbind(
	\instrument, \fast,
		\dur, Pseq([0.15], inf),
		//\freq, Pwrand([100, 101, 102, 104, 109, 103.2]/2, [1, 2, 3, 10, 11, 5].normalizeSum, inf).trace(prefix:"Freq: "),
		\midinote, Pwhite(4.0, 50.0, inf).trace(prefix:"M: "),
		\harmonic, Pexprand(1, 30, inf).trace(prefix:"harm: "),
		\at, Pwhite(4.0, 5.0, inf),
		\rl, Pwhite(5.0, 10.0, inf),
		\dc, 1,
		\amp, Pkey(\harmonic).reciprocal * 0.3,
		\pan, Pwhite(-0.8, 0.8, inf).trace(prefix:"P: "),
		\cutoffL, Pwhite(199, 2000, inf).trace(prefix:"L: "),
		\cutoffH, Pwhite(10, 150, inf).trace(prefix:"H: "),
		\amp, 0.5,
 
 
	);
 
);
 
)
 
 
Pdef(\fastpat).play
Pdef(\fastpat).stop
(
 
 
a =
 
Pmul(\amp, 0.5,
 
Pfsm([
    #[0, 1, 1, 3], // entry states
 
    //e1 (== state 0)
    Pbind(
		\instrument, \fast,
		//\fast,
		\dur, Pseq(#[0.05], 40),
		//\gate, Pseq([Pseq(#[1], 99), 0], 1),
		\midinote, Pwhite(12, 30.0, inf).trace(prefix:"(0)"),
		\harmonic, Pexprand(1, 14, inf),
		\at, Pwhite(10, 20, inf),
		\rl, Pwhite(4, 6, inf),
		\dc, 1,
		\amp, Pkey(\harmonic).reciprocal * 0.3,
		\pan, Pwhite(-0.8, 0.8, inf),
		\cutoffL, Pwhite(1990, 20000, inf),
		\cutoffH, Pwhite(10, 150, inf),
		\amp, 0.4,
	     ),
    #[2, 2, 4, 3, 5],
    //e2 (== state 1)
   Pbind(
		\instrument, \fast,
		//\fast,
		\dur, Pseq(#[0.15], 7),
		//\gate, Pseq([Pseq(#[1], 99), 0], 1),
		\midinote, Pwhite(80, 100.0, inf).trace(prefix:"(1)"),
		\harmonic, Pexprand(1, 30, inf),
		\at, Pwhite(4.0, 5.0, inf),
		\rl, Pwhite(5.0, 10.0, inf),
		\dc, 1,
		\amp, Pkey(\harmonic).reciprocal * 0.3,
		\pan, Pwhite(-0.8, 0.8, inf),
		\cutoffL, Pkey(\harmonic).reciprocal*2000,
		\cutoffH, Pwhite(10, 150, inf),
		\amp, 0.6,
	     ),
		#[6, 6, 3, 3, 6, 0, 4, 5],
 
		//state 2
		Pbind(
		\instrument, \fast2,
		//\fast,
		\dur, Pwhite(1/64, 1/60, 27),
		//\gate, Pseq([Pseq(#[1], 99), 0], 1),
		\midinote, Pwhite(50, 76, inf).trace(prefix:"(2)"),
		\harmonic, Pexprand(1, 40, inf).round,
		\at, Pwhite(0.1, 0.4, inf),
		\rl, Pwhite(1.2, 4.3, inf),
		\dc, 1,
		\amp, Pkey(\harmonic).reciprocal * 0.3,
		\pan, Pwhite(-0.8, 0.8, inf),
		\cutoffL, Pwhite(19999, 20000, inf),
		\cutoffH, Pwhite(10, 150, inf),
		\amp, Pwrand([0.3, 0.2, 0.1, 0.9], [4, 4, 3, 0.5].normalizeSum, inf),
	     ),
		#[0, 1, 1, 1, 2, 3],
 
		//state3
 
		Pbind(
			\instrument, \bufLF,
			\at, Pseq([1, 1, 1, 1]/80, inf),
			\rl, Pseq([4], inf),
			\dur, Pwhite(0.1, 2, 2).trace(prefix:"(3)"),
			\startp, Pwhite(2*44100, 37*44100, inf ),
			\ch, Pseq([0, 1], inf),
			\sound, Pseq([f], inf),
			\rate, Pwhite(0.6, 1.5, inf),
			\cutoffL, Pseq([20000], inf),
			\cutoffH, Pseq([10], inf),
			\mixx, Pseq([0, 0, 0, 0.3], inf),
			\rooom, 0,
			\dampp, Pseq([0.4], inf),
			\vol,   Pseq([1, 1.5, 1.5, 1.5, 4]*0.5, inf)
 
),
		#[5, 6, 3, 3, 4, 2, 2],
 
 
			//state4
 
		Pbind(
			\instrument, \bufLF,
			\at, Pseq([1, 1, 1, 1]/800, inf),
			\rl, Pseq([0.1], inf),
			\dur, Pwhite(0.01, 0.2, 20).trace(prefix:"(4)"),
			\startp, Pwhite(2*44100, 20*44100, inf ),
			\ch, Pseq([0, 1], inf),
			\sound, Pseq([g], inf),
			\rate, Pwhite(4, 40, inf),
			\cutoffL, Pseq([2000], inf),
			\cutoffH, Pseq([500], inf),
			\mixx, Pseq([0, 0, 0, 0.3], inf),
			\rooom, 0,
			\dampp, Pseq([0.4], inf),
			\vol,   Pseq([1, 1.5, 1.5, 10, 2]*0.25, inf)
 
),
		#[1, 4, 4, 5, 5, 6],
 
					//state5
 
		Pbind(
			\instrument, \bufLF,
			\at, Pseq([1, 1, 1, 1]/800, inf),
			\rl, Pseq([10], inf),
			\dur, Pwhite(0.4, 0.7, 10).trace(prefix:"(5)"),
			\startp, Pwhite(0.1*44100, 140*44100, inf ),
			\ch, Pseq([0, 1], inf),
			\sound, Pseq([h], inf),
			\rate, Pwhite(1, 15, inf),
			\cutoffL, Pseq([2000], inf),
			\cutoffH, Pseq([500], inf),
			\mixx, Pseq([0, 0, 0, 0.3], inf),
			\rooom, 0,
			\dampp, Pseq([0.4], inf),
			\vol,   Pseq([1, 1.5, 1.5, 2, 2]*0.65, inf)
 
),
		#[6, 4, 0, 5],
 
 
 
		//state 6
 
		Pbind(
			\instrument, \bufLF,
			\at, Pseq([1, 1, 1, 1]/800, inf),
			\rl, Pseq([0.1], inf),
			\dur, Pwhite(0.01, 0.2, 20).trace(prefix:"(6)"),
			\startp, Pwhite(0.01*44100, 0.1*44100, inf ),
			\ch, Pseq([0, 1], inf),
			\sound, Prand([d[\bam]], 10),
			\rate, Pwhite(0.8, 1.2, inf),
			\cutoffL, Pseq([2000], inf),
			\cutoffH, Pseq([500], inf),
			\mixx, Pseq([0, 0, 0, 0.3], inf),
			\rooom, 0,
			\dampp, Pseq([0.4], inf),
			\vol,   Pseq([1, 1.5, 1.5, 3, 4]*0.5, inf)
 
),
		#[1, 4, 4, 5, 7, 0, 1, 4],
		//state7 terminal
		nil, nil
 
 
]))
)
 
a.play
// History, as it was on Fri Apr 25 08:18:31 2014.

[
[ 0, 'me', "a = Live(\"live reheasral\");" ],
[ 2.437906535, 'me', "//" ],
[ 28.287323983, 'me', "Ndef(\\birds).fadeTime = 12;" ],
[ 28.927740377, 'me', "Ndef(\\birds, { BirdSong.ar }).play;" ],
[ 62.573854066, 'me', "o = OSCFunc({ |m| (degree: m[3]).play; }, '/tr');" ],
[ 118.434085541, 'me', "SynthDef(\\bs, { |freq=2 ffreq=29| Out.kr(0, SendTrig.kr(Impulse.kr(freq), 0, SinOsc.kr(ffreq).range(1,12).round)) }).add;" ],
[ 126.780901166, 'me', "x = Synth(\\bs)" ],
[ 178.405397139, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, SinOsc.ar(freq)*Line.ar(1,0,1,1,0,2)/3) }).add;" ],
[ 180.170631506, 'me', "q = OSCFunc({ |m| (instrument: \\sine, degree: m[3]).play; }, '/tr');" ],
[ 197.734894733, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(SinOsc.ar(freq)*Line.ar(1,0,1,1,0,2)/3)) }).add;" ],
[ 218.087839971, 'me', "SynthDef(\\cs, { |freq=3 ffreq=19| Out.kr(0, SendTrig.kr(Impulse.kr(freq), 0, SinOsc.kr(ffreq).range(1,12).round)) }).add;" ],
[ 230.279519035, 'me', "y = Synth(\\cs);" ],
[ 310.565206217, 'me', "fork{
	12.do{ |i|
		x.set(\\ffreq, (12..29).choose);
		1.wait;
	}
}" ],
[ 337.420019725, 'me', "fork{
	12.do{ |i|
		i.post;
		// first x changes in range
		x.set(\\ffreq, (12..29).choose);
		1.wait;
	}
}" ],
[ 371.005329443, 'me', "fork{
	12.do{ |i|
		i.post;
		// first x changes in range
		x.set(\\ffreq, (12..29).choose);
		//
		y.set(\\ffreq, (2..19).choose);
		1.wait;
	}
}" ],
[ 371.231311676, 'me', "fork{
	12.do{ |i|
		i.post;
		// first x changes in range
		x.set(\\ffreq, (12..29).choose);
		//
		y.set(\\ffreq, (2..19).choose);
		1.wait;
	}
}" ],
[ 388.792213053, 'me', "fork{
	12.do{ |i|
		i.post;
		// first x changes in range
		x.set(\\ffreq, (12..29).choose.post);
		//
		y.set(\\ffreq, (2..19).choose.postln);
		1.wait;
	}
}" ],
[ 405.182449757, 'me', "fork{
	12.do{ |i|
		i.post;
		// first x changes in range
		x.set(\\ffreq, (12..29).choose.post);
		//
		y.set(\\ffreq, (2..19).choose.postln);
		1.wait;
	}
}" ],
[ 420.734507673, 'me', "fork{
	12.do{ |i|
		i.post;
		// first x changes in range
		x.set(\\ffreq, (12..29).choose.post);
		//
		y.set(\\ffreq, (2..19).choose.postln);
		1.wait;
	}
}" ],
[ 437.232739286, 'me', "fork{
	12.do{ |i|
		i.post;
		// first x changes in range
		x.set(\\ffreq, (12..29).choose.post);
		//
		y.set(\\ffreq, (200,400..3900).choose.postln);
		1.wait;
	}
}" ],
[ 476.935526666, 'me', "	FreqScope.new" ],
[ 610.001774691, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2,0,Line.ar(1,0,1,1,0,2))))) }).add;" ],
[ 624.403203182, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2,0,Line.ar(1,0,1,1,0,2)), SinOsc.ar(19).range(200,3000)))) }).add;" ],
[ 628.756100602, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2,0,Line.ar(1,0,1,1,0,2)), SinOsc.ar(1.9).range(200,3000)))) }).add;" ],
[ 629.787933903, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2,0,Line.ar(1,0,1,1,0,2)), SinOsc.ar(1.19).range(200,3000)))) }).add;" ],
[ 660.378517482, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,1,1,0,2)), SinOsc.ar(1.19).range(200,3000))), SinOsc.kr(13))) }).add;" ],
[ 663.781197157, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,1,1,0,2)), SinOsc.ar(1.19).range(200,3000))), SinOsc.kr(23))) }).add;" ],
[ 665.153415253, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,1,1,0,2)), SinOsc.ar(1.19).range(200,3000))), SinOsc.kr(3))) }).add;" ],
[ 666.445448467, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,1,1,0,2)), SinOsc.ar(1.19).range(200,3000))), SinOsc.kr(13))) }).add;" ],
[ 670.690369112, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,1,1,0,2)), SinOsc.ar(1.19).range(200,3000))), SinOsc.kr(16))) }).add;" ],
[ 680.986858362, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,1,1,0,2)), SinOsc.ar(1.19).range(200,11000))), SinOsc.kr(16))) }).add;" ],
[ 686.101231623, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,1,1,0,2)), SinOsc.ar(1.19).range(200,11000))), SinOsc.kr(26))) }).add;" ],
[ 687.996476524, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,1,1,0,2)), SinOsc.ar(1.19).range(200,11000))), SinOsc.kr(16))) }).add;" ],
[ 695.373584033, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(CombN.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,1,1,0,2)), SinOsc.ar(1.19).range(200,11000))), SinOsc.kr(16))) }).add;" ],
[ 703.636884911, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,1,1,0,2)), SinOsc.ar(1.19).range(200,11000))), SinOsc.kr(16))) }).add;" ],
[ 743.837193929, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(CombN.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.1,1,0,2)), SinOsc.ar(1.19).range(200,11000), SinOsc.kr(29).abs)), SinOsc.kr(16))) }).add;" ],
[ 749.805595776, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(CombN.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.1,1,0,2)), SinOsc.ar(1.19).range(200,11000))), SinOsc.kr(16))) }).add;" ],
[ 757.348853409, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(CombN.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.3,1,0,2)), SinOsc.ar(1.19).range(200,11000))), SinOsc.kr(16))) }).add;" ],
[ 767.307642941, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.3,1,0,2)), SinOsc.ar(1.19).range(200,11000))), SinOsc.kr(16))) }).add;" ],
[ 774.267717876, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.3,1,0,2)), SinOsc.ar(1.19).range(200,11000))), SinOsc.kr(126))) }).add;" ],
[ 786.374656033, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.3,1,0,2)), SinOsc.ar(1.19).range(200,11000))), SinOsc.kr(12*Stepper.kr(Impulse.kr(9))))) }).add;" ],
[ 788.266770902, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.3,1,0,2)), SinOsc.ar(1.19).range(200,11000))), SinOsc.kr(12*Stepper.kr(Impulse.kr(19))))) }).add;" ],
[ 789.670023996, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.3,1,0,2)), SinOsc.ar(1.19).range(200,11000))), SinOsc.kr(12*Stepper.kr(Impulse.kr(29))))) }).add;" ],
[ 798.019200809, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.3,1,0,2)), SinOsc.ar(1.19).range(200,11000))), SinOsc.kr(3*Stepper.kr(Impulse.kr(9))))) }).add;" ],
[ 803.42827252, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.3,1,0,2)), SinOsc.ar(1.19).range(200,11000))), SinOsc.kr(3*Stepper.kr(Impulse.kr(9),0,0,24)))) }).add;" ],
[ 805.626783839, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.3,1,0,2)), SinOsc.ar(1.19).range(200,11000))), SinOsc.kr(3*Stepper.kr(Impulse.kr(9),0,0,24,2)))) }).add;" ],
[ 807.661394407, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.3,1,0,2)), SinOsc.ar(1.19).range(200,11000))), SinOsc.kr(3*Stepper.kr(Impulse.kr(19),0,0,24,2)))) }).add;" ],
[ 810.279297449, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.3,1,0,2)), SinOsc.ar(1.19).range(200,11000))), SinOsc.kr(13*Stepper.kr(Impulse.kr(19),0,0,24,2)))) }).add;" ],
[ 812.350021667, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.3,1,0,2)), SinOsc.ar(1.19).range(200,11000))), SinOsc.kr(23*Stepper.kr(Impulse.kr(19),0,0,24,2)))) }).add;" ],
[ 814.551662548, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.3,1,0,2)), SinOsc.ar(1.19).range(200,11000))), SinOsc.kr(13*Stepper.kr(Impulse.kr(19),0,0,24,2)))) }).add;" ],
[ 816.762753241, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.3,1,0,2)), SinOsc.ar(1.19).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(19),0,0,24,2)))) }).add;" ],
[ 819.571505718, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.3,1,0,2)), SinOsc.ar(1.19).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(39),0,0,24,2)))) }).add;" ],
[ 824.591454411, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.3,1,0,2)), SinOsc.ar(1.19).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(39),0,0,48,2)))) }).add;" ],
[ 837.478911685, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.5,1,0,2)), SinOsc.ar(1.19).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(39),0,0,48,2)))) }).add;" ],
[ 842.730644514, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.7,1,0,2)), SinOsc.ar(1.19).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(39),0,0,48,2)))) }).add;" ],
[ 856.519354369, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.7,1,0,2)), SinOsc.ar(1.19*8).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(39),0,0,48,2)))) }).add;" ],
[ 860.02635755, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.7,1,0,2)), SinOsc.ar(1.19*18).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(39),0,0,48,2)))) }).add;" ],
[ 861.882787556, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.7,1,0,2)), SinOsc.ar(1.19*28).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(39),0,0,48,2)))) }).add;" ],
[ 863.192903529, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.7,1,0,2)), SinOsc.ar(1.19*128).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(39),0,0,48,2)))) }).add;" ],
[ 871.696889457, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.7,1,0,2)), SinOsc.ar(1.19*128).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(9),0,0,48,2)))) }).add;" ],
[ 876.237673527, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.7,1,0,2)), SinOsc.ar(1.19*128).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(9),0,0,12,2)))) }).add;" ],
[ 878.977489616, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.7,1,0,2)), SinOsc.ar(1.19*128).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(9),0,0,24,2)))) }).add;" ],
[ 880.855637375, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.7,1,0,2)), SinOsc.ar(1.19*128).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(0.9),0,0,24,2)))) }).add;" ],
[ 888.684309204, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.7,1,0,2)), SinOsc.ar(1.19*64).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(0.9),0,0,24,2)))) }).add;" ],
[ 891.087311448, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.7,1,0,2)), SinOsc.ar(1.19*128).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(0.9),0,0,24,2)))) }).add;" ],
[ 894.441651224, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.7,1,0,2)), SinOsc.ar(1.19*512).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(0.9),0,0,24,2)))) }).add;" ],
[ 897.215609881, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.7,1,0,2)), SinOsc.ar(1.19*128).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(0.9),0,0,24,2)))) }).add;" ],
[ 905.343359122, 'me', "fork{
	12.do{ |i|
		i.post;
		// first x changes in range
		x.set(\\ffreq, (12..29).choose.post);
		//
		y.set(\\ffreq, (200,300..3900).choose.postln);
		1.wait;
	}
}" ],
[ 913.222580019, 'me', "fork{
	12.do{ |i|
		i.post;
		// first x changes in range
		x.set(\\ffreq, (22..39).choose.post);
		//
		y.set(\\ffreq, (200,300..3900).choose.postln);
		1.wait;
	}
}" ],
[ 928.079362827, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.7,1,0,2)), SinOsc.ar(1.19*128).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(1.9),0,0,24,2)))) }).add;" ],
[ 931.897027797, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.7,1,0,2)), SinOsc.ar(1.19*128).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(1.9),0,0,24,4)))) }).add;" ],
[ 932.920319852, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.7,1,0,2)), SinOsc.ar(1.19*128).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(1.9),0,0,24,3)))) }).add;" ],
[ 982.43236878, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.7,1,0,2)), SinOsc.ar(1.19*128).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(1.9),0,0,24,TChoose.kr(Impulse.kr(1),[2,3]))))) }).add;" ],
[ 988.177960416, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.7,1,0,2)), SinOsc.ar(1.19*128).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(1.9),0,0,24,TChoose.kr(Impulse.kr(1),[3,4]))))) }).add;" ],
[ 990.841735313, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.7,1,0,2)), SinOsc.ar(1.19*128).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(1.9),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]))))) }).add;" ],
[ 995.536428964, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.7,1,0,2)), SinOsc.ar(1.19*128).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(19),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]))))) }).add;" ],
[ 998.369484808, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.7,1,0,2)), SinOsc.ar(1.19*128).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(9),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]))))) }).add;" ],
[ 1000.12745517, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.7,1,0,2)), SinOsc.ar(1.19*128).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]))))) }).add;" ],
[ 1007.558701098, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.57,1,0,2)), SinOsc.ar(1.19*128).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]))))) }).add;" ],
[ 1009.422677131, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.47,1,0,2)), SinOsc.ar(1.19*128).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]))))) }).add;" ],
[ 1011.291720876, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.27,1,0,2)), SinOsc.ar(1.19*128).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]))))) }).add;" ],
[ 1016.179830644, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.127,1,0,2)), SinOsc.ar(1.19*128).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]))))) }).add;" ],
[ 1019.146364745, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.27,1,0,2)), SinOsc.ar(1.19*128).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]))))) }).add;" ],
[ 1026.366255811, 'me', "o.free;" ],
[ 1047.207586586, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.27,1,0,2)), SinOsc.ar(1.19*128).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]*8))))) }).add;" ],
[ 1061.790844329, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.27,1,0,2)), SinOsc.ar(1.19*128).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]*Stepper.kr(Impulse.kr(43))))))) }).add;" ],
[ 1065.562447323, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.27,1,0,2)), SinOsc.ar(1.19*128).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]*Stepper.kr(Impulse.kr(3))))))) }).add;" ],
[ 1074.303021831, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.27,1,0,2)), SinOsc.ar(1.19*128).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]*Stepper.kr(Impulse.kr(3),0,10,40)))))) }).add;" ],
[ 1076.515054231, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.27,1,0,2)), SinOsc.ar(1.19*128).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]*Stepper.kr(Impulse.kr(3),0,10,140)))))) }).add;" ],
[ 1079.347760163, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.27,1,0,2)), SinOsc.ar(1.19*128).range(200,11000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]*Stepper.kr(Impulse.kr(13),0,10,140)))))) }).add;" ],
[ 1093.119676147, 'me', "fork{
	12.do{ |i|
		i.post;
		// first x changes in range
		x.set(\\ffreq, (22..39).choose.post);
		//
		y.set(\\ffreq, (200,300..3900).choose.postln);
		1.wait;
	}
}" ],
[ 1099.333773618, 'me', "fork{
	12.do{ |i|
		i.post;
		// first x changes in range
		x.set(\\ffreq, (22..39).choose.post);
		//
		y.set(\\ffreq, (200,300..3900).choose.postln);
		1.wait;
	}
}" ],
[ 1109.311116197, 'me', "fork{
	12.do{ |i|
		i.post;
		// first x changes in range
		x.set(\\ffreq, (22..39).choose.post);
		//
		y.set(\\ffreq, (1200,1300..3900).choose.postln);
		1.wait;
	}
}" ],
[ 1125.56211192, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.27,1,0,2)), SinOsc.ar(1.19*128).range(200,5000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]*Stepper.kr(Impulse.kr(13),0,10,140)))))) }).add;" ],
[ 1128.904651475, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.27,1,0,2)), SinOsc.ar(1.19*128).range(200,4000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]*Stepper.kr(Impulse.kr(13),0,10,140)))))) }).add;" ],
[ 1130.083563441, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.27,1,0,2)), SinOsc.ar(1.19*128).range(200,3000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]*Stepper.kr(Impulse.kr(13),0,10,140)))))) }).add;" ],
[ 1131.631980845, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.27,1,0,2)), SinOsc.ar(1.19*128).range(200,2000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]*Stepper.kr(Impulse.kr(13),0,10,140)))))) }).add;" ],
[ 1133.229490448, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.27,1,0,2)), SinOsc.ar(1.19*128).range(200,1000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]*Stepper.kr(Impulse.kr(13),0,10,140)))))) }).add;" ],
[ 1134.832859748, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.27,1,0,2)), SinOsc.ar(1.19*128).range(100,1000))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]*Stepper.kr(Impulse.kr(13),0,10,140)))))) }).add;" ],
[ 1139.293523491, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.27,1,0,2)), SinOsc.ar(1.19*128).range(100,800))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]*Stepper.kr(Impulse.kr(13),0,10,140)))))) }).add;" ],
[ 1141.240236861, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.27,1,0,2)), SinOsc.ar(1.19*128).range(100,700))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]*Stepper.kr(Impulse.kr(13),0,10,140)))))) }).add;" ],
[ 1142.737326658, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.27,1,0,2)), SinOsc.ar(1.19*128).range(100,500))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]*Stepper.kr(Impulse.kr(13),0,10,140)))))) }).add;" ],
[ 1144.261356958, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.27,1,0,2)), SinOsc.ar(1.19*128).range(100,400))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]*Stepper.kr(Impulse.kr(13),0,10,140)))))) }).add;" ],
[ 1145.900869357, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.27,1,0,2)), SinOsc.ar(1.19*128).range(100,300))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]*Stepper.kr(Impulse.kr(13),0,10,140)))))) }).add;" ],
[ 1148.199296651, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.27,1,0,2)), SinOsc.ar(1.19*128).range(50,300))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]*Stepper.kr(Impulse.kr(13),0,10,140)))))) }).add;" ],
[ 1153.288273308, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.27,1,0,2)), SinOsc.ar(1.19*128).range(40,300))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]*Stepper.kr(Impulse.kr(13),0,10,140)))))) }).add;" ],
[ 1155.319706774, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.27,1,0,2)), SinOsc.ar(1.19*128).range(40,330))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]*Stepper.kr(Impulse.kr(13),0,10,140)))))) }).add;" ],
[ 1156.942514972, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.27,1,0,2)), SinOsc.ar(1.19*128).range(40,350))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]*Stepper.kr(Impulse.kr(13),0,10,140)))))) }).add;" ],
[ 1158.370758593, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.27,1,0,2)), SinOsc.ar(1.19*128).range(40,360))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]*Stepper.kr(Impulse.kr(13),0,10,140)))))) }).add;" ],
[ 1160.606182536, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.27,1,0,2)), SinOsc.ar(1.19*128).range(40,440))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]*Stepper.kr(Impulse.kr(13),0,10,140)))))) }).add;" ],
[ 1163.67195978, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.27,1,0,2)), SinOsc.ar(1.19*128).range(40,540))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]*Stepper.kr(Impulse.kr(13),0,10,140)))))) }).add;" ],
[ 1166.909978639, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.27,1,0,2)), SinOsc.ar(1.19*128).range(40,640))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]*Stepper.kr(Impulse.kr(13),0,10,140)))))) }).add;" ],
[ 1170.093516637, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.27,1,0,2)), SinOsc.ar(1.19*128).range(40,740))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]*Stepper.kr(Impulse.kr(13),0,10,140)))))) }).add;" ],
[ 1208.938195097, 'me', "			(2.0..1.2).size" ],
[ 1213.375633276, 'me', "			(2.0,1.9..1.2).size" ],
[ 1217.167617129, 'me', "			(2.0,1.9..0.9).size" ],
[ 1227.427572167, 'me', "fork{
	12.do{ |i|
		i.post;
		// first x changes in range
		x.set(\\ffreq, (22..39).choose.post);
		//
		y.set(\\ffreq, (1200,1300..3900).choose.postln);
		x.set(\\freq, (2.0,1.9..0.9)[i]);
		//	(2.0,1.9..0.9).size
		1.wait;
	}
}" ],
[ 1267.088485788, 'me', "		(0.9..0.2).mirror.size" ],
[ 1273.82628172, 'me', "		(0.9,0.8..0.2).mirror.size" ],
[ 1277.938290939, 'me', "		(0.9,0.8..0.3).mirror.size" ],
[ 1278.287134048, 'me', "		(0.9,0.8..0.3).mirror.size" ],
[ 1288.103188989, 'me', "		(0.9,0.8..0.4).mirror2.size" ],
[ 1307.233577997, 'me', "fork{
	12.do{ |i|
		i.post;
		// first x changes in range
		x.set(\\ffreq, (22..39).choose.post);
		//
		y.set(\\ffreq, (1200,1300..3900).choose.postln);
//		x.set(\\freq, (2.0,1.9..0.9)[i]);
		//
		x.set(\\freq, (0.9,0.8..0.4).mirror2[i]);
		
	//	(0.9,0.8..0.4).mirror2.size
		//	(2.0,1.9..0.9).size
		1.wait;
	}
}" ],
[ 1321.6201507, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.7,1,0,2)), SinOsc.ar(1.19*128).range(40,740))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]*Stepper.kr(Impulse.kr(13),0,10,140)))))) }).add;" ],
[ 1324.587205269, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.37,1,0,2)), SinOsc.ar(1.19*128).range(40,740))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]*Stepper.kr(Impulse.kr(13),0,10,140)))))) }).add;" ],
[ 1327.456965926, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.37,1,0,2)), SinOsc.ar(1.19*128).range(40,1740))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]*Stepper.kr(Impulse.kr(13),0,10,140)))))) }).add;" ],
[ 1332.304304539, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.37,1,0,2)), SinOsc.ar(1.19*64).range(40,1740))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]*Stepper.kr(Impulse.kr(13),0,10,140)))))) }).add;" ],
[ 1336.21207016, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.37,1,0,2)), SinOsc.ar(1.19*24).range(40,1740))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]*Stepper.kr(Impulse.kr(13),0,10,140)))))) }).add;" ],
[ 1339.008985761, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.37,1,0,2)), SinOsc.ar(1.19*48).range(40,1740))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]*Stepper.kr(Impulse.kr(13),0,10,140)))))) }).add;" ],
[ 1341.163350336, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, Pan2.ar(FreeVerb.ar(RLPF.ar(SinOsc.ar(freq,0,Line.ar(1,0,0.37,1,0,2)), SinOsc.ar(1.19*48).range(40,740))), SinOsc.kr(9*Stepper.kr(Impulse.kr(7),0,0,24,TChoose.kr(Impulse.kr(3),[3,4]*Stepper.kr(Impulse.kr(13),0,10,140)))))) }).add;" ],
[ 1343.460510585, 'me', "thisProcess.stop" ],
];
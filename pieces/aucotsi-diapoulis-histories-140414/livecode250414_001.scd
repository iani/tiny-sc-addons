// History, as it was on Fri Apr 25 08:58:55 2014.

[
[ 0, 'me', "a = Live(\"Live rehearsal\");" ],
[ 1.4230473120001, 'me', "Record.start;" ],
[ 25.190592567, 'me', "Ndef(\\birds).fadeTime = 12;" ],
[ 26.964546859, 'me', "Ndef(\\birds, { BirdSong.ar }).play;" ],
[ 58.440025665, 'me', "o = OSCFunc({ |m| (degree: m[3]).play}, '/tr');" ],
[ 109.007340249, 'me', "SynthDef(\\bs, { |freq=2 ffreq=29| Out.kr(0, SendTrig.kr(Impulse.kr(freq), 0, SinOsc.kr(ffreq).range(1,12).round)) }).add;" ],
[ 115.894673913, 'me', "x = Synth(\\bs);" ],
[ 163.318483731, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, SinOsc.ar(freq)*Line.ar(1,0,1,1,0,2)/3) }).add;" ],
[ 165.240249066, 'me', "q = OSCFunc({ |m| (instrument: \\sine, degree: m[3]).play}, '/tr');" ],
[ 173.079621203, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3) }).add;" ],
[ 188.005589054, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3)) }).add;" ],
[ 202.269877653, 'me', "SynthDef(\\cs, { |freq=3 ffreq=19| Out.kr(0, SendTrig.kr(Impulse.kr(freq), 0, SinOsc.kr(ffreq).range(1,12).round)) }).add;" ],
[ 219.291500538, 'me', "y = Synth(\\cs);" ],
[ 283.340911626, 'me', "fork{
	12.do { |i|
		x.set(\\ffreq, (19..29).choose );
	}
}" ],
[ 291.573112899, 'me', "fork{
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (19..29).choose.post );
	}
}" ],
[ 300.540348458, 'me', "fork{
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (19..29).choose.post );
		1.wait;
	}
}" ],
[ 317.734082432, 'me', "fork{
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (19..29).choose.post );
		y.set(\\ffreq, (9..29).choose.post );
		1.wait;
	}
}" ],
[ 325.803518768, 'me', "fork{
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (19..29).choose.post );
		y.set(\\ffreq, (9..19).choose.post );
		1.wait;
	}
}" ],
[ 343.419180412, 'me', "fork{
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (19..29).choose.post );
		y.set(\\ffreq, (9..19).choose.post );
		1.wait;
	}
}" ],
[ 351.612944563, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(SinOsc.ar(freq!2)*Line.ar(1,0,0.91,1,0,2)/3)) }).add;" ],
[ 354.139481216, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(SinOsc.ar(freq!2)*Line.ar(1,0,0.81,1,0,2)/3)) }).add;" ],
[ 358.817568224, 'me', "fork{
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (19..29).choose.post );
		y.set(\\ffreq, (9..19).choose.post );
		1.wait;
	}
}" ],
[ 373.383352104, 'me', "fork{
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (19..29).choose.post );
		y.set(\\ffreq, (90,120..900).choose.post );
		1.wait;
	}
}" ],
[ 412.199953965, 'me', "fork{
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (19..29).choose.post );
		y.set(\\ffreq, (90,120..900).choose.post );
		1.wait;
	}
}" ],
[ 436.014478728, 'me', "fork{
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (19..39).choose.post );
		y.set(\\ffreq, (900,1200..2900).choose.post );
		1.wait;
	}
}" ],
[ 453.364635566, 'me', "fork{
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (19..39).choose.post );
		y.set(\\ffreq, (900,1200..2900).choose.post );
		1.wait;
	}
}" ],
[ 468.068884491, 'me', "fork{
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (19..39).choose.post );
		y.set(\\ffreq, (120,140..800).choose.post );
		1.wait;
	}
}" ],
[ 473.575598349, 'me', "fork{
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (19..39).choose.post );
		y.set(\\ffreq, (120,240..2800).choose.post );
		1.wait;
	}
}" ],
[ 489.943028937, 'me', "fork{
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (19..39).choose.post );
		y.set(\\ffreq, (120,240..2800).choose.post );
		1.wait;
	}
}" ],
[ 627.751732013, 'me', "fork{
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (19..39).choose.post );
		y.set(\\ffreq, (220,240..2800).choose.post );
//		x.set(\\ffreq, (19..39).choose.post );
		1.wait;
	}
}" ],
[ 655.402372602, 'me', "		(3.0,2.9..2.2).size" ],
[ 669.600548934, 'me', "fork{
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (19..39).choose.post );
		y.set(\\ffreq, (220,240..2800).choose.post );
		x.set(\\freq, (3.0,2.9..1.9).post );
		//(3.0,2.9..1.9).size
		1.wait;
	}
}" ],
[ 750.67466888, 'me', "		(2.0,1.9..1.9).size" ],
[ 752.842943085, 'me', "		(2.0,1.9..1.1).size" ],
[ 770.678204079, 'me', "fork{
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (19..39).choose.post );
		y.set(\\ffreq, (220,240..2800).choose.post );
		//x.set(\\freq, (3.0,2.9..1.9).post );
		//
		y.set(\\freq, (2.0,1.9..0.9).post );
		//(3.0,2.9..1.9).size
		//(2.0,1.9..0.9).size
		1.wait;
	}
}" ],
[ 780.934356174, 'me', "fork{
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (19..39).choose.post );
		y.set(\\ffreq, (220,240..2800).choose.post );
		x.set(\\freq, (3.0,2.9..1.9).post );
		//
		y.set(\\freq, (2.0,1.9..0.9).post );
		//(3.0,2.9..1.9).size
		//(2.0,1.9..0.9).size
		1.wait;
	}
}" ],
[ 801.287199587, 'me', "fork{
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (19..39).choose.post );
		y.set(\\ffreq, (220,240..2800).choose.post );
		x.set(\\freq, (3.0,2.9..1.9) );
		//
		y.set(\\freq, (2.0,1.9..0.9));
		//(3.0,2.9..1.9).size
		//(2.0,1.9..0.9).size
		1.wait;
	}
}" ],
[ 830.943396509, 'me', "fork{
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (19..39).choose.post );
		y.set(\\ffreq, (220,240..2800).choose.post );
		x.set(\\freq, (3.0,2.9..1.9)[i].post );
		//
		y.set(\\freq, (2.0,1.9..0.9)[i].post );
		//(3.0,2.9..1.9).size
		//(2.0,1.9..0.9).size
		1.wait;
	}
}" ],
[ 847.370829297, 'me', "		(1.9,1.8..0.9)" ],
[ 849.910964375, 'me', "		(1.9,1.8..0.9).size" ],
[ 878.974847347, 'me', "		(0.9..0.5).mirror2.size" ],
[ 881.812199105, 'me', "		(0.9..0.5).mirror2.size" ],
[ 885.790741306, 'me', "		(0.9,0.8..0.5).mirror2.size" ],
[ 916.317854479, 'me', "fork{
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (19..39).choose.post );
		y.set(\\ffreq, (220,240..2800).choose.post );
		x.set(\\freq, (3.0,2.9..1.9)[i].post );
		//
		//(1.9,1.8..0.8).size
//		(0.9,0.8..0.4).mirror2.size
//		y.set(\\freq, (2.0,1.9..0.9)[i].post );
		y.set(\\freq, (0.9,0.8..0.4).mirror2[i]);
		//(3.0,2.9..1.9).size
		//(2.0,1.9..0.9).size
		1.wait;
	}
}" ],
[ 935.371642589, 'me', "		(1.9..1.4).mirror2.size" ],
[ 941.147507842, 'me', "		(1.9,1.8..1.4).mirror2.size" ],
[ 958.636294865, 'me', "fork{
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (19..39).choose.post );
		y.set(\\ffreq, (220,240..2800).choose.post );
		//x.set(\\freq, (3.0,2.9..1.9)[i].post );
		//(1.9,1.8..1.4).mirror2.size
		x.set(\\freq, (1.9,1.8..1.4).mirror2);
		//(1.9,1.8..0.8).size
//		(0.9,0.8..0.4).mirror2.size
//		y.set(\\freq, (2.0,1.9..0.9)[i].post );
		y.set(\\freq, (0.9,0.8..0.4).mirror2[i]);
		//(3.0,2.9..1.9).size
		//(2.0,1.9..0.9).size
		1.wait;
	}
}" ],
[ 975.420307563, 'me', "fork{
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (19..39).choose.post );
		y.set(\\ffreq, (220,240..2800).choose.post );
		//x.set(\\freq, (3.0,2.9..1.9)[i].post );
		//(1.9,1.8..1.4).mirror2.size
		x.set(\\freq, (1.9,1.8..1.4).mirror2);
		//(1.9,1.8..0.8).size
//		(0.9,0.8..0.4).mirror2.size
//		y.set(\\freq, (2.0,1.9..0.9)[i].post );
		y.set(\\freq, (0.9,0.8..0.4).mirror2[i]);
		//(3.0,2.9..1.9).size
		//(2.0,1.9..0.9).size
		1.wait;
	}
}" ],
[ 989.172990888, 'me', "fork{
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (19..39).choose.post );
		y.set(\\ffreq, (220,240..2800).choose.post );
		//x.set(\\freq, (3.0,2.9..1.9)[i].post );
		//(1.9,1.8..1.4).mirror2.size
		x.set(\\freq, (1.9,1.8..1.4).mirror2);
		//(1.9,1.8..0.8).size
//		(0.9,0.8..0.4).mirror2.size
//		y.set(\\freq, (2.0,1.9..0.9)[i].post );
		y.set(\\freq, (0.9,0.8..0.4).mirror2[i]);
		//(3.0,2.9..1.9).size
		//(2.0,1.9..0.9).size
		1.wait;
	}
}" ],
[ 993.256051468, 'me', "fork{
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (19..39).choose.post );
		y.set(\\ffreq, (220,240..2800).choose.post );
		//x.set(\\freq, (3.0,2.9..1.9)[i].post );
		//(1.9,1.8..1.4).mirror2.size
		x.set(\\freq, (1.9,1.8..1.4).mirror2[i]);
		//(1.9,1.8..0.8).size
//		(0.9,0.8..0.4).mirror2.size
//		y.set(\\freq, (2.0,1.9..0.9)[i].post );
		y.set(\\freq, (0.9,0.8..0.4).mirror2[i]);
		//(3.0,2.9..1.9).size
		//(2.0,1.9..0.9).size
		1.wait;
	}
}" ],
[ 1002.677204396, 'me', "		(1.9,1.8..0.8).size" ],
[ 1003.882000759, 'me', "		(1.9,1.8..0.8).size" ],
[ 1004.056164133, 'me', "		(1.9,1.8..0.8).size" ],
[ 1004.240878742, 'me', "		(1.9,1.8..0.8).size" ],
[ 1005.116815649, 'me', "		(1.9,1.8..0.8).size" ],
[ 1005.331483064, 'me', "		(1.9,1.8..0.8).size" ],
[ 1005.477920158, 'me', "		(1.9,1.8..0.8).size" ],
[ 1005.665859627, 'me', "		(1.9,1.8..0.8).size" ],
[ 1005.832007024, 'me', "		(1.9,1.8..0.8).size" ],
[ 1018.103207284, 'me', "fork{
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (19..39).choose.post );
		y.set(\\ffreq, (220,240..2800).choose.post );
		//x.set(\\freq, (3.0,2.9..1.9)[i].post );
		//(1.9,1.8..1.4).mirror2.size
//		x.set(\\freq, (1.9,1.8..1.4).mirror2[i]);
		//
		x.set(\\freq, 		(1.9,1.8..0.8)[i]);
//		(0.9,0.8..0.4).mirror2.size
//		y.set(\\freq, (2.0,1.9..0.9)[i].post );
		y.set(\\freq, (0.9,0.8..0.4).mirror2[i]);
		//(3.0,2.9..1.9).size
		//(2.0,1.9..0.9).size
		1.wait;
	}
}" ],
[ 1052.104831831, 'me', "		(0.8,0.7..0.1).mirror2" ],
[ 1054.473060416, 'me', "		(0.8,0.7..0.1).mirror2.size" ],
[ 1057.201283094, 'me', "		(0.8,0.7..0.3).mirror2.size" ],
[ 1068.867325931, 'me', "fork{
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (19..39).choose.post );
		y.set(\\ffreq, (220,240..2800).choose.post );
		//x.set(\\freq, (3.0,2.9..1.9)[i].post );
		//(1.9,1.8..1.4).mirror2.size
//		x.set(\\freq, (1.9,1.8..1.4).mirror2[i]);
		//
//		x.set(\\freq, (1.9,1.8..0.8)[i]);
//		x.set(\\freq, (0.8,0.7..0.1)[i]);
		x.set(\\freq, 		(0.8,0.7..0.3).mirror2[i]);
//		(0.9,0.8..0.4).mirror2.size
//		y.set(\\freq, (2.0,1.9..0.9)[i].post );
		y.set(\\freq, (0.9,0.8..0.4).mirror2[i]);
		//(3.0,2.9..1.9).size
		//(2.0,1.9..0.9).size
		1.wait;
	}
}" ],
[ 1112.266112822, 'me', "Record.stop;" ],
[ 1115.928611063, 'me', "thisProcess.stop" ],
];
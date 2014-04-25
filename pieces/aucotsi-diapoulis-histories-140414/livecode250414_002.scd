// History, as it was on Fri Apr 25 07:40:09 2014.

[
[ 0, 'me', "a = Live(\"live rehearsal\");" ],
[ 32.488137232, 'me', "Ndef(\\birds).fadeTime = 9;" ],
[ 33.421192475, 'me', "Ndef(\\birds, { BirdSong.ar }).play;" ],
[ 74.923734795, 'me', "o = OSCFunc({ |m| (degree: m[3]).play }, '/tr');" ],
[ 140.069965701, 'me', "SynthDef(\\bs, { |freq=2 ffreq=29| Out.kr(0, SendTrig.kr(Impulse.kr(freq), 0, SinOsc.kr(ffreq).range(1,12).round)) }).add;" ],
[ 155.707303974, 'me', "x = Synth(\\bs);" ],
[ 183.391142383, 'me', "q = OSCFunc({ |m| (instrument: \\sine, degree: m[3]).play }, '/tr');" ],
[ 247.254148795, 'me', "SynthDef(\\sine, { |freq phase amp| Out.ar(0, SinOsc.ar(freq, phase, amp)*Line.ar(1,0,1,1,0,2) ) }).add;" ],
[ 278.25002774, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, SinOsc.ar(freq)*Line.ar(1,0,1,1,0,2)/9 ) }).add;" ],
[ 282.542864827, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, SinOsc.ar(freq)*Line.ar(1,0,1,1,0,2)/3 ) }).add;" ],
[ 292.121381955, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3 ) }).add;" ],
[ 312.324193078, 'me', "SynthDef(\\sine, { |freq amp=0.1| Out.ar(0, SinOsc.ar(freq!2, 0, amp)*Line.ar(1,0,1,1,0,2) ) }).add;" ],
[ 316.51266076, 'me', "SynthDef(\\sine, { |freq amp=1.0| Out.ar(0, SinOsc.ar(freq!2, 0, amp)*Line.ar(1,0,1,1,0,2) ) }).add;" ],
[ 322.868131632, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2) ) }).add;" ],
[ 327.397374421, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3 ) }).add;" ],
[ 333.469706842, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/2 ) }).add;" ],
[ 349.049766307, 'me', "SynthDef(\\cs, { |freq=3 ffreq=19| Out.kr(0, SendTrig.kr(Impulse.kr(freq), 0, SinOsc.kr(ffreq).range(1,12).round)) }).add;" ],
[ 355.106977431, 'me', "y = Synth(\\cs);" ],
[ 367.209691281, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3 ) }).add;" ],
[ 423.77173165, 'me', "fork {
	12.do { |i|
		x.set(\\ffreq, (1..19).choose);
		1.wait;
	}
}" ],
[ 432.516511091, 'me', "fork {
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (1..19).choose);
		1.wait;
	}
}" ],
[ 439.555672717, 'me', "fork {
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (1..19).choose);
		y.set(\\ffreq, (1..19).choose);
		1.wait;
	}
}" ],
[ 447.63759782, 'me', "fork {
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (1..19).choose);
		y.set(\\ffreq, (100,200..4900).choose);
		1.wait;
	}
}" ],
[ 452.772126072, 'me', "fork {
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (1..29).choose);
		y.set(\\ffreq, (100,200..4900).choose);
		1.wait;
	}
}" ],
[ 463.490330555, 'me', "fork {
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (1..29).choose.post);
		y.set(\\ffreq, (100,200..4900).choose.postln);
		1.wait;
	}
}" ],
[ 493.127920893, 'me', "fork {
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (1..29).choose.post);
		y.set(\\ffreq, (100,200..4900).choose.postln);
		1.wait;
	}
}" ],
[ 510.554755399, 'me', "fork {
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (1..29).choose.post);
		y.set(\\ffreq, (100,200..4900).choose.postln);
		1.wait;
	}
}" ],
[ 543.246199721, 'me', "fork {
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (19..29).choose.post);
		y.set(\\ffreq, (200,400..4900).choose.postln);
		1.wait;
	}
}" ],
[ 549.603497867, 'me', "fork {
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (19..29).choose.post);
		y.set(\\ffreq, (20,40..490).choose.postln);
		1.wait;
	}
}" ],
[ 564.57020829, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, 0.6) ) }).add;" ],
[ 566.970080433, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, 0.2) ) }).add;" ],
[ 570.390371432, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, 0.2, 0.001) ) }).add;" ],
[ 574.046775576, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, 0.2, 0.01, 0.01) ) }).add;" ],
[ 579.282244013, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, 0.2, 0.01, 0.5) ) }).add;" ],
[ 583.135479392, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, 0.4, 0.01, 0.5) ) }).add;" ],
[ 585.300874721, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, 0.4, 0.1, 0.5) ) }).add;" ],
[ 588.739554153, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, 0.4, 0.01, 0.5) ) }).add;" ],
[ 597.194476948, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, 0.4, 0.1, 0.5) ) }).add;" ],
[ 599.908186676, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, 0.9, 0.1, 0.5) ) }).add;" ],
[ 602.678035919, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, 0.3, 0.1, 0.5) ) }).add;" ],
[ 646.194860027, 'me', "Record.start;" ],
[ 749.336176363, 'me', "fork {
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (10..29).choose.post);
		y.set(\\ffreq, (10..190).choose.postln);
		1.wait;
	}
}" ],
[ 817.803409849, 'me', "fork {
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (19..29).choose.post);
		y.set(\\ffreq, (10,40..490).choose.postln);
		// after -> y.set(\\ffreq, (10,40..490).choose.postln);
		1.wait;
	}
}" ],
[ 868.225401046, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(29).range(20,2000)), 0.3, 0.1, 0.5) ) }).add;" ],
[ 871.047459192, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(29).range(20,200)), 0.3, 0.1, 0.5) ) }).add;" ],
[ 873.495289838, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(2.9).range(20,200)), 0.3, 0.1, 0.5) ) }).add;" ],
[ 875.826171757, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(2.9).range(20,1200)), 0.3, 0.1, 0.5) ) }).add;" ],
[ 878.781909522, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(2.9).range(120,1200)), 0.3, 0.1, 0.5) ) }).add;" ],
[ 883.584351617, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(1.9).range(120,1200)), 0.3, 0.1, 0.5) ) }).add;" ],
[ 890.759477254, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(0.19).range(120,1200)), 0.3, 0.1, 0.5) ) }).add;" ],
[ 894.662205294, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(1.9).range(120,1200)), 0.3, 0.1, 0.5) ) }).add;" ],
[ 898.960884396, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(1.01).range(120,1200)), 0.3, 0.1, 0.5) ) }).add;" ],
[ 905.467412864, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(1.11).range(120,1200)), 0.3, 0.1, 0.5) ) }).add;" ],
[ 911.452224226, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(1.21).range(120,1200)), 0.3, 0.1, 0.5) ) }).add;" ],
[ 920.963337792, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(1.23).range(120,1200)), 0.3, 0.1, 0.5) ) }).add;" ],
[ 931.130985193, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(1.21).range(120,1200)), 0.3, 0.1, 0.5) ) }).add;" ],
[ 946.745650358, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(1.21).range(120,2200)), 0.3, 0.1, 0.5) ) }).add;" ],
[ 952.568524223, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(1.21).range(120,2200)), 0.3, 0.05, 0.5) ) }).add;" ],
[ 956.101230528, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(1.21).range(120,2200)), 0.63, 0.05, 0.5) ) }).add;" ],
[ 958.517231111, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(1.21).range(120,2200)), 0.43, 0.05, 0.5) ) }).add;" ],
[ 964.022545491, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(1.21).range(120,2200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 971.69556707, 'me', "8* 1.21" ],
[ 976.450204963, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.68).range(120,2200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 979.32022044, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.68/2).range(120,2200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 983.717187004, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.68/4).range(120,2200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 987.557001843, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.68/6).range(120,2200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 992.58954664, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.68/5).range(120,2200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1011.704699442, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.68/5, SinOsc.kr(9)*pi).range(120,2200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1013.887816521, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.68/5, SinOsc.kr(9)).range(120,2200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1017.205594541, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.68/5, SinOsc.kr(0.9)).range(120,2200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1020.556989722, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.68/5, SinOsc.kr(0.9)*pi).range(120,2200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1022.058039758, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.68/5, SinOsc.kr(0.9)*pi/2).range(120,2200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1035.812397177, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.68/5, SinOsc.kr(0.9)*pi/2, SinOsc.kr(29).abs).range(120,2200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1037.405257187, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.68/5, SinOsc.kr(0.9)*pi/2, SinOsc.kr(19).abs).range(120,2200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1039.684849485, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.68/5, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9).abs).range(120,2200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1066.893981445, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.68/5, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(3))).abs).range(120,2200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1076.128180756, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.68/5, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(3)).poll).abs).range(120,2200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1097.748992499, 'me', "q.free;" ],
[ 1120.536051451, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.68/5, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(3))).abs).range(120,2200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1123.440063649, 'me', "q = OSCFunc({ |m| (instrument: \\sine, degree: m[3]).play }, '/tr');" ],
[ 1131.107708092, 'me', "fork {
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (19..29).choose.post);
		y.set(\\ffreq, (10,40..490).choose.postln);
		// after -> y.set(\\ffreq, (10,40..490).choose.postln);
		1.wait;
	}
}" ],
[ 1138.687550876, 'me', "fork {
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (1..29).choose.post);
		y.set(\\ffreq, (10,40..490).choose.postln);
		// after -> y.set(\\ffreq, (10,40..490).choose.postln);
		1.wait;
	}
}" ],
[ 1147.628607467, 'me', "fork {
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (22..44).choose.post);
		y.set(\\ffreq, (10,40..490).choose.postln);
		// after -> y.set(\\ffreq, (10,40..490).choose.postln);
		1.wait;
	}
}" ],
[ 1153.594203234, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.68/5, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(13))).abs).range(120,2200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1155.6760508, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.68/5, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(23))).abs).range(120,2200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1157.752709278, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.68/5, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(120,2200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1160.922187476, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.68/5, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(120,3200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1163.99264591, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.68/5, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(120,4200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1167.682544912, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.68/5, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(120,6200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1170.554718294, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.68/5, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(120,8200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1174.84525578, 'me', "FreqScope();" ],
[ 1181.369487314, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.68/5, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(120,2200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1190.828550754, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.68/5, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(120,12200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1196.048468564, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.68/5, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(120,14200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1199.147832783, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.68/5, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(1120,14200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1221.000382181, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.6885, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(120,2200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1223.633589606, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.68*5, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(120,2200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1226.28291112, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.6885, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(120,2200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1232.348920597, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.685, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(120,2200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1259.177561964, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.685, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(120,12200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1267.933089182, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.685, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(120,6200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1271.472392703, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.685, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(420,6200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1333.542697153, 'me', "		(3.0..1.0)" ],
[ 1339.52555589, 'me', "		(3.0,2.9..1.0)" ],
[ 1342.893797791, 'me', "		(3.0,2.9..1.0).size" ],
[ 1346.260794367, 'me', "		(3.0,2.9..1.6).size" ],
[ 1349.069882415, 'me', "		(3.0,2.9..1.2).size" ],
[ 1350.991138552, 'me', "		(3.0,2.9..1.8).size" ],
[ 1352.799783512, 'me', "		(3.0,2.9..1.9).size" ],
[ 1387.318682996, 'me', "fork {
	12.do { |i|
		i.postln;
		x.set(\\ffreq, (22..44).choose.post);
		y.set(\\ffreq, (10,40..490).choose.postln);
		x.set(\\freq, (3.0,2.9..1.9)[i]);
//		(3.0,2.9..1.9).size
		// after -> y.set(\\ffreq, (10,40..490).choose.postln);
		1.wait;
	}
}" ],
[ 1404.760814717, 'me', "fork {
	12.do { |i|
		i.post;
		x.set(\\ffreq, (22..44).choose.post);
		y.set(\\ffreq, (10,40..490).choose.postln);
		x.set(\\freq, (3.0,2.9..1.9)[i]);
//		(3.0,2.9..1.9).size
		// after -> y.set(\\ffreq, (10,40..490).choose.postln);
		1.wait;
	}
}" ],
[ 1475.476758733, 'me', "(2.0,1.9..1.4).size" ],
[ 1481.572680285, 'me', "(2.0,1.9..0.9).size" ],
[ 1489.781861236, 'me', "fork {
	12.do { |i|
		i.post;
		x.set(\\ffreq, (22..44).choose.post);
		y.set(\\ffreq, (10,40..490).choose.postln);
		// decrease x first and then y
//		x.set(\\freq, (3.0,2.9..1.9)[i]);
		y.set(\\freq, (2.0,1.9..0.9)[i]);
//		(2.0,2.9..1.4).size
		// after -> y.set(\\ffreq, (10,40..490).choose.postln);
		1.wait;
	}
}" ],
[ 1544.016289358, 'me', "		(1.9,1.8..0.4).size" ],
[ 1547.065386498, 'me', "		(1.9,1.8..0.7).size" ],
[ 1548.341577913, 'me', "		(1.9,1.8..0.9).size" ],
[ 1550.331472384, 'me', "		(1.9,1.8..0.8).size" ],
[ 1561.456675013, 'me', "fork {
	12.do { |i|
		i.post;
		x.set(\\ffreq, (22..44).choose.post);
		y.set(\\ffreq, (10,40..490).choose.postln);
		// decrease x first and then y
//		x.set(\\freq, (3.0,2.9..1.9)[i]);
		// x now is 1.9
		y.set(\\freq, (2.0,1.9..0.9)[i]);
		// y now is 0.9
//		(2.0,2.9..1.4).size
		x.set(\\freq, (1.9,1.8..0.8)[i]);
//		(1.9,1.8..0.8).size
		// after -> y.set(\\ffreq, (10,40..490).choose.postln);
		1.wait;
	}
}" ],
[ 1659.85231904, 'me', "fork {
	12.do { |i|
		i.post;
		x.set(\\ffreq, (22..44).choose.post);
		y.set(\\ffreq, (10,40..490).choose.postln);
		// decrease x first and then y
//		x.set(\\freq, (3.0,2.9..1.9)[i]);
		// x now is 1.9
//		y.set(\\freq, (2.0,1.9..0.9)[i]);
		// y now is 0.9
		//(2.0,2.9..1.4).size
//		x.set(\\freq, (1.9,1.8..0.8)[i]);
		//(1.9,1.8..0.8).size
		// (x,y) (0.8,0.9)
		x.set(\\freq, (0.8..0.1).mirror[i]);
		y.set(\\freq, (0.9..0.1).mirror[i]);
		
		// after -> y.set(\\ffreq, (10,40..490).choose.postln);
		1.wait;
	}
}" ],
[ 1689.47870523, 'me', "fork {
	12.do { |i|
		i.post;
		x.set(\\ffreq, (22..44).choose.post);
		y.set(\\ffreq, (10,40..490).choose.postln);
		// decrease x first and then y
//		x.set(\\freq, (3.0,2.9..1.9)[i]);
		// x now is 1.9
//		y.set(\\freq, (2.0,1.9..0.9)[i]);
		// y now is 0.9
		//(2.0,2.9..1.4).size
//		x.set(\\freq, (1.9,1.8..0.8)[i]);
		//(1.9,1.8..0.8).size
		// (x,y) (0.8,0.9)
		x.set(\\freq, (1..4).mirror[i]);
		y.set(\\freq, (2..7).mirror[i]);
		
		// after -> y.set(\\ffreq, (10,40..490).choose.postln);
		1.wait;
	}
}" ],
[ 1704.277464177, 'me', "fork {
	12.do { |i|
		i.post;
		x.set(\\ffreq, (22..44).choose.post);
		y.set(\\ffreq, (10,40..490).choose.postln);
		// decrease x first and then y
//		x.set(\\freq, (3.0,2.9..1.9)[i]);
		// x now is 1.9
//		y.set(\\freq, (2.0,1.9..0.9)[i]);
		// y now is 0.9
		//(2.0,2.9..1.4).size
//		x.set(\\freq, (1.9,1.8..0.8)[i]);
		//(1.9,1.8..0.8).size
		// (x,y) (0.8,0.9)
		x.set(\\freq, (1..4).mirror[i]);
		y.set(\\freq, (2..7).mirror[i]);
		
		// after -> y.set(\\ffreq, (10,40..490).choose.postln);
		1.wait;
	}
}" ],
[ 1723.98299197, 'me', "fork {
	12.do { |i|
		i.post;
		x.set(\\ffreq, (22..44).choose.post);
		y.set(\\ffreq, (10,40..490).choose.postln);
		// decrease x first and then y
//		x.set(\\freq, (3.0,2.9..1.9)[i]);
		// x now is 1.9
//		y.set(\\freq, (2.0,1.9..0.9)[i]);
		// y now is 0.9
		//(2.0,2.9..1.4).size
//		x.set(\\freq, (1.9,1.8..0.8)[i]);
		//(1.9,1.8..0.8).size
		// (x,y) (0.8,0.9)
		x.set(\\freq, (1..4).mirror[i]);
		y.set(\\freq, (2..7).mirror[i]);
		1.wait;
//
		x.set(\\freq, (1..14).mirror[i]);
		y.set(\\freq, (2..17).mirror[i]);
		// after -> y.set(\\ffreq, (10,40..490).choose.postln);
		1.wait;
	}
}" ],
[ 1742.471841575, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.685*2, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(120,2200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1747.893346872, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.685/2, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(120,2200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1753.141458933, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.685/4, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(120,2200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1755.795043341, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.685/12, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(120,2200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1761.849820039, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.685/12, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(120,12200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1764.393405286, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.685/12, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(120,12200)), 0.15, 0.05, 0.95) ) }).add;" ],
[ 1766.365838292, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.685/12, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(120,12200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1771.139120421, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,0.1,1,0,2)/3, SinOsc.kr(9.685/12, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(120,12200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1775.361832116, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,0.01,1,0,2)/3, SinOsc.kr(9.685/12, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(120,12200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1777.196934576, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, FreeVerb.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,0.1,1,0,2)/3, SinOsc.kr(9.685/12, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(120,12200)), 0.5, 0.05, 0.95) ) }).add;" ],
[ 1794.149903348, 'me', "q.free;" ],
[ 1797.167327379, 'me', "q = OSCFunc({ |m| (instrument: \\sine, degree: m[3]).play }, '/tr');" ],
[ 1801.067394142, 'me', "o.free" ],
[ 1849.05273249, 'me', "Ndef(\\hh).fadeTime = 12;" ],
[ 1850.036523272, 'me', "Ndef(\\hh, { WhiteNoise.ar!2 * Pulse.kr(16, 3e-3) }).play;" ],
[ 1859.468676994, 'me', "Ndef(\\hh, { FreeVerb.ar(WhiteNoise.ar!2 * Pulse.kr(16, 3e-3)) }).play;" ],
[ 1904.734297441, 'me', "Ndef(\\bd, { FreeVerb.ar( SinOsc.ar(34 *Pulse.ar(1), 0, SinOsc.kr(12).abs) ) }).play;" ],
[ 1911.699212363, 'me', "Ndef(\\bd).stop" ],
[ 1915.285182259, 'me', "Ndef(\\bd2).fadeTime = 12;" ],
[ 1919.02652972, 'me', "Ndef(\\bd2, { FreeVerb.ar( SinOsc.ar(34!2 *Pulse.ar(1), 0, SinOsc.kr(12).abs) ) }).play;" ],
[ 2030.47256252, 'me', "SynthDef(\\sine, { |freq| 
	Out.ar(0, CombN.ar(RLPF.ar(SinOsc.ar(freq!2)*EnvGen.ar(Env.perc(0.01, 0.021),doneAction:2)/3, SinOsc.kr(9.685/12, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(120,12200))) ) }).add;" ],
[ 2043.285110204, 'me', "SynthDef(\\sine, { |freq| 
	Out.ar(0, CombN.ar(RLPF.ar(SinOsc.ar(freq!2)*EnvGen.ar(Env.perc(0.01, 0.1),doneAction:2)/3, SinOsc.kr(9.685/12, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(120,12200))) ) }).add;" ],
[ 2090.197636881, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, CombN.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.685, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(420,6200)), 0.02, 0.02) ) }).add;" ],
[ 2096.07059332, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, CombN.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.685, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(420,6200)), 0.2, 0.2) ) }).add;" ],
[ 2101.906503807, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, CombN.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,1,1,0,2)/3, SinOsc.kr(9.685, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(420,1200)), 0.2, 0.2) ) }).add;" ],
[ 2107.367972528, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, CombN.ar(RLPF.ar(SinOsc.ar(freq!2)*Line.ar(1,0,0.1,1,0,2)/3, SinOsc.kr(9.685, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(420,1200)), 0.2, 0.2) ) }).add;" ],
[ 2130.506831522, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, CombN.ar(RLPF.ar(SinOsc.ar(freq!2)*EnvGen.ar(Env.perc(0.01,0.1),doneAction:2)/3, SinOsc.kr(9.685, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(420,1200)), 0.2, 0.2) ) }).add;" ],
[ 2138.909554189, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, CombN.ar(RLPF.ar(SinOsc.ar(freq!2)*EnvGen.ar(Env.perc(0.01,0.2),doneAction:2)/3, SinOsc.kr(9.685, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(420,1200)), 0.2, 0.2) ) }).add;" ],
[ 2140.455001651, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, CombN.ar(RLPF.ar(SinOsc.ar(freq!2)*EnvGen.ar(Env.perc(0.01,0.1),doneAction:2)/3, SinOsc.kr(9.685, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(420,1200)), 0.2, 0.2) ) }).add;" ],
[ 2142.498105027, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, CombN.ar(RLPF.ar(SinOsc.ar(freq!2)*EnvGen.ar(Env.perc(0.01,0.12),doneAction:2)/3, SinOsc.kr(9.685, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(420,1200)), 0.2, 0.2) ) }).add;" ],
[ 2154.192202461, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, CombN.ar(RLPF.ar(SinOsc.ar(freq!2)*EnvGen.ar(Env.perc(0.01,0.2),doneAction:2)/3, SinOsc.kr(9.685, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(420,1200)), 0.2, 0.2) ) }).add;" ],
[ 2157.136266425, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, CombN.ar(RLPF.ar(SinOsc.ar(freq!2)*EnvGen.ar(Env.perc(0.01,0.3),doneAction:2)/3, SinOsc.kr(9.685, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(420,1200)), 0.2, 0.2) ) }).add;" ],
[ 2168.607734877, 'me', "SynthDef(\\sine, { |freq| Out.ar(0, CombN.ar(RLPF.ar(SinOsc.ar(freq!2)*EnvGen.ar(Env.adsr(0.01,0.3,0.01),doneAction:2)/3, SinOsc.kr(9.685, SinOsc.kr(0.9)*pi/2, SinOsc.kr(1.9*Stepper.kr(Impulse.kr(33))).abs).range(420,1200)), 0.2, 0.2) ) }).add;" ],
[ 2175.88083155, 'me', "thisProcess.stop" ],

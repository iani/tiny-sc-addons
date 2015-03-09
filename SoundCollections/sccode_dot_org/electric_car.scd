/*

«Electric car» by Kosmas Giannoutakis on 12 Jan'14 13:23 in motorcarengineharmonicrhythmiconsound design
In 2011 I took part in a competition for making sound design for the electric car in Germany. I didn't get any distinction but I think my sounding engine is interesting somehow. I use 8 rhythmicons out of face with 32 partials each. The speed maps the time periods of the rhythmicons and the rpm (revolutions per minute) maps the harmonic factor of the partials. You can add more rhythmicons or partials if you want but it is very cpu intensive! You may need to increase your numWireBufs of your server in order to load the synth.

http://sccode.org/1-4Vy#c343

Copied: Sun, Apr 13 2014, 17:19 EEST
*/

//load the Synth
//:
Server.default.options.numWireBufs = 1024;
Server.default.reboot;
//:
(
k = ControlSpec(5, -128, \lin);
e = ControlSpec(0.01, 0.5, \exp);
p = ControlSpec(65536, 0.25, \exp);
c = ControlSpec(-23, 0, \lin);
h = ControlSpec(1/2, 2/1, \exp);

SynthDef(\Motorklang, {arg speed=0.0, time=0.0, rpm=0.0, t_tr=1;
	var sig, speedch, rpmch;
		speedch = EnvGen.kr(Env([0, speed], [time]), t_tr);
		rpmch = EnvGen.kr(Env([0, h.map(rpm/6000);], [time]), t_tr);
		sig = Mix.fill(8, {arg i;
			var freq, aspeed, env, curve1, curve2, phase;
			curve1 = k.map(speedch).max(1);
			aspeed = p.map(speedch/75) * curve1;
			env = e.map(speedch/75);
			curve2 = c.map(speedch/75);
			freq = 300 + (i/4);
			phase = i/8;
			Mix.fill(32, {arg i;
				var freqsq;
				freqsq = ((((i+1)*freq).cpsmidi*rpmch) - (freq.cpsmidi*rpmch-freq.cpsmidi)).midicps.min(22050);
				SinOsc.ar(freqsq, 0, 0.1/(i+1))
				*
				EnvGen.ar(Env.perc(env, 1-env, 1, curve2),
					Impulse.ar(freq*(1+i)/aspeed, phase), timeScale: 1/(freq*(1+i)/aspeed));
				});
			});
		Out.ar(0, Mix.new(sig) ! 2);
	}).add;
)

//:
//Test it
(
x = Synth(\Motorklang);
x.set(\speed, 40, \rpm, 3000, \time, 0, \t_tr, 1);
)

//:
x.free

//A simple interface to check the sound limits of the engine

//:
(
x = Synth.newPaused(\Motorklang);
w = Window.new("Motor", Rect(150, 266, 950, 300)).front;
q = StaticText(w, Rect(835, 20, 100, 100));
y = StaticText(w, Rect(838, 140, 100, 100));
q.string = "km/h";
y.string = "rpm";
c = NumberBox(w, Rect(830, 90, 40, 20));
n = NumberBox(w, Rect(830, 210, 40, 20));
b = ControlSpec(0, 75, \linear, 0.1);
m = ControlSpec(0, 6000, \linear, 1);
a = Slider(w, Rect(50, 75, 700, 50)).value_(0).action_({
		x.run.set(\speed, b.map(a.value), \t_tr, 1);
		c.string_(b.map(a.value).asString)});
d = Slider(w, Rect(50, 200, 700, 50)).value_(0).action_({
		x.run.set(\rpm, m.map(d.value), \t_tr, 1);
		n.string_(m.map(d.value).asString)});
c.value = 0;
n.value = 0;
)
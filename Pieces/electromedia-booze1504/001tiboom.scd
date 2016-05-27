//:
{b=SinOsc;Pan2.ar(AllpassC.ar(a=b.ar(PulseCount.ar(Impulse.ar(9),PinkNoise.ar)*437),0.1,0.01),b.ar(79*b.ar(1/8).abs/a))} ++> \tiboom;

//:
{b=SinOsc; AllpassC.ar(a=b.ar(PulseCount.ar(Impulse.ar([4, 8]),PinkNoise.ar)*437),0.1,0.01) } ++> \tiboom;

//:
{b=SinOsc; AllpassC.ar(a=b.ar(PulseCount.ar(Impulse.ar([5, 2.5]),PinkNoise.ar)*437),1.0,
	LFNoise0.kr(1, 0.01, 0.02) max: 0.01
) } ++> \tiboom;

//:
{b=SinOsc; AllpassC.ar(a=b.ar(PulseCount.ar(Impulse.ar([5, 2.5]),PinkNoise.ar)*437),1.0,
	LFNoise0.kr([1, 2], 0.01, 0.02) max: 0.01
) } ++> \tiboom;

//:
{b=SinOsc; AllpassC.ar(a=b.ar(PulseCount.ar(Impulse.ar([5, 2.5]),PinkNoise.ar)*437),1.0,
	LFNoise0.kr([10, 2], 0.01, 0.02) max: 0.01
) } ++> \tiboom;

//:
{b=SinOsc; AllpassC.ar(a=b.ar(PulseCount.ar(Impulse.ar([5, 2.5]),PinkNoise.ar)
	* LFNoise0.kr(0.2, 500, 600)
),1.0,
	LFNoise0.kr([10, 2], 0.01, 0.02) max: 0.01
) } ++> \tiboom;

//:
{b=SinOsc;Pan2.ar(AllpassC.ar(a=b.ar(PulseCount.ar(Impulse.ar(9),PinkNoise.ar)*437),
	1.0,
	LFNoise1.kr(0.2, 0.09, 0.091) max: 0.01
),b.ar(79*b.ar(1/8).abs/a))} ++> \tiboom;

//:
{b=SinOsc;Pan2.ar(AllpassC.ar(a=b.ar(PulseCount.ar(Impulse.ar(9),PinkNoise.ar)*437),
	1.0,
	LFNoise1.kr(0.2, 0.09, 0.091) max: 0.01
),b.ar(79*b.ar(1/8).abs/a))} ++> \tiboom;

//:
{b=SinOsc;Pan2.ar(AllpassC.ar(a=b.ar(PulseCount.ar(
	Impulse.ar(Line.kr(0.2, 20, 120)),
	PinkNoise.ar)*437),0.1,0.01),b.ar(79*b.ar(1/8).abs/a))} ++> \tiboom; 

//:

{b=SinOsc;Pan2.ar(AllpassC.ar(a=b.ar(PulseCount.ar(Impulse.ar(9),PinkNoise.ar)*437),0.1,0.01),b.ar(79*b.ar(1/8).abs/a))} ++> \tiboom;

//:
{b=SinOsc;Pan2.ar(AllpassC.ar(a=b.ar(PulseCount.ar(Impulse.ar(1),PinkNoise.ar)*537),0.2,1.01),b.ar(99*b.ar(1/8).abs/a))} ++> \tiboom;

//:

{b=SinOsc;Pan2.ar(AllpassC.ar(a=b.ar(PulseCount.ar(Impulse.ar(

	Line.kr(1, 10, 30)
	
),PinkNoise.ar)*437),0.1,0.01),b.ar(79*b.ar(1/8).abs/a))} ++> \tiboom;


//:
\tiboom.fadeOut(4)

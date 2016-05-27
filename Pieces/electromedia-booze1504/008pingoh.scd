lSynthTree.faders;
Server.killAll;

\pingoh.st.fadeTime_(5);


//:
{a=SinOsc;p=Pulse;WhiteNoise.ar*p.kr(10,1e-2)+a.ar(39*p.ar(1))+FreeVerb.ar(a.ar(Convolution.ar(b=HenonN.ar(8),b)))!2/9} => \pingoh;
//:
{a=SinOsc;p=Pulse;WhiteNoise.ar*p.kr(10,1e-2)+a.ar(39*p.ar(1))+FreeVerb.ar(a.ar(Convolution.ar(b=HenonN.ar(0.8),b)))!2/9} => \pingoh;
//:
{a=SinOsc;p=Pulse;WhiteNoise.ar*p.kr(10,1e-2)+a.ar(39*p.ar(10))+FreeVerb.ar(a.ar(Convolution.ar(b=HenonN.ar(0.8),b)))!2/9} => \pingoh;
//:
{a=SinOsc;p=Pulse;WhiteNoise.ar*p.kr(10,1e-2)+a.ar(39*p.ar(10))+FreeVerb.ar(a.ar(Convolution.ar(b=HenonN.ar(
	LFNoise0.kr(0.2).range(0.5, 20)
),b)))!2/9} => \pingoh;
//:
{a=SinOsc;p=Pulse;WhiteNoise.ar*p.kr(10,1e-2)+a.ar(39*p.ar(10))+FreeVerb.ar(a.ar(Convolution.ar(b=HenonN.ar(
	LFNoise1.kr(0.2).range(0.5, 20)
),b)))!2/9} => \pingoh;
//:
{a=SinOsc;p=Pulse;WhiteNoise.ar*p.kr(
	LFNoise0.kr(0.2).range(1, 20),1e-2)+a.ar(39*p.ar(10))+FreeVerb.ar(a.ar(Convolution.ar(b=HenonN.ar(
	LFNoise1.kr(0.2).range(0.5, 20)
),b)))!2/9} => \pingoh;
//:
{a=SinOsc;p=Pulse;WhiteNoise.ar*p.kr(
	LFNoise0.kr(0.2).range(1, 20),1e-2)+a.ar(
		LFNoise1.kr(0.2).range(1, 20)
		*
		p.ar(10))+FreeVerb.ar(a.ar(Convolution.ar(b=HenonN.ar(
	LFNoise1.kr(0.2).range(0.5, 20)
),b)))!2/9} => \pingoh;
//:
{a=SinOsc;p=Pulse;
	WhiteNoise.ar
	*p.kr(10,1e-2)
	+a.ar(39*p.ar(1))
	+FreeVerb.ar(a.ar(Convolution.ar(b=HenonN.ar(8),b)))
	! 2 / 9
} => \pingoh;
//:
{a=SinOsc;p=Pulse;
	WhiteNoise.ar
	*p.kr(50,1e-2)
	+a.ar(19*p.ar(1))
	+FreeVerb.ar(a.ar(Convolution.ar(b=HenonN.ar(1),b)))
	! 2 / 9
} => \pingoh;
//:
{a=SinOsc;p=Pulse;
	WhiteNoise.ar
	*p.kr(5,1e-2)
	+a.ar(19*p.ar(1))
	+FreeVerb.ar(a.ar(Convolution.ar(b=HenonN.ar(1),b)))
	! 2 / 9
} => \pingoh;
//:
{a=SinOsc;p=Pulse;
	WhiteNoise.ar
	*p.kr(25,1e-3)
	+a.ar(39*p.ar(10))
	+FreeVerb.ar(a.ar(Convolution.ar(b=HenonN.ar(10),b)))
	! 2 / 9
} => \pingoh;
//:
{a=SinOsc;p=Pulse;
	WhiteNoise.ar
	*p.kr(LFNoise1.kr(0.1).range(1, 50), LFNoise1.kr(0.1).range(0.01, 0.001))
	+a.ar(LFNoise1.kr(0.1).range(1, 50)
		*p.ar(LFNoise1.kr(0.1).range(1, 50)))
	+FreeVerb.ar(a.ar(Convolution.ar(b=HenonN.ar(10),b)))
	! 2 / 9
} => \pingoh;
//:
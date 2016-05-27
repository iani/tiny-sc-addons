SynthTree.faders;
Server.killAll;

//:
~specs = ~specs ?? { () };
~specs[\ypochthonio] = (
	fader0: \amp.asSpec
)

//:
\ypochthonio.st.fadeTime_(5);

//:

//:

a=c=nil;b=SinOsc;9.do{|i|a=a++"b.ar("++(99/(i+1)).asString++"*";c=c++")"};
{FreeVerb.ar((a++"9"++c).interpret)!2 * \fader0.kr(1) * 3 } ++> \ypochthonio;

//:

//:

a=c=nil;b=SinOsc;9.do{|i|a=a++"b.ar("++(45/(i+1)).asString++"*";c=c++")"};
{FreeVerb.ar((a++"9"++c).interpret)!2} => \ypochthonio;

//:

a=c=nil;b=SinOsc;9.do{|i|a=a++"b.ar("++(25/(i+1)).asString++"*";c=c++")"};
{FreeVerb.ar((a++"9"++c).interpret)!2} => \ypochthonio;

//:

a=c=nil;b=SinOsc;9.do{|i|a=a++"b.ar("++(99/(i+2)).asString++"*";c=c++")"};
{FreeVerb.ar((a++"9"++c).interpret)!2} => \ypochthonio;

//:

a=c=nil;b=SinOsc;9.do{|i|a=a++"b.ar("++(99/(i+3)).asString++"*";c=c++")"};
{FreeVerb.ar((a++"9"++c).interpret)!2} => \ypochthonio;

//:

a=c=nil;b=SinOsc;9.do{|i|a=a++"b.ar("++(99/(i+4)).asString++"*";c=c++")"};
{FreeVerb.ar((a++"9"++c).interpret)!2} => \ypochthonio;

//:

a=c=nil;b=SinOsc;9.do{|i|a=a++"b.ar("++(99/(i+5)).asString++"*";c=c++")"};
{FreeVerb.ar((a++"9"++c).interpret)!2} => \ypochthonio;

//:

a=c=nil;b=SinOsc;9.do{|i|a=a++"b.ar("++(99/(i+5)).asString++"*";c=c++")"};
{FreeVerb.ar((a++"9"++c).interpret)!2} => \ypochthonio;

//:

a=c=nil;b=SinOsc;9.do{|i|a=a++"b.ar("++(9/(i+1)).asString++"*";c=c++")"};
{FreeVerb.ar((a++"9"++c).interpret)!2} => \ypochthonio;

//:

a=c=nil;b=LFSaw;9.do{|i|a=a++"b.ar("++(99/(i+1)).asString++"*";c=c++")"};
{FreeVerb.ar((a++"9"++c).interpret)!2} => \ypochthonio;

//:

a=c=nil;b=LFSaw;9.do{|i|a=a++"b.ar("++(99/(i+1)).asString++"*";c=c++")"};
{FreeVerb.ar((a++"9"++c).interpret)!2} => \ypochthonio;

//:

a=c=nil;b=LFSaw;9.do{|i|a=a++"b.ar("++(99/(i+1)).asString++"*";c=c++")"};
{FreeVerb.ar((a++"5"++c).interpret)!2} => \ypochthonio;

//:

a=c=nil;b=LFSaw;9.do{|i|a=a++"b.ar("++(99/(i+1)).asString++"*";c=c++")"};
{FreeVerb.ar((a++"1"++c).interpret)!2} => \ypochthonio;

//:

a=c=nil;b=SinOsc;9.do{|i|a=a++"b.ar("++(99/(i+1)).asString++"*";c=c++")"};
{FreeVerb.ar((a++"1"++c).interpret)!2} => \ypochthonio;

//:

a=c=nil;b=SinOsc;9.do{|i|a=a++"b.ar("++(99/(i+1)).asString++"*";c=c++")"};
{FreeVerb.ar((a++"9"++c).interpret)!2} => \ypochthonio;

//:

{ LPF.ar(Inp.ar, 500.dup) } => \ylpf;
//:
\ypochthonio.st => \ylpf;
//:
{ HPF.ar(Inp.ar, 500.dup) } => \ylpf;
//:
{ HPF.ar(Inp.ar, LFNoise1.kr(1).range(100, 500).dup) } => \ylpf;
//:
{ HPF.ar(Inp.ar, LFNoise1.kr(10).range(100, 500).dup) * 2 } => \ylpf;
//:
{ HPF.ar(Inp.ar, LFNoise1.kr(10).range(100, 500).dup) * 4 } => \ylpf;
//:
{ HPF.ar(Inp.ar, LFNoise1.kr(2).range(50, 500).dup) } => \ylpf;
//:
{ HPF.ar(Inp.ar, LFNoise0.kr(2).range(50, 500).dup) } => \ylpf;
//:
{ HPF.ar(Inp.ar, LFNoise0.kr(5).range(50, 500).dup) } => \ylpf;
//:
{ HPF.ar(Inp.ar, LFNoise0.kr(10).range(50, 500).dup) } => \ylpf;
//:
{ HPF.ar(Inp.ar, LFNoise0.kr(10).range(150, 1500).dup) * 2 } => \ylpf;
//:
{ HPF.ar(Inp.ar, LFNoise0.kr(10).range(250, 2500).dup) * 3 } => \ylpf;
//:

{ LPF.ar(Inp.ar, LFNoise1.kr(1).range(50, 1000).dup) } => \ylpf;

//:

{ Resonz.ar(Inp.ar, LFNoise0.kr(10).range(50, 1000).dup, 0.1) } => \ylpf;
//:

{ Resonz.ar(Inp.ar, LFNoise0.kr(20).range(50, 1000).dup, 0.1)  } => \ylpf;
//:

{ Resonz.ar(Inp.ar, LFNoise0.kr(20).range(500, 1000).dup, 0.1) } => \ylpf;
//:

{ Resonz.ar(Inp.ar, LFNoise0.kr(20).range(500, 1000).dup, 0.01) } => \ylpf;
//:

{ Resonz.ar(Inp.ar, LFNoise0.kr(20).range(500, 1000).dup, 0.01) * 2 } => \ylpf;
//:

{ Resonz.ar(Inp.ar, LFNoise0.kr(20).range(500, 1000).dup, 0.01) * 25 } => \ylpf;
//:

{ Resonz.ar(Inp.ar, LFNoise0.kr(20).range(500, 2000).dup, 0.01) * 15 } => \ylpf;
//:

{ Resonz.ar(Inp.ar, LFNoise0.kr([2, 4]).range(500, 2000), 0.01) * 125 } => \ylpf;
//:

{ Mix(Resonz.ar(Inp.ar, LFNoise0.kr([2, 4, 8]).range(500, 2000), 0.01)).dup * 125 } => \ylpf;
//:

{ Mix(Resonz.ar(Inp.ar, LFNoise0.kr([2, 4, 8]).range(1500, 2000), 0.01)).dup * 250 } => \ylpf;
//:

{ Mix(Resonz.ar(Inp.ar, LFNoise0.kr([2, 4, 8]).range(1000, 1500), 0.01)).dup * 250 } => \ylpf;
//:

{ Mix(Resonz.ar(Inp.ar, LFNoise0.kr([2, 4, 8, 16]).range(1000, 1500), 0.01)).dup * 250 } => \ylpf;
//:

{ Mix(Resonz.ar(Inp.ar, LFNoise0.kr([2, 4, 8, 16] / 3).range(1000, 1500), 0.01)).dup * 250 } => \ylpf;
//:

{ Mix(Resonz.ar(Inp.ar, LFNoise0.kr([2, 3, 4, 8, 16] / 3).range(1000, 1500), 0.01)).dup * 250 } => \ylpf;
//:

{ Mix(Resonz.ar(Inp.ar, LFNoise0.kr([2, 3, 4, 5, 8, 16] / 3).range(1000, 1500), 0.01)).dup * 250 } => \ylpf;
//:

{ Mix(Resonz.ar(Inp.ar, LFNoise0.kr([2, 3, 4, 5, 8, 16] / 2).range(1000, 1500), 0.01)).dup * 250 } => \ylpf;
//:

{ Mix(Resonz.ar(Inp.ar, LFNoise0.kr([2, 3, 4, 5, 8, 16] / 1).range(1000, 1500), 0.01)).dup * 250 } => \ylpf;
//:

{ Mix(Resonz.ar(Inp.ar, LFNoise0.kr([2, 3, 4, 5, 8, 16] * 2)
	.range(LFNoise0.kr(1).range(2000, 12000), LFNoise0.kr(4).range(100, 400)), 
 0.01)).dup * 50 } => \ylpf;
//:


SynthTree.faders;
Server.killAll;

//:

{p=Saw;SendTrig.ar(Changed.ar(a=Latch.ar(Stepper.ar(p.ar(Line.kr(30,10,40,1,0,2))),p.ar(8))),0,a)} => \pianist;

OSCdef('tr1', {|m|(degree:m[3]).play},'/tr');



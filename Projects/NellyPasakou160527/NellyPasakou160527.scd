
//:

a = Array.newClear (10);

a.put (4, 50);
a.at (0);
a.at (4);

a add: 1000;

100 do: { | i | a.add (i)}

100 do: { | i | a = a.add (i) }

a

//:

l = List.newClear (10);
100 do: { | i | l.add (i)}
l;

//:
l = List.new;
100 do: {l.add (1000); };

l

//:
b = Set ();
100 do: { b.add (1000); };
b;

//:
Scale.directory;
//:
Tuning.directory;

//:
Pbind (\degree, Pseq ((0..7))).play;
//:
Pbind (
	\degree, Pseq ((0..7), inf),
	\dur, 0.2,
	\mtranspose, Pstutter (8, Pseries (0, -1, inf))
).play;
//:
Pbind (\degree, Pseq ((0..7)), \scale, Scale.phrygian).play;
//:
~rhythm1 = [1, 1, 1, 3];
//:
Pbind (\octave, -1,
	\degree, Pseq ([2, 5, 6, 7, 6, 7, 8, 6, 5, 6 , 7 , 5])
).play;
//:
Pbind (\degree, Pseq ([2, 4, 5, 6, 4, 6, 7, 8], inf),
	\scale, Pstutter (4, Pseq ([Scale.ionian,  Scale.harmonicMinor], inf)),
	\dur, Pseq ([0.2, 0.2, 0.2, 0.6], inf),
	\mtranspose, Pstutter (4, Pseq ([0, -2], inf))
).play;

//:
var rhythm1;
rhythm1 = [1, 1, 1, 3];
Pbind (\dur, Pseq (rhythm1, inf), \midinote, ).play;

//:
Ppar (
	Pseq ([])
)

//:

currentEnvironment;





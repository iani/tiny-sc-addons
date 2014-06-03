/*
From: http://sccode.org/1-4W0

«Re: The Sounds of Fibonacci» by ttsesmetzis on 18 Mar'14 16:42 in code forkmathematicsresearch
Pisano periods for rythmic patterns.

Sun, Apr 13 2014, 16:54 EEST

*/

+ Array { 
	 // The pisano period for the given integer.
 	*pisano { | divisor = 3 |
 		var list, lastPair, sum;
 		if ( divisor.isInteger.not or: { divisor < 0 } ){
 			"The divisor must be a positive integer".throw;
 		};
 		list = List[ 0, 1 ];
 		while {
 			lastPair = list.keep( -2 );
 			sum = lastPair.sum;
 			sum != 1 or: { lastPair.last != 0 }
 		}{
 			list.add( sum % divisor );
 		};
 		^ list.array.drop( -1 )
 	}

 }

/*

b = Buffer.read( s, Platform.resourceDir +/+ "sounds/a11wlk01.wav" );

(
SynthDef(\playBuf, {| out = 0, buf = 0, amp = 0.2, pan = 0.0, dur = 0.2, gate = 1 startPos = 0 |
	var sig, env;
	env = EnvGen.ar( Env.sine( dur ), gate, amp, doneAction: 2 );
	sig = PlayBuf.ar( 
		1, 
		buf, 
		BufRateScale.ir( buf ), 
		1, 
		startPos * BufFrames.ir( buf )
	);
	OffsetOut.ar(out, Pan2.ar( sig * env, pan ) )
}).add
)

(
Pn(
	Plazy({
		var divisor = 3.rrand( 9 ), repeats = 10.rrand( 20 );
		var pisano, size, starts, durs, pans, amps;

		pisano = Array.pisano( divisor );
		size = pisano.size;
		starts = { 1.0.rand } ! size ;
		durs = { 0.03.rrand( 0.08 ) } ! size;
		pans = { 1.0.rand2 } ! size;
		amps = { 0.05.rrand( 0.8 ) } ! size;

		"Divisor: %\t pisano period is of length: %\n".postf( divisor, size );

		Pbind(
			\instrument, \playBuf,
			\pisano, Pseq( pisano, repeats ),
			\buf, b,
			\amp, Pindex( amps, Pkey( \pisano ) ),
			\dur, Pindex( durs, Pkey( \pisano ) ),
			\pan, Pindex( pans, Pkey( \pisano ) ),
			\startPos, Pindex( starts, Pkey( \pisano ) )
		)
	}),
	inf
).play
)

b.free

*/
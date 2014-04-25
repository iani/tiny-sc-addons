/*
«The Collatz Scale» by henklass on 08 Jan'14 13:37 in collatzproblemnotenumberstonality
Some time ago a did a thing on a series of numbers, that, as I learned later, was officially called the Collatz problem and it can be found on the Online Encyclopedia of Integer Sequences: http://oeis.org/A070165 . One day I was playing with those numbers on a keyboard and I had the impression, that some notes occur more frequent than others. This implies some kind of tonality. So I rewrote the code to use notenumbers in stead of frequencies. And here is the result. The fourth step, which coincidentally is a C, is dominant and the 10th, F# follows. There is quite some A, B flat, C#, E and G and very little E flat. A flat, B, D, and F are almost absent. So I guess the Collatz scale is: C, C#, E, F#, G, A, B flat, C and you can use E flat as some kind of Blue note or something.

http://sccode.org/1-4Vx

Copied: Sun, Apr 13 2014, 23:05 EEST
*/

//series of numbers: Collatz-scale: http://oeis.org/A070165
//from 1 to 100
//while number>1
//if even: divide by 2, else multiply by 3 and add 1 
//remember highest value, remember longest series, both with their startnumber
//startnumber->cutoff, number-> frequency, pan mid
//startnumber->cutoff, highest value -> frequency, pan right
//startnumber->cutoff, longest series -> cutoff, pan left
//There seemd to be some tonality in the numbers when used as MIDI-notenumbers
//To find that out you can count the occurrences of all the numbers wrapped between 0 en 11
Server.default.boot;
(
SynthDef(\beep, { |freq=440, cutoff=1000, pan=0|
	Out.ar(0, (Pan2.ar(LPF.ar(VarSaw.ar(freq, width: 0.01), cutoff), pan))*0.4 )}).send(s);
)
(
var highest=1,  longest=1, starthighest=1, startlongest=1;
var numberbeep, highestbeep, longestbeep;
u=Array.new(12);  //array to store the numbers, wrapped to 0..11
{for(0, 12, {u.add(0)})}.value;

numberbeep=Synth(\beep, [\freq, 200, \cutoff, 200, \pan, 0]);
longestbeep=Synth(\beep, [\freq, 200, \cutoff, 200, \pan, -1]);
highestbeep=Synth(\beep, [\freq, 200, \cutoff, 200, \pan, 1]);

Routine({
	for (1, 100, { arg startnumber;
		var number, length=1, maximum;
		number=startnumber;
		maximum=startnumber;
		u[startnumber%12]=u[startnumber%12]+1;
		
		(number.asString+" ").post;
		numberbeep.set(\cutoff, 100*startnumber);
		while ( {number>1},{
			if (number.asInteger.even, {number=(number/2)}, {number=3*number+1});
			length=length+1;
			if (number>maximum, {maximum=number});
			numberbeep.set(\freq, (32+(number%96)).midicps); //frequency as MIDI-notenumber between 32 and 128, that is 8 octaves
			longestbeep.set(\freq, (32+(length%96)).midicps);
			highestbeep.set(\freq, (32+(maximum%96)).midicps);
			u[number%12]=u[number%12]+1; //count the occurrences of this number wrapped between 0 and 11
			0.1.wait;
		});
		if(length>longest, {longest=length; startlongest=startnumber});
		if (maximum>highest, {highest=maximum; starthighest=startnumber});
		longestbeep.set(\cutoff, 100*longest);
		highestbeep.set(\cutoff, highest*2);
			("length: " + length.asString).post;
			(" maximum: " + maximum.asString).postln;
	});
	postf("longest series % at % \n", longest, startlongest);
	postf("highest value % at % \n", highest, starthighest);
	numberbeep.set(\freq, 33.midicps, \cutoff, 10000);
	longestbeep.set(\freq, ((32+longest)%96).midicps, \cutoff, 100*startlongest);
	highestbeep.set(\freq, ((32+highest)%128).midicps, \cutoff, 100*starthighest);
	10.wait;	
	numberbeep.free;
	highestbeep.free;
	longestbeep.free;
}).play;
)

(
/*This shows the Collatz-scale: The fourth step, which coincidentally is a C, is dominant and the 10th, F# follows. There is quite some A, B flat, C#, E and G and very little E flat. A flat, B, D, and F are almost absent. So I guess the Collatz scale is: C, C#, E, F#, G, A, B flat, C and you can use E flat as some kind of Blue note or something.*/

u.plot(bounds: Rect(10, 100, 400, 400));//show as graph 

for(0, 12, {arg i;   //show as list
	if( (u[i] > 0), {(i.asString+" ").post; u[i].postln})
	}
	);
)
numberbeep.set(\freq, (32+(0%96)).midicps); 
{VarSaw.ar(440, [0.1, 1], 0.05, 1, 0)}.scope
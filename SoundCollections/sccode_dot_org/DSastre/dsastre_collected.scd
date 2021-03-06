/* Collection of code submitted by DSastre

See: http://sccode.org/dsastre

Here: 
red alert

r3d3
http://sccode.org/1-4QH
powerset flat
http://sccode.org/1-4QD
startrek transporter
http://sccode.org/1-4QA

Copied: Mon, Apr 14 2014, 21:52 EEST
*/

//Fig 58.7: Red alert
//Complete patch, saw + second harmonic, resonators, distortion and post filters to create 
//fixed resonance. Contains the subpatch shown in fig 58.6.
//:
(
	SynthDef(\red, {
 
	var env, redAlert, dfbe, aIn, bIn, cIn, aOut, bOut, cOut;
 
	# aIn, bIn, cIn = LocalIn.ar(7).clumps([5,1,1]);
 
	env = [
		EnvGen.ar(Env.new([0,1,1,0], [0.9, 0.3, 0.0])), 
		EnvGen.ar(Env.new([0,1,1,0], [0.01, 0.88, 0.01]))
	];
	env[0] = LFSaw.ar(env[0].sqrt * 487 + 360, 1, 0.5, 0.5);
	env[0] = (env[0] - 0.5) + ((env[0] * 2 * 2pi).cos * 0.3);
	redAlert = (env[0] - OnePole.ar(env[0], exp(-2pi * (1 * SampleDur.ir)))) * env[1];
	redAlert = redAlert + (cIn * 0.006) * 0.2;
 
 
	// fig 58.6: Delay feedback element
	dfbe = 0!6;
	redAlert = redAlert + (aIn * 0.7);
	5.do{|i| dfbe[i] = DelayN.ar(redAlert[i], 0.1, [0.015, 0.022, 0.035, 0.024, 0.011][i])};
	aOut = dfbe[0..4]; 
 
	redAlert = redAlert[0..4].sum;
	redAlert = (redAlert - OnePole.ar(redAlert, exp(-2pi * (12 * SampleDur.ir))));
 
	dfbe[5] = redAlert + (bIn * 0.7);
	dfbe[5] = DelayN.ar(dfbe[5], 0.1, 0.061);
	# bOut, cOut = dfbe[5]!2;
	LocalOut.ar(aOut ++ bOut ++ cOut);
 
	redAlert = Clip.ar(redAlert * 4, -1, 1);
	redAlert = BPF.ar(redAlert, [740, 1400, 1500, 1600], (12!4).reciprocal) ++ (redAlert * 0.5);
	Out.ar(0, (redAlert.sum * 0.2)!2);
 
}).add;
)
//:
// ALL HANDS!! BATTLESTATIONS!
e = Synth(\red);

//:

// code also available here: 
// http://en.wikibooks.org/wiki/Designing_Sound_in_SuperCollider/Red_alert

//:


//Fig 45.3: A "toy" engine
//Instead of using a toggle object to simulate the break, the same functionality is implemented by moving the mouse cursor into the right or left half of the screen.
//:
(
{
        var toy, toggle, noise;
 
        toggle = MouseX.kr(0,1).round(1);
 
        toy = BPF.ar(WhiteNoise.ar, 9, 15.reciprocal); 
        toy = (toggle * toy);
        toy = (toy + (SinOsc.ar(9) * K2A.ar(Select.kr(toggle, [1,0])))) * 600;
        toy = Clip.ar(toy, 0, 1);
        toy = (toy - OnePole.ar(toy, exp(-2pi * (10 * SampleDur.ir))));
        toy = OnePole.ar(toy, exp(-2pi * (30 * SampleDur.ir)));
 
        noise = WhiteNoise.ar;
        noise = (noise - OnePole.ar(noise, exp(-2pi * (1000 * SampleDur.ir))));
        noise = BPF.ar(noise, 590, 4.reciprocal);
 
        toy = toy * noise; 
 
        toy = BPF.ar(toy, [470, 780, 1024], [8, 9, 10].reciprocal).sum;
        toy = (toy - OnePole.ar(toy, exp(-2pi * (100 * SampleDur.ir))));
        toy = (toy * 2).dup;
 
}.play;
)

//:

//Fig 45.4/45.5: A four cylinder engine with slugging speed

(
{
        var jitterEngine, noise, bufferA, bufferB, fourstroke, engineSpeed;
 
        bufferA = LocalBuf(44100, 1); 
        bufferB = LocalBuf(44100, 1); 
 
        engineSpeed = MouseX.kr(0,1);
 
        noise = WhiteNoise.ar;
        noise = OnePole.ar(noise, exp(-2pi * (20 * SampleDur.ir)));
        noise = OnePole.ar(noise, exp(-2pi * (20 * SampleDur.ir)));
        noise = DelTapWr.ar([bufferA, bufferB], [noise * 0.5, noise * 10]);
 
        fourstroke = DelTapRd.ar(bufferA, noise[0], [5, 10, 15, 20]/1000); 
        fourstroke = 
                        LFSaw.ar(OnePole.ar((K2A.ar(engineSpeed) * 40), exp(-2pi * (0.8 * SampleDur.ir))), 1, 0.5, 0.5)
                         + fourstroke
                         - [0.75, 0.5, 0.25, 0];
        fourstroke = (fourstroke * 2pi).cos;
        fourstroke.scope;
 
        fourstroke = 
                        fourstroke 
                        * (DelTapRd.ar(bufferB, noise[1], [5, 10, 15, 20]/1000) + ((1 - engineSpeed) * 15 + 7));
        fourstroke = 1 / ((fourstroke * fourstroke) + 1);
        fourstroke = fourstroke.sum!2 * 0.25;
 
}.play;
)

//:

//Fig 45.8: Advanced Engine
//Advanced engine with multiple transmission paths and warping non-linear waveguide. Contains the subpatches from fig 45.5, 45.6 and 45.7. At the end there is also an example how to control some parameters via a MIDI controller.

(
e = SynthDef(\engine, {
 
        | // arguments range: 0.0 - 1.0         
        mixCylinders   = 0.8,
        mixParabolic   = 0.9,
        engineSpeed    = 0, 
        parabolaDelay  = 0.15,
        warpDelay      = 0.4,
        waveguideWarp  = 0.67,
        wguideFeedback = 0.35,
        wguideLength1  = 0.2,
        wguideLength2  = 0.3,
        wguideWidth1   = 0.5,
        wguideWidth2   = 0.7
        |
 
        // To be able to send arrays as arguments you have to declare them as variables and
        // use NamedControl.kr. Take also a look at the MIDI example at the bottom how to address them. 
        var transDelay = NamedControl.kr(\transDelay, [0.2, 0.3, 0.45]);
        var overtonePhase = NamedControl.kr(\overtonePhase, [0.25, 0.35, 0.5]);
        var overtoneFreq = NamedControl.kr(\overtoneFreq, [0.3, 0.47, 0.38]);
        var overtoneAmp = NamedControl.kr(\overtoneAmp, [0.1, 0.2, 0.2]);
 
        var noise, bufferA, bufferB, bufferTd, fourstroke, phasor, td, parabola, fm1, preFM1, 
        fm2, preFM2, overtone, overtoneDrive, e1b, e2a, e2b, e1a, spacewarp, engine;
 
        engineSpeed = MouseX.kr(0,1);
 
 
        bufferA = LocalBuf(44100, 1); 
        bufferB = LocalBuf(44100, 1); 
        bufferTd = LocalBuf(44100, 1); 
 
 
        noise = WhiteNoise.ar;
        noise = OnePole.ar(noise, exp(-2pi * (20 * SampleDur.ir)));
        noise = OnePole.ar(noise, exp(-2pi * (20 * SampleDur.ir)));
        noise = (DelTapWr.ar([bufferA, bufferB], [noise * 0.5, noise * 30]));
 
        phasor = LFSaw.ar(
                OnePole.ar(K2A.ar(engineSpeed) * 30, exp(-2pi * (0.8 * SampleDur.ir))), 
                1, 0.5, 0.5);
        td = DelTapWr.ar(bufferTd, phasor);
 
        fourstroke = DelTapRd.ar(bufferA, noise[0], [5, 10, 15, 20]/1000, 4); 
        fourstroke = phasor + fourstroke - [0.75, 0.5, 0.25, 0];
        fourstroke = (fourstroke * 2pi).cos;
        fourstroke = fourstroke * (DelTapRd.ar(bufferB, noise[1], [5, 10, 15, 20]/1000, 4) + ((1 - engineSpeed) * 15 + 7));
        fourstroke = 1 / ((fourstroke * fourstroke) + 1);
        fourstroke = fourstroke.sum * mixCylinders;
        fourstroke = fourstroke - OnePole.ar(fourstroke, exp(-2pi * (4 * SampleDur.ir)));
 
 
        parabola = DelTapRd.ar(bufferTd, td, (parabolaDelay * 100)/1000, 1) - 0.5;
        parabola = parabola * parabola * (-4) + 1 * 3 * mixParabolic;
 
 
        preFM1 = DelTapRd.ar(bufferTd, td, (warpDelay * 100)/1000, 1);
        preFM1 = (preFM1 * 2pi).cos;
        preFM2 = K2A.ar(engineSpeed * waveguideWarp);
        preFM2 = OnePole.ar(preFM2, exp(-2pi * (0.2 * SampleDur.ir)));
        fm1 = (1 - preFM1) * preFM2 + 0.5;
        fm2 = (preFM2 * preFM1) + 0.5;
 
 
        overtoneDrive  = overtoneDrive!3;
        overtone = overtone!3;
 
        3.do{|i|
 
                overtoneDrive[i] = DelTapRd.ar(bufferTd, td, (transDelay[i]*100)/1000) * (0.5**(i+1)*32);
                overtoneDrive[i] = Wrap.ar(overtoneDrive[i]);
 
                overtone[i] = overtoneDrive[i].max(overtonePhase[i]) - overtonePhase[i];
                overtone[i] = overtone[i] * (1 - overtonePhase[i]).reciprocal;
                overtone[i] = overtone[i] * ((overtoneFreq[i] * 12) * overtonePhase[i]);
                overtone[i] = Wrap.ar(overtone[i]) - 0.5;
                overtone[i] = (overtone[i] * overtone[i]) * (-4) + 1 * 0.5;
                overtone[i] = (overtone[i] * (1 - overtoneDrive[i])) * (overtoneAmp[i] * 12);
        };
 
 
        # e1b, e2b, e2a, e1a = DelayC.ar(
                in: InFeedback.ar(bus:(10..13)), 
                maxdelaytime: 1,
                delaytime: ((([wguideLength1,wguideWidth1,wguideLength2,wguideWidth2] * 40) 
                        * [fm1,fm1,fm2,fm1])/1000)
        );
 
        OffsetOut.ar(11, e1b + overtone[1]);
 
        e2b = e2b + overtone[2];
        OffsetOut.ar(13, e2b);  
 
        e2a = e2a + overtone[0];
        OffsetOut.ar(10, e2a);
 
        OffsetOut.ar(12, e1a * wguideFeedback + (parabola - OnePole.ar(parabola, exp(-2pi * (30 * SampleDur.ir)))));
 
        spacewarp = e1b + e2b + e2a + e1a;
        spacewarp = spacewarp - OnePole.ar(spacewarp, exp(-2pi * (200 * SampleDur.ir)));
        spacewarp = spacewarp - OnePole.ar(spacewarp, exp(-2pi * (200 * SampleDur.ir)));
 
        engine = (spacewarp + fourstroke)!2 * 0.5;
 
        Out.ar(0, engine);
 
}).play;
)

//:
//For testing so many different parameters at once, a device with multiple controllers is your best friend.

MIDIIn.connectAll;
(
        var transFreq = Array.newClear(3);      
 
        MIDIFunc.cc({ |val, num|
                switch( num, 
                1,      {e.set(\wguideFeedback, (val/128).range(0,1).postln)},
                2,      {e.set(\mixParabolic, (val/128).range(0,1).postln)},
                3,      {e.setn(\overtoneFreq, transFreq.put(0, (val/128).range(0,1)).postln)},
                4,      {e.setn(\overtoneFreq, transFreq.put(1, (val/128).range(0,1)).postln)},
                5,      {e.setn(\overtoneFreq, transFreq.put(2, (val/128).range(0,1)).postln)},
                6,      {e.set(\parabolicDelay, (val/128).range(0,1).postln)},
                7,      {e.set(\warpDelay, (val/128).range(0,1).postln)},
                8,      {e.set(\waveguideWarp, (val/128).range(0,1).postln)},
                )       
        });
 
)



// code also available here:
// http://en.wikibooks.org/wiki/Designing_Sound_in_SuperCollider/Cars

//: ================================================================

//Fig 44.5: Motor
//Contains the subpatches shown in fig 44.2, 44.3, 44.4 and 44.6.

(
{ 
 
  |     // arguments range: 0.0 - 1.0
        runtime         = 0.2, 
        statorLevel     = 0.7,  
        brushLevel      = 0.9,  
        rotorLevel      = 0.6,  
        maxSpeed        = 0.3,  
        volume          = 0.5,
        tubeRes         = 0.2
  |
 
        var motorEnv, motorEnv1, motorEnv2, motor, rotor, drive, stator, resonance;
 
        // fig 44.2: Speed Control Envelope
        motorEnv = (Line.ar(0,1,runtime * 20, doneAction:2)) * 2;
        motorEnv1 = (1 - motorEnv.min(1)).pow(6); // fast growing curve
        motorEnv2 = motorEnv.max(1) - 1; // linear decay
        motorEnv = (motorEnv1 + motorEnv2) * (-1) + 1;
 
        drive = motorEnv * (maxSpeed * (-2000));
        drive = LFSaw.ar(drive, 1, 0.5, 0.5);
 
        // fig 44.3: Rotor
        rotor = WhiteNoise.ar;
        rotor = BPF.ar(rotor, 4000, 1.reciprocal) * brushLevel;
        rotor = (rotor + (rotorLevel * 0.2)) * drive.pow(4);
 
        // fig 44.4: Stator
        stator = (Wrap.ar(drive * 2) * 2pi).cos;
        // notice the difference in SC between (stator * stator) and stator.pow(2)
        // to achieve the desired sound result from the book, use (stator * stator)
        // stator = stator.pow(2) + 1; // equals stator ** 2 + 1; 
        stator = (stator * stator) + 1; 
        stator = (1 / stator - 0.5) * statorLevel;
 
        // fig 44.6: FM body resonance
        resonance = SinOsc.ar(178) * drive + motorEnv;
        resonance = (resonance * 2pi).cos;
        resonance = (resonance - OnePole.ar(resonance, exp(-2pi * (180 * SampleDur.ir))));
        resonance = (resonance - OnePole.ar(resonance, exp(-2pi * (180 * SampleDur.ir))));
        resonance = resonance * tubeRes;
 
        motor = motorEnv * (rotor + stator + resonance);
        motor = (motor * volume).dup;
 
}.play
)


// code also available here:
// http://en.wikibooks.org/wiki/Designing_Sound_in_SuperCollider/Motors

//:

//****************************************
// Fig 57.3: Babbling R2D2 computer noises

// "[...] it might not even make any good noises for a while, 
// but sometimes it makes great computer babble sounds". (Andy Farnell)

(
w = {   |period=0|
        var change, rate, sig, carrierFreq, cfRamp, carrierLvl, clRamp, 
        modulatorRatio, mrRamp, modulatorIndex, miRamp, outputAmplitude, oaRamp;
 
        period = period * 600 + 100;
 
        // Calculation of a recursive working metronome (Impulse.kr) that generates its 
        // changing frequency out of its own impulses.
        change = Impulse.kr(LocalIn.kr(1,10));
        rate = CoinGate.kr(1/3, change);
        rate = (TChoose.kr(rate, period/((0..1) + 1))/1000).reciprocal; 
        LocalOut.kr(rate);
 
        # carrierFreq, cfRamp = TIRand.kr(0, [1000, 1], change);
        carrierFreq = Ramp.kr( carrierFreq / 1000, (cfRamp * period) / 1000 ) * 0.6;
 
        # carrierLvl, clRamp = TIRand.kr(0, [9000, 1], CoinGate.kr(1/3, change));
        carrierLvl = Ramp.kr( carrierLvl, (clRamp * period) / 1000) + 100;
 
        # modulatorRatio, mrRamp = TIRand.kr([800,1], CoinGate.kr(1/4, change));
        modulatorRatio = Ramp.kr(modulatorRatio, (mrRamp * period) / 1000) + 20;
 
        # modulatorIndex, miRamp = TIRand.kr(0, [100, 1], CoinGate.kr(1/4, change));
        modulatorIndex = Ramp.kr(modulatorIndex / 200, (miRamp * period) / 1000) + 0.2;
 
        # outputAmplitude, oaRamp = TIRand.kr(0!2, 1!2, CoinGate.kr(1/2, change));
        outputAmplitude = Ramp.kr(outputAmplitude, (oaRamp * period + 3) / 1000);
 
        // jointed FM Synthesizer 
        sig = LFSaw.ar(carrierFreq, 1, 0.5, 0.5) * carrierLvl;
        sig = sig + SinOsc.ar(carrierFreq * modulatorRatio) * modulatorIndex;
        sig = cos(sig * 2pi) * outputAmplitude;
 
        // One pole filters:
        sig = OnePole.ar(sig, exp(-2pi * (10000 * SampleDur.ir)));
        sig = OnePole.ar(sig, exp(-2pi * (10000 * SampleDur.ir)));
        sig = (sig - OnePole.ar(sig, exp(-2pi * (100 * SampleDur.ir))));
        sig = (sig - OnePole.ar(sig, exp(-2pi * (100 * SampleDur.ir))));
        sig = sig!2 * 0.06;     
}.play;
)

//:
// period controls the talk-speed. range: 0-1. 0 matches to fast, 1 to slow:
w.set(\period, 1);
w.set(\period, 0);
w.set(\period, 0.5);
w.set(\period, 0.7);
w.set(\period, 0.3);
 
// To stop:
w.free;

//:

//*********************************************
// Fig 57.2: FM synthesiser for computer noises

(
SynthDef(\fmSynth, { |carrierFreq=100, carrierLvl=0.5, modulatorRatio=5, modulatorIndex=1.5, outputAmp=0.2, sig, out=0|
 
        // the simple FM core
        sig = LFSaw.ar(carrierFreq, 1, 0.5, 0.5) * carrierLvl;
        sig = sig + SinOsc.ar(carrierFreq * modulatorRatio) * modulatorIndex;
        sig = cos( sig * 2pi) * outputAmp * 0.06;
        Out.ar(out, sig);
},1!5).add;
)

//:
// At first start the synth:
g = Synth(\fmSynth);

//:
// Play with the parameters:
g.set(\carrierFreq, 800);
g.set(\carrierFreq, 50);
g.set(\carrierFreq, 100, \modulatorRatio, 5, \modulatorIndex, 0.5);
g.set(\carrierFreq, 40, \modulatorRatio, 7, \modulatorIndex, 1.5);
g.set(\carrierFreq, 955, \carrierLvl, 0.4, \modulatorRatio, 3, \modulatorIndex, 4);
// ... etc.

//:
// To stop:
g.free;

// code also available here: 
// http://en.wikibooks.org/wiki/Designing_Sound_in_SuperCollider/R2D2

//:


play({LFTri.ar(DegreeToKey.kr(as(Scale.zhi,LocalBuf),Demand.kr(Saw.kr(10),0,Dseq((1..12).powerset.flat)),12,1,[42,49]).midicps)})

//:

(
x = {
	var beam_envelope, phasor, beam, feedback, transporter, reverb, activateEnv, percEnv, activate, buffer; 
		
	buffer = LocalBuf(SampleRate.ir * 0.12);
		
	// feedback has to be 0 at the beginning, to avoid input 
	// nil before sound has been produced	
	feedback = 0;
	
	
	// Activate Sound (fig 56.3)

	activateEnv = EnvGen.ar(Env.new([0, 1, 1, 0], [0.01, 0.01, 5]));
	percEnv = EnvGen.ar(Env.new([1, 1, 0], [0.01, 0.12]));
		
	activate = (1 - activateEnv * 120 + 775) + (WhiteNoise.ar(0.1) + SinOsc.ar(30, mul:40));
	activate = OnePole.ar(activateEnv, exp(-2pi * (30 * SampleDur.ir))) * LFSaw.ar(activate, 1, 0.5, 0.5 );
	
	// adding a percussive shape at the beginning of the sound
	activate = (activate + (WhiteNoise.ar * percEnv)) * 3;
	
	activate = Clip.ar(activate, -1, 1);
	activate = BPF.ar(activate, [775,1550,2325], 13.reciprocal).sum * 0.5;

	
	
	// Beam Sound  
	
	beam = LFSaw.ar(467.1, 1, 0.5, 0.5 ) - 0.5;
	beam = beam - (Wrap.ar(beam) - 0.5);
	// two stage FM process
	phasor = LFSaw.ar( beam * 6500 + 277, 1, 0.5, 0.5) - 0.5;
	beam = beam * (phasor - (Wrap.ar(phasor) - 0.5));
	beam = DelTapWr.ar(buffer, beam + (feedback * 0.7));
	
	beam_envelope = Line.ar(0,1,12);
	
	feedback = DelTapRd.ar(buffer, beam, 
		(1 - beam_envelope * 12 + 1 
			// flanger effect w/ variable delays spaced 12ms apart [0,12,24]
			+ 12 * (0..2))
		// DelTapRd requires delaytime in seconds (the equivalence in pd [vd~] 
		// calculates with miliseconds, for it the division by 1000)
	 	/ 1000, 
		interp: 4).sum * 0.3;
	
	transporter = (beam_envelope * (-1) + 1).min(beam_envelope) * 4 * feedback;
	transporter = (transporter - OnePole.ar(transporter, exp(-2pi * (100 * SampleDur.ir))));
	transporter = BPF.ar(transporter, 
		// whole tone scale
		Array.geom(12, 466.164, 1.12247), 
		[1200, 1100, 930, 910, 880, 840, 800, 760, 720, 680, 640, 620].reciprocal).sum * 12;
	reverb = GVerb.ar(transporter + (activate * 0.1), 100, 8, 0.1, 0.9);
	reverb = reverb + (activate * 0.5)!2;

}.play
)
x.free;

// code also available here: 
// http://en.wikibooks.org/wiki/Designing_Sound_in_SuperCollider/Transporter
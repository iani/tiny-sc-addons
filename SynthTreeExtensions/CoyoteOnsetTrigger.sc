
+ Symbol {
	coyote { | in = 1 fastMul = 0.5 thresh = 0.2 |
		var st, message;
		message = format("/%", this).asSymbol;
		message.postln;
		st = {
			var input = SoundIn.ar(\input.kr(in)); // cannot use in for knobs
			var detect = Coyote.kr(
				input,
				// Tweak the following controls to calibrate tracking sensitivity
				fastMul: \fastMul.kr(fastMul),	
				thresh: \thresh.kr(thresh)
			);
			// Send trigger via OSC message whenever an onset is detected: 
			SendReply.kr(detect, message /* '/onset' */);
			PinkNoise.ar(Decay.kr(detect)); // use this as audible feedback for control purposes
			// turn SynthTree amp down when not needed. 
		} => this;
		Registry('Detectors', this, {
			OSCFunc({ 
				this.changed(message);
			}, message /* '/onset' */);
		});
		{ st.set(\amp, 0) }.defer(0.1); // TODO check this!
		//		^st; // return the symbol, for chaining to onsetAction.
	}

	onsetAction { | action |
		var message;
		message = format("/%", this).asSymbol;
		this.st.addNotifier(this, message, action)
	}
}

+ Symbol {
	coyote { | fastMul = 0.5 thresh = 0.2 |
		var st, message, inputChannelNumber, oscFunc;
		message = format("/%", this).asSymbol;
		inputChannelNumber = SynthTree.server.options.numOutputBusChannels + 1;
		st = this.asSynthTree;
		st.set(\amp, 0);
		{                    // in reserved for ar
			var input = In.ar(\myinput.kr(inputChannelNumber)); 
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
		} => st;
		oscFunc = Registry('Detectors', this, {
			"making osc func".postln;
			OSCFunc({
				// "trigger received".postln;
				st.changed(message);
			}, message /* '/onset' */);
		});
		// also clean up OSCFunc when SynthTree closes:
		st.onObjectClosed(st, {
			oscFunc.free;
			oscFunc.objectClosed; // removes from registry and frees notifications;
		});
		//		{ st.set(\amp, 0) }.defer(0.1); // TODO check this!
		//		^st; // return the symbol, for chaining to onsetAction.
	}

	onsetAction { | action |
		var message;
		message = format("/%", this).asSymbol;
		this.addNotifier(this.st, message, action)
	}
}
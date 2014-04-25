/*
«PWM crossfade» by Jonatan Liljedahl on 16 Aug'11 13:06 in pwmtransitioncrossfade
A demonstration of transitioning between notes in a sequence, by pulsewidth modulation.

http://sccode.org/1-L

Copied: Mon, Apr 14 2014, 12:36 EEST
*/
play {
    var notes = [ 400, 500, 450, 376, 600 ];
    var dur = 1/20;
    var freq = Demand.kr(Impulse.kr(dur, [0,0.5]), 0, Dseq(notes, inf));
    freq = LFPulse.kr(8, 0, LFTri.kr(dur, 1).range(0, 1)).range(*freq).max(376);
    LPF.ar(Saw.ar(freq * [1,0.99],0.5),8000);
}
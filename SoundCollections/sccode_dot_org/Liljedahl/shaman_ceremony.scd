/*
«Shaman ceremony» by Jonatan Liljedahl on 11 Aug'11 10:46 in folkshamanhandclap
based on my glitch folk tweets, added handclaps and shaman drumming.

http://sccode.org/1-l

Copied: Mon, Apr 14 2014, 12:34 EEST
*/
play{
    p=LFPulse;
    n=LFNoise1;
    Limiter.ar(
        GVerb.ar(
            LPF.ar(LeakDC.ar(
                mean({|n|(p.ar(n*1e2+50*p.kr(4-n/[4,7,5]).sum+3e2)*p.kr(n+1*2,0,0.8).lag(0.1))}!3)
            ),4000) * 0.4, 200, 9, 0.6, 0.5, 40, 1, 0.15, 0.25
        ).madd(0.8) + GVerb.ar(
            {|i|BPF.ar(PinkNoise.ar(Decay.ar(Impulse.ar(2,0.95+n.kr(1,0.08)),rrand(0.2,0.4),2)).tanh,600*i+1200,0.4)}.dup(6).sum*1.2,
            90, 3, 0.7, 0.5, 30, 1, 0.2, 0.3
        ) + Splay.ar(
            {|i|Ringz.ar(LPF.ar(Impulse.ar(6,n.kr(1,0.08)),4000),6*i+40+n.kr(30,2),0.5,n.kr(3).range(4,8)).tanh}.dup(3),0.5
        ).madd(0.3)
    )
}

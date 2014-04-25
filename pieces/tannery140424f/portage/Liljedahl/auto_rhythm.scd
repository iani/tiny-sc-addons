/*

«auto rhythm» by Jonatan Liljedahl on 16 Sep'11 11:03 in sctweetrhythmicrandomness
quantized random triggers creates a rhythm that increases in density over the first 30 seconds.

http://sccode.org/1-1b

Copied: Mon, Apr 14 2014, 12:50 EEST
*/

play{Ringz.ar(CoinGate.ar([5,3,9]/10*Line.kr(0,1,30),T2A.ar(Impulse.kr([4,12,6]))),[45,9e3,50,8e3],[6,1,10,3]/10,[9,2,3,1]).sin.sum.tanh!2}
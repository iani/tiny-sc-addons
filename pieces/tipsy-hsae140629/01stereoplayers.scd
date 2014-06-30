/*
Performance for Performigrations project kick-off meeting at P. Pepoli 20141516.
Server.killAll;
Fri, May 16 2014, 04:52 CEST
*/

//: LOAD BUFFER
BufferList.loadBuffer("/Users/iani/Music/sounds/1306TipsyCity/Y13M06D17/tipsy.WAV");

\tipsy.b;


//: Creating 4x magabove + 4x magbelow stereo players
var st;
(1..4) do: 
{ | i |
	st = format("below%", i).asSymbol;
    `\bufmagbelows =|> st;
	\tipsy.b.bufnum +>.buf st;
	0.001 +>.magbelow st;
	st.knobs;
};

(1..4) do: 
{ | i |
	st = format("above%", i).asSymbol;
    `\bufmagaboves =|> st;
	\tipsy.b.bufnum +>.buf st;
	100 +>.magabove st;
	st.knobs;
};

//: Spund check before start
{ Pan2.ar(PinkNoise.ar(0.1), \pos.kr(0)) } => \stereocheck;
-1 +>.pos \stereocheck;
1 +>.pos \stereocheck;
0 +>.pos \stereocheck;
//: ====================== START ====================
var st;
(1..4) do: 
{ | i |
	format("below%", i).asSymbol.start;
	format("above%", i).asSymbol.start;
};

//:
{ XLine.kr(10, 0.05, 30) } +>.magbelow \below1;
//: MAGBELOW
{ XLine.kr(10, 0.05, 30) } +>.magbelow \below1;
{ LFDNoise1.kr(0.1).range(-2, 2) } +>.rate \below1;
{ LFDNoise1.kr(1).range(-2, 2) } +>.rate \below1;
{ LFDNoise1.kr(10).range(-2, 2) } +>.rate \below1;
{ LFDNoise0.kr(10).range(-2, 2) } +>.rate \below1;
{ Line.kr(1, 5, 10) } +>.amp \below1;
{ LFDNoise1.kr(LFNoise0.kr(0.2).range(0.1, 10)).range(-2, 2) } +>.rate \below1;
{ LFDNoise0.kr(5).range(0, 1) } +>.magbelow \below1;
{ LFDNoise0.kr(0.2).range(0, 1) } +>.magbelow \below1;
{ LFDNoise1.kr(0.2).range(0, 1) } +>.magbelow \below1;
{ LFDNoise0.kr(5).range(0, 1) } +>.magbelow \below1;
{ LFDNoise0.kr(10).range(0, 1) } +>.magbelow \below1;
{ Line.kr(0, 10.01, 30) } +>.magbelow \below1;

0.5 +>.magbelow \below1;
0.2 +>.magbelow \below1;
0.1 +>.magbelow \below1;
0.05 +>.magbelow \below1;
1.5 +>.magbelow \below1;

1 +>.rate \below1;

//: MAGBELOW
{ XLine.kr(10, 0.05, 30) } +>.magbelow \below2;
{ LFDNoise1.kr(0.1).range(-2, 2) } +>.rate \below2;
{ LFDNoise1.kr(1).range(-2, 2) } +>.rate \below2;
{ LFDNoise1.kr(10).range(-2, 2) } +>.rate \below2;
{ LFDNoise1.kr(LFNoise0.kr(0.2).range(0.1, 10)).range(-2, 2) } +>.rate \below2;
{ LFDNoise0.kr(5).range(0, 1) } +>.magbelow \below1;
{ LFDNoise0.kr(0.2).range(0, 1) } +>.magbelow \below2;

0.5 +>.magbelow \below2;
0.2 +>.magbelow \below2;
0.1 +>.magbelow \below2;
0.05 +>.magbelow \below2;
1.5 +>.magbelow \below1;

//: MAGABOVE
{ Line.kr(10, 0, 30) } +>.magabove \above1;
{ LFDNoise1.kr(0.1).range(-2, 2) } +>.rate \above1;
{ LFDNoise1.kr(LFNoise0.kr(0.2).range(0.1, 10)).range(-2, 2) } +>.rate \above1;
{ LFDNoise0.kr(0.2).range(0, 1) } +>.magabove \above1;
{ Line.kr(0, 10, 30) } +>.magabove \above1;

//:
{ Line.kr(10, 0, 30) } +>.magabove \above2;
{ LFDNoise1.kr(0.1).range(-2, 2) } +>.rate \above2;
{ LFDNoise1.kr(LFNoise0.kr(0.2).range(0.1, 10)).range(-2, 2) } +>.rate \above2;
{ LFDNoise0.kr(0.2).range(0, 1) } +>.magabove \above2;
{ Line.kr(0, 10, 30) } +>.magabove \above1;



//: ================ END ================
//: Fadeout everyone in 10 seconds.
var st;
(1..4) do: 
{ | i |
	format("below%", i).asSymbol.fadeOut(10);
	format("above%", i).asSymbol.fadeOut(10);
};


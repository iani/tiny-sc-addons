/*
Performance for Performigrations project kick-off meeting at P. Pepoli 20141516.
Server.killAll;
Fri, May 16 2014, 04:52 CEST
*/

//: LOAD BUFFER
BufferList.loadBuffer("/Users/iani/Music/sounds/1306TipsyCity/Y13M06D17/tipsy.WAV");

//: Creating 4x magabove + 4x magbelow stereo players
var st;
(1..4) do: 
{ | i |
	st = format("qbelow%", i).asSymbol;
    `\bufmagbelowq =|> st;
	\tipsy.b.bufnum +>.buf st;
	//	0.1 +>.amp st;
	0.001 +>.magbelow st;
	st.knobs;
};

(1..4) do: 
{ | i |
	st = format("qabove%", i).asSymbol;
    `\bufmagaboveq =|> st;
	\tipsy.b.bufnum +>.buf st;
	//  0.1 +>.amp st;
	10 +>.magabove st;
	st.knobs;
};

//: ====================== START ====================
var st;
(1..4) do: 
{ | i |
	format("qbelow%", i).asSymbol.start;
	format("qabove%", i).asSymbol.start;
};
\above4.knobs;
//:
{ Line.kr(10, 0, 30) } +>.magabove \qabove1;
{ LFDNoise1.kr(0.1).range(-2, 2) } +>.rate \qabove1;
{ LFDNoise1.kr(LFNoise0.kr(0.2).range(0.1, 10)).range(-2, 2) } +>.rate \qabove1;
{ LFDNoise0.kr(0.2).range(0, 1) } +>.magabove \qabove1;
{ Line.kr(0, 10, 30) } +>.magabove \qabove1;

//:
{ Line.kr(10, 0, 30) } +>.magabove \qabove2;
{ LFDNoise1.kr(0.1).range(-2, 2) } +>.rate \qabove2;
{ LFDNoise1.kr(LFNoise0.kr(0.2).range(0.1, 10)).range(-2, 2) } +>.rate \qabove2;
{ LFDNoise0.kr(0.2).range(0, 1) } +>.magabove \qabove2;
{ Line.kr(0, 10, 30) } +>.magabove \qabove1;

//: MAGBELOW
{ XLine.kr(10, 0.05, 30) } +>.magbelow \qbelow1;
{ LFDNoise1.kr(0.1).range(-2, 2) } +>.rate \qbelow1;
{ LFDNoise1.kr(1).range(-2, 2) } +>.rate \qbelow1;
{ LFDNoise1.kr(10).range(-2, 2) } +>.rate \qbelow1;
{ LFDNoise1.kr(LFNoise0.kr(0.2).range(0.1, 10)).range(-2, 2) } +>.rate \qbelow1;
{ LFDNoise0.kr(5).range(0, 1) } +>.magbelow \qbelow1;
{ LFDNoise0.kr(0.2).range(0, 1) } +>.magbelow \qbelow1;
{ Line.kr(0, 10.01, 30) } +>.magbelow \qbelow1;

0.5 +>.magbelow \qbelow1;
0.2 +>.magbelow \qbelow1;
0.1 +>.magbelow \qbelow1;
0.05 +>.magbelow \qbelow1;
1.5 +>.magbelow \qbelow1;

1 +>.rate \qbelow1;

//: MAGBELOW
{ XLine.kr(10, 0.05, 30) } +>.magbelow \qbelow2;
{ LFDNoise1.kr(0.1).range(-2, 2) } +>.rate \qbelow2;
{ LFDNoise1.kr(1).range(-2, 2) } +>.rate \qbelow2;
{ LFDNoise1.kr(10).range(-2, 2) } +>.rate \qbelow2;
{ LFDNoise1.kr(LFNoise0.kr(0.2).range(0.1, 10)).range(-2, 2) } +>.rate \qbelow2;
{ LFDNoise0.kr(5).range(0, 1) } +>.magbelow \qbelow1;
{ LFDNoise0.kr(0.2).range(0, 1) } +>.magbelow \qbelow2;

0.5 +>.magbelow \qbelow2;
0.2 +>.magbelow \qbelow2;
0.1 +>.magbelow \qbelow2;
0.05 +>.magbelow \qbelow2;
1.5 +>.magbelow \qbelow1;

// FADEOUT
//: Fadeout everyone in 10 seconds.
var st;
(1..4) do: 
{ | i |
	format("qbelow%", i).asSymbol.fadeOut(10);
	format("qabove%", i).asSymbol.fadeOut(10);
};


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
{ Line.kr(0, 10, 30) } +>.magabove \above3;

//:
{ Line.kr(10, 0, 30) } +>.magabove \above3;
{ LFDNoise1.kr(0.1).range(-2, 2) } +>.rate \above3;
{ LFDNoise1.kr(LFNoise0.kr(0.2).range(0.1, 10)).range(-2, 2) } +>.rate \above3;
{ LFDNoise0.kr(0.2).range(0, 1) } +>.magabove \above3;
{ Line.kr(0, 10, 30) } +>.magabove \above3;

//:
{ Line.kr(10, 0, 30) } +>.magabove \above4;
{ LFDNoise1.kr(0.1).range(-2, 2) } +>.rate \above4;
{ LFDNoise1.kr(LFNoise0.kr(0.2).range(0.1, 10)).range(-2, 2) } +>.rate \above4;
{ LFDNoise0.kr(0.2).range(0, 1) } +>.magabove \above4;
{ Line.kr(0, 10, 30) } +>.magabove \above4;

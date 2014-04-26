
`\cricket1 => \cricket1;

//: 
(dur: 1, sawfreq: Pwhite(0.7, 3, inf)) *> \cricket1;

//:
(dur: Pwhite(0.1, 1, inf),
sawfreq: Pwhite(0.7, 3, inf),
sawmul: Pwhite(0.1, 0.9, inf),
sawadd: Pwhite(0.1, 0.9, inf),
mod2mul: Pwhite(10, 100, inf),
mod3mul: Pwhite(1000, 5000, inf),
mod3mul2: Pwhite(0.1, 0.9, inf)

) *> \cricket1;


//:

\cricket1.clearPatterns;

// \cricket1.resetParams;

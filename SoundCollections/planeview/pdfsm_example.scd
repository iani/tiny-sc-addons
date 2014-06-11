// Wed, Jun 11 2014, 12:43 EEST
// Courtesy of Alexandros Aggelakis

(
var w;
w = Pdfsm(
    [
        Pseq([0, 1, 2, 3, 4, 5,  6],inf),    // signalStream, Dictionary order of indexes
 
        IdentityDictionary[    // state 0
			0 -> [ 1, a],    //  sends to 1st state
			1 -> [ 1, b]
        ],
        IdentityDictionary[    // state 1
			1 -> [ 2, Prand([e, f], 1)],
			2 -> [2, Prand([c, d], 1)],
 
        ],
 
		        IdentityDictionary[    // state 2
			2 -> [ 3, Prand([g, h, j], 1)],
			3 -> [3, i],
 
        ],
 
 
		        IdentityDictionary[    // state 3
			3 -> [ 4, Prand([l, n], 1)],
			4 -> [4, Prand([k, m], 1)],
 
        ],
 
		        IdentityDictionary[    // state 4
			4 -> [ 4, Prand([o, p], 1)],
			5 -> [4, Prand([q, r], 1)],
			6 -> [nil]
 
 
 
 
 
		// //state 2
		// IdentityDictionary[
		// 	0 -> [ 0, q[\wrong].choose ],
		// 	1 -> [ 0, q[\well].choose ],
		// 	2 -> [ nil ]    // signalStream is infinitely long,
		// 	// so the fsm only ends because of this nil
		// 	// 2 -> [nil, nil] is also fine
        ]
    ],
    0,                 // startState
    1                 // repeats
).asStream;
 
 
x = Array.fill(5, {w.next.asStream});
//k = {20.do}
 
y = Pseq(x, inf).asStream;
 
)
 
(
fork{
	5.do({
	y.next.play;
		1.wait;
 
	})
}
)
y.next
p.play
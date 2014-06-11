/*

Τσοπανάκος ήμουνα ... προβατάκια έβοσκα.

"I was a little shepherd, herded little sheep."

Echoes from the synonymous melody, jingle of Greek National Radio after WW II

Chance little code got by modifying an example from Help on "Event types".

Wed, Jun 11 2014, 14:09 EEST
*/

(
{
	a = (degree: 3, sustain: 40).play;
	3.wait;
	1000.do { (type: \set, id: a[\id], \note: [0, 5, 8, 11, 12].choose).play; 0.03.wait };
}.fork
)
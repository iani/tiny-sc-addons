//: Playing patterns in single parameters

{ SinOsc.ar(\freq.kr(400), 0, 0.1) } => \sound4;
// Play a pattern into ~freq:
{ 50.rrand(80).midicps } *> \freq;
// Alternative formulation:
{ 80.rrand(90).midicps } => 0.02 *> \freq;
//: Play another pattern into freq parameter:
{ 250 rrand: 350 } => 0.05 *> \freq;
//: And another:
{ [60, 62, 66, 67].choose.midicps } => Prand([0.1, 0.2, 0.4], inf) *> \freq;
//: Shorter formulation of the above (with different paremeter values):
[70, 72, 76, 77].midicps.prand => [0.2, 0.4, 0.8].prand *> \freq;
// Pattern keeps playing when new synth is chucked into tree:
{ 0.1 * LPF.ar(LFPulse.ar(\freq.kr(440)), 1000) } => \sound4;
// Open knobs interface to watch how freq changes
~st.knobs;
//  Play with global duration stored in ~dur:
{ [65, 69, 70, 73].choose.midicps } => Pfunc({ ~dur.next }) *> \freq;
// Change global duration:
0.1 =!> \dur;
// Fade out this synth
\sound4.fadeOut;


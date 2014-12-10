/* Setting synth parameters

When a synth template gets chucked to a synthtree with =>, the parameters of that synth get pushed to the current environment.  They can then be accessed and set directly as environment variables.
*/
{ 0.1 * LPF.ar(LFSaw.ar(\freq.kr(440)), \filterFreq.kr(1000)) } => \sound3;
// Parameters of last chucked SynthTree are in the environment.
// Change the filter frequency:
400 => ~filterFreq;
// Change the generator frequency:
600 => ~freq;
// Play a routine into frequency, then fade out
{ 50 do: { 50.rrand(80).midicps => ~freq; 0.05.wait }; \sound3.fadeOut(3); }.fork;
//:
{ inf do: { 50.rrand(80).midicps => ~freq; 0.05.wait }; \sound3.fadeOut(3); }.fork;
//:
{ 10 do: { 50.rrand(80).midicps => ~freq; 0.5.wait }; \sound3.fadeOut(3); }.fork;


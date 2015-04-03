
//: Addressing oF
~oF = NetAddr ("192.168.55.2", 12345);

//: Shortcut for sending to oF
~s2of = { | ... msg |
	~oF.sendMsg (*msg);
};
//: Arguments for string display
/*
string: The string to display.
x : 0
y : 0
size : (1 .. ~15)
opacity : (0 .. 255)
*/

~s2of.("/no_parenthesis_verdana", "Testing", 0, -200, 3, 255.0)

~s2of.("/no_parenthesis_verdana", "12345", 30, -270, 3, 255.0)

//: Testing with routine

{
	20 do: { | i |
		~s2of.("/no_parenthesis_verdana", "Testing", i, i, 3, 255);
		1.wait;
	}
}.fork;

//: Testing with routine

{
	20 do: { | i |
		~s2of.("/no_parenthesis_verdana", "Testing", i.sin * 100, i.cos * 100, 3, 255);
		1.wait;
	}
}.fork;

//: Testing with routine

{
	300 do: { | i |
		i = i / 4 / pi;
		~s2of.("/no_parenthesis_verdana", "Testing", i.sin / pi * 100, i.cos * 100, 3, 255);
		0.1.wait;
	}
}.fork;

//: Testing with routine

{
	300 do: { | i |
		i = i / 4 / pi;
		~s2of.("/no_parenthesis_verdana", "", i.sin / pi * 100, i.cos * 100, 3, 255);
		0.1.wait;
	}
}.fork;

//: Testing erase
~s2of.("/setx_verdana", 0);
//:



a = "a" ! 10;

a [3] = "hello"
a [0] = ""
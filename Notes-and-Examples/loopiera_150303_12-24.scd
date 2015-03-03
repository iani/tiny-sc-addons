/* Tue Mar  3 12:24:20 2015 EET */


//:
~soundPath = Platform.userAppSupportDir +/+ "sounds/";

//:
~soundPaths2 = (Platform.userAppSupportDir +/+ "sounds-tetatet/*").pathMatch;

//:
(~soundPath +/+ "*").pathMatch;

//:

~sounds1 = (~soundPath +/+ "*.wav").pathMatch collect: { | p |
	Buffer.read(Server.default, p)
};

//:

~sounds2 = ~soundPaths2 collect: { | folder |
	(folder +/+ "*.wav").pathMatch collect: { | p |
	Buffer.read(Server.default, p)
	}
};

//:

~sounds1[1].play;

//:

~sounds2.first.first;
//:

~sounds2.first.first.play;

//: First loop tests.

{
	5 do: {
		[0.1, 0.2].choose.wait;
		~sounds2.first.first.play;
	}
	
}.fork

//================ Put them in the Library ================

//: First find out the name ...
PathName(~sounds2.first.first.path).fileNameWithoutExtension;
PathName(~sounds2.first.first.path).folderName;

//: Now use it to put in the Library
~sounds2.flat do: { | b |
	var path;
	path = PathName(b.path);
	Library.put(path.folderName.asSymbol, path.fileNameWithoutExtension.asSymbol, b);
};

//: Play all sounds at hi in a first series

{
	Library.at(\hi) do: { | buffer |
		buffer.play;
		0.2.wait;
	}
	
}.fork;

//:

//: Play all sounds at hi in a first series


{
	Library.at(\hi) do: { | buffer |
		buffer.play;
		[0.2, 0.4].choose.wait;
	}
	
}.fork;

{
	Library.at(\mid) do: { | buffer |
		buffer.play;
		[0.2, 0.4].choose.wait;
	}
	
}.fork;

{
	Library.at(\lo) do: { | buffer |
		buffer.play;
		[0.2, 0.4].choose.wait;
	}
	
}.fork;


//: Make this a function
~looper1 = {
{
	Library.at(\hi) do: { | buffer |
		buffer.play;
		[0.2, 0.4].choose.wait;
	}
	
}.fork;

{
	Library.at(\mid) do: { | buffer |
		buffer.play;
		[0.2, 0.4].choose.wait;
	}
	
}.fork;

{
	Library.at(\lo) do: { | buffer |
		buffer.play;
		[0.2, 0.4].choose.wait;
	}
	
}.fork;
};


//: Test f
~looper1.value;


//: Loop the function

{
	5 do: {
		~looper1.value;
		[2.4, 3.2].choose.wait;
	} 
	
}.fork;
//: First GUI
~loopaGroup = { | group |
	{
	Library.at(group) do: { | buffer |
		buffer.play;
		[0.2, 0.4].choose.wait;
	}
	}.fork;
};

~gui  = Window().front;
~gui.view.layout = VLayout(
	Button().states_([["hi"]]).action_({ ~loopaGroup.(\hi)}),
	Button().states_([["mid"]]).action_({ ~loopaGroup.(\mid)}),
	Button().states_([["lo"]]).action_({ ~loopaGroup.(\lo)})
);






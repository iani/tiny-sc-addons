/*
Templates from posts in http://sccode.org

As collected here.  With modifications.

This class only serves to load all .scd files that are in the same folder.

*/

TanneryTemplates {

	*initClass {
		StartUp add: { 
			(PathName(this.filenameSymbol.asString).pathOnly +/+ "*.scd")
			.pathMatch do: { | p | p.load};
			[this, thisMethod.name].postln;
		}
	}

}
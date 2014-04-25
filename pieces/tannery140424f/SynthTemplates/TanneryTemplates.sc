/*
Templates from posts in http://sccode.org

As collected here.  With modifications.

This class only serves to load all .scd files that are in the same folder.

*/

TanneryTemplates {

	*initClass {
		StartUp add: { 
			(PathName(this.filenameSymbol.asString) +/+ "*.scd")
			.pathMatch do: _.load;
			[this, thisMethod.name].postln;
		}
	}

}
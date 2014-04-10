
//:

var w= Window("popuptreemenu - simple", Rect(200, 400, 300, 100)).front;
a= PopUpTreeMenu.new(w, Rect(50, 30, 100, 20))
.tree_(
	(
		'a drum': (),
		'bass': (
			'funky': (),
			'unhip': (
				'umpahTuba': (),
				'umpahUpright': ()
			)
		),
		'melo': ()
	)
);
a.action_{|view, val| ("selected:"+val).postln};


//:
a.value_(['bass', 'funky'])
a.value_(['melo'])
a.valueAction_(['bass', 'unhip', 'umpahTuba'])


//:--polling state of the menu in use - example also show custom color/font settings

var w= Window("popuptreemenu - state", Rect(400, 400, 300, 100)).front;
a= PopUpTreeMenu.new(w, Rect(10, 20, 200, 34))
	.tree_(('aaa': (), 'bbb': (), 'ccc': ('123': (), '456': (), '789': ('hier': ()))))
	.font_(Font("Arial", 24))
	.background_(Color.red(1))
	.hiliteColor_(Color.red(0.75))
	.stringColor_(Color.red(0.5));
Routine({while({w.isClosed.not}, {
	("path:"++a.currentPath).post;
	(" leaf:"++a.currentLeaf).post;
	(" value:"++a.value).postln;
	0.4.wait;
})}).play(AppClock);

//:--changing position and font while active
a.value_(['aaa'])
a.bounds_(Rect(30, 30, 100, 20));
a.font_(Font("Geneva", 10));
a.refresh
a.value;
a.sortFunc= {|a, b| a>b}
a.sortFunc= nil 			 //the default
//cmd period to stop

//:
//--scanning a folder each time menu is pressed.
//--slightly inefficient but keeps menu/folder in sync
(
var root= "~/Music".standardizePath; 	 //edit this!
var w= Window("popuptreemenu - scan", Rect(200, 400, 300, 100)).front;
var buildTreeFunc;
a= PopUpTreeMenu.new(w, Rect(10, 20, 200, 20)).items_([root.basename]);
buildTreeFunc= {|path|
	var deepPathMatch, syms, tree;
	var dir= path.dirname;
	deepPathMatch= {|pn|
		var arr= [];
		pn.pathMatch.do{|x|
			if(x.last.isPathSeparator, {
				arr= arr++deepPathMatch.value(PathName(x++"*"));
			}, {
				arr= arr++PathName(x);
			})
		};
		arr
	};
	syms= deepPathMatch.value(PathName(path)).collect{|x|
		var pathNoRoot= x.fullPath.copyToEnd(root.size);
		pathNoRoot.split($/).collect{|y| y.asSymbol}
	};
	tree= ();
	syms.do{|x|
		var parent= tree;
		x.do{|y, i|
			var node= parent[y];
			if(node.isNil, {
				parent.put(y, ());
				parent= parent[y];
			}, {
				parent= node;
			});
		};
	};
	tree;
};
a.openAction_{|view, x, y|
	("rebuilding tree of"+root).postln;
	view.tree= buildTreeFunc.value(root); //build and replace tree
};
a.closeAction_{|view, x, y| "closing".postln};
a.action_{|view, val| ("selected:"+root++val.join($/)).postln};
)
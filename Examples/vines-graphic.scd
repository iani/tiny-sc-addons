/*
	From: http://sccode.org/1-14
«Recursion-toy-like vines with Pen» by uiae on 04 Sep'11 18:16 in gui
quick port of the "vines" setting with drawing style "segmented" of recursion toy (by soulwire) original js code
This is just a quick port to SuperCollider. Original idea, code, etc. by soulwire.

Copied here on Sun, Apr 13 2014, 16:20 EEST
How to add sound to this?
*/

//:

var win, view;
var run = true;
q = ();

q.branches = List[];

q.minWanderStep = 1.0184;
q.maxWanderStep = 0.1702;
q.minGrowthRate = 10.6214;
q.maxGrowthRate = 11.8251;
q.minShrinkRate = 0.99656;
q.maxShrinkRate = 0.91265;
q.branchProbability = 0.05;
q.minDivergence = 1.3268;
q.maxDivergence = 1.3885;
q.maxConcurrent = 500;
q.numBranches = 6;
q.minRadius = 0.15;
q.maxRadius = 70;

q.makeBranch = {
	arg env, x, y, theta, radius, scale = 1.0, generation = 1;

	(
		x: x, 
		y: y,
		ox:x, 
		oy: y,
		x1: nil, x2: nil,
		y1: nil, y2: nil,
		scale: 1.0,
		theta: theta,
		oTheta:theta,
		radius:radius,
		generation:1,
		growing:true,
		age:0,
		wanderStep: rrand(q.minWanderStep, q.maxWanderStep),
		growthRate: rrand(q.minGrowthRate, q.maxGrowthRate),
		shrinkRate: rrand(q.minShrinkRate, q.maxShrinkRate),
		fRender: {
			arg that, context;
			var scale, radius;
			if(that.growing,
				{
					scale = that.scale;
					radius = that.radius * scale;

					// Draw outline
					Pen.line(that.ox@that.oy,that.x@that.y);
					
					// not in qt...
					if((GUI.scheme == "CocoaGUI") and: (radius > 5.0), {
					 	Pen.setShadow(1@1, scale, Color.new(0,0,0,0.05));
					});
					
					Pen.width = radius + scale;
					Pen.strokeColor = Color.black;
					Pen.capStyle = 1; //round
					Pen.stroke();
					
					// Draw fill
					Pen.line(that.ox@that.oy, that.x@that.y);

					Pen.width = radius;
					Pen.strokeColor = Color.white;
					Pen.capStyle = 1; //round
					Pen.stroke();
				});
		},
		fUpdate: {
			arg that;
			var theta, scale, radius, branch, offset;
			if(that.growing,
				{
					that.ox = that.x;
					that.oy = that.y;
					that.oTheta = that.theta;

					that.theta = that.theta + rrand(that.wanderStep * -1,
						that.wanderStep);
					
					that.x = that.x + (cos(that.theta) 
						* that.growthRate * that.scale);
					that.y = that.y + (sin(that.theta) 
						* that.growthRate * that.scale);

					that.scale = that.scale * that.shrinkRate;

					if(
						(q.branches.size < q.maxConcurrent)
						and:
						(1.0.rand < q.branchProbability),
						{
							offset = rrand(q.minDivergence,
								q.maxDivergence);
							theta = that.theta 
							+ (offset * [1,-1].choose);
							
							scale = that.scale * 0.95;
							radius = that.radius * scale;

							branch = q.makeBranch(
								that.x, that.y, theta, radius, scale);

							branch.generation = that.generation + 1;
							q.branches.add(branch);
						});

					if((that.radius * that.scale) <= q.minRadius, {
						that.growing = false;
					});

					that.age = (that.age + 1);							
				})
		}
	)
};

q.makeRecursion = {
	arg env;

	(
		//started: false,
		fSpawn: {
			arg env, x,  y;
			var theta, radius;
			q.branches = List[];
			q.numBranches.do{
				arg i;
				theta = (i / q.numBranches) * 2pi;
				radius = q.maxRadius;
				q.branches.add(q.makeBranch(x, y, theta - (pi/2), radius));
			}
		},
		fUpdate: {
			arg env;
			var index;
			var numBranches = q.branches.size;
			q.branches.do{
				arg branch, i;
				branch.fUpdate;
				branch.fRender;
			};
			//strip dead branches
			
			numBranches.do{
				|i|
				index = numBranches - (i + 1);
				if(q.branches[index].growing.not,
					{
						q.branches.removeAt(index);
					})
			}
		}
	)	
};

r = q.makeRecursion;
r.fSpawn(350,350);
win = Window(
	"grow! (click to restart)", Rect(10, 10, 700, 700)
);
win.onClose = { run = false; };
view = UserView(win, 700@700).drawFunc_({ r.fUpdate }).clearOnRefresh_(false).mouseDownAction_({ |v,x,y| view.clearDrawing; r.fSpawn(x,y) });
win.front;
{ while { run } { win.refresh; 0.05.wait } }.fork(AppClock)
//:
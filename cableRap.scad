// Author: Laurent Brunel
// Licence: creative commons
// CableRap by Laurent Brunel is licensed under a 
// Creative CommonsAttribution-NonComercial 4.0 Internacional
// http://creativecommons.org/licenses/by-nc/4.0/
// Refer to this page when citing CableRap: 
// http://fablabsantander.org/wiki/index.php/CableRap

use<metric_fastners.scad>;

L=525;
l=525;


//moteur NEMA17
motSide=42;
motDep=47.65;
motAxisD=5;
motAxisL=21.5;
motScrewFixD=3;
motScrewsDist=31;
motFrontD=22;
motFrontH=1.5;

//moteur NEMA13
nema13_motSide=34.5;
nema13_motDep=36;
nema13_motAxisD=4.90;
nema13_motAxisL=19;
nema13_motScrewFixD=3;
nema13_motScrewsDist=26;
nema13_motFrontD=24;
nema13_motFrontH=2;


hPulley=8;
dPulley=20;
depPulley=2;

dLM=15; //minear bearing external diameter
hLM=24;//length of linear bearing

dCable=1;
dCablePassage=3;

guideD=8;//guide diameter
interGuidesdZ=guideD+0.5;

//head, moving plateform 
headD=69;
epHeadPlate=4;
epHead=3;
dZHead=interGuidesdZ+dLM+epHead+epHeadPlate;
interHole=12.5;

playFree=0.7;
playFix=0.4;

l_connexion_screws=35;

//motor connexion parameters:
epMotorCon=3;
guideConX=3.2*guideD;
guideConY=3.3*guideD;
guideConZ=2.57*guideD;
guideConOffset=dPulley/2+3;

//pen holder spring:
penSpringDiam=5.8;
penSpringLength=35;


X=260;
Y=200;
Z=9;



//all the system:
allTogether();
//motor();
//penZone();

//TO PRINT:
//rotate([0,90,0])embout2();
//rotate([0,180,0])motorConexion();
//rotate([0,90,0])guideConnexion();
//rotate([0,90,0])carriage();
//pulley();
//pulleyPrinted(true);
//pulleyWithBearingCut();
//rotate([0,180,0])head();
//rotate([0,-90,0])noMotor();
//rotate([0,90,0]) penHolder();
//rotate([0,0,0]) penHolder21();translate([0,-14,0])rotate([0,0,0])penHolder22();
//rotate([0,90,0]) penHolder22();
//rotate([0,-90,0])penHolder3PenHolder();
//smallMotorHolder();
//translate([0,0,0]) rotate([0,90,0])penHolder3bracket();
//translate([20,0,0]) rotate([0,90,0])penHolder3bracket();
//motor bracket:
//translate([40,0,0]) rotate([0,90,0])penHolder3bracket(l=25);
//penHolder3PenAttach();
//endstop_holder();
//rotate([90,0,0])endstop_holder_top();

module allTogether()
{
//motors:
color([0.5,0.5,0.8]) translate([0,0,motDep])rotate([0,-90,0]) motor_nema17();
color([0.5,0.5,0.8]) translate([0,L,motDep])rotate([0,-90,0]) motor_nema17();
//screws wher there is no motor:
color("grey")translate([l,0,0]) cap_bolt(5,75);
color("grey")translate([l,L,0]) cap_bolt(5,75);
// conexion to screw when there is no motor:
translate([l,0,motDep])rotate([0,-90,0])noMotor();
translate([l,L,motDep])rotate([0,-90,0])noMotor();

//for(k=[0,1])for(j=[0,1]) translate([k*l,j*L,motDep]) rotate([0,0,0])
translate([0,0,motDep])rotate([0,0,0])
	{
	motorConexion();
	translate([0,0,epMotorCon])guideConnexion();
	translate([0,0,epMotorCon+guideConZ])rotate([0,0,90])rotate([180,0,0])guideConnexion();
	color("grey")translate([0,0,guideConZ+epMotorCon+epMotorCon*2])connexionScrews();
	//fixation to base:
	translate([motSide*0.7,motSide*0.42,0])
		{
		translate([0,0,-motDep-10]) cylinder(r=6/2,h=70);
		translate([0,0,epMotorCon])flat_nut(6);
		}
	}
translate([l,0,motDep])rotate([0,0,90])
	{
	motorConexion();
	translate([0,0,epMotorCon])guideConnexion();
	translate([0,0,epMotorCon+guideConZ])rotate([0,0,90])rotate([180,0,0])guideConnexion();
	color("grey")translate([0,0,guideConZ+epMotorCon+epMotorCon*2])connexionScrews();
	//fixation to base:
	translate([motSide*0.7,motSide*0.42,0])
		{
		translate([0,0,-motDep-10]) cylinder(r=6/2,h=70);
		translate([0,0,epMotorCon])flat_nut(6);
		}
	}
translate([0,L,motDep])rotate([0,0,-90])
	{
	motorConexion();
	translate([0,0,epMotorCon])guideConnexion();
	translate([0,0,epMotorCon+guideConZ])rotate([0,0,90])rotate([180,0,0])guideConnexion();
	//endstop_holder();
	color("grey")translate([0,0,guideConZ+epMotorCon+epMotorCon*2])connexionScrews();
	//fixation to base:
	translate([motSide*0.7,motSide*0.42,0])
		{
		translate([0,0,-motDep-10]) cylinder(r=6/2,h=70);
		translate([0,0,epMotorCon])flat_nut(6);
		}
	}
translate([l,L,motDep])rotate([0,0,180])
	{
	motorConexion();
	translate([0,0,epMotorCon])guideConnexion();
	translate([0,0,epMotorCon+guideConZ])rotate([0,0,90])rotate([180,0,0])guideConnexion();
	//endstop_holder();
	color("grey")translate([0,0,guideConZ+epMotorCon+epMotorCon*2])connexionScrews();
	//fixation to base:
	translate([motSide*0.7,motSide*0.42,0])
		{
		translate([0,0,-motDep-10]) cylinder(r=6/2,h=70);
		translate([0,0,epMotorCon])flat_nut(6);
		}
	}



translate([0,0,100])rotate([180,0,0])csk_bolt(3,30);

//end stops:
	translate([0,70,motDep+Z])
		{
		rotate([90,0,0])endstop_holder();
		rotate([90,180,0])endstop_holder();
		translate([0,0,3])rotate([-90,0,0])endstop_holder_top();
		}
rotate([0,0,-90])	translate([-l,70,motDep+interGuidesdZ+Z])
		{
		rotate([90,0,0])endstop_holder();
		rotate([90,180,0])endstop_holder();
		translate([0,0,3])rotate([-90,0,0])endstop_holder_top();
		}


//X pulleys
translate([0,0,motDep+Z])
	{
	translate([0,0,0])pulley();
	translate([0,L,0])pulley();
	translate([l,L,0])pulley();
	translate([l,0,0])pulley();
	}
//Y pulleys
translate([0,0,motDep+Z+interGuidesdZ])
	{
	translate([0,0,0])pulley();
	translate([0,L,0])pulley();
	translate([l,L,0])pulley();
	translate([l,0,0])pulley();
	}
color ("grey")
translate([0,0,motDep+Z])
	{
	//guides X
	translate([0,Y,0])rotate([0,90,0])translate([0,0,(dPulley+dCablePassage)/2])
		cylinder(r=guideD/2,h=l-dPulley-dCablePassage,center=false);
	translate([dPulley,0,interGuidesdZ])rotate([0,90,0])cylinder(r=guideD/2,h=l-dPulley*2);
	translate([dPulley,L,interGuidesdZ])rotate([0,90,0])cylinder(r=guideD/2,h=l-dPulley*2);
	//guide Y
	translate([X,0,interGuidesdZ])rotate([-90,0,0])translate([0,0,(dPulley+dCablePassage)/2])
		cylinder(r=guideD/2,h=L-dPulley-dCablePassage);
	translate([0,dPulley,0])rotate([-90,0,0])cylinder(r=guideD/2,h=L-dPulley*2);
	translate([l,dPulley,0])rotate([-90,0,0])cylinder(r=guideD/2,h=L-dPulley*2);
	}

//cable
color ("grey")translate([0,0,motDep+Z])
	{
	for(k=[0,1])for(j=[0,1])for(i=[-1,1])translate([0,j*L+(dPulley/2+dCable/2)*i,k*interGuidesdZ])rotate([0,90,0])cylinder(r=dCable/2,h=l);
	for(k=[0,1])for(j=[0,1])for(i=[-1,1])translate([j*l+(dPulley/2+dCable/2)*i,0,k*interGuidesdZ])rotate([-90,0,0])cylinder(r=dCable/2,h=L);
	}

//moving head to hold the tool
translate([X,Y,motDep+Z]) 
	{
	head();
	translate([0,headD/2-hLM/2,interGuidesdZ]) rotate([90,0,0]) LM8UU();
	translate([0,-headD/2+hLM/2,interGuidesdZ]) rotate([90,0,0]) LM8UU();
	translate([headD/2-hLM/2,0,0]) rotate([0,90,0]) LM8UU();
	translate([-headD/2+hLM/2,0,0]) rotate([0,90,0]) LM8UU();
	}

//pen holder
//translate([X+20+12.5,Y,94])rotate([0,0,0]) penSystem();
translate([X+20+12.5,Y,94])rotate([0,0,0]) penSystemServo();

//pen holder spring:
//color("grey")translate([X+20,Y+15,94])rotate([0,0,0]) translate([5+7,25,0]) penSpring();

//carriages and bearings:
translate([0,0,motDep+Z])
{
//carriage Y 1: 
translate([0,Y,0])  { rotate([0,0,90])carriage();rotate([90,0,0])color("grey")LM8UU();}
//carriage Y 2: 
translate([l,Y,0]) {rotate([0,0,90])carriage();rotate([90,0,0])color("grey")LM8UU();}
//carriage X 1: 
translate([X,0,interGuidesdZ]) {rotate([180,0,0])carriage();rotate([0,90,0])color("grey")LM8UU();}
//carriage X 2: 
translate([X,L,interGuidesdZ]){ rotate([180,0,0])carriage();rotate([0,90,0])color("grey")LM8UU();}
}

//sheet of paper:
//color([0.8,0.8,0.8])translate([l/2,L/2,0])cube([210,297,0.5],center=true);

//base plate:
color([0.7,0.6,0.6])translate([-50,-40,-19])cube([605,605,19],center=false);

}



module penSystem()
{
//motor for pen:

	{
	//small motor:
	color([0.5,0.5,0.8]) motor_nema13();
	//small motor holder:
	translate([-20,0,-17])smallMotorHolder();
	//translate([5,0,0]) penHolder21();
	//translate([5,0,0]) penHolder22();
	//pen:
	//translate([12,35,-100]) cylinder(r=4.5,h=150);
		//motor lever:
	translate([4.5,0,0]) penHolder31();
	//mechanism base:
	translate([5,0,0]) penHolder32();
	//parallelogram brackets:
	translate([13.5,0,-25]) penHolder3bracket();
	translate([13.5,0,-66]) penHolder3bracket();
	//motor bracket:
	translate([8,30,0]) rotate([-90,0,0])penHolder3bracket(l=25);
	//pen holder:
	translate([-1.8,0,-5]) penHolder3PenHolder();
	//pen attach:
	translate([31,17,-62.5]) penHolder3PenAttach();
	//spring
	%translate([31,17,-48])penHolder3Spring();
	//pen:
	color("red")translate([31,17,-94]) cylinder(r=4.5,h=100,$fn=20);
	}

}





module penZone()
{
//motor for pen:
translate([X+20+12.5,Y,94])rotate([0,0,0]) 
	{
	//small motor:
	color([0.5,0.5,0.8]) motor_nema13();
	//small motor holder:
	translate([-20,0,-17])smallMotorHolder();
	//translate([5,0,0]) penHolder21();
	//translate([5,0,0]) penHolder22();
	//motor lever:
	translate([4.5,0,0]) penHolder31();
	//mechanism base:
	translate([5,0,0]) penHolder32();
	//parallelogram brackets:
	translate([13.5,0,-25]) penHolder3bracket();
	translate([13.5,0,-66]) penHolder3bracket();
	//motor bracket:
	translate([8,30,0]) rotate([-90,0,0])penHolder3bracket(l=25);
	//pen holder:
	translate([-1.8,0,-5]) penHolder3PenHolder();
	//pen attach:
	translate([31,17,-62.5]) penHolder3PenAttach();
	//spring
	%translate([31,17,-48])penHolder3Spring();
	//pen:
	%translate([31,17,-94]) cylinder(r=4.5,h=150,$fn=20);
	}
//pen holder spring:
//color("grey")translate([X+20,Y+15,94])rotate([0,0,0]) translate([5+7,25,0]) penSpring();
translate([X,Y,motDep+Z]) head();
color ("grey")
translate([0,0,motDep+Z])
	{
	//guides X
	
	translate([0,Y,0])rotate([0,90,0])translate([0,0,(dPulley+dCablePassage)/2])
		cylinder(r=guideD/2,h=l-dPulley-dCablePassage,center=false);
	//translate([dPulley,0,interGuidesdZ])rotate([0,90,0])cylinder(r=guideD/2,h=l-dPulley*2);
	//translate([dPulley,L,interGuidesdZ])rotate([0,90,0])cylinder(r=guideD/2,h=l-dPulley*2);
	
	//guide Y
	/*
	translate([X,0,interGuidesdZ])rotate([-90,0,0])translate([0,0,(dPulley+dCablePassage)/2])
		cylinder(r=guideD/2,h=L-dPulley-dCablePassage);
	translate([0,dPulley,0])rotate([-90,0,0])cylinder(r=guideD/2,h=L-dPulley*2);
	translate([l,dPulley,0])rotate([-90,0,0])cylinder(r=guideD/2,h=L-dPulley*2);
	*/
	}
}



//pen holder 3rd try , element 1: motor lever
module penHolder31()
{
//pen holder:
//intersection()
	{
	difference()
		{
		//motor lever
		union()
			{
			translate([9,-6,-6])cube([10,41,12]);
			translate([9,0,0])rotate([0,90,0])cylinder(r=10,h=10,$fn=30);
			}
		//hole for the motor axis
		translate([-1,0,0])rotate([0,90,0])cylinder(r=5/2,h=30,$fn=20);
		//hole to fix on the motor axis:
		translate([14,0,-10])rotate([0,0,0])cylinder(r=(3.2)/2,h=30,$fn=20);
		//hole for bracket:
		translate([-1,30,0])rotate([0,90,0])cylinder(r=3.2/2,h=30,$fn=20);
		}
	//translate([-1,19,0])rotate([0,90,0])cylinder(r=50/2,h=30,$fn=100);
	//translate([5,19,-10])rotate([0,0,0])cylinder(r=50/2,h=30,$fn=100);
	}
}



//pen holder 3rd try , element 2, vertical base
module penHolder32()
{
difference()
	{
	union()
		{
		//lower fixation on motor:
		translate([1,-17,-19])cube([7,34,12]);
		//lower part:
		translate([1,-5,-71])cube([7,20,56]);
		//lo
		translate([1,-10,-10])cube([7,20,27]);
		//uppper fixation on motor
		translate([-5,-17,7])cube([13,34,10]);
		}
	//holes to fix on the motor holder
	translate([-15,-nema13_motScrewsDist/2,-13])rotate([0,90,0])cylinder(r=3.2/2,h=30,$fn=20);
	translate([-15,nema13_motScrewsDist/2,-13])rotate([0,90,0])cylinder(r=3.2/2,h=30,$fn=20);
	//holes for paralelogram articulation
	translate([-15,0,-25])rotate([0,90,0])cylinder(r=3.2/2,h=50,$fn=20);
	translate([-15,0,-66])rotate([0,90,0])cylinder(r=3.2/2,h=50,$fn=20);
	//space for guide:
	translate([-15,-5,-44])scale([1,1.7,1.9])rotate([0,90,0])cylinder(r=15/2,h=50,$fn=30);
	//holes to fix on motor:
	translate([-15,-nema13_motScrewsDist/2,nema13_motScrewsDist/2])rotate([0,90,0])cylinder(r=3.2/2,h=50,$fn=20);
	translate([-15,nema13_motScrewsDist/2,nema13_motScrewsDist/2])rotate([0,90,0])cylinder(r=3.2/2,h=50,$fn=20);
	//avoid motor front:
	translate([-5,0,0])rotate([0,90,0]) cylinder(h=nema13_motFrontH+0.5,r=nema13_motFrontD/2+1,center=false,$fn=_fn);
	//space for motor axis:
	translate([-10,0,-2])scale([1,1,2.1])rotate([0,90,0])cylinder(r=12/2,h=50,$fn=20);
	}
}



//pen holder 3rd try , bracket
module penHolder3bracket(l=30)
{
difference()
	{
	union()
		{
		translate([0,0,-5])cube([5,l,10]);
		translate([0,0,0])rotate([0,90,0])cylinder(r=5,h=5,$fn=30);
		translate([0,l,0])rotate([0,90,0])cylinder(r=5,h=5,$fn=30);
		}
	translate([-1,0,0])rotate([0,90,0])cylinder(r=3/2,h=10,$fn=30);
	translate([-1,l,0])rotate([0,90,0])cylinder(r=3/2,h=10,$fn=30);
	}
}



//pen holder 3rd try , bracket
module penHolder3PenHolder()
{
z1=12;
z2=-41;
difference()
	{
	union()
		{
		translate([21,8,-66])cube([5,27,61]);
		for (z=[z1,z2]) translate([26,8,-25+z])difference()
			{
			//body
			cube([17,18,8]);
			//hole for screw 
			translate([9,9,4])rotate([0,90,0])cylinder(r=3.5/2,h=10,$fn=20);
			//pen hole 
			translate([7,9,-2])cylinder(r=5.3,h=15,$fn=20);
			//hole for articulation:
			//translate([-19,19,5])rotate([0,90,0])cylinder(r=3.5/2,h=50,$fn=20);
			}
		}
	for (z=[z1-12,z2-1]) translate([26-19,11+19,-25+5+z])
			//hole for articulation:
			//translate([-19,19,5])
			rotate([0,90,0])cylinder(r=2.5/2,h=50,$fn=20);
	//space lightness
	translate([-15,20,-36])scale([1,1,2.2])rotate([0,90,0])cylinder(r=17/2,h=50,$fn=30);
	}
}



module penHolder3PenAttach()
{
difference()
	{
	//translate([-17/2,-18/2,0])cube([17,18,8]);
	cylinder(r=16/2,h=15,$fn=20);
	//hole for screw 
	translate([0,0,7])rotate([0,90,0])cylinder(r=3.5/2,h=10,$fn=20);
	//pen hole 
	translate([0,0,-1])cylinder(r=5.3,h=35,$fn=20);
	}



}



//pen holder 3rd try , spring around the pen:
module penHolder3Spring()
{
difference()
{
cylinder(r=13.5/2,h=30,$fn=20);
translate([0,0,-1])cylinder(r=(13.5-12.1)/2,h=32,$fn=20);
}
}


module smallMotorHolder()
{
intersection()
{
difference()
	{
	translate([-6,-65/2,0])cube([32,65,8]);
	translate([20-3,-nema13_motScrewsDist/2,(nema13_motSide-nema13_motScrewsDist)/2])rotate([0,90,0])cylinder(r=3.5/2,h=15,$fn=20);
	translate([20-3,nema13_motScrewsDist/2,(nema13_motSide-nema13_motScrewsDist)/2])rotate([0,90,0])cylinder(r=3.5/2,h=15,$fn=20);
	translate([interHole,-interHole*2,-1])rotate([0,0,0])cylinder(r=7/2,h=15,$fn=20);
	translate([interHole,interHole*2,-1])rotate([0,0,0])cylinder(r=7/2,h=15,$fn=20);
	translate([0,-interHole*2,-1])rotate([0,0,0])cylinder(r=7/2,h=15,$fn=20);
	translate([0,interHole*2,-1])rotate([0,0,0])cylinder(r=7/2,h=15,$fn=20);
	//place for motor:
	translate([-17.5,-(nema13_motSide+2)/2,-1])cube([nema13_motDep+2,nema13_motSide+2,15]);
	//avoid motor front:
	translate([20,0,17])rotate([0,90,0]) cylinder(h=nema13_motFrontH+0.5,r=nema13_motFrontD/2+1,center=false,$fn=_fn);
	}
translate([0,0,0])cylinder(r=headD/2,h=15,$fn=100);
}

//motScrewsDist interHole
}





module penHolder()
{
//pen holder:
intersection()
{
difference()
	{
	translate([0,-6,-12/2])cube([14,50,12]);
	translate([14/2,3,0])rotate([90,0,0])cylinder(r=3.5/2,h=10,$fn=20);
	translate([14/2,50+1,0])rotate([90,0,0])cylinder(r=3.5/2,h=10,$fn=20);
	translate([14/2,35,-7])cylinder(r=4.5,h=15,$fn=20);
	translate([-1,0,0])rotate([0,90,0])cylinder(r=5/2,h=20,$fn=20);
	translate([-1,15,43])rotate([0,90,0])cylinder(r=80/2,h=16,$fn=100);
	translate([-1,15,-43])rotate([0,90,0])cylinder(r=80/2,h=16,$fn=100);
	}
translate([-1,19,0])rotate([0,90,0])cylinder(r=50/2,h=16,$fn=100);
}

}


//motor side pen holder
module penHolder21()
{
//pen holder:
intersection()
	{
	difference()
		{
		translate([0,-6,-5])cube([30,20,12]);
		//hole for the motor axis
		translate([-1,0,0])rotate([0,90,0])cylinder(r=5/2,h=30,$fn=20);
		//hole to fix on the motor axis:
		translate([7,0,-10])rotate([0,0,0])cylinder(r=(3.2)/2,h=30,$fn=20);
		//hole for the spring:
		translate([7,5,0])rotate([-90,0,0])cylinder(r=(penSpringDiam+0.5)/2,h=30,$fn=20);
		translate([20,5,0])rotate([-90,0,0])cylinder(r=(penSpringDiam+0.5)/2,h=30,$fn=20);
		//hole to fix  the spring:
		translate([7,10,-10])rotate([0,0,0])cylinder(r=(3.2)/2,h=30,$fn=20);
		translate([20,10,-10])rotate([0,0,0])cylinder(r=(3.2)/2,h=30,$fn=20);
		}
	translate([-1,19,0])rotate([0,90,0])cylinder(r=50/2,h=30,$fn=100);
	translate([5,19,-10])rotate([0,0,0])cylinder(r=50/2,h=30,$fn=100);
	}
}



//pen side pen holder
module penHolder22()
{
//pen holder:
translate([0,10,0])
intersection()
	{
	difference()
		{
		//body
		translate([0,-6+29,-5])cube([30,22,12]);
		//holes for screws to fix the pens:
		translate([7,50+1,0])rotate([90,0,0])cylinder(r=3.5/2,h=10,$fn=20);
		translate([20,50+1,0])rotate([90,0,0])cylinder(r=3.5/2,h=10,$fn=20);
		//pen hole 1:
		translate([14/2,35,-7])cylinder(r=4.5,h=15,$fn=20);
		//pen hole 2
		translate([21,37,-7])cylinder(r=5.5,h=15,$fn=20);
		//hole for the spring:
		translate([7,20,0])rotate([-90,0,0])cylinder(r=(penSpringDiam+0.5)/2,h=15,$fn=20);
		translate([20,20,0])rotate([-90,0,0])cylinder(r=(penSpringDiam+0.5)/2,h=15,$fn=20);
		//hole to fix  the spring:
		translate([7,27,-10])rotate([0,0,0])cylinder(r=(3.2)/2,h=30,$fn=20);
		translate([20,27,-10])rotate([0,0,0])cylinder(r=(3.2)/2,h=30,$fn=20);
		}
	//translate([-1,19,0])rotate([0,90,0])cylinder(r=50/2,h=16,$fn=100);
	}
}



module penSpring()
{
translate([0,0,0])rotate([90,0,0])cylinder(r=penSpringDiam/2,h=penSpringLength);
}






//translate([12,10,200])color([0.2,0.2,0.2])rotate([0,0,90])rotate([0,180,0])import("servo_grand.stl");



module penSystemServo()
{
//motor for pen:
translate([12,-10,0])color([0.2,0.2,0.2])rotate([0,0,90])rotate([0,180,0])import("servo_grand.stl");

	{
	//small motor:
	//color([0.5,0.5,0.8]) motor_nema13();
	//servo holder:
	translate([-20,0,-17])smallMotorHolder();
	//motor lever:
	translate([4.5,0,0]) penHolderServoMotorLever();
	//mechanism base:
	color([0.8,0.2,0.2,0.8])translate([5,0,0]) penHolderServo32();
	//parallelogram brackets:
	translate([13.5,0,-25]) penHolder3bracket();
	translate([13.5,0,-66]) penHolder3bracket();
	//motor bracket:
	translate([8,30,0]) rotate([-90,0,0])penHolder3bracket(l=25);
	//pen holder:
	translate([-1.8,0,-5]) penHolder3PenHolder();
	//pen attach:
	translate([31,17,-62.5]) penHolder3PenAttach();
	//spring
	%translate([31,17,-48])penHolder3Spring();
	//pen:
	color("red")translate([31,17,-94]) cylinder(r=4.5,h=100,$fn=20);
	}

}


//pen holder 3rd try , element 1: motor lever
module penHolderServoMotorLever()
{
//pen holder:
//intersection()
	{
	difference()
		{
		//motor lever
		union()
			{
			translate([9,-6,-6])cube([7,41,12]);
			translate([9,0,0])rotate([0,90,0])cylinder(r=10,h=7,$fn=30);
			}
		//hole for the motor axis
		translate([-1,0,0])rotate([0,90,0])cylinder(r=5.8/2,h=15,$fn=20);
		//hole for the motor axis
		translate([-1,0,0])rotate([0,90,0])cylinder(r=3/2,h=30,$fn=20);
		//hole to fix on the motor axis:
		translate([12.5,0,-10])rotate([0,0,0])cylinder(r=(3.2)/2,h=30,$fn=20);
		//hole for bracket:
		translate([-1,30,0])rotate([0,90,0])cylinder(r=3.2/2,h=30,$fn=20);
		}
	//translate([-1,19,0])rotate([0,90,0])cylinder(r=50/2,h=30,$fn=100);
	//translate([5,19,-10])rotate([0,0,0])cylinder(r=50/2,h=30,$fn=100);
	}
}


//pen holder 3rd try , element 2, vertical base
module penHolderServo32()
{
difference()
	{
	union()
		{
		//lower fixation on motor:
		translate([1,-17-21,-19])cube([7,34+21,12+17]);
		//lower part:
		translate([1,-5,-71])cube([7,20,56]);
		//lo
		translate([1,-10,-10])cube([7,20,27]);
		//uppper fixation on motor
		//translate([-5,-17,7])cube([13,34,10]);
		}
	//holes to fix on the motor holder
	translate([-15,-nema13_motScrewsDist/2,-13])rotate([0,90,0])cylinder(r=3.2/2,h=30,$fn=20);
	translate([-15,nema13_motScrewsDist/2,-13])rotate([0,90,0])cylinder(r=3.2/2,h=30,$fn=20);
	//holes for paralelogram articulation
	translate([-15,0,-25])rotate([0,90,0])cylinder(r=3.2/2,h=50,$fn=20);
	translate([-15,0,-66])rotate([0,90,0])cylinder(r=3.2/2,h=50,$fn=20);
	//space for guide:
	translate([-15,-5,-44])scale([1,1.7,1.9])rotate([0,90,0])cylinder(r=15/2,h=50,$fn=30);
	//holes to fix on motor:
	translate([-15,-nema13_motScrewsDist/2,nema13_motScrewsDist/2])rotate([0,90,0])cylinder(r=3.2/2,h=50,$fn=20);
	translate([-15,nema13_motScrewsDist/2,nema13_motScrewsDist/2])rotate([0,90,0])cylinder(r=3.2/2,h=50,$fn=20);
	//avoid motor front:
	translate([-5,0,0])rotate([0,90,0]) cylinder(h=nema13_motFrontH+0.5,r=nema13_motFrontD/2+1,center=false,$fn=_fn);
	//space for motor axis:
	translate([-10,0,-2])scale([1,1,2.1])rotate([0,90,0])cylinder(r=12/2,h=50,$fn=20);
	}
}



module carriage()
{
bx=hLM+12;
by=dPulley+6+20;
bz=dLM+8;
intersection()
{
difference()
	{
	translate([-bx/2,-dPulley-5-4,-bz/2]) cube([bx,by,bz],center=false);
	//guide X for head:
	translate([0,0,0])rotate([90,0,0])translate([0,0,0])cylinder(r=(guideD+playFix)/2,h=by,center=false,$fn=50);
	//cable passage
	for (j=[0,1])for (i=[-1,1]) translate([-1,i*(dPulley/2+dCable/2),j*interGuidesdZ])rotate([0,90,0])translate([0,0,0])cylinder(r=(dCablePassage)/2,h=bx+3,center=true,$fn=20);
		//cable bloking
	for (j=[-1,1])for (i=[-1,1])translate([i*bx*0.34,j*by*0.25,0])rotate([90,0,0])translate([0,0,0])cylinder(r=(2.5)/2,h=by,center=true,$fn=20);
		//cable blocking access
	for (j=[-1,1])for (i=[-1,1])translate([i*bx*0.34,-dLM/2-11,0])rotate([90,0,0])cylinder(r=(9)/2,h=by,center=false,$fn=20);
	//platform bar blocking:
	for (j=[-1])translate([0,j*by*0.45,0])rotate([0,0,0])translate([0,0,0])cylinder(r=(3.2)/2,h=by,center=true,$fn=20);
	//linear bearing bloking:
	for (j=[0])translate([j*bx*0.3,0,0])rotate([0,0,0])translate([0,0,0])cylinder(r=(2.5)/2,h=by,center=true,$fn=20);
	//hole for linear bearing:
	translate([0,0,0])rotate([0,90,0])translate([0,0,0])cylinder(r=(dLM+playFree)/2,h=by+2,center=true,$fn=50);
	//slit for guide pressing:
	translate([-bx/2-1,-by-dLM-3,-1.5/2])cube([bx+2,by,1.5]);
	//platform bar pressing:
	for (j=[-1])for (i=[-1,1])translate([i*(guideD/2+2),j*by*0.55,0])rotate([0,0,0])translate([0,0,0])cylinder(r=(3.2)/2,h=by,center=true,$fn=20);
	}
//chamfers
//rotate([0,90,0])translate([0,0,-bx/2-1])cylinder(r=bx*0.94,h=bx+2,$fn=100);
}
}


module pulleyWithBearingCut()
{
intersection()
{
pulleyWithBearing();
translate([-100,0,-100])cube([200,200,200]);
}
}

module pulleyWithBearing()
{
pulleyPrinted(true);
color("grey")translate([0,0,0])pulleyBearing();
}

module pulley()
{
pulleyPrinted(false);
}


module pulleyPrinted(withBearing=true)
{
difference()
{
translate([0,0,-hPulley/6]) union()
	{
	translate([0,0,hPulley*3/6]) cylinder(h=hPulley/6,r=(dPulley+depPulley*2)/2,$fn=50);
	translate([0,0,hPulley/3]) cylinder(h=hPulley/6,r2=(dPulley+depPulley*2)/2,r1=dPulley/2,$fn=50);
	translate([0,0,0]) cylinder(h=hPulley/3,r=dPulley/2,$fn=50);
	translate([0,0,-hPulley/6]) cylinder(h=hPulley/6,r1=(dPulley+depPulley*2)/2,r2=dPulley/2,$fn=50);
	translate([0,0,-hPulley*2/6]) cylinder(h=hPulley/6,r=(dPulley+depPulley*2)/2,$fn=50);
	}
//motor axis hole:
translate([0,0,-hPulley]) cylinder(h=hPulley*2,r=motAxisD/2,$fn=50);
//bearing place:
if (withBearing) translate([0,0,-hPulley/2+1.4]) cylinder(h=hPulley*2,r=(16+0.5)/2,$fn=50);
//blocking screw hole, M3:
translate([0,0,0]) rotate([90,0,0]) cylinder(h=dPulley,r=2.5/2,$fn=20);
}
}


// RS 618-9878
module pulleyBearing()
{
di=5;
de=16;
ep=5;
translate([0,0,-ep/2])
difference()
{
cylinder(r=de/2,h=ep,$fn=40);
translate([0,0,-1])cylinder(r=di/2,h=ep+2,$fn=40);

}
}


module head()
{

difference()
	{
	translate([0,0,-dLM/2-epHead])cylinder(h=dZHead,r=headD/2,$fn=100);
	//guide X hole for linear bearing
	translate([0,0,0])rotate([0,90,0])translate([0,0,-1])cylinder(r=(dLM+playFix)/2,h=headD+2,center=true);
	//guide Y hole for linear bearing
	translate([0,0,interGuidesdZ])rotate([-90,0,0])translate([0,0,-1])cylinder(r=(dLM+playFix)/2,h=headD+2,center=true);
	//holes to fix things on 
	for (i=[-2:2])for (j=[-1:1]) translate([i*interHole,j*interHole,interGuidesdZ+dLM/2-5]) cylinder(r=2.5,h=epHeadPlate+6,center=false,$fn=20);
	for (i=[-1:1])for (j=[-2,2]) translate([i*interHole,j*interHole,interGuidesdZ+dLM/2-1]) cylinder(r=2.5,h=epHeadPlate+2,center=false,$fn=20);
	//less matter to print:
	difference()
		{
		translate([0,0,-dLM/2-epHead-epHeadPlate])cylinder(h=dZHead,r=(headD-epHead*2)/2);
		translate([0,0,-dLM/2-epHead-epHeadPlate])cylinder(h=dZHead,r=(headD-hLM*2+epHead*4)/2);
		}
	//less matter to print:
	translate([0,0,-dLM/2-epHead-epHeadPlate])cylinder(h=dZHead,r=(headD-hLM*2+epHead*2)/2);
	//less matter to print:
	for(i=[-1,1])translate([0,i*(headD/2-epHead/2),-dZHead*0.5+interGuidesdZ-dLM/2-epHead]) scale([1,2,1]) rotate([0,90,0]) cylinder(r=dZHead*0.5,h=headD,center=true,$fn=100) ;
	}
}




//to make more rigid the corners
module rigidifierPlate()
{

translate([0,0,0])
difference()
	{
	union()
		{
		translate([0,0,+epMotorCon/2])	cube (size=[motSide,motSide,epMotorCon],center=true);
		//extensions for guide connector
		translate([0,motSide/2,0])scale([1,1,1]) cylinder(h=epMotorCon,r=motSide/2,$fn=50);
		translate([motSide/2,0,0])scale([1,1,1]) cylinder(h=epMotorCon,r=motSide/2,$fn=50);
		}
	//motor screw holes:
	//for(i=[-1,1])for(j=[-1,1])translate([i*motScrewsDist/2,j*motScrewsDist/2,-1]) rotate([0,0,0]) cylinder(h=10,r=1.5,$fn=20);
	//wheel hole:
	translate([0,0,-1]) cylinder(h=epMotorCon+2,r=(motAxisD)/2,center=false,$fn=30);
	//holes for M3 pressing screws:
	for(j=[-1,1])for(i=[-1,1])translate([guideConOffset+guideConX*(0.65+i*0.2),j*(guideD/2+dPulley/2)/2,-1])cylinder(r=2.5/2,h=epMotorCon+2,$fn=20);
	rotate([0,0,90]) for(j=[-1,1])for(i=[-1,1])translate([guideConOffset+guideConX*(0.65+i*0.2),j*(guideD/2+dPulley/2)/2,-1])cylinder(r=2.5/2,h=epMotorCon+2,$fn=20);
	//chamfer
	translate([-motSide*0.78,-motSide*0.78,epMotorCon/2])	rotate([0,0,45]) cube (size=[motSide,motSide,epMotorCon+2],center=true);
	}

}



//conexion guide/motors
module motorConexion()
{

translate([0,0,epMotorCon])
difference()
	{
	connexion();
	//motor screw holes:
	for(i=[-1,1])for(j=[-1,1])translate([i*motScrewsDist/2,j*motScrewsDist/2,-epMotorCon-1]) rotate([0,0,0]) cylinder(h=10,r=1.5,$fn=20);
	//wheel hole:
	translate([0,0,-epMotorCon-1]) cylinder(h=epMotorCon+2,r=(dPulley+depPulley*2+2)/2,center=false,$fn=30);
	//holes for M3 pressing screws:
	for(j=[-1,1])for(i=[-1,1])translate([guideConOffset+guideConX*(0.65+i*0.2),j*(guideD/2+dPulley/2)/2,-epMotorCon-1])cylinder(r=2.5/2,h=epMotorCon+2,$fn=20);
	rotate([0,0,90]) for(j=[-1,1])for(i=[-1,1])translate([guideConOffset+guideConX*(0.65+i*0.2),j*(guideD/2+dPulley/2)/2,-epMotorCon-1])cylinder(r=2.5/2,h=epMotorCon+2,$fn=20);
	
	}
}


module connexion(h=18)
{
difference()
	{
	translate([-epMotorCon*0.3,-epMotorCon*0.3,0])plateConnexion(motSide+2*epMotorCon+2,h);
	translate([0,0,-epMotorCon]) plateConnexion(motSide+2,h);
	}
}


module plateConnexion(l=5,h=10)
{
union()
	{
	translate([-l/2,-l/2,-h])	cube (size=[l,l,h],center=false);
	//extensions for guide connector
	translate([0,l/2,-h])scale([1,1,1]) cylinder(h=h,r=(l)/2,$fn=50);
	translate([l/2,0,-h])scale([1,1,1]) cylinder(h=h,r=(l)/2,$fn=50);
	}
}


//connexionScrews();
module connexionScrews()
{

	//holes for M3 pressing screws:
	for(j=[-1,1])for(i=[-1,1])translate([guideConOffset+guideConX*(0.65+i*0.2),j*(guideD/2+dPulley/2)/2,-1])rotate([180,0,0])csk_bolt(3,l_connexion_screws);
	rotate([0,0,90]) for(j=[-1,1])for(i=[-1,1])translate([guideConOffset+guideConX*(0.65+i*0.2),j*(guideD/2+dPulley/2)/2,-1])rotate([180,0,0])csk_bolt(3,l_connexion_screws);

}


//noMotorCut();
module noMotorCut()
{
intersection()
{
#translate([-60,10,-50])cube (size=[100,100,100],center=false);
noMotor();
}
}

module noMotor()
{
difference()
	{
	union()
		{
		intersection()//chamfer
			{
			difference()
				{
				union()
					{
					translate([-8/2,0,0])	cube (size=[8,motSide,motSide],center=true);
					//rehaut
					rotate([0,90,0]) cylinder(h=5,r=10/2,center=false,$fn=50);
					//rehaut
					rotate([0,90,0]) cylinder(h=3,r=20/2,center=false,$fn=50);
					}
				//less material:
				translate([motFrontH-14,0,0])rotate([0,90,0]) cylinder(h=10,r=34/2,center=false,$fn=20);
				}
			rotate([0,90,0])cylinder(h=20,r=motSide*0.605,center=true,$fn=100);
			}
		translate([-8/2,0,0]) cube (size=[8,8,motSide],center=true);
		translate([-8/2,0,0]) cube (size=[8,motSide,8],center=true);
		}
	//screw holes:
	for(i=[-1,1])for(j=[-1,1])translate([-9,i*motScrewsDist/2,j*motScrewsDist/2]) rotate([0,90,0]) cylinder(h=10,r=3.2/2,$fn=20);
	//hole for M5 screw thread:
	translate([motFrontH1,0,0])rotate([0,90,0]) cylinder(h=20,r=4/2,center=true,$fn=20);
	}
}



//conect guide and motor connexion
module guideConnexion()
{
intersection() //cutting the corners:
	{
	difference()
		{
		translate([guideConOffset,-guideConY/2,0])cube([guideConX,guideConY,guideConZ]) ;
		//guide holes
		translate([guideConOffset-1,0,Z+interGuidesdZ-epMotorCon]) rotate([0,90,0])cylinder(h=guideConX+2,r=(guideD+playFix)/2,center=false,$fn=30);
		//cable passage
		for(j=[0,1])for(i=[-1,1])translate([guideConOffset-1,i*(dPulley/2+dCable/2),Z+j*interGuidesdZ-epMotorCon])rotate([0,90,0])cylinder(r=(dCablePassage)/2,h=guideConX+3,center=false,$fn=20);
		for(j=[0,1])for(i=[-1,1])translate([guideConOffset-1,i*(dPulley/2+dCable/2+dCablePassage/2),Z+j*interGuidesdZ-epMotorCon])rotate([0,90,0])translate([-dCablePassage/2,-dCablePassage/2,0])cube([dCablePassage,dCablePassage,guideConX+3],center=false);
		//holes for M3 pressing screws:
		for(j=[-1,1])for(i=[-1,1])translate([guideConOffset+guideConX*(0.65+i*0.2),j*(guideD/2+dPulley/2)/2,-1])cylinder(r=3.1/2,h=guideConZ+2,$fn=20);
		//opening slice for elastic blocking of the guide:
		translate([guideConOffset-1,1,Z+interGuidesdZ-1-epMotorCon])cube([guideConX+2,guideConY,2]) ;
		}
	translate([guideConOffset+guideConX/2,0,-1]) cylinder(r=guideConX*0.68,h=guideConZ+2,$fn=40);
	}
}



//endstop_holder();

module endstop_holder()
{
a=19;
e=10;
translate([0,0,0])intersection() //cutting the corners:
	{
	difference()
		{
		//main cube:
		translate([-a/2,-a/2,0])cube([a,a,e]);
		//8mm bar hole:
		translate([0,0,-1]) rotate([0,0,0])cylinder(r=4.1,h=15,$fn=30);
		
		//switch pin holes:
		for(x=[-2.5,2.5])translate([x,a/2*0.7,-1]) cube([1,e,e+2])
		translate([0,0,0])
			{
			//translate([-2.5,a/2*0.7,-1]) rotate([0,0,0]) cylinder(r=0.75,h=15,$fn=20);
			//translate([+2.5,a/2*0.7,-1]) rotate([0,0,0]) cylinder(r=0.75,h=15,$fn=20);
			}
		//hole for M3  pressing screw:
		translate([a/2*0.65,a,e/2]) rotate([90,0,0]) cylinder(r=2.5/2,h=a*1.5,$fn=20);
		translate([-a/2*0.65,a,e/2]) rotate([90,0,0]) cylinder(r=2.5/2,h=a*1.5,$fn=20);
		//space for switch:
		translate([-2,-6,0])cube([l+4,5,14]);
		//cut half
		translate([-a/2-1,-a+0.5,-1])cube([a+2,a,e+2]);

		}
	translate([0,0,-2]) rotate([0,0,0]) cylinder(r=a*0.65,h=15,$fn=40);
	}
}

module endstop_holder_top()
{
a=19;
e=10;
//main cube:
translate([0,0,-e])
difference()
	{
	translate([-a/2,-a/2,0])cube([a,2,e]);
	//hole for M3  pressing screw:
	for(x=[-1,1])translate([x*a/2*0.65,a-5,e/2]) rotate([90,0,0]) cylinder(r=3.2/2,h=a*1.5,$fn=20);
	}
		
}





module motor_nema17()
{
//moteur
difference()
	{
	translate([-motDep/2,0,0])	cube (size=[motDep,motSide,motSide],center=true);
	//screw holes:
	for(i=[-1,1])for(j=[-1,1])translate([-8,i*motScrewsDist/2,j*motScrewsDist/2]) rotate([0,90,0]) cylinder(h=10,r=1.5,$fn=10);
	}
//rehaut
rotate([0,90,0]) cylinder(h=motFrontH,r=motFrontD/2,center=false,$fn=_fn);

//axe moteur
translate([motFrontH,0,0])rotate([0,90,0]) cylinder(h=motAxisL,r=motAxisD/2,center=false,$fn=20);

}

module motor_nema13()
{
//moteur
difference()
	{
	translate([-nema13_motDep/2,0,0])	cube (size=[nema13_motDep,nema13_motSide,nema13_motSide],center=true);
	//screw holes:
	for(i=[-1,1])for(j=[-1,1])translate([-8,i*nema13_motScrewsDist/2,j*nema13_motScrewsDist/2]) rotate([0,90,0]) cylinder(h=10,r=1.5,$fn=10);
	}
//rehaut
rotate([0,90,0]) cylinder(h=nema13_motFrontH,r=nema13_motFrontD/2,center=false,$fn=_fn);

//axe moteur
translate([nema13_motFrontH,0,0])rotate([0,90,0]) cylinder(h=nema13_motAxisL,r=nema13_motAxisD/2,center=false,$fn=20);

}

module LM8UU()
{
translate([0,0,-12])difference()
{
cylinder(r=dLM/2,h=24,center=false,$fn=30);
translate([0,0,-1])cylinder(r=8/2,h=hLM+2,center=false,$fn=30);
}
}



module switch()
{
color("black") cube([3.7,3.6,6],center=true);
color([0.3,0.2,0.2]) translate([2.6,0,0])cube([1.5,1.4,3],center=true);
for (i=[-1,1]) color("grey")translate([0,0,i*2.5]) rotate([0,-90,0]) cylinder(r=0.5/2,h=10,$fn=10);

}





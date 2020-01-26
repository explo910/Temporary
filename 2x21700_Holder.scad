$fn = 250; //Auflösung für Rundungen

//---------------------------
//Auf Variablen umbauen ;) <- DAS ist der grund für OpenSCAD ^^
//Batt=71mm Hoch
//Batt=21.5mm Durchmesser => 10,75mm Radius
//Übergang => 1cm mit 2,5mm Rand
//---------------------------
//Untere Hälfte -> 80%
//Obere Hälfte -> 20%
//---------------------------

//--------------------------------------------------------------------------------------------------
// Config Section Start
//--------------------------------------------------------------------------------------------------

ProzentOben=70;
BattD = 21.5;
BattR = BattD/2;
BattH = 71;
Stege = 3;
//BattD+Stege*2+BattD+Stege*2 => BattD *2 + Stege*4 => 55
GesamtL = BattD *2 + Stege*4;
GesamtB = BattD + (Stege*2);
GesamtH = BattH + (Stege*2);
ObereH = ((GesamtH / 100) * ProzentOben);
UntereH = ((GesamtH / 100 ) * (100-ProzentOben));
Uebergang = 10;
DistanceBetween = 10;

echo("GesamtB: ");
echo(GesamtB); 
echo(" GesamtH");
echo(GesamtH);
echo("UntereH");
echo(UntereH);
echo("GesamtL");
echo(GesamtL);

//--------------------------------------------------------------------------------------------------
// Config Section End
//--------------------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------------------
// Code Section Start
//--------------------------------------------------------------------------------------------------

difference() {
    union() {
        cube([GesamtB,GesamtL,ObereH]);
        translate([BattR+Stege,BattR+Stege,Stege])  cylinder(ObereH-Stege+Uebergang,BattR+(Stege/2),BattR+(Stege/2));
        translate([BattR+Stege,GesamtL-(BattR+Stege),Stege])  cylinder(ObereH-Stege+Uebergang,BattR+(Stege/2),BattR+(Stege/2));
    }
        translate([BattR+Stege,BattR+Stege,Stege])  cylinder(ObereH-Stege+Uebergang,BattR,BattR);
        translate([BattR+Stege,GesamtL-(BattR+Stege),Stege])  cylinder(ObereH-Stege+Uebergang,BattR,BattR);
}

translate([(DistanceBetween + GesamtB),0,0]){
    difference() {
        union() {
            cube([GesamtB,GesamtL,UntereH]);

        }
        translate([BattR+Stege,BattR+Stege,UntereH-Uebergang])  cylinder(Uebergang,BattR+(Stege/2),BattR+(Stege/2));
        translate([BattR+Stege,GesamtL-(BattR+Stege),UntereH-Uebergang])  cylinder(Uebergang,BattR+(Stege/2),BattR+(Stege/2));
        translate([BattR+Stege,BattR+Stege,Stege])  cylinder(UntereH-Stege,BattR,BattR);
        translate([BattR+Stege,GesamtL-(BattR+Stege),Stege])  cylinder(UntereH-Stege,BattR,BattR);
    }
}

//--------------------------------------------------------------------------------------------------
// Code Section End
//--------------------------------------------------------------------------------------------------



//difference() {
//    union() {
//        cube([28,60,50]);
//        translate([14,15,3])  cylinder(57,13,13);
//        translate([14,45,3])  cylinder(57,13,13);
//    }
//    translate([14,15,3])  cylinder(57,11.5,11.5);
//    translate([14,45,3])  cylinder(57,11.5,11.5);
//}

//translate([35,0,0]){
//    difference() {
//        union() {
//            cube([28,60,50]);
//
//        }
//        translate([14,15,40])  cylinder(10,13,13);
//        translate([14,45,40])  cylinder(10,13,13);
//        translate([14,15,3])  cylinder(47,11.5,11.5);
//        translate([14,45,3])  cylinder(47,11.5,11.5);
//    }
//}

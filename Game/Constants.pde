//represent fow rotated is the plate in direction X or Z
float angleX = 0.0; 
float angleZ = 0.0; 

//change the speed of the rotation of the plate
float speed = 1.0; 

//position of the plate before a mousedragged
//updated when a mouseDragged occure
float posX = 0.0; 
float posY = 0.0;

//radius of our sphere
float radius = 13;

// physic constants
float gravityConstant = 0.2;
float mu = 0.01;
float rebondcoeff = 0.5;

//size of our sqare plate
float boxXZ = 500;
float boxY = 10;

//if true the user can add cylinder to the plate
boolean shiftMode= false;

//contains the all the cylinder the user sets during shiftMode
ArrayList<PVector> obst = new ArrayList<PVector>();
ArrayList<PVector> nw = new ArrayList<PVector>();
ArrayList<PVector> ne = new ArrayList<PVector>();
ArrayList<PVector> sw = new ArrayList<PVector>();
ArrayList<PVector> se = new ArrayList<PVector>();

//constant for the cylinder construction
float cylinderBaseSize = 25;
float cylinderHeight = 50;
int cylinderResolution = 40;


//keeps score week 06
/*
float score = 0.0;
float previousScore = 0.0;


// height of the bottom surface
int bSH = 100;
*/
PImage img;
float threshold = 128; 
HScrollbar thresholdBar;
HScrollbar secondThresholdBar;
float upperThresh = 130; 
float lowerThresh = 118; 
int i = 0;


void settings() {
  size(800, 600);
}
void setup() {
  frameRate(2f);
  //img = loadImage("board1.jpg");
  //noLoop(); // no interactive behaviour: draw() will be called only once.
  thresholdBar = new HScrollbar(0, 580, 800, 20);
  secondThresholdBar = new HScrollbar(0, 540, 800, 20);
  
  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      //println(cameras[i]);
    }
    cam = new Capture(this, cameras[0]);
    cam.start();
  }
}

void draw() {
  i++;
  background(0); 
  //upperThresh = thresholdBar.getPos()*255;
  //lowerThresh = secondThresholdBar.getPos()*255;
  img = cam.get();
  //image(img, 0, 0);
  PImage result = createImage(img.width, img.height, RGB); 
  // result = convolute(result); 
  for (int i = 0; i < result.width * result.height; i++) {
    if (brightness(img.pixels[i]) < 6 || brightness(img.pixels[i]) > 250) {
      result.pixels[i] = color(0);
    } else {
      int hueG = (int)(hue(img.pixels[i]));
      result.pixels[i] = (hueG <= upperThresh && hueG >= lowerThresh) ?  color(255) : color(0);
    }
  }
  if (cam.available() == true) {
    cam.read();
  }
  // image(result, 0, 0); 
  //image(sobel(result), 0, 0);
  image(img, 0, 0); 
  //
  hough(sobel(result),4);
  
  //thresholdBar.display();
  //thresholdBar.update();
  //secondThresholdBar.display();
  //secondThresholdBar.update();
  
  //if(i % 255 == 0){
    //println("u :"+ upperThresh+" l :"+lowerThresh);
  //}
}
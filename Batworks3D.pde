// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: https://youtu.be/CKeyIbT3vXI

import peasy.*;

ArrayList<Firework> fireworks;

PVector gravity = new PVector(0, 0.2);

PeasyCam cam;

ArrayList<PVector> batPoints = new ArrayList();

void setup() {
  String lines[] = loadStrings("BatPoint.txt");
  for(int i = 0; i < lines.length; i++){
    float values[] = float(lines[i].split(" "));
    batPoints.add( new PVector(values[0], -values[1]-0) );
  }
  fullScreen(P3D);
  //size(800, 600, P3D);
  //cam = new PeasyCam(this, 1500);

  fireworks = new ArrayList<Firework>();
  colorMode(HSB);
  background(0);
}

void draw() {


  if (random(1) < 0.01) {
    fireworks.add(new Firework());
  }

  background(0);
  translate(width/2, height, -1000);
  rotateY(frameCount*0.003);

  // Floor
  stroke(255);
  strokeWeight(1);
  fill(51);
  beginShape();
  vertex(-width, height/2, -800);
  vertex(width, height/2, -800);
  vertex(width, height/2, 800);
  vertex(-width, height/2, 800);
  endShape(CLOSE);


  for (int i = fireworks.size()-1; i >= 0; i--) {
    Firework f = fireworks.get(i);
    f.run();
    if (f.done()) {
      fireworks.remove(i);
    }
  }
}

// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: 

// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class Firework {

  ArrayList<Particle> particles;    // An arraylist for all the particles
  Particle firework;
  float hu;

  Firework() {
    //hu = random(255);
    hu = 50;
    firework = new Particle(random(-width/2, width/2), height/2, random(-800, 800), hu);
    particles = new ArrayList<Particle>();   // Initialize the arraylist
  }
  
  boolean done() {
    if (firework == null && particles.isEmpty()) {
      return true;
    } else {
      return false;
    }
  }

  void run() {
    if (firework != null) {
      fill(hu,255,255);
      firework.applyForce(gravity);
      firework.update();
      firework.display();

      
      if (firework.explode()) {
        /*for (int i = 0; i < 750; i++) {
          particles.add(new Particle(firework.location, hu));    // Add "num" amount of particles to the arraylist
        }*/
        int sub = 24; // how many layers of the tridimensional firework 
        float scale = 5;
        for(int j = 0; j < sub; j++){
          // calculations to define the size of the symbol on each layer 
          float theta = HALF_PI*j/sub;
          float r = sqrt(1/(sq(cos(theta)/3)+sq(sin(theta)/1)));
          float y = r*cos(theta);
          float z = r*sin(theta);
          float xyScale = y/3*scale;
          for (int i = 0; i < batPoints.size()*PartSigmoid(theta); i++) {
            PVector velP = new PVector();
            PVector velN = new PVector();
            if(theta == 0 ){
              velP = batPoints.get(i).copy().mult(xyScale).add(0,0,z*scale);
              velN = batPoints.get(i).copy().mult(xyScale).add(0,0,-z*scale);
            }
            else{
              velP = batPoints.get((int)random(0,batPoints.size())).copy().mult(xyScale).add(0,0,z*scale);
              velN = batPoints.get((int)random(0,batPoints.size())).copy().mult(xyScale).add(0,0,-z*scale);
            }
            particles.add(new Particle(firework.location, hu,velP));    // Add "num" amount of particles to the arraylist
            particles.add(new Particle(firework.location, hu,velN));
      }
        }
        firework = null;
      }
    }

    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.applyForce(gravity);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }


  // A method to test if the particle system still has particles
  boolean dead() {
    if (particles.isEmpty()) {
      return true;
    } else {
      return false;
    }
  }
}

// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Walker[] w;

void setup() {
  size(400,400);
  frameRate(30);

  // Create a walker object
  w = new Walker[10];

for(int i = 0; i < 10; i++)
{
 w[i] = new Walker(); 
}
}

void draw() {
  background(255);
  // Run the walker object
  for(int i = 0; i < 10; i++)
  {
  w[i].walk();
  w[i].display();
  }
}



// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// A random walker class!

class Walker {
  PVector position;
  PVector velocity;

  ArrayList<PVector> history;

  PVector noff;


  Walker() {
    position = new PVector(width/2, height/2);
    history = new ArrayList<PVector>();
    noff = new PVector(random(1000), random(1000));
    velocity = new PVector();
  }

  void display() {
    stroke(0);
    fill(175);
    rectMode(CENTER);
    rect(position.x, position.y, 16, 16);

    beginShape();
    stroke(0);
    noFill();
    for (PVector v: history) {
      vertex(v.x, v.y);
    }
    endShape();
  }

  // Randomly move up, down, left, right, or stay in one place
  void walk() {


    velocity.x = map(noise(noff.x), 0, 1, -1, 1);
    velocity.y = map(noise(noff.y), 0, 1, -1, 1);
    velocity.mult(5);

    noff.add(0.01, 0.01, 0);

    position.add(velocity);

    history.add(position.get());
    if (history.size() > 1000) {
      history.remove(0);
    }

    // Stay on the screen
    position.x = constrain(position.x, 0, width-1);
    position.y = constrain(position.y, 0, height-1);
  }
}



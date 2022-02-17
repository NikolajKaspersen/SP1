Ball ball; // Define the ball as a global object 
Paddle paddleLeft;
Paddle paddleRight;
int scoreLeft = 0;
int scoreRight = 0;

void setup(){
  size(800,600);
  ball = new Ball(width/2, height/2, 30); //create a new ball to the center of the window
  ball.speedX = 5; // Giving the ball speed in x-axis
  ball.speedY = random(-3,3); // Giving the ball speed in y-axis
  paddleLeft = new Paddle(60, height/2, 30,200);
  paddleRight = new Paddle(width-60, height/2, 30,200);
}

void draw(){
  background(0); // Clear the window
  ball.move(); //calculate a new location for the ball
  ball.display(); // Draw the ball to the window
  
    if (ball.right() > width) { //if stuff between () is true, execute code between {}
    scoreLeft = scoreLeft + 1;
    ball.speedX = -ball.speedX;
  }
  
  if (ball.left() < 0) {
    scoreRight = scoreRight + 1;
    ball.speedX = -ball.speedX;
  }

  if (ball.bottom() > height) {
    ball.speedY = -ball.speedY;
  }

  if (ball.top() < 0) {
    ball.speedY = -ball.speedY;
  }
    paddleLeft.move();
  paddleLeft.display();
  paddleRight.move();
  paddleRight.display();

if (paddleLeft.bottom() > height) {
    paddleLeft.y = height-paddleLeft.h/2;
  }

  if (paddleLeft.top() < 0) {
    paddleLeft.y = paddleLeft.h/2;
  }
    
  if (paddleRight.bottom() > height) {
    paddleRight.y = height-paddleRight.h/2;
  }

  if (paddleRight.top() < 0) {
    paddleRight.y = paddleRight.h/2;
  }
  
  // If the ball gets behind the paddle and if the ball is in the area of the paddle bounce the ball to other direction
  if ( ball.left() < paddleLeft.right() && ball.y > paddleLeft.top() && ball.y < paddleLeft.bottom()){
    ball.speedX = -ball.speedX;
    ball.speedY = map(ball.y - paddleLeft.y, -paddleLeft.h/2, paddleLeft.h/2, -10, 10);
  }

  if ( ball.right() > paddleRight.left() && ball.y > paddleRight.top() && ball.y < paddleRight.bottom()) {
    ball.speedX = -ball.speedX;
    ball.speedY = map(ball.y - paddleRight.y, -paddleRight.h/2, paddleRight.h/2, -10, 10);
  }
textSize(40);
textAlign(CENTER);
text(scoreRight, width/2+30, 30); // Right side score
text(scoreLeft, width/2-30, 30); // Left side score



}


void keyPressed(){
  if(keyCode == UP){
    paddleRight.speedY=-5;
  }
  if(keyCode == DOWN){
    paddleRight.speedY=5;
  }
  if(key == 'a'){
    paddleLeft.speedY=-5;
  }
  if(key == 'z'){
    paddleLeft.speedY=5;
  }
}

void keyReleased(){
  if(keyCode == UP){
    paddleRight.speedY=0;
  }
  if(keyCode == DOWN){
    paddleRight.speedY=0;
  }
  if(key == 'a'){
    paddleLeft.speedY=0;
  }
  if(key == 'z'){
    paddleLeft.speedY=0;
  }
}

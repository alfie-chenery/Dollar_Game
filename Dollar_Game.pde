int nodes = 5;
boolean hard_mode = false;
ArrayList<Node> Nodes;

void setup(){
  size(800,800);
  int r = width/2 - 100;
  PVector offset = new PVector(width/2, height/2);
  
  //generate graph
  Nodes = new ArrayList<Node>();
  for(int i=0; i<nodes; i++){
    float theta = i*(TWO_PI/nodes)-HALF_PI;
    PVector pos = new PVector(r*cos(theta), r*sin(theta));
    pos.add(offset);
    Node n = new Node(i,pos);
    Nodes.add(n);
  }
  for(Node n : Nodes){
    n.generateArcs(); 
  }
}

void mousePressed(){
  for(Node n : Nodes){
    if(sqrt((sq(mouseX-n.pos.x) + sq(mouseY-n.pos.y))) < n.r){
       n.exchange();
    }
  }
}

void draw(){
  background(0);
  for(Node n : Nodes){
    n.drawArcs();
  }
  
  boolean success = true;
  for(Node n : Nodes){
    n.show(); 
    
    if(n.money < 0){
      success = false;
    }
  }
  
  if(success){
    println("You Win!");
    noLoop();
  }
}

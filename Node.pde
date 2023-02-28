class Node{
  int index;
  PVector pos;
  int neighbours;
  IntList connections;
  int money;
  int r = 50;
  
  Node(int i, PVector P){
    index = i;
    pos = P;
    money = int(random(-3,6));
    connections = new IntList();
  }
  
  void generateArcs(){
    for(int n=0; n<int(random(1,int(nodes/2))); n++){
      int c = index;
      while((c == index)||(connections.hasValue(c))){ //cant connect to self OR already connected node
        c = int(random(0,nodes));
      }
      connections.append(c);
      Nodes.get(c).addArc(index); //add self to connected nodes arcs so connection is bidirectional
    } 
  }
  
  void addArc(int i){
    connections.append(i); 
  }
  
  void exchange(){
    for(int n : connections){
      money--;
      Nodes.get(n).money ++;
    }
  }
  
  void drawArcs(){
    for(int i : connections){
      line(pos.x,pos.y,Nodes.get(i).pos.x,Nodes.get(i).pos.y); 
    }
    
  }
  
  void show(){
    fill(0);
    stroke(255);
    strokeWeight(2);
    circle(pos.x,pos.y,2*r);
    fill(255);
    textAlign(CENTER);
    textSize(32);
    text(money,pos.x,pos.y);
  }
  
  
  
  
  
  
}

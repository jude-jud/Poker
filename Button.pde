 class Button{
  float x,y,w,h;
  String label;
  
  public Button(){
    x = 0;
    y = 0;
    w = 100;
    h = 50;
    label = "none";
  }
  public Button(float x,float y,String l){
    this.x = x;
    this.y = y;
    w = 100;
    h = 50;
    label = l;
  }
  public void show(){
    fill(200);
    rect(x,y,w,h);
    fill(255);
    textAlign(CENTER,CENTER);
    text(label,x+w/2,y+h/2);
  }
  public boolean mouseover(){
    if((mouseX > x && mouseX < x + w)&&(mouseY > y && mouseY < y + h)){
      //System.out.println("mousevoer");
      return(true);
    }
    
    return(false);
  }
  public boolean mouseClick(){
    if(justClicked == true && mouseover() == true){
      return(true);
    }
    return(false);
  }
}

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
//Homework:
//write a show function that will show the rectangular button and the label on top of the button
//write another function called mouseover that will return a Boolean indicating whether or not your mouse is over the rectangular button
//then create a button object in the main file
//in the draw function activate the mouseover function of the button object and print the result

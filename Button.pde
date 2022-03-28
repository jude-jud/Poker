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
    rect(x,y,w,h);
    text(label,x/2-w,y/2-h);
  }
  public boolean mouseover(){
    if((mouseX > x && mouseX < x + w)&&(mouseY > y && mouseY < y + h)){
      System.out.println("mousevoer");
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

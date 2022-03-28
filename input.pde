class Input{
  float x,y,w,h;
  String input;
  
  public Input(){
    input = "";
    x = 0;
    y = 0;
    w = 100;
    h = 50;
  }
  public Input(float x,float y){
    this.x = x;
    this.y = y;
    input = "";
    w = 100;
    h = 50;
  }
  public void show(){
    fill(255);
    rect(x,y,w,h);
    fill(0);
    textSize(20);
    text(input,x,y+30);
    
  }
  public void addChar(char n){
    input+=n;
  }
  public void delChar(){
    if(input.length() > 0){
      input = input.substring(0,input.length()-1);
    }
  }
  public int getnum(){
    return(int(input));
  }
}

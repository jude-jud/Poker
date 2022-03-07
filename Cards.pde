class Cards{
  int number;
  String suit;
  PImage sprite;
  float x,y,w,h;
  public Cards(int n, String s,PImage sp){
    suit = s;
    number = n;
    sprite = sp;
    x=0;
    y=0;
    w=73;
    h=96;
    if(this.number == 1){
      this.number = 14;
    }
  }
  public void setXY(float x,float y){
    this.x = x;
    this.y = y;
  }
  public void show(){
    image(sprite,x,y,w,h);
  }
}

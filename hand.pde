class Hand{
  Cards card1,card2;
  float x,y;
  public Hand(float x,float y){
    this.x = x;
    this.y = y;
  }
  public void setCards(Cards card1,Cards card2){
    this.card1 = card1;
    this.card2 = card2;
    this.card1.setXY(x,y);
    this.card2.setXY(x+73,y);
  }
  public void showHand(){
    card1.show();
    card2.show();
  }
}

class GameTable{
  Cards[] tablecards;
  float x,y;
  public GameTable(float x,float y){
    this.x = x;
    this.y = y;
    tablecards = new Cards[5];
  }
  public void ShowTable(){
    for(int i= 0;i<5;i++){
      if(tablecards[i] != null){
        tablecards[i].show();
      }
    }
  }
  public void placeCard3(Cards card1,Cards card2,Cards card3){
    card1.setXY(x,y);
    card2.setXY(x + 73,y);
    card3.setXY(x + 146,y);
    tablecards[0] = card1;
    tablecards[1] = card2;
    tablecards[2] = card3;
  }
  public void placeCard4(Cards card4){
    
  }
  public void resetTable(){
    tablecards = new Cards[5];
  }
}

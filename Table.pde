class GameTable{
  Cards[] tablecards;
  float x,y;
  int pot, curbet;
  public GameTable(float x,float y){
    this.x = x;
    this.y = y;
    tablecards = new Cards[5];
    pot = 0;
    curbet = 0;
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
    card4.setXY(x + 219,y);
    tablecards[3] = card4;
  }
  public void placeCard5(Cards card5){
    card5.setXY(x + 292,y);
    tablecards[4] = card5;
  }
  public void resetTable(){
    tablecards = new Cards[5];
    pot = 0;
    curbet = 0;
  }
  public Cards[] getcards(){
    return(tablecards);
  }
  public void changeBet(int curbet){
    this.curbet = curbet;
  }
  public int getCurbet(){
    return(curbet);
  }
  public int getPot(){
    return(pot);
  }
  public void addPot(int money){
    pot = pot+ money;
  }
}

//1) In the showTable function, also draw the currentBet on the screen
//2) create a money variable in the hand class
//3) in the constructor set the money variable to be 1000
//4) in the showHands function draw out the money variable on the screen
//5) write a function called giveMoney with a number parameter.
//-subtract from how much money the hand has based on the money parameter
//-also return the money parameter

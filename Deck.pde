class Deck{
  Cards[] cards;
  int cn;
  int topcard = 0;
  public Deck(){
    cn = 0;
    cards = new Cards[52];
    for(int n = 0;n<13;n++){
      cards[cn] = new Cards(n+1,"diamonds",cardsprites[cn]);
      cn+=1;
      cards[cn] = new Cards(n+1,"clubs",cardsprites[cn]);
      cn += 1;
      cards[cn] = new Cards(n+1,"hearts",cardsprites[cn]);
      cn += 1;
      cards[cn] = new Cards(n+1,"spades",cardsprites[cn]);
      cn += 1;
    }
  }
  public void showall(){
    int n = 0;
    for(int c = 0;c<4;c++){ 
      for(int i = 0;i<13;i++){
        cards[n].setXY(i*73,c*96);
        cards[n].show();
        n++;
      }
    }
  }
  public Cards passCard(){
    topcard++;
    return(cards[topcard]);
  }
  public void shuffle(){
    for(int i = 0;i<52;i++){
      int r = int(random(0,52));
      Cards temp = cards[i];
      cards[i] = cards[r];
      cards[r]= temp;
    }
  }
}
//Homework: write a shuffle function in deck that will randomize the positions of the card objects in the array.

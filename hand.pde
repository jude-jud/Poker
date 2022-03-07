 class Hand{
  Cards[] combined;
  Cards card1,card2;
  float x,y;
  int score;
  public Hand(float x,float y){
    this.x = x;
    this.y = y;
    score = 0;
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
    fill(0);
    text(score,x,y-10);
  }
  public void combinecards(Cards[] cs){
    combined = new Cards[7];
    combined[0] = cs[0];
    combined[1] = cs[1];
    combined[2] = cs[2];
    combined[3] = cs[3];
    combined[4] = cs[4];
    combined[5] = card1;
    combined[6] = card2;
    sortarray();
  }
  public void sortarray(){
    Cards temp;
    for(int e = 0; e < 7;e++){
      for(int i = 0;i<6;i++){
        if(combined[i].number > combined[i+1].number){
          temp = combined[i];
          combined[i] = combined[i+1];
          combined[i+1] = temp;
        }
      }
    }
  }
  public int highcard(){
    int highest = 0;
    for(int i = 0; i < 7;i++){
      if(highest < combined[i].number){
        highest = combined[i].number;
      }
    }
    return(highest);
  }
  public int straight(){
    int counter = 0;
    int highest = 0;
    for(int i = 0;i<6;i++){
      if(combined[i+1].number == combined[i].number+1){
        counter += 1;
        highest = combined[i].number;
      }
      else{
        counter = 0;
      }
      if(counter == 4){
        return(400+combined[i+1 ].number);
      }
    }
    return(0);
  }
  public int pair(){
    for(int i = 0;i<6;i++){
      if(combined[i].number == combined[i+1].number){
        return(100+combined[i].number);
      }
    }
    return(0);
  }
  public int twopair(){
    int counter = 0;
    for(int i = 0;i<6;i++){
      if(combined[i].number == combined[i+1].number){
        counter += 1;
      }
      if(counter == 2){
        return(200+combined[i].number);
      }
    }
    return(0);
  }
  public int triples(){
    for(int i = 0;i<5;i++){
      if(combined[i].number == combined[i+1].number && combined[i].number==combined[i+2].number){
        return(300+combined[i].number);
      }
      }
    return(0);
  }
  public int flush(){
    int dcounter = 0;
    int ccounter = 0;
    int hcounter = 0;
    int scounter = 0;
    
    for(int i = 0;i<7;i++){
      if(combined[i].suit == "diamond"){
        dcounter++;
        if(dcounter == 5){
          return(500+combined[i].number);
        }
      }
      if(combined[i].suit == "club"){
        ccounter++;
        if(ccounter == 5){
          return(500+combined[i].number);
        }
      }
      if(combined[i].suit == "heart"){
        hcounter++;
        if(hcounter == 5){
          return(500+combined[i].number);
        }
      }
      if(combined[i].suit == "spade"){
        scounter++;
        if(scounter == 5){
          return(500+combined[i].number);
        }
      }
    }
    return(0);
  }
  public int FourOfAKind(){
    for(int i = 0;i<4;i++){
      if(combined[i].number == combined[i+1].number && combined[i].number==combined[i+2].number && combined[i].number==combined[i+3].number){
        return(700+combined[i].number);
      }
    }
    return(0);
  }
  public int fullHouse(){
    int highest = 0;
    boolean two = false;
    boolean three = false;
    for(int i = 0;i<5;i++){
      if(combined[i].number == combined[i+1].number && combined[i].number==combined[i+2].number){
        highest = combined[i].number;
        three = true;
      }
    }
    for(int i = 0;i<6;i++){
      if(combined[i].number == combined[i+1].number){
        if(combined[i].number != highest){
          two = true;
        }
      }
    }
    if(two == true && three == true){
      return(600+highest);
    }
    else{
      return(0);
    }
  }
  public int straitFlush(){
    for(int a = 0;a < 3;a++){
      if(combined[0+a].number == combined[1+a].number-1 && combined[1+a].number-1 == combined[2+a].number-2 && combined[2+a].number-2 == combined[3+a].number-3 && combined[3+a].number-3 == combined[4+a].number-4 && combined[0+a].suit == combined[1+a].suit && combined[0+a].suit == combined[2+a].suit && combined[0+a].suit == combined[3+a].suit && combined[0+a].suit == combined[4+a].suit ){
        return(800+combined[a+4].number);
      }
    }
    return(0);
  }
  public void calcscore(){
    if(FourOfAKind() != 0){
      score = FourOfAKind();
    }
    else if(fullHouse() != 0){
      score = fullHouse();
    }
    else if(flush() != 0){
      score = flush();
    }
    else if(straight() != 0){
      score = straight();
    }
    else if(triples()!=0){
      score = triples();
    }
    else if(twopair()!=0){
      score = twopair();
    }
    else if(pair()!=0){
      score = pair();
    }
    else{
      score = highcard();
    }
  }
}
//HOMEWORK: Strait flush and testing

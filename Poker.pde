 enum Gamestates{
  PASSCARD,
  THREECARD,
  FOURTHCARD,
  FIFTHCARD,
  BET,
  CHECKWIN
}

Gamestates currentstate = Gamestates.PASSCARD;
GameTable t;
int turnnumber = 0;
boolean spacekey = false;
boolean justClicked = false;
PImage[] cardsprites = new PImage[52];
Deck d;
Hand player,p2,p3,p4;
Input in;
Button b,check;
void setup(){
  size(1000,800);
  PImage diamonds = loadImage("diamonds-cards.jpg");
  PImage clubs = loadImage("clubs-cards.jpg");
  PImage hearts = loadImage("hearts-cards.jpg");
  PImage spades = loadImage("spades-cards.jpg");
  int c = 0;
  for(int i = 0;i<13;i++){
    cardsprites[c] = diamonds.get(i*73,0,73,96);
    c++;
    cardsprites[c] = clubs.get(i*73,0,73,96);
    c++;
    cardsprites[c] = hearts.get(i*73,0,73,96);
    c++;
    cardsprites[c] = spades.get(i*73,0,73,96);
    c++;
  }
  d = new Deck();
  d.shuffle();
  player = new Hand(427,700);
  t = new GameTable(317,327 );
  p2 = new Hand(427,50);
  p3 = new Hand(50,327);
  p4 = new Hand(800,327);
  in = new Input(600,700);
  b = new Button(700,700,"BET");
  check = new Button(800,700,"CHECK");
}
void draw(){
  background(255);
  
  //d.showall();
  switch(currentstate){
    case PASSCARD:
      turnnumber = 0;
      d.shuffle();
      Cards c1 = d.passCard();
      Cards c2 = d.passCard();
      Cards c3 = d.passCard();
      Cards c4 = d.passCard();
      Cards c5 = d.passCard();
      Cards c6 = d.passCard();
      Cards c7 = d.passCard();
      Cards c8 = d.passCard();
      player.setCards(c1,c2);
      p2.setCards(c3,c4);
      p3.setCards(c5,c6);
      p4.setCards(c7,c8);
      currentstate = Gamestates.BET;
      break;
    case THREECARD:
      turnnumber = 1;
      t.placeCard3(d.passCard(),d.passCard(),d.passCard());
      currentstate = Gamestates.BET;
      break;
    case FOURTHCARD:
      turnnumber = 2;
      t.placeCard4(d.passCard());
      currentstate = Gamestates.BET;
      break;
    case FIFTHCARD:
      turnnumber = 3;
      t.placeCard5(d.passCard());
      currentstate = Gamestates.BET;
      break;
    case BET:
      if(b.mouseClick() == true){
        t.changeBet(in.getnum());
      }
      if(check.mouseClick() == true && turnnumber == 0){
        currentstate = Gamestates.THREECARD;
      }
      if(check.mouseClick() == true && turnnumber == 1){
        currentstate = Gamestates.FOURTHCARD;
      }
      if(check.mouseClick()  == true && turnnumber == 2){
        currentstate = Gamestates.FIFTHCARD;
      }
      if(check.mouseClick()  == true && turnnumber == 3){
        currentstate = Gamestates.CHECKWIN;
        player.combinecards(t.tablecards);
        player.calcscore();
        p2.combinecards(t.tablecards);
        p2.calcscore();
        p3.combinecards(t.tablecards);
        p3.calcscore();
        p4.combinecards(t.tablecards);
        p4.calcscore();
      }
      break;
    case CHECKWIN:
      turnnumber = 4;
      break;
  }
  player.showHand();
  p2.showHand();
  p3.showHand();
  p4.showHand();
  t.ShowTable();
  in.show();
  b.show();
  check.show();
  spacekey = false;
  justClicked = false;
}
void keyPressed(){
  if(keyCode == 32){
    spacekey = true;
  }
  if(keyCode <= 57 && keyCode >= 48){
    in.addChar(key);
  }
  if(keyCode == 8){
    in.delChar();
  }
}
void mouseClicked(){
  justClicked = true; 
}
//finish switch statement

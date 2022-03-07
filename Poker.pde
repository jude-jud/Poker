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
boolean spacekey =false;
PImage[] cardsprites = new PImage[52];
Deck d;
Hand player;
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
  t = new GameTable(317,400);
  
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
      player.setCards(c1,c2);
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
      if(spacekey == true && turnnumber == 0){
        currentstate = Gamestates.THREECARD;
      }
      if(spacekey == true && turnnumber == 1){
        currentstate = Gamestates.FOURTHCARD;
      }
      if(spacekey == true && turnnumber == 2){
        currentstate = Gamestates.FIFTHCARD;
      }
      if(spacekey == true && turnnumber == 3){
        currentstate = Gamestates.CHECKWIN;
        player.combinecards(t.tablecards);
        player.calcscore();
      }
      break;
    case CHECKWIN:
      turnnumber = 4;
      break;
  }
  player.showHand();
  t.ShowTable();
  spacekey = false;
}
void keyPressed(){
  if(keyCode == 32){
    spacekey = true;
  }
}
//finish switch statement

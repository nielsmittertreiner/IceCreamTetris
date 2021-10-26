 class IceCream { 


  PImage graphic = new PImage();
  int xIceCream, yIceCream;
  float iceCreamSize = 80;

  String[] filepaths = new String[5];
  int[] icecreamgridposition = new int[5];
  IceCreamSystem icecreamsystem;


    IceCream(int icecream){

 
  for (int i = 0; i < 5; ++i) {
    
        filepaths[i] = "img/ijsjes.png";
  }

        
        graphic = loadImage(filepaths[icecream]);
  

   
 }


 void draw(){

  drawIceCream();

 }


  void update() {
  }


 void drawIceCream(){ 

  image(graphic, xIceCream, yIceCream, iceCreamSize,iceCreamSize);

 }



}
mixin Musician  {
  void playInstrument(String instrumentname); // abstract method; 


  void playPiano() {
    playInstrument('Piano');
  }
  void playFlute() {
    playInstrument('Flute');
  }

}

class musican with Musician {

  @override
  void playInstrument(String instrumentname) {
    print('Plays the $instrumentname beautifully');    
  }
}


void main()
{
  final player = musican(); 

  player.playInstrument("koko");


}





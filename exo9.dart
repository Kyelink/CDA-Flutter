import 'dart:io';
import 'dart:math';
bool isInt(String str) {
  try{
    var value = int.parse(str);
  } on FormatException {
    return false;
  } 
  return true;
  
}
main() {
  int nToGuess=Random().nextInt(100)+1;
  int tentatives=0;
  int guess=0;

  while(guess!=nToGuess){
    print('Saisir un nombre entre 1 et 100');
    String age = stdin.readLineSync();
    while(!isInt(age)||int.parse(age)<1||int.parse(age)>100){
      print('(format invalide) Saisis un nombre :');
      age = stdin.readLineSync();
    };
    guess = int.parse(age);
    tentatives++;
    if(guess==nToGuess){print("Gagné!");}
    else if(guess>nToGuess){print("Trop haut!");}
    else{print("Trop bas!");}
  }
  print("En "+tentatives.toString()+" tentatives!");

  

}
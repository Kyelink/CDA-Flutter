import 'dart:io';
import 'dart:math';

bool isEqual(List<int> a, List<int> b) {
  bool eq = true;
  for(int i = 0 ; i<a.length; i++){
    if(a[i]!=b[i]){eq = false; break;}
  }
  return eq;
  
}

bool isInt(String str) {
  try{
    var value = int.parse(str);
  } on FormatException {
    return false;
  } 
  return true;
  
}

List<int> fourDigitsIntToList(int n) {
   return [((n-n%1000)/1000).round(),((n%1000-n%100)/100).round() ,((n%100-n%10)/10).round(),n%10];
}



main() {

  List<int> numToGuess=fourDigitsIntToList(Random().nextInt(10000));
  

  print(numToGuess);
  int n = 0;
  do{
    print('Saisis un nombre à 4 chiffres :');
    String age = stdin.readLineSync();
    while(!isInt(age)||int.parse(age)<0||int.parse(age)>9999){
      print('(format invalide) Saisis un nombre à 4 chiffres :');
      age = stdin.readLineSync();
    };
    n = int.parse(age);
    
  }while(!isEqual(numToGuess,fourDigitsIntToList(n)));

  print("felicitation");



}
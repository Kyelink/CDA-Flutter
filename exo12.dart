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
  print('Saisir un nombre de termes de la suite de Fibonacci à générer :');
  String age = stdin.readLineSync();
  while(!isInt(age)||int.parse(age)<0){
    print('(format invalide) Saisis un nombre :');
    age = stdin.readLineSync();
  };
  int n = int.parse(age);

  double phi = (1+sqrt(5))/2;
  double psi = (1-sqrt(5))/2;

  List<int> numbers = [];
 
  for(int i=1;i<=n;i++){
    int terme = ((pow(phi,i)-pow(psi,i))/sqrt(5)).round();
    numbers.add(terme);
  }
  
  print("termes de la suite de Fibonacci :");
  print(numbers);
  

  

  

}
import 'dart:io';
import 'dart:math';

main() {
  

 print('Saisir une phrase :');
  String str = stdin.readLineSync();
  str=str.split(" ").reversed.toList().join(" ");;
  
  print(str);




  

}
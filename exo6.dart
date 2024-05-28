import 'dart:io';

main() {
  print('Saisis un String :');
  String str = stdin.readLineSync();
  bool isPal = true;
  for(int i=0;i<str.length/2;i++){
    if(str[i]!=str[str.length-1-i]){isPal = false; break;}
  }
  print(isPal?"Palindrome!":"Pas lindrome! T'as compris, tu l'as, tu l'as???");

}
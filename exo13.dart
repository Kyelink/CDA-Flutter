import 'dart:io';
import 'dart:math';

main() {
  

  List<int> randList = List.generate(10, (_) => Random().nextInt(10));
  randList.sort();
  print(randList);
  List<int> duplicates = [];
  for(int i=0;i<randList.length-1;i++){
    if(randList[i]==randList[i+1]){duplicates.add(randList[i]);}
  }
  List<int> filteredList =[...{...randList}.difference({...duplicates})];
 
  print(filteredList);




  

}
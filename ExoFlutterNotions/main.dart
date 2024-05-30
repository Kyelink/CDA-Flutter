import 'package:flutter/material.dart';


class Item {
  bool isCrossed=false;
  String name="";
  Item(String str){name=str;}
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Create a list of items to display in the list view
    final items = [Item('To do 1'),Item('To do 2'),Item('To do 3')];

    return MaterialApp(
      title: 'Flutter ListView.builder Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView.builder Example'),
        ),
        body: ListView.builder(
          // Use the itemCount property to specify the number of items in the list
          itemCount: items.length,
          // Use the itemBuilder property to specify how each item should be displayed
          itemBuilder: (context, index) {
            // Get the item at the specified index
            final item = items[index];
            // Return a ListTile widget that displays the item's text
            TextDecoration getLineThrough(){return item.isCrossed?TextDecoration.lineThrough:TextDecoration.none;}
            return ListTile(
              title: Text(item.name, style: TextStyle(decoration: getLineThrough() )),
              onTap: () {
                // Do something when the list tile is tapped
                item.isCrossed=true;
                
                
                print('You just clicked on ${item.name} ${getLineThrough()}');
              },
            );
          },
        ),
      ),
    );
  }
}
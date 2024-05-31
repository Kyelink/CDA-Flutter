import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Item {
  String name = "";
  String description = "";
  bool isCrossed = false;
  Item(String str, String desc) {
    name = str;
    description = desc;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Item> items = [
    Item('To do 1', 'desc1'),
    Item('To do 2', 'desc2'),
    Item('To do 3', 'desc3')
  ];

  // Define a function to show the input dialog box
  void _showInputDialog() {
    // Show an alert dialog box that contains a text field for user input
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Create a text editing controller to manage the input field
        TextEditingController controllerName = TextEditingController();
        TextEditingController controllerDescription = TextEditingController();

        return AlertDialog(
          // Set the title of the dialog box
          title: Text("Enter Task"),
          // Add a text field to the dialog box for the user to enter text
          content: Column(children: [
            TextField(
              controller: controllerName,
              decoration: InputDecoration(hintText: 'Enter title'),
            ),
            TextField(
              controller: controllerDescription,
              decoration: InputDecoration(hintText: 'Enter description'),
            ),
          ]),

          // Add two buttons to the dialog box
          actions: <Widget>[
            // Add a "Cancel" button that dismisses the dialog box without saving any input
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            // Add a "Save" button that saves the input and closes the dialog box
            TextButton(
              child: Text('Save'),
              onPressed: () {
                // Update the value of _inputText with the text entered by the user
                setState(() {
                  String descr = controllerDescription.text.trim();
                  items.add(Item(controllerName.text, descr));
                });
                // Close the dialog box
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste de tâches'),
      ),
      body: Center(
          child: ListView.builder(
        // Use the itemCount property to specify the number of items in the list
        itemCount: items.length,
        // Use the itemBuilder property to specify how each item should be displayed
        itemBuilder: (context, index) {
          // Get the item at the specified index
          final item = items[index];
          // Return a ListTile widget that displays the item's text

          return ListTile(
            title: Text(item.name),
            subtitle: Text(item.description),
            tileColor: Color.fromARGB(255, 161, 161, 161),
            onTap: () {
              // Do something when the list tile is tapped
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Scaffold(
                      appBar: AppBar(),
                      body: ListTile(
                          title: Text(item.name),
                          subtitle: Text(item.description)))));
            },
            onLongPress: (() {
              setState(() {
                items.removeAt(index);
              });
            }),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        // Add an "Edit" icon button that launches the input dialog box when pressed
        onPressed: _showInputDialog,
        child: Icon(Icons.edit),
      ),
    );
  }
}

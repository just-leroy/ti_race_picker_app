import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();
  String name = '';
  String dropdownValue = '3';
  FocusNode myFocusNode = FocusNode();

  var items = ['3', '4', '5', '6', '7', '8'];

  @override
  void initState() {
    super.initState();
    myFocusNode.addListener(() {
      debugPrint('Has focus: ${myFocusNode.hasFocus}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              '',
              style: TextStyle(color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Amount of players: ',
                  style: TextStyle(color: Colors.white),
                ),
                DropdownButton(
                  focusNode: myFocusNode,
                  dropdownColor: Colors.grey[900],
                  value: dropdownValue,
                  icon: const Icon(Icons.keyboard_arrow_down_rounded),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                        value: items,
                        child: Text(items,
                            style: const TextStyle(color: Colors.white)));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      dropdownValue = value as String;
                    });
                  },
                )
              ],
            ),
            TextFormField(
              focusNode: myFocusNode,
              controller: nameController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText: 'Name of player 1',
                  labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Colors.blue : Colors.grey)),
            ),
            FloatingActionButton(
              onPressed: () => {
                //TODO: add navigator
              },
              backgroundColor: Colors.blue,
              child: const Icon(Icons.keyboard_arrow_right_rounded),
            ),
          ],
        ),
      ),
    );
  }
}

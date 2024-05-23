import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dietary Restrictions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DietaryRestrictionsPage(),
    );
  }
}

class DietaryRestrictionsPage extends StatefulWidget {
  @override
  _DietaryRestrictionsPageState createState() => _DietaryRestrictionsPageState();
}

class _DietaryRestrictionsPageState extends State<DietaryRestrictionsPage> {
  List<bool> _selections = List.generate(10, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dietary Restrictions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'I have the following dietary restrictions:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 8.0, // spacing between the buttons
              runSpacing: 4.0, // spacing between the lines
              children: [
                _buildToggleButton('Vegan', 0),
                _buildToggleButton('Vegetarian', 1),
                _buildToggleButton('Dairy Free', 2),
                _buildToggleButton('Kosher', 3),
                _buildToggleButton('Low Carb', 4),
                _buildToggleButton('Wheat Allergy', 5),
                _buildToggleButton('Nut Allergy', 6),
                _buildToggleButton('Fish Allergy', 7),
                _buildToggleButton('Soy Allergy', 8),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(String label, int index) {
    return ChoiceChip(
      label: Text(label),
      selected: _selections[index],
      onSelected: (bool selected) {
        setState(() {
          _selections[index] = selected;
        });
      },
    );
  }
}

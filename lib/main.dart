import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red, // Couleur principale de l'application
        scaffoldBackgroundColor: Colors.white, // Couleur de fond de l'application
      ),
      home: NumericKeyboard(),
    );
  }
}

class NumericKeyboard extends StatefulWidget {
  @override
  _NumericKeyboardState createState() => _NumericKeyboardState();
}

class _NumericKeyboardState extends State<NumericKeyboard> {
  int selectedNumber = -1;

  void selectNumber(int number) {
    setState(() {
      selectedNumber = number;
    });
  }

  void displayImage() {
    if (selectedNumber >= 0 && selectedNumber <= 9) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Image.asset(
              'lib/assets/$selectedNumber.jpg',
              width: 200,
              height: 200,
            ),
          );
        },
      );
    }
  }

  Widget buildNumericButton(int number) {
    return ElevatedButton(
      onPressed: () {
        selectNumber(number);
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.red, // Couleur de fond en rouge
        shape: CircleBorder(),
        padding: EdgeInsets.all(20.0),
      ),
      child: Text(
        '$number',
        style: TextStyle(fontSize: 20, color: Colors.white), // Numéros en blanc
      ),
    );
  }

  Widget buildNumericRow(List<int> numbers) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: numbers
          .map(
            (number) => buildNumericButton(number),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rayane'),
        backgroundColor: Colors.red, // Couleur de la barre de navigation (rouge)
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2.0, color: Colors.red),
              ),
              child: Text(
                selectedNumber >= 0 ? '$selectedNumber' : 'Aucun chiffre choisi',
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 20),
            buildNumericRow([1, 2, 3]),
            buildNumericRow([4, 5, 6]),
            buildNumericRow([7, 8, 9]),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                displayImage();
              },
              child: Text('Afficher'),
            ),
          ],
        ),
      ),
    );
  }
}

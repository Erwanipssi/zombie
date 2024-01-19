import 'package:flutter/material.dart';
import '/signupzombie.dart';

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Signupzombie()),
        );
      },
      child: Icon(Icons.arrow_forward),
      backgroundColor: Color.fromARGB(255, 8, 98, 11),
    );
  }
}
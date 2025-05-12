import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  BottomButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.pink,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 60.0,
        child: Center(
          child: Text(label, style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}

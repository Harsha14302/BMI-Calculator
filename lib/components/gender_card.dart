import 'package:flutter/material.dart';
import '../constants/enums.dart'; // Updated path

class GenderCard extends StatelessWidget {
  final Gender gender;
  final bool selected;
  final VoidCallback onTap;

  GenderCard({required this.gender, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: selected ? Colors.blue : Colors.grey[800],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              gender == Gender.male 
          ? Icons.man 
          : Icons.woman,
              size: 80.0
            ),
            SizedBox(height: 15.0),
            Text(gender.label, style: TextStyle(fontSize: 18.0, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

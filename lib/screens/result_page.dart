import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultPage({
    required this.bmiResult,
    required this.resultText,
    required this.interpretation,
  });

  Color getResultColor() {
    double bmi = double.tryParse(bmiResult) ?? 0;
    if (bmi >= 25) return Colors.orangeAccent;
    else if (bmi > 18.5) return Colors.green;
    else return Colors.yellow;
  }

  double getDialProgress() {
    double bmi = double.tryParse(bmiResult) ?? 0;
    return (bmi.clamp(10.0, 40.0) - 10.0) / 30.0;
  }

  @override
  Widget build(BuildContext context) {
    final dialProgress = getDialProgress();
    final resultColor = getResultColor();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('BMI', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Your Body Mass Index',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text('Personalize Your Results',
                style: TextStyle(color: Colors.grey[600])),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // navigate back to edit measurements
              },
              child: Text('EDIT MEASUREMENTS',
                  style: TextStyle(color: Colors.purpleAccent, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 180,
                  height: 180,
                  child: CircularProgressIndicator(
                    value: dialProgress,
                    strokeWidth: 12.0,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: AlwaysStoppedAnimation<Color>(resultColor),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      bmiResult,
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      resultText,
                      style: TextStyle(fontSize: 18, color: resultColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            // BMI Scale Bar
            Column(
              children: [
                Container(
                  height: 10,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      colors: [
                        Colors.red.shade400,
                        Colors.orange,
                        Colors.green,
                        Colors.yellow,
                        Colors.red.shade700,
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("0", style: TextStyle(fontSize: 12)),
                    Text("18.5", style: TextStyle(fontSize: 12)),
                    Text("25.0", style: TextStyle(fontSize: 12)),
                    Text("35.0+", style: TextStyle(fontSize: 12)),
                  ],
                )
              ],
            ),
            SizedBox(height: 30),
            // Suggestion and Goal Setting
            Column(
              children: [
                Text(
                  interpretation.toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text('Set Your Goal', style: TextStyle(color: Colors.grey[700])),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    goalOption('Lose Weight', false),
                    goalOption('Maintain', true),
                    goalOption('Gain Weight', false),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: Text("RE-CALCULATE",
                  style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  Widget goalOption(String label, bool selected) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        backgroundColor: selected ? Colors.green.shade100 : Colors.white,
        side: BorderSide(color: Colors.grey.shade400),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}

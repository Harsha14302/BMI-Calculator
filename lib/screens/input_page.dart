import 'package:flutter/material.dart';
import '../components/gender_card.dart';
import '../components/reusable_card.dart';
import '../components/bottom_button.dart';
import 'result_page.dart';
import '../calculator_brain.dart';
import '../constants/enums.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GenderCard(
                    gender: Gender.male,
                    selected: selectedGender == Gender.male,
                    onTap: () => setState(() => selectedGender = Gender.male),
                  ),
                ),
                Expanded(
                  child: GenderCard(
                    gender: Gender.female,
                    selected: selectedGender == Gender.female,
                    onTap: () => setState(() => selectedGender = Gender.female),
                  ),
                ),
              ],
            ),
            ),
            Expanded(
            child: ReusableCard(
              color: Colors.grey[850]!,
              cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text('HEIGHT', style: TextStyle(fontSize: 16.0, color: Colors.grey)),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              SizedBox(
              width: 60,
              child: TextFormField(
              // Use controller instead of initialValue for dynamic updates
              controller: TextEditingController(text: height.toString()),
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
              onChanged: (value) {
              if (value.isNotEmpty) {
                int? newHeight = int.tryParse(value);
                if (newHeight != null && newHeight >= 100 && newHeight <= 200) {
                setState(() => height = newHeight);
                }
              }
              },
              ),
              ),
              Text(' cm', style: TextStyle(fontSize: 16.0)),
              ],
              ),
              Slider(
              value: height.toDouble(),
              min: 100.0,
              max: 200.0,
              onChanged: (value) {
              setState(() {
                height = value.round();
                // Force text field update
                (context as Element).markNeedsBuild();
              });
              },
              ),
              ],
              ),
            ),
            ),
            Expanded(
            child: Row(
              children: [
              Expanded(
              child: ReusableCard(
              color: Colors.grey[850]!,
              cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('WEIGHT', style: TextStyle(fontSize: 18.0, color: Colors.grey)),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                SizedBox(
                width: 60,
                child: TextFormField(
                  controller: TextEditingController(text: weight.toString()),
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w900),
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                  if (value.isNotEmpty) {
                  int? newWeight = int.tryParse(value);
                  if (newWeight != null && newWeight > 0 && newWeight <= 200) {
                  setState(() => weight = newWeight);
                  }
                  }
                  },
                ),
                ),
                Text(' kg', style: TextStyle(fontSize: 16.0)),
                ],
                ),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                IconButton(icon: Icon(Icons.remove), onPressed: () => setState(() => weight--)),
                IconButton(icon: Icon(Icons.add), onPressed: () => setState(() => weight++)),
                ],
                ),
              ],
              ),
              ),
              ),
                Expanded(
                child: ReusableCard(
                color: Colors.grey[850]!,
                cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text('AGE', style: TextStyle(fontSize: 18.0, color: Colors.grey)),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                SizedBox(
                width: 60,
                child: TextFormField(
                  controller: TextEditingController(text: age.toString()),
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w900),
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                  if (value.isNotEmpty) {
                  int? newAge = int.tryParse(value);
                  if (newAge != null && newAge > 0 && newAge <= 120) {
                    setState(() => age = newAge);
                  }
                  }
                  },
                ),
                ),
                Text(' yrs', style: TextStyle(fontSize: 16.0)),
                ],
                ),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                IconButton(icon: Icon(Icons.remove), onPressed: () => setState(() => age--)),
                IconButton(icon: Icon(Icons.add), onPressed: () => setState(() => age++)),
                ],
                ),
                ],
                ),
                ),
                ),
              ],
            ),
            ),
          BottomButton(
            label: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildCounterCard(String label, int value, VoidCallback onIncrement, VoidCallback onDecrement) {
    return ReusableCard(
      color: Colors.grey[850]!,
      cardChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: TextStyle(fontSize: 18.0, color: Colors.grey)),
          Text(value.toString(), style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(icon: Icon(Icons.remove), onPressed: onDecrement),
              IconButton(icon: Icon(Icons.add), onPressed: onIncrement),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 0;
  int age = 10;
  double oxygen = 0;
  double temperature = 0;
  int heartRate = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MedShield'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColour,
                  icon: FontAwesomeIcons.lungs, // Oxygen level
                  label: 'OXYGEN',
                  value: oxygen != null ? '${oxygen}%' : '-',
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColour,
                  icon: FontAwesomeIcons.thermometerHalf, // Body temperature
                  label: 'TEMPERATURE',
                  value: temperature != null ? '${temperature}°C' : '-',
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              icon: FontAwesomeIcons.heartbeat, // Heart rate
              label: 'HEART RATE',
              value: heartRate != null ? '${heartRate}bpm' : '-',
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColour,
                  label: 'WEIGHT',
                  value: weight != null ? weight.toString() : '-',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundIconButton(
                        icon: FontAwesomeIcons.minus,
                        onPressed: () {
                          setState(() {
                            weight--;
                          });
                        },
                      ),
                      SizedBox(width: 10.0),
                      RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        onPressed: () {
                          setState(() {
                            weight++;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColour,
                  label: 'AGE',
                  value: age != null ? age.toString() : '-',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundIconButton(
                        icon: FontAwesomeIcons.minus,
                        onPressed: () {
                          setState(() {
                            age--;
                          });
                        },
                      ),
                      SizedBox(width: 10.0),
                      RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        onPressed: () {
                          setState(() {
                            age++;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          BottomButton(
            buttonTitle: 'CHECK',
            onTap: () {
              HealthMonitor patient = HealthMonitor(
                oxygenLevel: oxygen,
                temperature: temperature,
                heartRate: heartRate,
                age: age,
              );

              Map<String, String> result = patient.analyzeHealth();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    oxygen: oxygen,
                    heartRate: heartRate,
                    temperature: temperature,
                    interpretation: result["Health Assessment"] ??
                        "No assessment available",
                    recommendation: result["Recommended Actions"] ??
                        "No recommendations available",
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

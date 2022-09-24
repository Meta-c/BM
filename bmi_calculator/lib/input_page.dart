//import 'main.dart';
// ignore_for_file: sort_child_properties_last

//import 'dart:ffi';
import 'dart:math';
import 'package:bmi_calculator/result_page.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'swift_row.dart';
import 'layout.dart';
import 'constants.dart';
import 'calculator.dart';

enum Gender { male, female, na }

int height = 0;
int weight = 50;
int age = 0;
double result = 0;

// ignore: use_key_in_widget_constructors
class InputPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender genderSelected = Gender.na;
  // int height = 0;
  // int weight = 50;
  // int age = 0;
  // double result = 0;

  void handleWeight(String operation) {
    if (operation == 'plus') {
      setState(() {
        weight++;
      });
    } else if (weight != 50) {
      setState(() {
        weight--;
      });
    }
  }

  void handleAge(String operation) {
    if (operation == 'plus') {
      setState(() {
        age++;
      });
    } else if (age != 0) {
      setState(() {
        age--;
      });
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            'BMI CALCULATOR',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
//----------------------GENDER ROW ------------------------------

            Expanded(
              child: gendreRow(
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        genderSelected = Gender.male;
                      });
                    },
                    child: layout(
                      colour: genderSelected == Gender.male
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: GendreLayout(
                        gendre: FontAwesomeIcons.mars,
                        gendreText: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        genderSelected = Gender.female;
                      });
                      ;
                    },
                    child: layout(
                        colour: genderSelected == Gender.female
                            ? activeCardColor
                            : inactiveCardColor,
                        cardChild: GendreLayout(
                            gendre: FontAwesomeIcons.venus,
                            gendreText: 'FEMALE')),
                  ),
                ),
              ),
            ),

// --------------------- HEIGHT SLIDER --------------------------

            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: layout(
                      colour: activeCardColor,
                      cardChild: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Text('Height', style: textStyle),
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  '$height',
                                  style: numStyle,
                                ),
                                Text(
                                  'cm',
                                  style: textStyle,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Slider.adaptive(
                                  activeColor: Colors.red,
                                  inactiveColor: inactiveCardColor,
                                  value: height.toDouble(),
                                  min: 0,
                                  max: 200,
                                  onChanged: (double newHeight) {
                                    setState(() {
                                      height = newHeight.toInt(); //.toInt();
                                    });
                                  }),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

// ------------------ AGE AND WEIGHT ROW ----------------------------

            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: layout(
                    colour: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text('WEIGHT', style: textStyle),
                        Text('$weight', style: numStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FloatingBtn(
                                icon: Icons.remove,
                                onpress: () => handleWeight('minus'),
                                herotag: 'Wminus',
                              ),
                            ),
//SizedBox
                            SizedBox(
                              width: 10,
                            ),

                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FloatingBtn(
                                  icon: Icons.add,
                                  onpress: () => handleWeight('plus'),
                                  herotag: 'Wplus',
                                )),
                          ],
                        )
                      ],
                    ),
                  )),
                  const SizedBox(
                    width: 10,
                  ),

                  //--------------- -------------AGE  BOX -----------------------

                  Expanded(
                    child: layout(
                        colour: activeCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text('AGE', style: textStyle),
                            Text('$age', style: numStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FloatingBtn(
                                      icon: Icons.remove,
                                      onpress: () => handleAge('minus'),
                                      herotag: 'Aminus',
                                    )),
//SizedBox
                                SizedBox(
                                  width: 10,
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FloatingBtn(
                                    icon: Icons.add,
                                    onpress: () => handleAge('plus'),
                                    herotag: 'Aplus',
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),

// ----------------------------- CALCULATE BUTTON -----------------------------

            InkWell(
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TestPage(
                            interpertation: calc.getInterpretation(),
                            bmiResult: calc.calculateBMI(),
                            resultText: calc.getResult())));
              },
              child: Container(
                color: bottomButtonColor,
                margin: const EdgeInsets.only(top: 10),
                width: double.infinity,
                height: 80.0,
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                  child: Text(
                    'CALCULATE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

// ignore: camel_case_types, must_be_immutable

// ignore: must_be_immutable
class GendreLayout extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  GendreLayout({required this.gendre, required this.gendreText});
  late IconData gendre;
  late String gendreText;

  @override
  State<GendreLayout> createState() => _GendreLayoutState();
}

class _GendreLayoutState extends State<GendreLayout> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Icon(
          widget.gendre,
          size: 60,
          color: Colors.white,
        ),
        const SizedBox(height: 15),
        Text(
          widget.gendreText,
          style: textStyle,
        )
      ],
    );
  }
}

Row gendreRow(Expanded male, Expanded female) {
  return Row(
    children: [
      male,
      const SizedBox(
        width: 10,
      ),
      female
    ],
  );
}

// ignore: must_be_immutable
class FloatingBtn extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  FloatingBtn(
      {required this.icon, required this.onpress, required this.herotag});

  late IconData icon;
  late final void Function() onpress;
  late String herotag;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        heroTag: herotag,
        child: Icon(
          icon,
          color: Colors.white,
          size: 35,
        ),
        backgroundColor: const Color(0xFF4c4F5E),
        onPressed: onpress);
  }
}

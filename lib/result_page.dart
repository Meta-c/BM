import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'input_page.dart';

// class TestPage extends StatefulWidget {
//   TestPage(
//       {required this.interpertation,
//       required this.bmiResult,
//       required this.resultText});

//   late final String bmiResult;
//   late final String resultText;
//   late final String interpertation;

//   @override
//   State<TestPage> createState() => _TestPageState();
// }

class TestPage extends StatelessWidget {
  TestPage(
      {required this.interpertation,
      required this.bmiResult,
      required this.resultText});

  late String bmiResult;
  late String resultText;
  late String interpertation;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //-------------- RESULT TEXT ---------------
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8.0, 0, 0),
                  child: const Text(
                    'Your Result',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),

// -------------- RESULT CONTAINER ------------------

            // ignore: avoid_unnecessary_containers
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: activeCardColor,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Center(
                    child: Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          //--------------------------------------- FIRST TEXT --------------------------
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                            child: Text(
                              resultText,
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20),
                            ),
                          ),

//------------ SIZED BOX ---------------------

                          SizedBox(
                            height: 100,
                          ),

//

// ---------------------- SECOND TEXT (BMI NUMBER )---------------------
                          Text(
                            bmiResult,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 60,
                                fontWeight: FontWeight.bold),
                          ),

//---------- SIZED BOX ---------------------------

                          SizedBox(
                            height: 100,
                          ),

//---------------- THIRD TEXT ------------------------------------------

                          Text(
                            interpertation,
                            style: TextStyle(color: Colors.white),
                          ),

// ------------- Re-CALCULATE -------------------
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InputPage()));
              },
              child: Container(
                color: bottomButtonColor,
                margin: const EdgeInsets.only(top: 10),
                width: double.infinity,
                height: 80.0,
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                  child: Text(
                    'RE-CALCULATE',
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
        ),
      ),
    );
  }
}

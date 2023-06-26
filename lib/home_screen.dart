import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _showResultBox = false;
  late double a;
  late double b;
  late double c;
  String ans = "";

  //calculation vars

  void _reset() {
    _formKey.currentState!.reset();
    setState(() {
      _showResultBox = false;
    });
  }

  void _calculate() {
    _formKey.currentState!.save();
    double sumOfZeroes = -b / a;
    double productOfZeroes = c / a;
    double s = productOfZeroes / 2.0;
    double u = (sumOfZeroes / 2.0) * (productOfZeroes / 2.0);
    double v = u - productOfZeroes;
    double x = sqrt(v);
    double r1 = (sumOfZeroes / 2.0) - x;
    double r2 = (sumOfZeroes / 2.0) + x;
    String sf = s.toStringAsFixed(2);
    String rf1 = r1.toStringAsFixed(2);
    String rf2 = r2.toStringAsFixed(2);

    if (v >= 0) {
      ans = "Roots of equation are:\n $rf1 and $rf2";
    } else {
      double y = sqrt(-v);
      String yf = y.toStringAsFixed(2);
      ans = "The Roots of the equation are:\n $sf + i$yf and $sf - i$yf";
    }
    setState(() {
      _showResultBox = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff176B87),
      appBar: AppBar(
        title: const Text(
          "QuadCalc",
          style: TextStyle(
            fontSize: 24,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: const Color(0xff176B87).withOpacity(.8),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "Assume the qudratic equation in form:",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(
                      0xff001C30,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 8.0,
                right: 8,
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "aX² + bX + c = 0",
                  style: TextStyle(
                    color: Color(
                      0xff001C30,
                    ),
                    fontSize: 32,
                  ),
                ),
              ),
            ),

            //input values
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //row for a and b variable textfield input
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //field a
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .4,
                          child: TextFormField(
                            onSaved: (newValue) {
                              a = double.parse(newValue!);
                            },
                            keyboardType: TextInputType.number,
                            cursorColor: const Color(0xff64CCC5),
                            style: const TextStyle(color: Color(0xff64CCC5)),
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff64CCC5),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    10,
                                  ),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff64CCC5),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    10,
                                  ),
                                ),
                              ),
                              label: Text(
                                "Value of 'a'",
                                style: TextStyle(
                                  color: Color(0xffDAFFFB),
                                ),
                              ),
                            ),
                          ),
                        ),

                        //field b
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .4,
                          child: TextFormField(
                            onSaved: (newValue) {
                              b = double.parse(newValue!);
                            },
                            keyboardType: TextInputType.number,
                            cursorColor: const Color(0xff64CCC5),
                            style: const TextStyle(color: Color(0xff64CCC5)),
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff64CCC5),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    10,
                                  ),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff64CCC5),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    10,
                                  ),
                                ),
                              ),
                              label: Text(
                                "Value of 'b'",
                                style: TextStyle(
                                  color: Color(0xffDAFFFB),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    //field c
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .4,
                      child: TextFormField(
                        onSaved: (newValue) {
                          c = double.parse(newValue!);
                        },
                        keyboardType: TextInputType.number,
                        cursorColor: const Color(0xff64CCC5),
                        style: const TextStyle(
                          color: Color(0xff64CCC5),
                        ),
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff64CCC5),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                10,
                              ),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff64CCC5),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                10,
                              ),
                            ),
                          ),
                          label: Text(
                            "Value of 'c'",
                            style: TextStyle(
                              color: Color(0xffDAFFFB),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(
                              0xff001C30,
                            ),
                          ),
                          onPressed: _reset,
                          child: const Text(
                            "Reset",
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(
                              0xff001C30,
                            ),
                          ),
                          onPressed: _calculate,
                          child: const Text(
                            "Calculate",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            //output values
            if (_showResultBox) ...[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Container(
                    height: 150,
                    decoration: const BoxDecoration(
                      color: Color(0xffDAFFFB),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          20,
                        ),
                      ),
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 32.0,
                          left: 32,
                          top: 16,
                          bottom: 16,
                        ),
                        child: Text(
                          ans,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(
                              0xff001C30,
                            ),
                            fontSize: 48,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}

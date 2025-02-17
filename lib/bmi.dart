import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  const BMI({super.key});
  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  bool isMale = true;
  @override
  int age = 20;
  int weight = 59;
  double height = 80;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Card(
                        color:
                            isMale == true ? Colors.grey.shade900 : Colors.grey,
                        child: const Column(
                          children: [
                            Icon(
                              Icons.male,
                              size: 50,
                              color: Colors.white,
                            ),
                            Text("Male",
                                style: TextStyle(
                                    fontSize: 32, color: Colors.grey)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Card(
                        color: isMale == false
                            ? Colors.pink
                            : Colors.grey.shade900,
                        child: const Column(
                          children: [
                            Icon(
                              Icons.female,
                              size: 50,
                              color: Colors.white,
                            ),
                            Text("Female",
                                style: TextStyle(
                                    fontSize: 32, color: Colors.grey)),
                          ],
                        ),
                      ),
                    ),
                    ////////////  3RD PLACE
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 5,
                child: Column(
                  children: [
                    const Text(
                      "Height",
                      style: TextStyle(color: Colors.white),
                    ),
                    const Text(
                      "CM",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      height.toStringAsFixed(2),
                      style: const TextStyle(color: Colors.white),
                    ),
                    Slider(
                        activeColor: Colors.grey,
                        inactiveColor: Colors.white,
                        max: 210,
                        min: 70,
                        value: height,
                        onChanged: (value) {
                          setState(() {
                            height = value;
                          });
                        }),
                  ],
                )),
            /////////////////
            Expanded(
              flex: 5,
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      color: Colors.grey.shade900,
                      child: Column(
                        children: [
                          const Text("Weight",
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.grey,
                              )),
                          Text("$weight",
                              style: const TextStyle(
                                  fontSize: 32,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),

                          //  Button
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (weight > 1) {
                                        setState(() {
                                          weight--;
                                        });
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey.shade700,
                                      shape: const CircleBorder(),
                                    ),
                                    child: const Icon(Icons.remove,
                                        color: Colors.white),
                                  ),
                                ),

                                /// Button
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey.shade700,
                                    shape: const CircleBorder(),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ]),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      color: Colors.grey.shade900,
                      child: Column(
                        children: [
                          const Text("Age",
                              style:
                                  TextStyle(fontSize: 32, color: Colors.grey)),
                          Text("$age",
                              style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (age > 1) {
                                        setState(() {
                                          age--;
                                        });
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey.shade700,
                                      shape: const CircleBorder(),
                                    ),
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),

                                /// Button
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey.shade700,
                                    shape: const CircleBorder(),
                                  ),
                                  child: const Icon(Icons.add,
                                      color: Colors.white),
                                ),
                              ]),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ///////////// LASRT PART
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                color: Colors.pink,
                child: Center(
                    child: InkWell(
                  onTap: () {
                    double h = height / 100;
                    double w = weight.toDouble();
                    double heightSqaure = h * h;
                    double result = w / heightSqaure;

                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text(
                              "BMI CALCULATION",
                              style: TextStyle(color: Colors.pink),
                            ),
                            content: Text("Your Result Is $result"),
                            contentTextStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(color: Colors.red),
                                  )),
                              TextButton(
                                  onPressed: () {}, child: const Text("No")),
                            ],
                          );
                        });
                  },
                  child: const Text(
                    "CALCULATE",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
